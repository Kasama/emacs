(require 'package)

;; use-package auto install configuration {
;; Add package listings
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (unless (assoc 'use-package package-archive-contents)
    (package-refresh-contents))
  (package-install 'use-package))

;; Use use-package as the package manager
(eval-when-compile
  (require 'use-package))

;; end of packages configuration }

;; disable annoying menu bar
(menu-bar-mode -1)
;; disable annoying scroll bar
(toggle-scroll-bar -1)
;; disable annoying tool bar
(tool-bar-mode -1)

(line-number-mode 1)
(column-number-mode 1)

;; disable startup screen
(setq inhibit-startup-screen t)


;; enable evil-mode (Vim for Emacs)
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
    (setq evil-operator-state-cursor '("orange" hollow))

    ;; jk works with visual lines instead of real lines
    (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

    ;; Scroll with C-j/k
    (define-key evil-normal-state-map (kbd "C-j") 'evil-scroll-line-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-scroll-line-up)

    ;; enable leader key
    (use-package evil-leader
      :ensure t
      :init
      (setq evil-leader/in-all-states 1)
      :config
      (progn
	(global-evil-leader-mode)
	;; set leader key to ,
	(evil-leader/set-leader ",")
	)
      )

    ;; enable C-a and C-x to increment and decrement numbers
    (use-package evil-numbers
      :ensure t
      :config
      (progn
	(evil-define-key 'normal global-map (kbd "C-a") 'evil-numbers/inc-at-pt)
	(evil-define-key 'normal global-map (kbd "C-x") 'evil-numbers/dec-at-pt)
	)
      )
    )
  )

(use-package vue-mode
  :mode ("\\.vue\\'" . vue-mode)
  )

;; enable Helm
(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
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
    (vue-mode ## evil-numbers evil-leader base16-theme color-theme helm use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; use base16-monokai as theme (must be after custom-set-varibles)
(use-package base16-theme
  :ensure t
  :init (load-theme 'base16-monokai)
  )
