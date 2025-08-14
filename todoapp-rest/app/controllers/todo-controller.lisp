; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-rest/controllers/todo-controller
  (:use #:cl
        #:clails/controller/base-controller)
  (:import-from #:todoapp-rest/models/todo
                #:show-all
                #:add-task
                #:done-task)
  (:export #:<todo-rest-controller>
           #:<todo-rest-update-controller>))

(in-package #:todoapp-rest/controllers/todo-controller)

(defclass <todo-rest-controller> (<rest-controller>)
  ())

(defmethod do-get ((controller <todo-rest-controller>))
  (let ((records (show-all)))
    (set-response controller `(("tasks" . ,records)))))

(defmethod do-post ((controller <todo-rest-controller>))
  (let ((result (add-task (gethash "name" (params controller)))))
    (set-response controller `(("result" . "success")
                               ("message" . "success")
                               ("task" . ,result)))))


(defclass <todo-rest-update-controller> (<rest-controller>)
  ())

(defmethod do-put ((controller <todo-rest-update-controller>))
  (let ((result (done-task (gethash "id" (params controller)))))
    (set-response controller `(("result" . "success")
                               ("message" . "success")
                               ("task" . ,result)))))
