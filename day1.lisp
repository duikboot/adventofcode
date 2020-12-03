(in-package :cl-user)
(defpackage :day1
  (:use :cl))
(in-package :day1)


(defun read-lines (file)
  (uiop:read-file-lines file))

(defun 2020? (&rest values)
  (= (reduce #'+ values) 2020))

(defun combos (numbers)
    (loop named outer for x in numbers do
      (loop for y in numbers do
        (loop for z in numbers do
              (if (2020? x y z)
                (return-from outer (list x y z)))))))

(defun main ()
  (let* ((lines (read-lines "input_day1.txt"))
         (numbers (mapcar #'parse-integer lines)))
    (reduce #'* (combos numbers))))

(main)
