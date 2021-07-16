;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Matheus Ashton Silva"
      user-mail-address "matheusashton@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
                                        ; (setq doom-theme 'doom-oceanic-next)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Indentation levels
(setq typescript-indent-level 2)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
(load! "nu")

;; Always start maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Configuring root folder for Projectile to search projects
(setq projectile-project-search-path '("~/dev/nu" "~/dev/pessoal" "~/dev/nu/mini-meta-repo/packages"))
(setq frame-title-format (setq icon-title-format  ;; set window title with "project"
                               '((:eval (projectile-project-name)))))

;; Treemacs theme
(after! doom-themes
  (setq doom-themes-treemacs-theme "doom-colors"))

(after! dtrt-indent
  (add-to-list 'dtrt-indent-hook-mapping-list '(typescript-mode javascript typescript-indent-level)))

;; Treemacs - Ignoring .gitignore files / dirs
(setq treemacs-python-executable "/usr/bin/python3")
(after! treemacs
  (treemacs-git-mode 'extended)
  (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?))


(setq +format-on-save-enabled-modes '(dart-mode))

;; Typescript
(add-hook 'typescript-mode-local-vars-hook
          (lambda ()
            (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)))
(add-hook 'typescript-mode-local-vars-hook
          (lambda ()
            (flycheck-add-next-checker 'tsx-tide 'javascript-eslint 'append)))

(setq lispyville-key-theme
      '((operators normal)
        c-w
        (prettify insert)
        (text-objects normal)
        (atom-movement t)
        slurp/barf-lispy
        additional
        additional-insert
        additional-wrap))

(after! lispyville
  (map! :map lispy-mode-map-lispy "[" nil))

(after! lispyville
  (map! :map lispy-mode-map-lispy "]" nil))

(after! clojure-mode
  (define-clojure-indent
    (against-background 'defun)
    (alet 'defun)
    (as-> 1)
    (as-customer 1)
    (as-of 1)
    (constraint-fn 'defun)
    (data-fn 'defun)
    (defflow 'defun)
    (defflow-loopback-false 'defun)
    (fact 'defun)
    (facts 'defun)
    (flow 'defun)
    (flow-mx 'defun)
    (for-all 'defun)
    (future-fact 'defun)
    (let-entities 'defun)
    (log-messages 'defun)
    (match? 'defun)
    (mlet 'defun)
    (provided 'defun)
    (providing 'defun)
    (request-context 'defun)
    (tabular 'defun)
    (tabular-flow 'defun)
    (verify 'defun)
    (defroutes 'defun)
    (GET 2)
    (POST 2)
    (PUT 2)
    (DELETE 2)
    (HEAD 2)
    (ANY 2)
    (OPTIONS 2)
    (PATCH 2)
    (rfn 2)
    (let-routes 1)
    (context 2)))

(use-package! clojure-mode
  :config
  (setq clojure-indent-style 'align-arguments
        clojure-thread-all-but-last t
        yas-minor-mode 1))

(use-package! lsp-treemacs
  :config
  (setq lsp-treemacs-error-list-current-project-only t))

(use-package! lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-peek-list-width 60
        lsp-ui-doc-max-width 60
        lsp-ui-peek-fontify 'always
        lsp-ui-sideline-show-code-actions nil))

(use-package! hover
  :after dart-mode
  :config
  (setq hover-hot-reload-on-save t
        hover-clear-buffer-on-hot-restart t
        hover-screenshot-path "$HOME/Pictures"))

(after! projectile
  (projectile-register-project-type 'dart '("pubspec.yaml")
                                    :project-file "pubspec.yaml"
                                    :test-suffix "_test"
                                    :test "dart test")
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD"))


(add-hook! cider-mode (add-to-list 'cider-test-defining-forms "defflow"))

(defadvice! fix-lookup-handlers (ret)
  :filter-return '(+lsp-lookup-references-handler +lsp-lookup-definition-handler)
  (when ret 'deferred))

(map! :after centaur-tabs-mode
      :map centaur-tabs-mode-map
      :n "gt" 'centaur-tabs-forward)

(map! :after centaur-tabs-mode
      :map centaur-tabs-mode-map
      :n "]t" 'centaur-tabs-forward)

(map! :after centaur-tabs-mode
      :map centaur-tabs-mode-map
      :n "[t" 'centaur-tabs-backward)

(map! :after centaur-tabs-mode
      :map centaur-tabs-mode-map
      :n "gT" 'centaur-tabs-backward)

(map! :after lsp-mode
      :map lsp-mode-map
      :n "gd" 'lsp-find-definition)

(map! :after lsp-mode
      :map lsp-mode-map
      :n "gD" 'lsp-find-references)

(plist-put! +ligatures-extra-symbols
            :true          "⊤"
            :false         "⊥"
            :str           "ξ"
            :bool          "β"
            :list          "∐")
