; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-mysql-system
  (:use #:asdf #:cl))
(in-package #:todoapp-mysql-system)

(defsystem todoapp-mysql
  :class :package-inferred-system
  :description ""
  :version "0.0.1"
  :author ""
  :license ""
  :pathname "app"
  :depends-on ("clails"
               "todoapp-mysql/application"))

