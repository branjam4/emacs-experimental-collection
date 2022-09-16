(define-module (emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system perl)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages)
  #:use-module (guix packages))

(define-public emacs-repeat-help
  (package
    (name "emacs-repeat-help")
    (version "20220718.1742")
    (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/karthink/repeat-help.git")
                  (commit "bdc21d9a8846b4adf63dd9317860666da5ade478")))
            (sha256
             (base32
              "1bvgq9amnawyv3k1vbalvlfw2r2z1yqilwllcsanlrdcz95awcv2"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/karthink/repeat-help")
    (synopsis "Display keybindings for repeat-mode")
    (description
     "repeat-help shows key descriptions when using Emacs' `repeat-mode'.

The description can be in the form a Which Key popup or an Embark indicator
(which see).  To use it, enable `repeat-mode' (Emacs 28.0.5 and up) and
`repeat-help-mode'.  When using a repeated key binding, you can press `C-h' to
toggle a popup with the available keybindings.

To change the key to toggle the popup type, customize `repeat-help-key'.

To have the popup show automatically, set `repeat-help-auto' to true.

By default the package tries to use an Embark key indicator.  To use Which-Key
or the built-in hints, customize `repeat-help-popup-type'.")
    (license license:gpl3+)))

(define-public emacs-dirvish
  (package
  (name "emacs-dirvish")
  (version "20220801.700")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/alexluigit/dirvish.git")
                  (commit "9e2cfbeea2093ee93a64d2b76c8f66692183243f")))
            (sha256
             (base32
              "1jqajfvd4d5q2i7h2sildz1v54pbpna3gjzyq19xz68yjm069jbc"))))
  (build-system emacs-build-system)
  (propagated-inputs (list emacs-transient))
  (arguments
   '(#:include '("^[^/]+.el$" "^[^/]+.el.in$"
                 "^dir$"
                 "^[^/]+.info$"
                 "^[^/]+.texi$"
                 "^[^/]+.texinfo$"
                 "^doc/dir$"
                 "^doc/[^/]+.info$"
                 "^doc/[^/]+.texi$"
                 "^doc/[^/]+.texinfo$"
                 "^extensions/[^/]+.el$")
     #:exclude '("^.dir-locals.el$" "^test.el$" "^tests.el$" "^[^/]+-test.el$"
                 "^[^/]+-tests.el$")))
  (home-page "https://github.com/alexluigit/dirvish")
  (synopsis "A modern file manager based on dired mode")
  (description
   "This package provides a minimalistic yet versatile file manager based on Dired.
This package gives Dired the following features:

- Multiple window layouts - Always available file preview - Isolated sessions -
A modern and composable user interface")
  (license license:gpl3+)))

(define-public emacs-unicode-escape
  (package
    (name "emacs-unicode-escape")
    (version "20160614.1234")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kosh04/unicode-escape.el.git")
                    (commit "fc69ec780d9e54c364a9252bd0cf1d2507f3fab7")))
              (sha256
               (base32
                "1bqknk6y7r0dqhmwhq3ac56cqf0albp18h222klnijv4bazjfcjw"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-names emacs-dash))
    (home-page "https://github.com/kosh04/unicode-escape.el")
    (synopsis "Escape/Unescape unicode notations")
    (description
     "Escape and unescape unicode notations. \"\\uNNNN\" <-> \"\\\\uNNNN\"

Non-BMP characters are converted to 16-bit code of pairs called surrogate-pair
(optional).")
    (license license:expat)))

(define-public emacs-run-command
  (package
  (name "emacs-run-command")
  (version "20210529.1505")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/bard/emacs-run-command.git")
                  (commit "ce2d69feeffb9ef9815ef5b5e32f236763197a10")))
            (sha256
             (base32
              "132gsmgqnfzx8q0f4gchjzhm3wqm5frjrsb8q9cmqsa5y2g7qjmf"))))
  (build-system emacs-build-system)
  (home-page "https://github.com/bard/emacs-run-command")
  (synopsis "Run an external command from a context-dependent list")
  (description
   " Leave Emacs less.  Relocate those frequent shell commands to configurable,
dynamic, context-sensitive lists, and run them at a fraction of the keystrokes
with autocompletion.")
  (license license:gpl3+))
  )

(define-public emacs-company-tabnine
  (package
  (name "emacs-company-tabnine")
  (version "20210310.2247")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/TommyX12/company-tabnine.git")
                  (commit "98e9e8b38b6ca289fbe265b0a7b62c7fe38ed0e2")))
            (sha256
             (base32
              "162ca70xwmdd8lsdawzpykd6kaqfljflaxy2nwjn8f89f80ih3fg"))))
  (build-system emacs-build-system)
  (propagated-inputs (list emacs-company emacs-dash emacs-s
                           emacs-unicode-escape))
  (home-page "https://github.com/TommyX12/company-tabnine/")
  (synopsis "A company-mode backend for TabNine")
  (description
   " Description:

TabNine(https://tabnine.com/) is the all-language autocompleter.  It uses
machine learning to provide responsive, reliable, and relevant suggestions.
`company-tabnine' provides TabNine completion backend for
`company-mode'(https://github.com/company-mode/company-mode).  It takes care of
TabNine binaries, so installation is easy.

Installation:

1.  Make sure `company-mode' is installed and configured.  2.  Add
`company-tabnine' to `company-backends':

  (add-to-list 'company-backends #'company-tabnine)

3.  Run M-x company-tabnine-install-binary to install the TabNine binary for
your system.

Usage:

`company-tabnine' should work out of the box.  See M-x customize-group RET
company-tabnine RET for customizations.

Recommended Configuration:

- Trigger completion immediately.

  (setq company-idle-delay 0)

- Number the candidates (use M-1, M-2 etc to select completions).

  (setq company-show-numbers t)")
  (license license:expat))
  )

(define-public emacs-mpv
  (package
    (name "emacs-mpv")
    (version "20211228.2043")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kljohann/mpv.el.git")
                    (commit "4fd8baa508dbc1a6b42b4e40292c0dbb0f19c9b9")))
              (sha256
               (base32
                "03zziy1lcvpf1wq15bsxwy0dhdb2z7rrdcj6srgrmgykz2wf33q7"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-json-mode emacs-org))
    (home-page "https://github.com/kljohann/mpv.el")
    (synopsis "control mpv for easy note-taking")
    (description
     "This package is a potpourri of helper functions to control a mpv process via its
IPC interface.  You might want to add the following to your init file:

(org-add-link-type \"mpv\" #'mpv-play) (defun org-mpv-complete-link (&optional
arg)   (replace-regexp-in-string    \"file:\" \"mpv:\"    (org-file-complete-link
arg)    t t)) (add-hook 'org-open-at-point-functions
#'mpv-seek-to-position-at-point)")
    (license license:gpl3+)))

(define-public emacs-elfeed-tube
  (package
  (name "emacs-elfeed-tube")
  (version "20220703.2128")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/karthink/elfeed-tube.git")
                  (commit "5817c91f5b3b7159965aa73839d2a0a08fd952bd")))
            (sha256
             (base32
              "1w22n54gm8my4r4kvi2id6s2wghsqdazzk168v79kw8kfw32vyy9"))))
  (build-system emacs-build-system)
  (propagated-inputs (list emacs-elfeed emacs-aio))
  (arguments
   '(#:include '("^elfeed-tube.el$" "^elfeed-tube-utils.el$")
     #:exclude '()))
  (home-page "https://github.com/karthink/elfeed-tube")
  (synopsis "YouTube integration for Elfeed")
  (description
   " Elfeed Tube is an extension for Elfeed, the feed reader for Emacs, that
enhances your Youtube RSS feed subscriptions.

Typically Youtube RSS feeds contain only the title and author of each video.
Elfeed Tube adds video descriptions, thumbnails, durations, chapters and \"live\"
transcrips to video entries.  See https://github.com/karthink/elfeed-tube for
demos.  This information can optionally be added to your entry in your Elfeed
database.

The displayed transcripts and chapter headings are time-aware, so you can click
on any transcript segment to visit the video at that time (in a browser or your
video player if you also have youtube-dl).  A companion package,
`elfeed-tube-mpv', provides complete mpv (video player) integration with the
transcript, including video seeking through the transcript and following along
with the video in Emacs.

To use this package,

(i) Subscribe to Youtube channel or playlist feeds in Elfeed.  You can use the
helper function `elfeed-tube-add-feeds' provided by this package to search for
Youtube channels by URLs or search queries.

(ii) Place in your init file the following:

(require 'elfeed-tube) (elfeed-tube-setup)

(iii) Use Elfeed as normal, typically with `elfeed'.  Your Youtube feed entries
should be fully populated.

You can also call `elfeed-tube-fetch' in an Elfeed buffer to manually populate
an entry, or obtain an Elfeed entry-like summary for ANY youtube video (no
subscription needed) by manually calling `elfeed-tube-fetch' from outside
Elfeed.

User options:

There are three options of note:

`elfeed-tube-fields': Customize this to set the kinds of metadata you want added
to Elfeed's Youtube entries.  You can selectively turn on/off thumbnails,
transcripts etc.

`elfeed-tube-auto-save-p': Set this boolean to save fetched Youtube metadata to
your Elfeed database, i.e.  to persist the data on disk for all entries.

`elfeed-tube-auto-fetch-p': Unset this boolean to turn off fetching metadata.
You can then call `elfeed-tube-fetch' to manually fetch data for specific feed
entries.

See the customization group `elfeed-tube' for more options.  See the README for
more information.")
  (license license:unlicense))
  )

(define-public emacs-elfeed-tube-mpv
  (package
  (name "emacs-elfeed-tube-mpv")
  (version "20220704.1952")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/karthink/elfeed-tube.git")
                  (commit "5817c91f5b3b7159965aa73839d2a0a08fd952bd")))
            (sha256
             (base32
              "1w22n54gm8my4r4kvi2id6s2wghsqdazzk168v79kw8kfw32vyy9"))))
  (build-system emacs-build-system)
  (propagated-inputs (list emacs-elfeed-tube emacs-mpv))
  (arguments
   '(#:include '("^elfeed-tube-mpv.el$")
     #:exclude '()))
  (home-page "https://github.com/karthink/elfeed-tube")
  (synopsis "Control mpv from Elfeed")
  (description
   " This package provides integration with the mpv video player for `elfeed-tube'
entries, which see.

With `elfeed-tube-mpv' loaded, clicking on a transcript segment in an Elfeed
Youtube video feed entry will launch mpv at that time, or seek to that point if
already playing.

It defines two commands and a minor mode:

- `elfeed-tube-mpv': Start an mpv session that is \"connected\" to an Elfeed entry
corresponding to a Youtube video.  You can use this command to start playback,
or seek in mpv to a transcript segment, or enqueue a video in mpv if one is
already playing.  Call with a prefix argument to spawn a new instance of mpv
instead.

- `elfeed-tube-mpv-where': Jump in Emacs to the transcript position
corresponding to the current playback time in mpv.

- `elfeed-tube-mpv-follow-mode': Follow along in the transcript in Emacs to the
video playback.")
  (license license:unlicense))
  )

(define-public emacs-verb
  (package
  (name "emacs-verb")
  (version "20220214.943")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/federicotdn/verb.git")
                  (commit "f6fd85d913c39603695e52d258d02e6030e3d42d")))
            (sha256
             (base32
              "032s7i4gg7cc35cqa816sji8bhww2wzlihizvvbbzplsz435mdbs"))))
  (build-system emacs-build-system)
  (home-page "https://github.com/federicotdn/verb")
  (synopsis "Organize and send HTTP requests")
  (description
   "Verb is a package that allows you to organize and send HTTP requests from Emacs.
 See the project's README.md file for more details.")
  (license license:gpl3+)))

