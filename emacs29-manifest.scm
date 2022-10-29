;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(specifications->manifest
  (list "emacs-imenu-list"
        "emacs-anzu"
	"guix"
	"bash"
        "emacs-detached"
        "emacs-crdt"
        "emacs-lispy"
	"emacs-navigel"
	"emacs-multifiles"
	"emacs-m-buffer-el"
	"emacs-piem"
	"emacs-pcmpl-args"
	"emacs-stripe-buffer"
	"emacs-exiftool"
	"emacs-org-ql"
        "emacs-god-mode"
	"emacs-tshell"
        "emacs-use-package"
        "emacs-next"))
