;;; install lsp

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (lsp-mode . lsp-enable-which-key-integration)

         (c++-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (cmake-mode . lsp-deferred)
         (css-mode . lsp-deferred)
         (haskell-mode . lsp-deferred)
         (html-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (json-mode . lsp-deferred)
         (lua-mode . lsp-deferred)
         (markdown-mode . lsp-deferred)
         (nix-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (rust-mode . lsp-deferred)
         (sh-mode . lsp-deferred)
         (yaml-mode . lsp-deferred)
         (zig-mode . lsp-deferred)
         (glsl-mode . lsp-deferred)
         )
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :commands lsp-ui-mode
  :custom
  (lsp-ui-doc-position 'at-point))
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(with-eval-after-load 'evil
  (define-key evil-insert-state-map (kbd "C-SPC") #'lsp-signature-activate))

;; performance tuning
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ; 1mb

;;; auto formatting

(use-package apheleia
  :config (apheleia-global-mode +1)

  ;; Custom function to format Org emacs-lisp blocks on save
  (defun my/org-format-elisp-blocks ()
    "Formats all emacs-lisp code blocks in the current Org buffer."
    (when (eq major-mode 'org-mode)
      (org-save-outline-visibility t
    	(org-babel-map-src-blocks nil
    	  (when (string= lang "emacs-lisp")
    	    (org-edit-special)
    	    (indent-region (point-min) (point-max))
    	    (org-edit-src-exit))))))

  ;; Trigger the block formatter right before saving the file
  (add-hook 'before-save-hook #'my/org-format-elisp-blocks))

;;; keybinds

(with-eval-after-load 'evil
  (evil-define-key 'normal lsp-mode-map
    ;; help
    (kbd "K")  'lsp-ui-doc-glance
    (kbd "gd") 'lsp-find-definition
    (kbd "gD") 'lsp-find-declaration
    (kbd "gi") 'lsp-find-implementation
    (kbd "go") 'lsp-find-type-definition
    (kbd "gr") 'lsp-find-references
    (kbd "gs") 'lsp-signature-activate

    ;; errors
    (kbd "gl") 'lsp-ui-flycheck-list))

;; actions
(dtiderko/leader-keys
  "rn" '(lsp-rename :which-key "Rename symbol")
  "a"  '(lsp-execute-code-action :which-key "Code action"))

(provide 'lsp)
