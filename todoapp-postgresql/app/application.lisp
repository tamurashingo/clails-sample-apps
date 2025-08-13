; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-postgresql/application
  (:use #:cl)
  (:import-from #:todoapp-postgresql/config/environment)
  (:import-from #:todoapp-postgresql/config/database)
  (:import-from #:todoapp-postgresql/controllers/application-controller))


;-- 20250812033041 : add todo controller
(asdf:load-system :todoapp-postgresql/controllers/todo-controller)

