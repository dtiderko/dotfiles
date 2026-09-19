;;; Backup file dir

(setq backup-directory-alist `(("." . ,(expand-file-name "backup/" user-emacs-directory))))
(make-directory (expand-file-name "backup/" user-emacs-directory) t)

;;; Commenting

(use-package evil-nerd-commenter
  :after evil
  :config
  (define-key evil-normal-state-map (kbd "gc") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map (kbd "gc") 'evilnc-comment-or-uncomment-lines)
  )

;;; Indentation

;;;; Spaces instead of tabs

(setq tab-width 2)
(setq evil-shift-width 2)
(setq indent-tabs-mode nil)

;;;; Automatic indentation

(electric-indent-mode 1)

(provide 'qol)