(define-public perl-b-lint
  (package
    (name "perl-b-lint")
    (version "1.20")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://cpan/authors/id/R/RJ/RJBS/B-Lint-"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1cqhgj17jqlrwdw2lz2sprs2zydry09y14lwhmipk2zxcj4l0jfw"))))
    (build-system perl-build-system)
    (propagated-inputs `(("perl-module-pluggable" ,perl-module-pluggable)))
    (home-page "https://metacpan.org/release/B-Lint")
    (synopsis "Perl lint")
    (description "The B::Lint module is equivalent to an extended version of the -w option of perl. It is named after the program lint which carries out a similar process for C programs.
")
    (license license:perl-license)))

(define-public emacs-pkg-overview
  (package
  (name "emacs-pkg-overview")
  (version "20210802.1509")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/Boruch-Baum/emacs-pkg-overview.git")
                  (commit "9b2e416758a6c107bb8cc670ec4d2627f82d5590")))
            (sha256
             (base32
              "1p15jyjpiikx5y3syvhrdxabhhl898af88dv3fi95gm8v39n35i0"))))
  (build-system emacs-build-system)
  (home-page "https://github.com/Boruch-Baum/emacs-pkg-overview")
  (synopsis "Make org documentation from elisp source file")
  (description
   " This package parses an elisp file's comments, definitions, docstrings, and
other documentation into a hierarchical `org-mode' buffer.  It is intended to
facilitate familiarization with a file's contents and organization / structure.
The viewer can quickly swoop in and out and across the file structure using
standard `org-mode' commands and keybindings.


; Dependencies (all are already part of Emacs):

  org -- for `org-mode'


; Installation:

1) Evaluate or load this file.

2) I don't expect anyone who would want to define a global    keybinding for
this kind of function needs me to tell them how    do so, but I'm mindlessly
filling out my own template, so:

     (global-set-key (kbd \"S-M-C F1 M-x butterfly C-c C-h ?\") 'pkg-overview)")
  (license license:gpl3+)))

