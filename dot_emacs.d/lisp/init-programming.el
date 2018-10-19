;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;              项目管理               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package magit
  :ensure t
  :defer 3
  :config
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*magit:")
                 (display-buffer-reuse-window
                  display-buffer-below-selected)
                 (reusable-frames . visible)
                 (side            . bottom)
                 (window-height   . 0.4)))
  )


(use-package evil-magit
  :ensure t
  :defer 3
  :after magit
  )

(use-package projectile
  :ensure t
  :defer 1
  :bind(
        :map projectile-mode-map
        ( "C-c p" . projectile-command-map)
        )
  )

;; (use-package git-gutter
;;   :ensure t
;;   :init
;;   (global-git-gutter-mode +1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;               代码补全             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :defer 1
  :hook (prog-mode . company-mode)
  :bind (("M-/" . company-complete)
         :map company-active-map
         ("<backtab>" . company-select-previous-or-abort)
         ("M-i" . company-complete-selection)
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ("M-n" . company-select-next)
         ("M-p" . company-select-previous))
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-echo-delay 0)
  (setq company-global-modes
        '(not message-mode git-commit-mode eshell-mode))

  ;; company-dabbrev
  (setq company-dabbrev-char-regexp "[[:word:]_:@.-]+")
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case nil)
  (setq company-require-match nil)
  (setq company-dabbrev-minimum-length 2)

  (setq company-backends
        '((company-capf company-dabbrev company-files)
          (company-dabbrev-code company-gtags company-etags
                                company-keywords)))
  (setq company-transformers
        '(company-sort-by-occurrence))

  ;;   ;; 只有一个可选的时候也显示出来
  (setq company-frontends
        '(company-pseudo-tooltip-frontend
          company-echo-metadata-frontend))

  (if (and (fboundp 'daemonp) (daemonp))
      (add-hook 'after-make-frame-functions
                (lambda (x)
                  (global-company-mode)))
    (global-company-mode)))

;; YouCompleteMe
(use-package ycmd
  :ensure t
  :defer 5
  :config
  (set-variable 'ycmd-startup-timeout 5)
  (setq ycmd-tag-files 'auto)
  (setq ycmd-request-message-level -1)
  (set-variable 'ycmd-startup-timeout 5)
  (set-variable 'ycmd-server-command `("python" ,(file-truename "~/.vim/plugged/YouCompleteMe/third_party/ycmd/ycmd")))
  (set-variable 'ycmd-global-config "~/.config/nvim/.ycm_extra_conf.py")
  (set-variable 'ycmd-extra-conf-handler 'load)
  (defun ycmd-setup-completion-at-point-function ()
    "Setup `completion-at-point-functions' for `ycmd-mode'."
    (add-hook 'completion-at-point-functions
              #'ycmd-complete-at-point nil :local))

  (add-hook 'ycmd-mode-hook #'ycmd-setup-completion-at-point-function)
  )

(use-package company-ycmd
  :ensure t
  :defer 5
  :hook(company-mode . company-ycmd-setup)
  )


(use-package hippie-expand
  :defer 5
  :config
  (setq hippie-expand-try-functions-list
        '(try-expand-dabbrev
	      try-expand-dabbrev-visible
	      try-expand-dabbrev-all-buffers
	      try-expand-dabbrev-from-kill
	      try-complete-file-name-partially
	      try-complete-file-name
	      try-expand-all-abbrevs
	      try-expand-list
	      try-expand-line
	      try-complete-lisp-symbol-partially
	      try-complete-lisp-symbol))
  )

(use-package yasnippet
  :ensure t
  :after company
  :defer 3
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets"                 ;; personal snippets
          ;; "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
          ;; "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
          ))
  (defun chandler/company-to-yasnippet ()
    (interactive)
    (company-abort)
    (call-interactively 'company-yasnippet))
  (bind-key "C-a" 'chandler/company-to-yasnippet company-active-map)
  )


(use-package yasnippet-snippets
  :ensure t
  :defer 5
  )





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;               代码检查             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package flycheck
  :ensure t
  :defer 2
  :config
  ;; 控制buffer行为
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*Flycheck errors*" eos)
                 (display-buffer-reuse-window
                  display-buffer-below-selected)
                 (reusable-frames . visible)
                 (side            . bottom)
                 (window-height   . 0.3))))

(use-package flycheck-ycmd
  :ensure t
  :defer 2
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-ycmd-setup))


(use-package format-all
  :ensure t
  :defer 2
  )




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                  其他               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package gtags
  :ensure t
  :defer 2
  )

(use-package aggressive-indent
  :ensure t
  :defer 2
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'css-mode-hook #'aggressive-indent-mode)
  )

(use-package devdocs
  :ensure t
  :defer 5
  )

;; ;; 自动换行
;; (add-hook 'text-mode-hook (lambda ()
;;                             (turn-on-auto-fill)
;;                             (fci-mode)
;;                             (set-fill-column 82)))
;; (add-hook 'markdown-mode-hook (lambda ()
;;                                 (turn-on-auto-fill)
;;                                 (fci-mode)
;;                                 (set-fill-column 82)))
;; (add-hook 'python-mode-hook (lambda ()
;;                               (fci-mode)
;;                               (set-fill-column 94)))
;; (add-hook 'c-mode-hook (lambda ()
;;                          (fci-mode)
;;                          (set-fill-column 94)))


(use-package smartparens
  :ensure t
  :defer 2
  :config
  ;; 括号补全
  (smartparens-global-mode t)
  (show-paren-mode t)
  (define-advice
      show-paren-function
      (:around (fn)
               fix-show-paren-function)
    "Highlight enclosing parens."
    (cond ((looking-at-p "\\s(")
           (funcall fn))
          (t (save-excursion (ignore-errors (backward-up-list))
                             (funcall fn)))))
  (sp-local-pair 'emacs-lisp-mode "'" nil
                 :actions nil)
  (sp-local-pair 'lisp-interaction-mode "'" nil
                 :actions nil)
  )

(use-package evil-smartparens
  :ensure t
  :defer 2
  :after evil smartparens
  :config
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  )

;; 撤销记录
(use-package undo-tree
  :ensure t
  :defer 1
  :config
  (progn
    (defun modi/undo-tree-enable-save-history ()
      "Enable auto saving of the undo history."
      (interactive)

      (setq undo-tree-auto-save-history t)

      ;; Compress the history files as .gz files
      ;; (advice-add 'undo-tree-make-history-save-file-name :filter-return
      ;;             (lambda (return-val) (concat return-val ".gz")))

      ;; Persistent undo-tree history across emacs sessions
      (setq modi/undo-tree-history-dir (let ((dir (concat user-emacs-directory
                                                          "undo-tree-history/")))
                                         (make-directory dir :parents)
                                         dir))
      (setq undo-tree-history-directory-alist `(("." . ,modi/undo-tree-history-dir)))

      (add-hook 'write-file-functions #'undo-tree-save-history-hook)
      (add-hook 'find-file-hook #'undo-tree-load-history-hook))

    (defun modi/undo-tree-disable-save-history ()
      "Disable auto saving of the undo history."
      (interactive)

      (setq undo-tree-auto-save-history nil)

      (remove-hook 'write-file-functions #'undo-tree-save-history-hook)
      (remove-hook 'find-file-hook #'undo-tree-load-history-hook))

    (modi/undo-tree-enable-save-history)

    (global-undo-tree-mode 1)))


(provide 'init-programming)
