;;; Set up file-extension/mode associations.
                                        ; Note that I use xml-mode for html... that's because i'm writing
                                        ; XHTML and I want my html to conform to XML.
(setq auto-mode-alist
      (append '(
                ("\\.sgml" . sgml-mode)
                ("\\.idd" . sgml-mode)
                ("\\.ide" . sgml-mode)
                ("\\.htm" . xml-mode)
                ("\\.html" . xml-mode)
                ("\\.xml" . xml-mode)
                ("\\.xsl" . xml-mode)
                ("\\.fo" . xml-mode)
                )
              auto-mode-alist
              )
      )

;;; Set up and enable syntax coloring.
                                        ; Create faces  to assign markup categories.
(make-face 'sgml-doctype-face)
(make-face 'sgml-pi-face)
(make-face 'sgml-comment-face)
(make-face 'sgml-sgml-face)
(make-face 'sgml-start-tag-face)
(make-face 'sgml-end-tag-face)
(make-face 'sgml-entity-face)

                                        ; Assign attributes to faces. Background of white assumed.

(set-face-foreground 'sgml-doctype-face "blue1")
(set-face-foreground 'sgml-sgml-face "cyan1")
(set-face-foreground 'sgml-pi-face "magenta")
(set-face-foreground 'sgml-comment-face "purple")
(set-face-foreground 'sgml-start-tag-face "Red")
(set-face-foreground 'sgml-end-tag-face "Red")
(set-face-foreground 'sgml-entity-face "Blue")

                                        ; Assign faces to markup categories.
(setq sgml-markup-faces
      '((doctype        . sgml-doctype-face)
        (pi             . sgml-pi-face)
        (comment        . sgml-comment-face)
        (sgml   . sgml-sgml-face)
        (comment        . sgml-comment-face)
        (start-tag      . sgml-start-tag-face)
        (end-tag        . sgml-end-tag-face)
        (entity . sgml-entity-face)))


                                        ; PSGML - enable face settings
(setq sgml-set-face t)

                                        ; Auto-activate parsing the DTD when a document is loaded.
                                        ; If this isn't enabled, syntax coloring won't take affect until
                                        ; you manually invoke "DTD->Parse DTD"
(setq sgml-auto-activate-dtd t)
(setq sgml-set-face t)
(setq sgml-indent-data t)

;;; Set up my "DTD->Insert DTD" menu.

(setq sgml-custom-dtd '
      (
       ( "DITA concept"
         "<?xml version=\"1.0\"?>\n<!DOCTYPE concept SYSTEM \"concept.dtd\">" )
       ( "DITA task"
         "<?xml version=\"1.0\"?>\n<!DOCTYPE task SYSTEM \"task.dtd\">" )
       ( "DITA reftopic"
         "<?xml version=\"1.0\"?>\n<!DOCTYPE reftopic SYSTEM \"reftopic.dtd\">" )
       ( "DITA APIdesc"
         "<?xml version=\"1.0\"?>\n<!DOCTYPE APIdesc SYSTEM \"apidesc.dtd\">" )
       ( "DITA topic"
         "<?xml version=\"1.0\"?>\n<!DOCTYPE topic SYSTEM \"ditabase.dtd\">" )
       ( "HOD Script"
         "<?xml version=\"1.0\"?>\n<!DOCTYPE HASCRIPT SYSTEM \"HAScript.dtd\">" )
       ( "XHTML 1.0 Strict"
         "<?xml version=\"1.0\"?>\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0

Strict//EN\" \"xhtml1-strict.dtd\">" )
       ( "XHTML 1.0 Transitional"
         "<?xml version=\"1.0\"?>\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0

Transitional//EN\" \"xhtml1-transitional.dtd\">" )
       ( "XHTML 1.0 Frameset"
         "<?xml version=\"1.0\"?>\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0

Frameset//EN\" \"xhtml1-frameset.dtd\">" )
                                        ; I use XHTML now!
                                        ;       ( "HTML 4.01 Transitional"
                                        ;        "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">" )
                                        ;       ( "HTML 4.01 Strict"
                                        ;        "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\">" )
                                        ;       ( "HTML 4.01 Frameset"
                                        ;        "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\">" )
                                        ; An example of IBMIDDoc SGML DTD
                                        ;       ( "IBMIDDoc"
                                        ;        "<!DOCTYPE ibmiddoc PUBLIC \"+//ISBN 0-933186::IBM//DTD IBMIDDoc//EN\" [\n]>")
                                        ; An example of DOCBOOK XML DTD.
                                        ;       ( "DOCBOOK XML 4.1.2"
                                        ;        "<?xml version=\"1.0\"?>\n<!DOCTYPE book PUBLIC \"-//OASIS//DTD DocBook XML

       V4.1.2//EN\" \"http://www.oasis-open.org/docbook/xml/4.0/docbookx.dtd\" [\n]>")
       )
)

; From Lennart Staflin - re-enabling launch of browser (from original HTML mode)
(defun my-psgml-hook ()
  (local-set-key "\C-c\C-b" 'browse-url-of-buffer)
  )


(add-hook 'sgml-mode-hook 'my-psgml-hook)""))")