(define-public emacs-eredis
  (package
  (name "emacs-eredis")
  (version "20181119.131")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/justinhj/eredis.git")
                  (commit "bc86b9f63a3e7a5eb263875030d0e15d6f5f6e37")))
            (sha256
             (base32
              "1a3vvdlld66x0j3i7plhc0fm6mkj64mvd375j8g65nvfn6cwc3h4"))))
  (build-system emacs-build-system)
  (propagated-inputs (list emacs-dash))
  (home-page "http://github.com/justinhj/eredis/")
  (synopsis "eredis, a Redis client in emacs lisp")
  (description
   "Eredis provides a programmatic API for accessing Redis (in-memory data structure
store/database) using emacs lisp.

Usage:

Each redis connection creates a process and has an associated buffer which
revieves data from the redis server

(setq redis-p1 (eredis-connect \"localhost\" \"6379\")) (eredis-set \"key\" \"value\"
redis-p1) \"ok\" (eredis-get \"key\" redis-p1) \"value\"

Earlier versions of redis (pre 0.9) did not support multiple
connections/processes.  To preserve backwards compatibility you can omit the
process argument from commands and an internal variable
`eredis--current-process' will track the most recent connection to be used by
default.

You can close a connection like so.  The process buffer can be closed
seperately.  (eredis-disconnect redis-p1)

; 0.9.6 Changes

Fix install

; 0.9.5 Changes

Bug fixes for org mode and missing keys

; 0.9.4 Changes

eredis-reduce-from-matching-key-value eredis-each-matching-key-value

; 0.9.3 Changes

Iteration and reductions over Redis strings

eredis-reduce-from-key-value eredis-each-key-value

Bug fixes

Bugs around parsing and mget mset are fixed

; 0.9.2 Changes

Fixed working with very slow responses, request timeout and retry

; 0.9 Changes

Multiple connections to multiple redis servers supported Buffer is used for all
output from the process (Redis) Github repo contains an ert test suite Fix for
multibyte characters Support for LOLWUT (version 5.0 of Redis and later)

; Github contributors

justinhj pidu crispy darksun lujun9972")
  (license license:gpl3+)))

(define-public perl-getopt-argvfile
  (package
    (name "perl-getopt-argvfile")
    (version "1.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/J/JS/JSTENZEL/Getopt-ArgvFile-"
                    version ".tar.gz"))
              (sha256
               (base32
                "08jvhfqcjlsn013x96qa6paif0095x6y60jslp8p3zg67i8sl29p"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Getopt-ArgvFile")
    (synopsis
     "interpolates script options from files into @ARGV or another array")
    (description "This module is a simple supplement to other option handling modules.
It allows script options and parameters to be read from files
instead of from the command line by interpolating file contents
into @ARGV. This way it PREPARES the final option handling.

Getopt::ArgvFile does NOT perform any option processing itself, and
should work fine together with any other option handling module
(e.g. Getopt::Long) or even self coded option handling.")
    (license license:artistic2.0)))

(define-public perl-test-inline
  (package
    (name "perl-test-inline")
    (version "2.214")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/E/ET/ETHER/Test-Inline-" version
                    ".tar.gz"))
              (sha256
               (base32
                "0rp3y6kpy4a59mzq14wbzr93ps4cfpi6cr5ca7yzgif2wqygrq4m"))))
    (build-system perl-build-system)
    (native-inputs `(("perl-test-classapi" ,perl-test-classapi)
                     ("perl-test-script" ,perl-test-script)))
    (propagated-inputs `(("perl-algorithm-dependency" ,perl-algorithm-dependency)
                         ("perl-config-tiny" ,perl-config-tiny)
                         ("perl-file-chmod" ,perl-file-chmod)
                         ("perl-file-find-rule" ,perl-file-find-rule)
                         ("perl-file-flat" ,perl-file-flat)
                         ("perl-file-remove" ,perl-file-remove)
                         ("perl-params-util" ,perl-params-util)
                         ("perl-path-tiny" ,perl-path-tiny)))
    (home-page "https://metacpan.org/release/Test-Inline")
    (synopsis "Embed your tests in your code, next to what is being tested")
    (description "Embedding tests allows tests to be placed near the code being tested.

This is a nice supplement to the traditional .t files.")
    (license license:perl-license)))

(define-public perl-test-classapi
  (package
  (name "perl-test-classapi")
  (version "1.07")
  (source (origin
            (method url-fetch)
            (uri (string-append
                  "mirror://cpan/authors/id/E/ET/ETHER/Test-ClassAPI-" version
                  ".tar.gz"))
            (sha256
             (base32
              "1ahqz824bz4853dyp8yhrfp0swcaj1d4dwz8x8afxhhcbvydps9h"))))
  (build-system perl-build-system)
  (propagated-inputs `(("perl-class-inspector" ,perl-class-inspector)
                       ("perl-config-tiny" ,perl-config-tiny)
                       ("perl-params-util" ,perl-params-util)))
  (home-page "https://metacpan.org/release/Test-ClassAPI")
  (synopsis "Provides basic first-pass API testing for large class trees")
  (description "For many APIs with large numbers of classes, it can be very useful to be able to do a quick once-over to make sure that classes, methods, and inheritance is correct, before doing more comprehensive testing. This module aims to provide such a capability.")
  (license license:perl-license)))

