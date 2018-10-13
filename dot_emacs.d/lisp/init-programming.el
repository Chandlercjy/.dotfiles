
;;; Code:
(use-package smartparens
  :ensure t
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
  :after evil smartparens
  :config
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  )

;; 撤销记录
(setq undo-tree-auto-save-history t)
(setq undo-tree-enable-undo-in-region nil)
(setq undo-tree-history-directory-alist '(("" . "~/.emacs.d/undohist")))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.08)
  (setq company-minimum-prefix-length 3)
  (add-hook 'after-init-hook #'global-company-mode)
  (bind-key "<backtab>" 'company-select-previous-or-abort company-active-map)

  ;; 只有一个可选的时候也显示出来
  (setq company-frontends '(company-pseudo-tooltip-frontend
                            company-echo-metadata-frontend))
  )


(use-package flycheck
  :ensure t
  :config
  ;; 控制buffer行为
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*Flycheck errors*" eos)
                 (display-buffer-reuse-window
                  display-buffer-below-selected)
                 (reusable-frames . visible)
                 (side            . bottom)
                 (window-height   . 0.4))))

;; YouCompleteMe
(use-package ycmd
  :ensure t
  :config
  ;; (add-hook 'after-init-hook #'global-ycmd-mode)
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
  :config
  (add-hook 'after-init-hook #'company-ycmd-setup))

(use-package flycheck-ycmd
  :ensure t
  :config
  (add-hook 'after-init-hook #'flycheck-ycmd-setup))

(use-package gtags
  :ensure t
  )

;;项目管理
(use-package projectile
  :ensure t
  )

(use-package format-all
  :ensure t
  )

;; 自动换行
(add-hook 'text-mode-hook (lambda ()
                            (turn-on-auto-fill)
                            (fci-mode)
                            (set-fill-column 82)))
(add-hook 'markdown-mode-hook (lambda ()
                                (turn-on-auto-fill)
                                (fci-mode)
                                (set-fill-column 82)))
(add-hook 'python-mode-hook (lambda ()
                              (fci-mode)
                              (set-fill-column 94)))
(add-hook 'c-mode-hook (lambda ()
                         (fci-mode)
                         (set-fill-column 94)))



(use-package yasnippet
  :ensure t
  :after company evil
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
  :config
  )

(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  (add-hook 'css-mode-hook #'aggressive-indent-mode)
  )


(provide 'init-programming)
