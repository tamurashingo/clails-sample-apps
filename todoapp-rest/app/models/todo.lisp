; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-rest/models/todo
  (:use #:cl
        #:clails/model/base-model
        #:clails/model/query)
  (:export #:<todo>
           #:show-all
           #:add-task
           #:done-task))

(in-package #:todoapp-rest/models/todo)

(defmodel <todo> (<base-model>)
  (:table "todo"))

(defun show-all ()
  (select '<todo> :order-by '((id :desc))))

(defun add-task (taskname)
  (let ((record (make-record '<todo> :title taskname)))
    (save record)
    record))

(defun done-task (task-id)
  (let ((todo (car (select '<todo> :where `(= id ,task-id)))))
    (setf (ref todo :done) t
          (ref todo :done-at) (clails/util:now))
    (save todo)
    todo))
