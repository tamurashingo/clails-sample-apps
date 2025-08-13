; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-postgresql-system
  (:use #:asdf #:cl))
(in-package #:todoapp-postgresql-system)

(defsystem todoapp-postgresql
  :class :package-inferred-system
  :description ""
  :version "0.0.1"
  :author ""
  :license ""
  :pathname "app"
  :depends-on ("clails"
               "todoapp-postgresql/application"))

