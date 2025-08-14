; -*- mode: lisp -*-
(in-package #:cl-user)
(defpackage #:todoapp-rest/controllers/application-controller
  (:use #:cl
        #:clails/controller/base-controller)
  (:export #:<application-controller>))

(in-package #:todoapp-rest/controllers/application-controller)

(defclass <application-controller> (<web-controller>)
  ())

(defmethod do-get ((controller <application-controller>))
  (set-view controller "index.html"))

