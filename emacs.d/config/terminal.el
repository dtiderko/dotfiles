;; This terminal needs to compile a native library. Therefore, make sure to install all required libraries.

(use-package vterm
  :commands vterm
  :config
  (setq vterm-shell "bash"))

;; And add a keybind to open a new unique terminal.
(defun unique-vterm ()
  (interactive)
  (vterm)
  (rename-uniquely))
(dtiderko/leader-keys "t" '(unique-vterm :which-key "Open Terminal"))

(provide 'terminal)
