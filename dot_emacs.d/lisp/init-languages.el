
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;              Emacs-lisp             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package highlight-defined
  :ensure t
  :hook (emacs-lisp-mode . highlight-defined-mode)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                Python               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :hook(
        (python-mode . ycmd-mode)
        (python-mode . company-mode)
        )
  :config
  (setq python-indent-offset 4)
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "--simple-prompt -i --pylab")

  ;; 使在ipython中能上下选择命令
  (define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
  (define-key comint-mode-map (kbd "<down>") 'comint-next-input)
  )

(use-package flycheck-pycheckers
  :ensure t
  :commands flycheck-mode
  :hook (flycheck-mode . flycheck-pycheckers-setup)
  :config
  (setq flycheck-pycheckers-checkers (quote (pylint pep8)))
  )

(use-package py-isort
  :ensure t
  :defer 5
  )

;; Python Notebook
(use-package ein
  :ensure t
  :defer 5
  :after company
  :config
  (setq ein:completion-backend 'ein:use-company-backend)
  )

(use-package fill-column-indicator
  :ensure t
  :after company
  :init
  (defvar-local company-fci-mode-on-p nil)
  ;; 修复导致company显示错误的问题
  (defun company-turn-off-fci (&rest ignore)
    (when (boundp 'fci-mode)
      (setq company-fci-mode-on-p fci-mode)
      (when fci-mode (fci-mode -1))))

  (defun company-maybe-turn-on-fci (&rest ignore)
    (when company-fci-mode-on-p (fci-mode 1)))

  :hook ((company-completion-started . company-turn-off-fci)
         (company-completion-finished . company-maybe-turn-on-fci)
         (company-completion-cancelled . company-maybe-turn-on-fci)
         (prog-mode . fci-mode))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                 C++                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'c-mode-common-hook 'ycmd-mode)
(add-hook 'c-mode-common-hook 'company-mode)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))

(use-package cpputils-cmake
  :ensure t
  :defer 5
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (if (derived-mode-p 'c-mode 'c++-mode)
                  (cppcm-reload-all)
                )))
  ;; OPTIONAL, somebody reported that they can use this package with Fortran
  (add-hook 'c90-mode-hook (lambda () (cppcm-reload-all)))
  ;; OPTIONAL, avoid typing full path when starting gdb
  (global-set-key (kbd "C-c C-g")
                  '(lambda ()(interactive) (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))
  ;; OPTIONAL, some users need specify extra flags forwarded to compiler
  ;; (setq cppcm-extra-preprocss-flags-from-user '("-I/usr/src/linux/include" "-DNDEBUG"))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                CMake                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package cmake-mode
  :ensure t
  :defer 5
  :config
  (add-to-list 'auto-mode-alist '("\\CMakeLists.txt\\'" . cmake-mode))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                  Go                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package go-mode
  :ensure t
  :commands go-mode
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                TypeScript           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package tide
  :ensure t
  :after company
  :init
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1))
  :hook (  
         ;; formats the buffer before saving
         (before-save . tide-format-before-save)
         (typescript-mode . setup-tide-mode)
         )
  :config
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;               JavaScript            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode)
  :config
  (add-hook 'js2-mode-hook 'ycmd-mode)
  (add-hook 'js2-mode-hook 'company-mode)
  (add-hook 'js2-mode-hook 'js2-mode-hide-warnings-and-errors)
  (add-hook 'js2-mode-hook #'setup-tide-mode)
  )

(use-package nodejs-repl
  :ensure t
  :after js2-mode
  :config
  (add-hook 'js-mode-hook
            (lambda ()
              (define-key js-mode-map (kbd "C-c C-c") 'nodejs-repl-send-buffer)
              (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-expression)
              (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-send-line)
              (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
              (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))

  (add-hook 'js2-mode-hook
            (lambda ()
              (define-key js2-mode-map (kbd "C-c C-c") 'nodejs-repl-send-buffer)
              (define-key js2-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-expression)
              (define-key js2-mode-map (kbd "C-c C-l") 'nodejs-repl-send-line)
              (define-key js2-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
              (define-key js2-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                 Web                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package web-mode
  :ensure t
  :mode
  (("\\.html?\\'" . web-mode)
   ("\\.phtml\\'" . web-mode)
   ("\\.tpl\\.php\\'" . web-mode)
   ("\\.[agj]sp\\'" . web-mode)
   ("\\.as[cp]x\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode)
   ;; associate a content type
   ("\\.api\\'" . web-mode)
   ("/some/react/path/.*\\.js[x]?\\'" . web-mode))
  :config
  ;; (add-hook 'web-mode-hook 'ycmd-mode)
  ;; (add-hook 'web-mode-hook 'company-mode)

  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file

  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-block-padding 2
        web-mode-comment-style 2
        web-mode-enable-auto-expanding t
        web-mode-enable-css-colorization t
        web-mode-enable-auto-pairing t
        web-mode-enable-current-element-highlight t)
  ) ; this fixes the quote problem I mentioned

(provide 'init-languages)
