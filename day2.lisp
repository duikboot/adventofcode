(in-package :cl-user)
(defpackage :day2
  (:use :cl))
(in-package :day2)

(ql:quickload :split-sequence)

(load "utils.lisp")

(defun get-char (line)
  (char (second line) 0))

(defun password (line)
  (third line))

(defun times (str)
  (let ((split (split-sequence:split-sequence #\- str)))
    (list
      (parse-integer (first split))
      (parse-integer (second split) :junk-allowed t))))

(defun split (line)
  (let ((split (split-sequence:split-sequence #\Space line)))
    split))

(defun main ()
  (let* ((lines (read-lines "input_day2.txt"))
         (splitted (mapcar #'split lines))
         (chars (mapcar #'get-char splitted))
         (passwords (mapcar #'password splitted))
         (counts (mapcar
                   (lambda (c s)
                     (count c s)) chars passwords)))
    (length (loop for char in chars
                 for password in passwords
                 for count in counts
                 for line in lines
                 when (and
                        (>= count (first (times line)))
                        (<= count (second (times line))))
                 collect char))))

(main)
