(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

(require 'package-management)
(require 'ui)
(require 'qol)
(require 'keybinds)
(require 'lsp)
(require 'projects)
(require 'git)
(require 'terminal)
(require 'grease)
(require 'm-x-search)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
