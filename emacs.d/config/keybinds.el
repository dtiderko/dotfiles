;;; Make ESC quit prompts

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; which-key

;; Show available keycombos on keypress.
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.3))

;;; Evil mode (vim motions)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-undo-system 'undo-tree)
  (setq evil-want-fine-undo 'fine)
  :config
  (evil-mode 1)
  )

;; And enable undo in non buffer files (?)
(use-package undo-tree
  :after evil
  :init
  (global-undo-tree-mode)
  (add-hook 'evil-local-mode-hook 'turn-on-undo-tree-mode)
  :config
  (make-directory (expand-file-name "undo/" user-emacs-directory) t)
  (setq undo-tree-history-directory-alist
        `(("." . ,(expand-file-name "undo/" user-emacs-directory))))
  )

;; Add some more evil keybindings.
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;;; general

(use-package general
  :config
  (general-evil-setup t)

  (general-create-definer dtiderko/leader-keys
    :keymaps '(normal visual emacs)
    :prefix "SPC")
  (dtiderko/leader-keys
    "q" 'evil-quit)
  )

(provide 'keybinds)
