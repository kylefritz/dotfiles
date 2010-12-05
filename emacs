
; don't make backup files
(setq make-backup-files nil)

; add code folding shortcut => (M-1 C-x $) hide method bodies (C-x $ shows)
(defun jao-toggle-selective-display ()
  (interactive)
  (set-selective-display (if selective-display nil 1)))

(global-set-key [f1] 'jao-toggle-selective-display)

;line numbers?
;(global-linum-mode 1)