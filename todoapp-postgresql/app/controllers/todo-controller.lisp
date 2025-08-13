; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-postgresql/controllers/todo-controller
  (:use #:cl
        #:clails/controller/base-controller)
  (:import-from #:todoapp-postgresql/models/todo
                #:show-all
                #:add-task
                #:done-task)
  (:import-from #:clails/model/base-model
                #:ref)
  (:import-from #:clails/helper/date-helper
                #:view/datetime)
  (:export #:<todo-controller>
           #:<todo-update-controller>))

(in-package #:todoapp-postgresql/controllers/todo-controller)

(defclass <todo-controller> (<web-controller>)
  ((records :accessor records)))

(defmethod do-get ((controller <todo-controller>))
  (setf (records controller) (show-all))
  (set-view controller "todo/show.html"))

(defmethod do-post ((controller <todo-controller>))
  (add-task (gethash "name" (params controller)))
  (setf (records controller) (show-all))
  (set-view controller "todo/show.html"))


(defclass <todo-update-controller> (<web-controller>)
  ((records :accessor records)))

(defmethod do-put ((controller <todo-update-controller>))
  (done-task (gethash "id" (params controller)))
  (set-redirect controller "/todo"))

;(defmethod do-delete ((controller <todo-controller>))
;  (set-view controller "todo/delete.html"))

