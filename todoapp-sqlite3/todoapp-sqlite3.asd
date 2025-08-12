; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-sqlite3-system
  (:use #:asdf #:cl))
(in-package #:todoapp-sqlite3-system)

(defsystem todoapp-sqlite3
  :class :package-inferred-system
  :description ""
  :version "0.0.1"
  :author ""
  :license ""
  :pathname "app"
  :depends-on ("clails"
               "todoapp-sqlite3/application"))

