;;; +org.el -*- lexical-binding: t; -*-
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(use-package! org
  :init (setq org-directory "~/org")
  :config
  (setq org-hide-emphasis-markers t
        org-agenda-files '("~/org/todo.org")

        org-capture-templates (doct '(("Personal Todo entry"
                                       :keys "t"
                                       :file "~/org/todo.org"
                                       :headline "Personal")
                                      ("Task with deadline"
                                       :keys "T"
                                       :headline "Personal"
                                       :file "~/org/todo.org"
                                       :template "** TODO %? \nDEADLINE: %t\n")))))

(use-package! org-super-agenda
  :after org-agenda
  :config
  (org-super-agenda-mode)
  (setq org-agenda-custom-commands '(("o" "Overview"
                                      ((agenda "" ((org-agenda-overriding-header "")
                                                   (org-agenda-span 1)
                                                   (org-agenda-start-day "today")
                                                   (org-agenda-use-time-grid nil)
                                                   (org-agenda-format-date "")
                                                   (org-super-agenda-groups
                                                    '((:name "Hoje"
                                                       :date today
                                                       :order 1
                                                       :discard (:anything))))))
                                       (agenda "" ((org-agenda-overriding-header "")
                                                   (org-agenda-compact-blocks t)
                                                   (org-agenda-start-day "+1d")
                                                   (org-agenda-span 7)
                                                   (org-super-agenda-groups
                                                    '((:name "Semana"
                                                       :date today
                                                       :order 2
                                                       :discard (:anything))))))
                                       (alltodo "" ((org-agenda-overriding-header "")
                                                    (org-super-agenda-groups
                                                     '((:name "Importante"
                                                        :priority "A"
                                                        :discard (:anything t)))))))))))
(use-package! org-roam
  :config
  (setq! org-roam-directory "~/logseq"
         org-roam-dailies-directory "journals/"
         org-roam-capture-templates '(("d"
                                       "default"
                                       plain
                                       "%?"
                                       :target (file+head "pages/${slug}.org" "#+title: ${title}\n")
                                       :unnarrowed t))))
