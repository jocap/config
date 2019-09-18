;; -*-lisp-*-

(in-package :stumpwm)

(export '(*autosplit-next* current-frame))

;; Key bindings

(set-prefix-key (kbd "C-t"))

(define-key *root-map* (kbd "c") "exec t")
(define-key *root-map* (kbd "C") "exec urxvtc")
(define-key *root-map* (kbd "M-b") "battery-status")
(define-key *root-map* (kbd "d") "exec dwim")

(define-key *top-map* (kbd "M-TAB") "fnext")
(define-key *top-map* (kbd "M-ISO_Left_Tab") "fprevious")
(define-key *root-map* (kbd "o") "fother")
(define-key *root-map* (kbd "X") "remove-split")

(define-key *top-map* (kbd "s-TAB") "gnext")
(define-key *top-map* (kbd "s-ISO_Left_Tab") "gprev")

(define-key *root-map* (kbd "k") "move-focus up")
(define-key *root-map* (kbd "j") "move-focus down")
(define-key *root-map* (kbd "h") "move-focus left")
(define-key *root-map* (kbd "l") "move-focus right")

(define-key *root-map* (kbd "M-k") "move-with-window up")
(define-key *root-map* (kbd "M-j") "move-with-window down")
(define-key *root-map* (kbd "M-h") "move-with-window left")
(define-key *root-map* (kbd "M-l") "move-with-window right")

(define-key *root-map* (kbd "H") "*help-map*") ; TODO: make this work

(define-key *exchange-window-map* (kbd "l") "exchange-direction right")
(define-key *exchange-window-map* (kbd "h") "exchange-direction left")

(define-key *root-map* (kbd "SPC") "autosplit-next")

(define-key *root-map* (kbd "C-r") "loadrc")
(define-key *root-map* (kbd "/") "mode-line")

(define-key *top-map* (kbd "F1") "setlang usx")
(define-key *top-map* (kbd "F2") "setlang sex")
(define-key *top-map* (kbd "F3") "setlang rux")

;; Settings

(setf *screen-mode-line-format*
  (list ; '(:eval (check-battery)) " "
        "[%n] %W"
        ; "^>" ; right align
        ; '(:eval (check-lang))
        ))
(setf *mode-line-position* :top)
(setf *mode-line-foreground-color* "#d0d0d0")

(setf *timeout-wait* 999)
(setf *mouse-focus-policy* :sloppy) ; focus follows mouse
(setf *suppress-frame-indicator* t) ; required for automovemouse-hook

(setf *window-number-map* "1234567890")
(setf *frame-number-map* "1234567890abcdefghijklmnopqrstuvwxyz")
(setf *group-number-map* "1234567890")

(setf *window-border-style* :thin)
(set-focus-color "#999")

; (set-font "-xos4-terminus-medium-r-normal--14-140-72-72-c-80-iso8859-15")

;; Commands and functions

(defun chomp (x)
  (remove #\newline x))

(defun current-frame ()
  (tile-group-current-frame (current-group)))

(defcommand (move-with-window tile-group) (dir) ((:direction "Direction: "))
  (move-focus-and-or-window dir t))

(defcommand battery-status () ()
  (echo (run-shell-command "apm" t)))

(defcommand (fprevious tile-group) () ()
  (focus-prev-frame (current-group)))

(defun check-battery ()
  (let ((string (chomp (run-shell-command "apm -l" t))))
    (if (<= (parse-integer string) 10)
        (format nil "^1^b~a%^^*" string)
      (format nil "~a%" string))))

(defun check-lang ()
  (chomp (run-shell-command "setxkbmap -query | awk '/^layout:/ {print $2}'" t)))

(defcommand setlang (lang) (:string)
  (run-shell-command (format nil "setlang ~a" lang))
  (echo lang))

(setf *autosplit-next* nil)

(defcommand autosplit-next () ()
  (setf *autosplit-next* t))

; TODO: not working!
(defun autosplit-hook (window)
 (when *autosplit-next*
   (setf *autosplit-next* nil)
   (let* ((old-window (current-window))
          (group (current-group))
          (old-frame-no (frame-number (tile-group-current-frame group)))
          (new-frame-no (split-frame group :row)))
      (pull-window (current-window) (frame-by-number group new-frame-no))
      (pull-window old-window (frame-by-number group old-frame-no))
      (focus-frame group (frame-by-number group new-frame-no)))))

(defun automovemouse-hook (current-window last-window)
  (when *ongoing-command*
    (run-shell-command "xdotool mousemove --window $(xdotool getwindowfocus) --polar 0 0" nil)))

;; Hooks

(remove-all-hooks *new-window-hook*)
(add-hook *new-window-hook* #'autosplit-hook)

(setf *ongoing-command* nil)

(remove-all-hooks *pre-command-hook*)
(add-hook *pre-command-hook* (lambda (c) (setf *ongoing-command* t)))

(remove-all-hooks *post-command-hook*)
(add-hook *post-command-hook* (lambda (c) (setf *ongoing-command* nil)))

(remove-all-hooks *focus-window-hook*)
(add-hook *focus-window-hook* #'automovemouse-hook)
