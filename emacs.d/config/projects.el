;;; projectile

(use-package projectile
  :init
  (setq projectile-project-search-path '(
                                         ("~/" . 1)
                                         ("~/Projects" . 2)
                                         ))
  :config
  (setq projectile-enable-caching t)
  (global-set-key (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1)
  )

(dtiderko/leader-keys
  "SPC" '(projectile-find-file :which-key "Find file in project")
  "g" '(projectile-ripgrep :which-key "Grep the project")
  )

;; And auto discover all available projects.
(projectile-discover-projects-in-search-path)

;; Extension to intergrate with counsel.
(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

;;; envrc

;; Enter devenv on project enter.
(use-package envrc
  :hook (after-init . envrc-global-mode))
(with-eval-after-load 'envrc
  (define-key envrc-mode-map (kbd "C-c e") 'envrc-command-map))


(provide 'projects)
