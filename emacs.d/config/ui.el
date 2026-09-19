;;; Font

(set-face-attribute 'default nil :font "Monocraft")

;;; Theme

(use-package gruvbox-theme :config (load-theme 'gruvbox-dark-medium t))

;;; Transparent background

(set-frame-parameter nil 'alpha-background 80)
(add-to-list 'default-frame-alist '(alpha-background . 80))

;;; disable stupid stuff

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

;;; Relative line numbers

(setq-default display-line-numbers-type 'relative) 
(global-display-line-numbers-mode 1)

;; Exculde some modes from having relative line numbers.
(dolist (mode-hook '(vterm-mode-hook eshell-mode-hook))
  (add-hook mode-hook (lambda () (display-line-numbers-mode 0))))

;;; Rainbow delimiters

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;;; Doom modeline

(use-package doom-modeline
  :init (setq doom-modeline-icon t)
  :config (doom-modeline-mode 1))

;;; icons

(use-package nerd-icons)

;;; Color column

(setq-default fill-column 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

(provide 'ui)
