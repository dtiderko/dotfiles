(use-package grease
  :load-path "~/.emacs.d/lisp/grease.el"
  :commands (grease-open grease-toggle grease-here)
  :init
  (setq grease-show-hidden t) 
  )

(dtiderko/leader-keys "pv" '(grease-toggle :which-key "Open grease"))

(provide 'grease)
