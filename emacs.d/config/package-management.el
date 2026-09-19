;;; Sources

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;;; use-package

(require 'use-package)
(setq use-package-always-ensure t)
(setq inhibit-startup-message t)
(setq package-install-upgrade-built-in t)

(defun ensure-sys-pkg (pkg)
  (unless (executable-find pkg)
    (warn "%s is not installed on your system!" pkg)))

;;; Automatic updates

(use-package auto-package-update
  :custom
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  (auto-package-update-delete-old-versions t)
  (auto-package-update-interval 7) ; check every 7 days
  :config
  (auto-package-update-maybe))

(provide 'package-management)
