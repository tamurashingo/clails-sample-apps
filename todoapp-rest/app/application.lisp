; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-rest/application
  (:use #:cl)
  (:import-from #:todoapp-rest/config/environment)
  (:import-from #:todoapp-rest/config/database)
  (:import-from #:todoapp-rest/controllers/application-controller))


;-- 20250812083630 : add todo controller
(asdf:load-system :todoapp-rest/controllers/todo-controller)

