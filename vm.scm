(use-modules
 (gnu)
 (gnu system linux-container)
 (gnu services shepherd)
 (guix)
 (guix utils)
 (guix profiles)
 (guix packages)
 (srfi srfi-1))
(use-service-modules spice dbus)
(use-package-modules base certs emacs python package-management version-control virtualization)

(define %os-release-file
  (plain-file "os-release"
              (string-append
                "NAME=\"GNU Guix\"\n"
                "PRETTY_NAME=\"GNU Guix\"\n"
                "VERSION=\""((@ (guix packages) package-version) guix)"\"\n"
                "ID=guix\n"
                "HOME_URL=\"https://www.gnu.org/software/guix/\"\n"
                "SUPPORT_URL=\"https://www.gnu.org/software/guix/help/\"\n"
                "BUG_REPORT_URL=\"mailto:bug-guix@gnu.org\"\n")))

(operating-system
 (locale "en_US.utf8")
 (locale-libcs (list (canonical-package glibc)))
 (timezone "America/Los_Angeles")
 (keyboard-layout (keyboard-layout "us"))
 (host-name "qemudock")
 (users %base-user-accounts)
 (packages
  (append
      (list qemu emacs-next git nss-certs python)
      %base-packages))

 (services (append
	    (list (dbus-service)
		  (service special-files-service-type
			   `(("/etc/os-release" ,%os-release-file)))
		  (service spice-vdagent-service-type))
               %base-services))
 (bootloader
  (bootloader-configuration
   (bootloader grub-bootloader)
   (targets '( "/dev/vda"))
   (terminal-outputs '(console))))
 (file-systems
  (cons* (file-system
          (mount-point "/")
          (device "/dev/vda1")
          (type "ext4"))
         %base-file-systems)))