(define-public perl-algorithm-dependency
  (package
  (name "perl-algorithm-dependency")
  (version "1.112")
  (source (origin
            (method url-fetch)
            (uri (string-append
                  "mirror://cpan/authors/id/E/ET/ETHER/Algorithm-Dependency-"
                  version ".tar.gz"))
            (sha256
             (base32
              "11y11qdx8kgs72j14skzh1p13vii60pwi582kp7xr8jnkz1vf3vy"))))
  (build-system perl-build-system)
  (native-inputs `(("perl-test-classapi" ,perl-test-classapi)))
  (propagated-inputs `(("perl-params-util" ,perl-params-util)))
  (home-page "https://metacpan.org/release/Algorithm-Dependency")
  (synopsis "Base class for implementing various dependency trees")
  (description "Algorithm::Dependency is a framework for creating simple read-only dependency hierarchies, where you have a set of items that rely on other items in the set, and require actions on them as well.

Despite the most visible of these being software installation systems like the CPAN installer, or Debian apt-get, they are useful in other situations. This module intentionally uses implementation-neutral words, to avoid confusion.")
  (license license:perl-license)))

(define-public perl-config-tiny
  (package
    (name "perl-config-tiny")
    (version "2.28")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/R/RS/RSAVAGE/Config-Tiny-" version
                    ".tgz"))
              (sha256
               (base32
                "000mw17nb7aj341s0afqimxd53w5y0c4yk61pihqzm191lx89pqj"))))
    (build-system perl-build-system)
    (native-inputs `(("perl-test-pod" ,perl-test-pod)))
    (home-page "https://metacpan.org/release/Config-Tiny")
    (synopsis "Read/Write .ini style files with as little code as possible")
    (description "Config::Tiny is a Perl class to read and write .ini style configuration files with as little code as possible, reducing load time and memory overhead.")
    (license license:perl-license)))

(define-public perl-file-chmod
  (package
    (name "perl-file-chmod")
    (version "0.42")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/X/XE/XENO/File-chmod-" version
                    ".tar.gz"))
              (sha256
               (base32
                "15bp82i5ha6v3vb526r0lgwmgjqx346xwpmmd18j315wd3zszbvc"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/File-chmod")
    (synopsis "Implements symbolic and ls chmod modes")
    (description "File::chmod is a utility that allows you to bypass system calls or bit processing of a file's permissions. It overloads the chmod() function with its own that gets an octal mode, a symbolic mode (see below), or an \"ls\" mode (see below). If you wish not to overload chmod(), you can export symchmod() and lschmod(), which take, respectively, a symbolic mode and an \"ls\" mode.")
    (license license:perl-license)))

(define-public perl-file-flat
  (package
    (name "perl-file-flat")
    (version "1.07")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/E/ET/ETHER/File-Flat-" version
                    ".tar.gz"))
              (sha256
               (base32
                "0yw6fmqaqd1fjiwq5yvdhrjbg7kafi0ihidaglsqy29ri27zdhw7"))))
    (build-system perl-build-system)
    (native-inputs `(("perl-test-classapi" ,perl-test-classapi)))
    (propagated-inputs `(("perl-file-copy-recursive" ,perl-file-copy-recursive)
                         ("perl-file-remove" ,perl-file-remove)
                         ("perl-prefork" ,perl-prefork)))
    (home-page "https://metacpan.org/release/File-Flat")
    (synopsis "Implements a flat filesystem")
    (description "File::Flat implements a flat filesystem. A flat filesystem is a filesystem in which directories do not exist. It provides an abstraction over any normal filesystem which makes it appear as if directories do not exist. In effect, it will automatically create directories as needed. This is create for things like install scripts and such, as you never need to worry about the existence of directories, just write to a file, no matter where it is.")
    (license license:perl-license)))

(define-public perl-test-pod
  (package
    (name "perl-test-pod")
    (version "1.52")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/E/ET/ETHER/Test-Pod-" version
                    ".tar.gz"))
              (sha256
               (base32
                "1z75x1pxwp8ajwq9iazlg2c3wd7rdlim08yclpdg32qnc36dpa30"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Test-Pod")
    (synopsis "check for POD errors in files")
    (description "Check POD files for errors or warnings in a test file, using Pod::Simple to do the heavy lifting.")
    (license license:perl-license)))

(define-public perl-prefork
  (package
  (name "perl-prefork")
  (version "1.05")
  (source (origin
            (method url-fetch)
            (uri (string-append "mirror://cpan/authors/id/E/ET/ETHER/prefork-"
                  version ".tar.gz"))
            (sha256
             (base32
              "01ckn45ij3nbrsc0yc4wl4z0wndn36jh6247zbycwa1vlvgvr1vd"))))
  (build-system perl-build-system)
  (home-page "https://metacpan.org/release/prefork")
  (synopsis "Optimized module loading for forking or non-forking processes")
  (description "prefork.pm is intended to serve as a central and optional marshalling point for state detection (are we running in compile-time or run-time mode) and to act as a relatively light-weight module loader.

prefork is intended to be used in two different ways.

The first is by a module that wants to indicate that another module should be loaded before forking. This is known as a \"Loader\".

The other is a script or module that will be initiating the forking. It will tell prefork.pm that it is either going to fork, or is about to fork, or for some other reason all modules previously mentioned by the Loaders should be loaded immediately.")
  (license license:perl-license)))

(define-public perl-fusqlfs
  (package
  (name "perl-fusqlfs")
  (version "0.009")
  (source (origin
            (method url-fetch)
            (uri (string-append
                  "mirror://cpan/authors/id/K/KS/KSTEPME/FusqlFS-" version
                  ".tar.gz"))
            (sha256
             (base32
              "1bdwspa0lnpalcc6q4xxn6xd1jp489yqmx1hx6w1xl9mh0iwnqpn"))))
  (build-system perl-build-system)
  (native-inputs (list perl-module-build perl-test-deep perl-test-inline))
  (propagated-inputs (list fuse
                           perl-dbi perl-getopt-argvfile
                           perl-dbd-pg perl-dbd-sqlite perl-dbd-mysql
                           perl-yaml-tiny))
  (home-page "https://metacpan.org/release/FusqlFS")
  (synopsis
   "FUSE file system to mount DB and provide tools to control and admin it")
  (description "This FUSE-daemon allows to mount any DB as a simple filesystem. Unlike other
similar \"sqlfs\" filesystem, it doesn't provide simple DB-backed file storage,
but given you full interface to all database internals.

Every table, view, function etc. is a directory, every single field, index,
record etc. is a file, symlink or subdirectory in the mounted filesystem. You
can create table \"mkdir ./mnt/tables/tablename\", and remove them with \"rmdir\"
afterwards. You can edit fields as simple YAML-files. All your usual file
utilities are at your service including \"find\", \"rm\", \"ln\", \"mv\", \"cp\" etc.

Just mount your DB and enjoy!")
  (license license:gpl3+)))
