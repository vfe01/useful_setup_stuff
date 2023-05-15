(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(global-display-line-numbers-mode)
(delete-selection-mode )

(global-unset-key (kbd "C-x m"))
(global-unset-key (kbd "C-x o"))
;;Own custom keybindings
(global-set-key (kbd "M-C-r") 'replace-string)
(global-set-key (kbd "C-M-m") 'magit)
(global-set-key (kbd "M-C-s") 'suspend-frame)
(global-set-key (kbd "M-C-k") 'kill-buffer)
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/elpa/flycheck-inline/")
(load-theme 'monokai t)
;;(with-eval-after-load 'flycheck
;;    (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

(add-hook 'web-mode-hook 'ac-html-enable)
(add-hook 'web-mode-hook 'auto-rename-tag-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(setq web-mode-enable-auto-closing t)
(setq web-mode-auto-close-style 2)
  
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require 'package)

(add-to-list 'package-archives
	     '("MELPA Stable" . "https://stable.melpa.org/packages/") t)


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
;;(add-hook 'objc-mode-hook 'irony-mode)


(require 'company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
(smartparens-global-mode)
(global-flycheck-mode)
(global-auto-complete-mode)
(yas-global-mode)
(global-anzu-mode +1)
;;(global-aggressive-indent-mode 1)
(indent-guide-global-mode)
(global-highlight-parentheses-mode)
(move-text-default-bindings)
(which-key-mode)
(global-set-key [f8] 'neotree-toggle)

;;M-; för att kommentera en eller flera valda lines
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(malinka-mode)

(defhydra hydra-yas()
  "yasnippets"
  ("v" yas-visit-snippet-file "visit snippet file")
  ("d" yas-describe-tables "descirbe tables")
  ("n" yas-new-snippet "new snippet"))
(global-set-key (kbd "C-M-y") 'hydra-yas/body)

(defhydra hydra-packages ()
  "packages"
  ("i" package-install "install")
  ("l" package-list-packages "list")
  ("d" package-delete "delete")
  ("e" (find-file "~/.emacs") ".emacs")
  ("b" (find-file "~/.bashrc") ".bashrc"))
(global-set-key (kbd "M-p") 'hydra-packages/body)

(require 'bm)
(defhydra hydra-bookmarks ()
  "bookmarks"
  ("n" bm-next "next")
  ("p" bm-previous "previous")
  ("t" bm-toggle "toggle")
  ("s" bm-show "show")
  ("C-s" bm-buffer-save "save buffer")
  ("C-r" bm-buffer-restore "restore buffer"))

(global-set-key (kbd "M-C-b") 'hydra-bookmarks/body)

;;Värdelöst men ok exempel på en hydra
(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))



(global-set-key (kbd "M-z") #'zzz-to-char)
(global-set-key (kbd "M-C-z") #'zzz-up-to-char)

(global-set-key (kbd "M-o") 'ace-window)


(require 'dashboard)
(dashboard-setup-startup-hook)

;;Javascript
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;; (add-hook 'js-mode-hook #'rainbow-delimiters-mode)

;;(add-hook 'js-mode-hook (lambda () (tern-mode t)))
;;/Javascript

(require 'workgroups2)

;;(require 'sublimity)
;; (require 'sublimity-scroll)
;;(require 'sublimity-map) ;; experimental
;; (require 'sublimity-attractive)

;;(with-eval-after-load 'flycheck
;;    (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))
;;(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;;(projectile-mode +1)
;;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;(define-key shell-pop-m (kdb "C-x t") 'shell-pop)

(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ ")
(load "~/.emacs.d/c-eldoc")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   '("f5b6be56c9de9fd8bdd42e0c05fecb002dedb8f48a5f00e769370e4517dde0e8" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "9abe2b502db3ed511fea7ab84b62096ba15a3a71cdb106fd989afa179ff8ab8d" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "28a34dd458a554d34de989e251dc965e3dc72bace7d096cdc29249d60f395a82" "78e9a3e1c519656654044aeb25acb8bec02579508c145b6db158d2cfad87c44e" default))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(emmet-mode web-mode auto-rename-tag ac-html smartparens malinka flycheck-irony cpputils-cmake company-irony-c-headers yasnippet-snippets which-key neotree hydra evil-nerd-commenter move-text highlight-parentheses rainbow-delimiters zzz-to-char indent-guide aggressive-indent indium tern js2-mode dart-mode bm anzu ace-window workgroups2 sublimity dashboard haskell-mode haskell-emacs speed-type magit flycheck-rust treemacs spacemacs-theme darktooth-theme gruvbox-theme monokai-theme solarized-theme shell-pop rust-mode meghanada projectile dumb-jump auto-complete flycheck yasnippet))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(shell-pop-shell-type
   '("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell))))
 '(shell-pop-universal-key nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#222" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default")))))




