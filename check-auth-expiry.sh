#!/bin/bash
# Check if authentication credentials are expired or expiring soon

# Check for required tools
for tool in date stat base64 cut grep; do
    if ! command -v $tool &> /dev/null; then
        echo "⚠️  Required tool missing: $tool"
        exit 0
    fi
done

CACHE_FILE="$HOME/.cache/auth-expiry-check"
CACHE_DURATION=3600  # 1 hour in seconds

# Check if cache exists and is fresh
if [ -f "$CACHE_FILE" ]; then
    cache_age=$(($(date +%s) - $(stat -c %Y "$CACHE_FILE" 2>/dev/null || stat -f %m "$CACHE_FILE" 2>/dev/null)))
    if [ "$cache_age" -lt "$CACHE_DURATION" ]; then
        # Use cached result
        exit $(cat "$CACHE_FILE")
    fi
fi

# Check AWS credentials
AWS_EXPIRED=false
OIDC_EXPIRED=false

# Check AWS credentials from the credentials file
if [ -f "$HOME/.aws/credentials" ]; then
    # Look for any aws_session_expiration line
    while IFS= read -r line; do
        if [[ "$line" =~ aws_session_expiration[[:space:]]*=[[:space:]]*(.*) ]]; then
            exp_time="${BASH_REMATCH[1]}"
            # Convert to epoch time
            exp_epoch=$(date -d "$exp_time" +%s 2>/dev/null)
            now_epoch=$(date +%s)

            if [ -n "$exp_epoch" ] && [ "$exp_epoch" -lt "$now_epoch" ]; then
                AWS_EXPIRED=true
                break
            fi
        fi
    done < "$HOME/.aws/credentials"
fi

# Check OIDC token expiry (okta.jwt)
if [ -f "$HOME/.oidc/okta.jwt" ]; then
    # Extract payload and decode expiry
    payload=$(cut -d'.' -f2 "$HOME/.oidc/okta.jwt")
    # Add padding for base64
    padded="${payload}$(printf '%*s' $((4 - ${#payload} % 4)) '' | tr ' ' '=')"

    # Decode and extract exp field
    exp_epoch=$(echo "$padded" | base64 -d 2>/dev/null | grep -o '"exp":[0-9]*' | cut -d':' -f2)
    now_epoch=$(date +%s)

    if [ -n "$exp_epoch" ] && [ "$exp_epoch" -lt "$now_epoch" ]; then
        OIDC_EXPIRED=true
    fi
fi

# Exit with status code indicating expiry
if [ "$AWS_EXPIRED" = true ] || [ "$OIDC_EXPIRED" = true ]; then
    result=1  # Expired
else
    result=0  # Valid
fi

# Cache the result
mkdir -p "$(dirname "$CACHE_FILE")"
echo "$result" > "$CACHE_FILE"
exit $result
