;; -*- lexical-binding: t -*-

;; "Deliver us from Evil."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f0eb51d80f73b247eb03ab216f94e9f86177863fb7e48b44aacaddbfe3357cf1" "db5b906ccc66db25ccd23fc531a213a1afb500d717125d526d8ff67df768f2fc" "98fada4d13bcf1ff3a50fceb3ab1fea8619564bb01a8f744e5d22e8210bfff7b" default))
 '(package-selected-packages
   '(orderless leaf magit objed org-modern svg-lib svg-tag-mode annotate dict-tree frog-menu fsm ilist prop-menu ace-window advice-patch avy blist cape corfu crdt dired-du dired-git-info edit-indirect eev eglot el-search eldoc eldoc-eval embark embark-consult marginalia minibuffer-header nano-agenda nano-modeline nano-theme vertico))
 '(widget-image-enable nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(nano-modeline-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(fido-mode 1)
(toggle-frame-fullscreen)
(require 'minibuffer-header) (minibuffer-header-mode)
(require 'hierarchy)
(load-theme 'nano-light)
(global-set-key [67108910] 'embark-act)
(global-set-key "k" 'ibuffer)
(global-set-key "" 'ace-window)
(setq prefix-help-command #'embark-prefix-help-command)
(require 'orderless)
(require 'corfu)
(require 'avy)
(require 'ace-window)
;; Example configuration for Consult
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings (mode-specific-map)
         ("C-c h" . consult-history)
         ("C-c C-m" . consult-mode-command)
         ("C-c C-k" . consult-kmacro)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x C-b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x C-4 C-b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x C-5 C-b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom god-mode bindings for fast register access
         ("C-#" . consult-register-load)
         ("C-m" . consult-register-store)          ;; orig. =M-'= abbrev-prefix-mark (unrelated)
         ("C-'" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ("<help> C-a" . consult-apropos)            ;; orig. apropos-command
         ;; M-g bindings (goto-map)
         ("M-g C-e" . consult-compile-error)
         ("M-g C-f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g C-o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g C-m" . consult-mark)
         ("M-g C-k" . consult-global-mark)
         ("M-g C-i" . consult-imenu)
         ("M-g C-I" . consult-imenu-multi)
         ;; M-s bindings (search-map)
         ("M-s C-d" . consult-find)
         ("M-s C-D" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s C-r" . consult-ripgrep)
         ("M-s C-l" . consult-line)
         ("M-s C-L" . consult-line-multi)
         ("M-s C-m" . consult-multi-occur)
         ("M-s C-k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s C-e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s C-e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s C-l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s C-L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key (kbd "M-."))
  ;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-recent-file
   consult--source-project-recent-file
   :preview-key (kbd "M-."))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; (kbd "C-+")

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
  ;; There are multiple reasonable alternatives to chose from.
  ;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
  ;;;; 2. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-function (lambda (_) (projectile-project-root)))
  ;;;; 3. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
  ;;;; 4. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
)

(define-key minibuffer-local-map (kbd "M-.") #'my-embark-preview)
(defun my-embark-preview ()
  "Previews candidate in vertico buffer, unless it's a consult command"
  (interactive)
  (unless (bound-and-true-p consult--preview-function)
    (save-selected-window
      (let ((embark-quit-after-action nil))
        (embark-dwim)))))

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

(setq god-mode-enable-function-key-translation nil)
(require 'god-mode)
(god-mode)
(global-set-key (kbd "<menu>") #'god-mode-all)

(defun my-god-mode-update-cursor-type ()
  (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))

(add-hook 'post-command-hook #'my-god-mode-update-cursor-type)

(defun my-god-mode-update-mode-line ()
  (cond
   (god-local-mode
    (set-face-attribute 'mode-line nil
                        :foreground "#604000"
                        :background "#fff29a")
    (set-face-attribute 'mode-line-inactive nil
                        :foreground "#3f3000"
                        :background "#fff3da"))
   (t
    (set-face-attribute 'mode-line nil
                        :foreground "#0a0a0a"
                        :background "#d7d7d7")
    (set-face-attribute 'mode-line-inactive nil
                        :foreground "#404148"
                        :background "#efefef"))))

(add-hook 'post-command-hook 'my-god-mode-update-mode-line)

(require 'god-mode-isearch)
(define-key isearch-mode-map (kbd "<menu>") #'god-mode-isearch-activate)
(define-key god-mode-isearch-map (kbd "<escape>") #'god-mode-isearch-disable)
(define-key god-mode-isearch-map (kbd "j") #'avy-isearch)
(define-key god-local-mode-map (kbd "z") #'repeat)
(define-key god-local-mode-map (kbd "i") #'god-local-mode)
(global-set-key (kbd "C-x C-1") #'delete-other-windows)
(global-set-key (kbd "C-x C-2") #'split-window-below)
(global-set-key (kbd "C-x C-3") #'split-window-right)
(global-set-key (kbd "C-x C-0") #'delete-window)

(define-key god-local-mode-map (kbd "{") #'backward-paragraph)
(define-key god-local-mode-map (kbd "}") #'forward-paragraph)

(use-package detached
  :init
  (detached-init)
  :bind (;; Replace `async-shell-command' with `detached-shell-command'
         ([remap async-shell-command] . detached-shell-command)
         ([remap shell-command] . detached-shell-command)
         ;; Replace `compile' with `detached-compile'
         ([remap compile] . detached-compile)
         ([remap recompile] . detached-compile-recompile)
         ;; Replace built in completion of sessions with `consult'
         ([67108900] . 'detached-open-session)
         ([67108897] . 'shell-command)
         ([remap detached-open-session] . detached-consult-session))
  :custom ((detached-show-output-on-attach t)
           (detached-terminal-data-command system-type)))

(with-eval-after-load 'embark
    (fset 'embark-collect-swoop-down
          (kmacro-lambda-form [?\C-n return] 0 "%d"))
    (define-key embark-collect-mode-map (kbd "M-n") 'embark-collect-swoop-down)

    (fset 'embark-collect-swoop-up
          (kmacro-lambda-form [?\C-p return] 0 "%d"))
    (define-key embark-collect-mode-map (kbd "M-p") 'embark-collect-swoop-up)

    (add-hook 'embark-collect-mode-hook #'embark-collect-direct-action-minor-mode))

  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (define-key isearch-mode-map [remap isearch-query-replace]  #'anzu-isearch-query-replace)
  (define-key isearch-mode-map [remap isearch-query-replace-regexp] #'anzu-isearch-query-replace-regexp)

(defun avy-action-embark (pt)
    (unwind-protect
        (save-excursion
          (goto-char pt)
          (embark-act))
      (select-window
       (cdr (ring-ref avy-ring 0))))
    t)

(defun aw-isearch-forward (window)
    "Perform isearch-forward in WINDOW."
    (select-window window) (isearch-forward))

(with-eval-after-load 'avy
   (setf (alist-get ?. avy-dispatch-alist) 'avy-action-embark)
   (setf (alist-get ?/ avy-dispatch-alist) 'aw-isearch-forward))

(imenu-list-minor-mode)
(global-set-key [67108898] 'imenu-list-smart-toggle)
