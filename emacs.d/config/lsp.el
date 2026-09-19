(ensure-sys-pkg "git")
(ensure-sys-pkg "npm")
(ensure-sys-pkg "python")
(ensure-sys-pkg "cargo")
(ensure-sys-pkg "ghcup")

;;; install lsps

(use-package mason
  :ensure t
  :config
  (mason-setup))

(mason-setup
  (dolist (pkg '(
		 "clangd"
		 "css-lsp"
		 "haskell-language-server"
		 "html-lsp"
		 "biome" ; json, js and more
		 "lua-language-server"
		 "marksman"
		 "nil"
		 "basedpyright"
		 "rust-analyzer"
		 "bash-language-server"
		 "yaml-language-server"
		 "zls"
		 "glsl_analyzer"
		 ))
    (unless (mason-installed-p pkg)
      (ignore-errors (mason-install pkg)))))

;;; enable lsps
(use-package rust-mode)
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (lsp-mode . lsp-enable-which-key-integration)

         (c++-mode . lsp-deferred)
         (c-mode . lsp-deferred)
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
(use-package flycheck
  :ensure t
  :hook ((after-init . global-flycheck-mode)
         (after-init . global-flycheck-annotate-mode))
  :config
  (global-flycheck-lsp-mode 1))

;; performance tuning
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ; 1mb

;;; auto formatting

(use-package apheleia
  :config (apheleia-global-mode +1))

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
