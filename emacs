(setq visible-bell t)
(setq inhibit-startup-message t)
(setq mouse-yank-at-point t)
(setq kill-ring-max 200)
(setq default-fill-column 60)
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list())
(setq sentence-end "\\([。 ！ ？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
(setq enable-recursive-minibuffers t)
(setq scroll-margin 3
      scroll-conservatively 10000)
(setq default-major-mode 'text-mode)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(mouse-avoidance-mode 'animate)
(setq frame-title-format "emacs@%b")
(auto-image-file-mode)
(global-font-lock-mode t)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
(setq version-control t)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)
(global-set-key [(f5)] 'speedbar)
(setq shell-file-name "/bin/bash")
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
(setq outline-minor-mode-prefix [(control o)])
(add-hook 'c-mode-hook 'linux-c-mode)
(add-hook 'c++-mode-hook 'linux-cpp-mode)
(setq imenu-sort-function 'imenu--sort-by-name)
(defun linux-c-mode()
  (define-key c-mode-map [return] 'newline-and-indent)
  (define-key c-mode-map [(f7)] 'compile)
  (define-key c-mode-map [(meta \`)] 'c-indent-command)
  (define-key c-mode-map [(control \`)] 'hs-toggle-hiding)
  (interactive)
  (c-set-style "K&R")
  (c-toggle-auto-state)
  (c-toggle-hungry-state 1)
  (setq c-basic-offset 4) 
  (imenu-add-menubar-index)
  (which-function-mode)
 )
(defun linux-cpp-mode()
  (define-key c++-mode-map [return] 'newline-and-indent)
  (define-key c++-mode-map [(f7)] 'compile)
  (interactive)
  (c-set-style "K&R")
  (c-toggle-auto-state)
  (c-toggle-hungry-state 1)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode)
  )


(mapcar
 (function (lambda (setting)
    (setq auto-mode-alist
  (cons setting auto-mode-alist))))
 '(("\\.xml$". sgml-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$". sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)))
(setq backup-directory-alist (quote (("." . "~/backups"))))
(setq backup-by-copying t)


(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
 '(
try-expand-line
try-expand-line-all-buffers
try-expand-list
try-expand-list-all-buffers
try-expand-dabbrev
try-expand-dabbrev-visible
try-expand-dabbrev-all-buffers
try-expand-dabbrev-from-kill
try-complete-file-name
try-complete-file-name-partially
try-complete-lisp-symbol
try-complete-lisp-symbol-partially
try-expand-whole-kill))
(defun my-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
 (hippie-expand nil)
(indent-for-tab-command))
)
(global-set-key [(control tab)] 'my-indent-or-complete)
;;org-mode
(require 'org-install)
(require 'org-publish)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 
(lambda () (setq truncate-lines nil)))
 
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


(setq org-publish-project-alist
      '(("note-org"
         :base-directory "/root/org/org"
         :publishing-directory "/root/org/publish"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-index t
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html"
         :section-numbers nil
         :style "<link rel=\"stylesheet\"
    href=\"./css/main.css\"
    type=\"text/css\"/>")
        ("note-static"
         :base-directory "/root/org/org"
         :publishing-directory "/root/org/publish"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("note" 
         :components ("note-org" "note-static")
         :author "hyz0906@gmail.com"
         )))
(global-set-key (kbd "<f8> p") 'org-publish)
;;


(setq display-time-day-and-date t)
(display-time)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)
(setq calendar-latitude +34.433334)
(setq calendar-longitude +117.2797)
(setq calendar-location-name "Xi'an")
(setq user-full-name "Han Yuzhe")
(setq user-mail-address "hyz0906@gmail.com")
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)


;;(set-keyboard-coding-system 'chinese-iso-8bit)




(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "文泉驿正黑")))))
