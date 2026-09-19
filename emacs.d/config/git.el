(ensure-sys-pkg "git") ; required by: magit, git-gutter

;;; Magit

(use-package transient)
(use-package magit :after transient)
(dtiderko/leader-keys "G" '(magit-status :which-key "Open Magit"))

;;; Git Gutter

;; Actually good guide here: https://ianyepan.github.io/posts/emacs-git-gutter/

;; Show which lines are new/deleted/modified

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

;; And modify the Bitmap for appearance
(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(provide 'git)
