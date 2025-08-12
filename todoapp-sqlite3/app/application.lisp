; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-sqlite3/application
  (:use #:cl)
  (:import-from #:todoapp-sqlite3/config/environment)
  (:import-from #:todoapp-sqlite3/config/database)
  (:import-from #:todoapp-sqlite3/controllers/application-controller))



;-- 20250812083630 : add todo controller
(asdf:load-system :todoapp-sqlite3/controllers/todo-controller)

