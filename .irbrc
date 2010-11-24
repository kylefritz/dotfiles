require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize
IRB.conf[:AUTO_INDENT] = true

require 'bond'
Bond.start

require 'utility_belt'

def vim
  edit_interactively :vim
end

def reload(require_regex)
  $".grep(/#{require_regex}/).each {|e| $".delete(e) && require(e) }
end