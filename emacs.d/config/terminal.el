;; required by: vterm
(ensure-sys-pkg "cmake")
(ensure-sys-pkg "make")
(ensure-sys-pkg "gcc")
(ensure-sys-pkg "libtool")
(ensure-sys-pkg "bash")

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
