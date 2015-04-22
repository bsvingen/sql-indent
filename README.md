
This is sql-indent for Emacs.

It was originally written by [Alex Schroeder](http://www.emacswiki.org/emacs/AlexSchroeder), and used to live on [emacswiki.org](http://www.emacswiki.org/emacs?SqlIndent).

Usage note:

Loading this file will make all SQL mode buffers created from then on use `sql-indent-line' for indentation.  A possible way to install sql-indent.el would be to add the following to your .emacs:

```emacs-lisp
(eval-after-load "sql"
  '(load-library "sql-indent"))
```

