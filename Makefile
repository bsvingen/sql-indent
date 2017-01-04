EMACS=emacs
CASK ?= cask

build :
	cask exec $(EMACS) -Q --batch --eval             \
	    "(progn                                \
	      (setq byte-compile-error-on-warn t)  \
	      (batch-byte-compile))" sql-indent.el

clean :
	@rm -f *.elc

test :
	cask exec ecukes

.PHONY:	all test install clean build
