;;; ../.dotfiles/.doom.d/+nubank.el -*- lexical-binding: t; -*-

;; Specific configurations for Nubank (work) environment

(let ((nudev-emacs-path "~/dev/nu/nudev/ides/emacs/"))
  (when (file-directory-p nudev-emacs-path)
    (add-to-list 'load-path nudev-emacs-path)
    (require 'nu nil t)))

(add-to-list 'projectile-project-search-path "~/dev/nu/")
(add-to-list 'projectile-project-search-path "~/dev/nu/mini-meta-repo/packages/")
(add-to-list 'projectile-project-search-path "~/dev/nu/artemisia/modules/")
(add-to-list 'projectile-project-search-path "~/dev/nu/mini-meta-repo/packages/lending")

(setq projectile-project-root-functions '(projectile-root-local
                                          projectile-root-top-down
                                          projectile-root-top-down-recurring
                                          projectile-root-bottom-up))
(use-package! hover
  :after dart-mode
  :config
  (setq hover-hot-reload-on-save t
        hover-clear-buffer-on-hot-restart t
        hover-screenshot-path "$HOME/Pictures"))
