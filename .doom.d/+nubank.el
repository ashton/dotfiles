;;; ../.dotfiles/.doom.d/+nubank.el -*- lexical-binding: t; -*-

;; Specific configurations for Nubank (work) environment
(defun config-projects ()
  (add-to-list 'projectile-project-search-path "~/dev/nu/")
  (add-to-list 'projectile-project-search-path "~/dev/nu/mini-meta-repo/packages/")
  (add-to-list 'projectile-project-search-path "~/dev/nu/artemisia/modules/")
  (add-to-list 'projectile-project-search-path "~/dev/nu/mini-meta-repo/packages/lending")
  (setq projectile-project-root-functions '(projectile-root-local
                                            projectile-root-top-down
                                            projectile-root-top-down-recurring
                                            projectile-root-bottom-up)))

(defun config-org-capture-templates ()
  (setq org-capture-templates
        (doct-add-to org-capture-templates
                     `(("Nubank related captures"
                        :keys "n"
                        :children (
                                   ("Nubank task related captures"
                                    :keys "t"
                                    :headline "Work"
                                    :file "~/org/todo.org"
                                    :children (("Simple task"
                                                :keys "s"
                                                :template "** TODO %?\n")
                                               ("Task with link (uses file content)"
                                                :keys "l"
                                                :template "** TODO %? at: %a\n")
                                               ("Task with deadline"
                                                :keys "d"
                                                :template "** TODO %? \nDEADLINE: %t\n")))
                                   ("Brag document entry"
                                    :keys "b"
                                    :file "~/org/bragdocument.org"
                                    :headline ,(let ((system-time-locale "pt_BR.UTF-8")) (format-time-string "%B"))
                                    :template "** %?\n"))))
                     'append)))

(let ((nudev-emacs-path "~/dev/nu/nudev/ides/emacs/"))
  (when (file-directory-p nudev-emacs-path)
    (add-to-list 'load-path nudev-emacs-path)
    (require 'nu nil t)

    (config-projects)
    (config-org-capture-templates)

    (use-package! hover
      :after dart-mode
      :config
      (setq hover-hot-reload-on-save t
            hover-clear-buffer-on-hot-restart t
            hover-screenshot-path "$HOME/Pictures"))))
