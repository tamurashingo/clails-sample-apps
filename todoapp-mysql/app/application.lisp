; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-mysql/application
  (:use #:cl)
  (:import-from #:todoapp-mysql/config/environment)
  (:import-from #:todoapp-mysql/config/database)
  (:import-from #:todoapp-mysql/controllers/application-controller))



;-- 20250812033041 : add todo controller
(asdf:load-system :todoapp-mysql/controllers/todo-controller)

