;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

;; global bindings
(map!
  :desc "Jump to matching item"
  :n "TAB" 'evil-jump-item

  :desc "increase window width"
  :nvi "C-S-<left>" (lambda () (interactive) (enlarge-window 5 t))

  :desc "decrease window width"
  :nvi "C-S-<right>" (lambda () (interactive) (enlarge-window -5 t))

  :desc "increase window height"
  :nvi "C-S-<down>" (lambda () (interactive) (enlarge-window 5))

  :desc "decrease window height"
  :nvi "C-S-<up>" (lambda () (interactive) (enlarge-window -5))

  :desc "Expand region"
  :nvi "M-=" #'er/expand-region

  :desc "Reverse expand region"
  :nvi "M--" (lambda () (interactive) (er/expand-region -1))

  :desc "Select all occurrences with multi-cursors"
  :n "M-r" 'evil-multiedit-match-all

  (:prefix "g"
    :nm "o" 'consult-imenu
    :nm "O" 'evil-goto-char
    :nm "f" '+format/region-or-buffer)

  (:prefix "["
    :m "e" 'flycheck-next-error)

  (:prefix "]"
    :m "e" 'flycheck-previous-error))

; Tabs
(map! :after centaur-tabs
  (:prefix "["
    :nm "t" '+tabs:next-or-goto
    :nm "T" '+tabs:previous-or-goto)
  (:prefix "g"
    :nm "t" '+tabs:next-or-goto
    :nm "T" '+tabs:previous-or-goto))

; LSP
(map! :after lsp-mode
       :map lsp-mode-map
       :prefix "g"

       :n "d" 'lsp-find-definition
       :n "D" 'lsp-find-references)

; ORG
(map! :map org-mode-map
       :n "M-RET" 'org-open-at-point)

; unbinding greater precedence key maps
(after! paredit
  (define-key paredit-mode-map (kbd "C-<left>") nil)
  (define-key paredit-mode-map (kbd "C-<right>") nil)
  (unbind-key ">" 'evil-normal-state-map)
  (unbind-key ">" 'evil-normal-state-map)
  (unbind-key "M-." 'evil-normal-state-map)
  (unbind-key "M-," 'global-map))

; Lisp navigation and interaction
(map! :after paredit
      :map paredit-mode-map
  
      :desc "Forward barf"
      :nv "<" #'paredit-forward-barf-sexp

      :desc "Forward slurp"
      :nv ">" #'paredit-forward-slurp-sexp

      :desc "Backward slurp"
      :nv "M-," #'paredit-backward-slurp-sexp

      :desc "Backward barf"
      :nv "M-." #'paredit-backward-barf-sexp)

(map! :after evil-cleverparens
      :textobj "l" #'evil-cp-inner-form #'evil-cp-a-form)

; removes shadowing binds
(after! evil-cleverparens
  (unbind-key "<normal-state> M-r" 'evil-cleverparens-mode-map)
  (unbind-key "<normal-state> [" 'evil-cleverparens-mode-map)
  (unbind-key "<operator-state> [" 'evil-cleverparens-mode-map)
  (unbind-key "<visual-state> [" 'evil-cleverparens-mode-map)
  (unbind-key "<normal-state> ]" 'evil-cleverparens-mode-map)
  (unbind-key "<operator-state> ]" 'evil-cleverparens-mode-map)
  (unbind-key "<visual-state> ]" 'evil-cleverparens-mode-map))
