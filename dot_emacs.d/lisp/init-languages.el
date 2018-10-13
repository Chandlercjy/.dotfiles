
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;              Emacs-lisp             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package highlight-defined
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook 'highlight-defined-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                Python               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config (setq python-indent-offset 4)
  (add-hook 'python-mode-hook 'ycmd-mode)
  (add-hook 'python-mode-hook 'company-mode)
  )

(use-package flycheck-pycheckers
  :ensure t
  :after flycheck
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup)
  (setq flycheck-pycheckers-checkers (quote (pylint pep8)))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;           Python Notebook           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ein
  :ensure t
  :config
  (setq ein:completion-backend 'ein:use-company-backend)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;            IPython Shell            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package fill-column-indicator
  :ensure t
  )

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i --pylab")
(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
(define-key comint-mode-map (kbd "<down>") 'comint-next-input)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                 C++                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'c-mode-common-hook 'ycmd-mode)
(add-hook 'c-mode-common-hook 'company-mode)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))

(use-package cpputils-cmake
  :ensure t
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
  :config
  (add-to-list 'auto-mode-alist '("\\CMakeLists.txt\\'" . cmake-mode))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;                TypeScript           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :after company
  :config
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)
  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  )

(provide 'init-languages)

