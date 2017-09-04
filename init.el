(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(tool-bar-mode -1)
(menu-bar-mode -1)
(line-number-mode 1)
(scroll-bar-mode -1)
(column-number-mode 1)

(unless (package-installed-p 'use-package)
  (unless (assoc 'use-package package-archive-contents)
    (package-refresh-contents))
  (package-install 'use-package))

(use-package base16-theme
  :ensure t
  :init (load-theme 'base16-monokai)
  )

(use-package evil
  :ensure t
  :config
  (progn
    (evil-mode 1)

    ;; Color cursor based on mode
    (setq evil-emacs-state-cursor '("red" box))
    (setq evil-normal-state-cursor '("white" box))
    (setq evil-visual-state-cursor '("orange" box))
    (setq evil-insert-state-cursor '("white" bar))
    (setq evil-replace-state-cursor '("red" box))
    (setq evil-operator-state-cursor '("red" hollow))

    (use-package evil-leader
      :ensure t
      :config
      (global-evil-leader-mode)
      (progn
	(evil-leader/set-leader ",")
	)
      )

    ;; jk works with visual lines instead of real lines
    (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

    ;; C-j/k
    (define-key evil-normal-state-map (kbd "C-j") 'evil-scroll-line-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-scroll-line-up)
    )
  )

(use-package helm
  :ensure t
  :bind (
	 ("M-x" . helm-M-x)
	 )
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" default)))
 '(package-selected-packages
   (quote
    (evil-leader base16-theme color-theme helm use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
