(defun nu--cider-test-default-with-integration-ns (ns)
  "Custom cider test infer function.
Checks if NS is integration fallbacking to cider default check otherwise."
  (when ns
    (if (or (string-prefix-p "integration" ns) (string-prefix-p "postman" ns))
        ns
      (cider-test-default-test-ns-fn ns))))

(after! cider
  (setq cider-test-infer-test-ns #'nu--cider-test-default-with-integration-ns)
  (setf cider-test-defining-forms (append cider-test-defining-forms '("defflow" "defflow-loopback-false"))))

(use-package! cider
  :after clojure-mode
  :config
  (setq cider-ns-refresh-show-log-buffer t
        cider-show-error-buffer t;'only-in-repl
        cider-font-lock-dynamically '(macro core function var deprecated)
        cider-prompt-for-symbol nil)
  (set-popup-rule! "*cider-test-report*" :side 'right :width 0.5)
  (set-popup-rule! "^\\*cider-repl" :side 'bottom :quit nil)
  (set-lookup-handlers! 'cider-mode nil))

(defun nu-splunk-search-str (query-str earliest-date)
  (let* ((splunk-base-url "https://nubank.splunkcloud.com/en-US/app/search/search?earliest=%s&q=%s")
         (splunk-url (format splunk-base-url earliest-date query-str)))
    (browse-url splunk-url)))

(defun nu-splunk-search-region (begin end arg)
  "Searches in Splunk. Default input is the active region. If current buffer
belongs to a Nubank project, adds source to the input.
If called with prefix argument, use index=staging."
  (interactive "r\nP")
  (let* ((region-or-nil (if (use-region-p)
                            (buffer-substring-no-properties begin end)
                          nil))
         (search-str (nu-splunk-search-fmt-search-str (projectile-project-name) arg region-or-nil))
         (input-str (read-string "search: " search-str))
         (earliest-date (completing-read "Time range: " '("@d" "-15m" "-60m" "-4h" "-24h" "-7d" "-30d"))))
    (nu-splunk-search-str input-str earliest-date)))

(setq nu--available-commands-cmd "nu --available-commands")

(defun nu--list-cli-commands-completions (out-contexts)
  (require 'dash)
  (thread-last
      out-contexts
    (-partition-before-pred (lambda (line)
                              (string-match-p "^[^|]" line)))
    (-mapcat (lambda (partition)
               (-let [(context-name . context-commands) partition]
                 (or (--map (->> (concat context-name it)
                                 (replace-regexp-in-string "|--" " "))
                            context-commands)
                     partition))))))

(defun nu-list-cli-commands ()
  "Lists all nu cli commands. Opens a shell with the chosen command after selection."
  (interactive)
  (let* ((output-cmd (shell-command-to-string nu--available-commands-cmd))
         (split-output (split-string output-cmd "\n"))
         (selected-command (completing-read "commands: "
                                            (nu--list-cli-commands-completions split-output))))
    (nu--insert-in-shell (format "nu %s" selected-command))))

(defun nu-refresh-token ()
  "Run `nu auth refresh-token` in the chosen env."
  (interactive)
  (let ((env (completing-read "Env:" '("prod" "staging"))))
    (shell-command (format "nu auth refresh-token --env %s" env))))

(defun nu-copy-token ()
  "Append the output of `nu auth token` to the kill ring."
  (interactive)
  (let ((env (completing-read "Env:" '("prod" "staging"))))
    (kill-new (shell-command-to-string (format "nu auth token --env %s" env)))))

(defun nu-list-scopes ()
  "Lists all scopes (equivalent to `nu security scope show`)"
  (interactive)
  (shell-command "nu security scope show $(cat $NU_HOME/.nu/about/me/iam_user) --env prod"))

(defun nu-clj-lint-fix ()
  "Run `clj -Mlint:lint/fix' in the current project."
  (interactive)
  (async-shell-command (format "cd %s && clj -Mlint:lint/fix" (projectile-project-root))))

(defun nu-clj-nsorg-fix ()
  "Run `clj -Mnsorg:nsorg/fix' in the current project."
  (interactive)
  (async-shell-command (format "cd %s && clj -Mnsorg:nsorg/fix" (projectile-project-root))))

(defun nu-lein-lint-fix ()
  "Run `lein lint-fix' in the current project."
  (interactive)
  (async-shell-command (format "cd %s && lein lint-fix" (projectile-project-root))))

(provide 'nu)
