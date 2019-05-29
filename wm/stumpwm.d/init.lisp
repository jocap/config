;; -*-lisp-*-

(in-package :stumpwm)

;; Key bindings

(set-prefix-key (kbd "C-t"))

(define-key *root-map* (kbd "c") "exec u")
(define-key *root-map* (kbd "C") "exec urxvtc")
(define-key *root-map* (kbd "M-b") "battery-status")

(define-key *top-map* (kbd "M-TAB") "fnext")
(define-key *top-map* (kbd "M-ISO_Left_Tab") "fprevious")
(define-key *root-map* (kbd "o") "fother")
(define-key *root-map* (kbd "X") "remove-split")

(define-key *top-map* (kbd "s-TAB") "gnext")
(define-key *top-map* (kbd "s-ISO_Left_Tab") "gprev")

(define-key *top-map* (kbd "s-k") "move-focus up")
(define-key *top-map* (kbd "s-j") "move-focus down")
(define-key *top-map* (kbd "s-h") "move-focus left")
(define-key *top-map* (kbd "s-l") "move-focus right")

(define-key *root-map* (kbd "k") "move-focus up")
(define-key *root-map* (kbd "j") "move-focus down")
(define-key *root-map* (kbd "h") "move-focus left")
(define-key *root-map* (kbd "l") "move-focus right")

(define-key *top-map* (kbd "s-K") "move-window up")
(define-key *top-map* (kbd "s-J") "move-window down")
(define-key *top-map* (kbd "s-H") "move-window left")
(define-key *top-map* (kbd "s-L") "move-window right")

(define-key *root-map* (kbd "H") "*help-map*") ; TODO: make this work

(define-key *exchange-window-map* (kbd "l") "exchange-direction right")
(define-key *exchange-window-map* (kbd "h") "exchange-direction left")

(define-key *root-map* (kbd "C-r") "loadrc")
(define-key *root-map* (kbd "/") "mode-line")

;; Settings

(setf *screen-mode-line-format*
  (list '(:eval (check-battery))
        " [%n] %W"))
(setf *mode-line-position* :top)

(setf *timeout-wait* 999)

(setf *window-number-map* "1234567890")
(setf *frame-number-map* "1234567890abcdefghijklmnopqrstuvwxyz")
(setf *group-number-map* "1234567890")

(setf *window-border-style* :thin)
(set-focus-color "#999")

;; Commands and functions

(defcommand battery-status () ()
  (echo (run-shell-command "apm" t)))

(defun current-frame ()
  (tile-group-current-frame (current-group)))

(defcommand (fprevious tile-group) () ()
  (focus-prev-frame (current-group)))

(defun check-battery ()
  (let ((string (remove #\newline (run-shell-command "apm -l" t))))
    (if (<= (parse-integer string) 10)
        (format nil "^1^b~a%^^*" string)
      (format nil "~a%" string))))

;; Message window font
; (set-font "-xos4-terminus-medium-r-normal--14-140-72-72-c-80-iso8859-15")

;;; Define window placement policy...

; ;; Clear rules
; (clear-window-placement-rules)
; 
; ;; Last rule to match takes precedence!
; ;; TIP: if the argument to :title or :role begins with an ellipsis, a substring
; ;; match is performed.
; ;; TIP: if the :create flag is set then a missing group will be created and
; ;; restored from *data-dir*/create file.
; ;; TIP: if the :restore flag is set then group dump is restored even for an
; ;; existing group using *data-dir*/restore file.
; (define-frame-preference "Default"
;   ;; frame raise lock (lock AND raise == jumpto)
;   (0 t nil :class "Konqueror" :role "...konqueror-mainwindow")
;   (1 t nil :class "XTerm"))
; 
; (define-frame-preference "Ardour"
;   (0 t   t   :instance "ardour_editor" :type :normal)
;   (0 t   t   :title "Ardour - Session Control")
;   (0 nil nil :class "XTerm")
;   (1 t   nil :type :normal)
;   (1 t   t   :instance "ardour_mixer")
;   (2 t   t   :instance "jvmetro")
;   (1 t   t   :instance "qjackctl")
;   (3 t   t   :instance "qjackctl" :role "qjackctlMainForm"))
; 
; (define-frame-preference "Shareland"
;   (0 t   nil :class "XTerm")
;   (1 nil t   :class "aMule"))
; 
; (define-frame-preference "Emacs"
;   (1 t t :restore "emacs-editing-dump" :title "...xdvi")
;   (0 t t :create "emacs-dump" :class "Emacs"))
