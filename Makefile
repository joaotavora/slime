EMACS_BIN ?= emacs
LISP_BIN ?= sbcl

OBJ_FILES = $(patsubst contrib/%.el,contrib/%.elc,$(wildcard contrib/*.el))
# emacs 24.4 allows us to add to the end of the load path using `:'
# which is what we want in these version 24, especially since
# cl-lib.el might be in the dir to shadow emacs's own.
#
ifeq ($(shell $(EMACS_BIN) --version | grep -E 24.\(3.5\|4\)),)
    COLON =
else
    COLON = :
endif
LOAD_PATH=-L $(COLON)$(PWD) -L $(COLON)$(PWD)/contrib

%.elc: %.el
	${EMACS_BIN} -Q $(LOAD_PATH) --batch -f batch-byte-compile $<
slime.elc: hyperspec.elc

# compilation
#
compile-contribs: slime.elc slime-tests.elc $(patsubst contrib/%.el,contrib/%.elc,$(wildcard contrib/*.el))
compile-core: slime.elc $(patsubst %.el,%.elc,$(wildcard *.el))
compile-all: compile-contribs compile-core
compile-%: slime.elc slime-tests.elc contrib/slime-%.elc
	@echo

# automated tests
#
SELECTOR ?=t
OPTIONS ?=--batch


EMACS_23=$(shell $(EMACS_BIN) --version | grep -E 23)
ERT=https://raw.github.com/ohler/ert/c619b56c5bc6a866e33787489545b87d79973205/lisp/emacs-lisp/ert.el
ERTX=https://raw.github.com/ohler/ert/c619b56c5bc6a866e33787489545b87d79973205/lisp/emacs-lisp/ert-x.el
CL_LIB=http://elpa.gnu.org/packages/cl-lib-0.3.el

check-%: export TEST_CONTRIBS=$(patsubst check-%,slime-%,$@)
check-%: compile-%
	TEST_CONTRIBS=$(TEST_CONTRIBS) $(MAKE) check
check:
	if [ -n $(USE_TEMP_DIR) ]; then						    \
		temp_dir=`mktemp -d --suffix=-slime`				   ;\
		git clone $(PWD) $$temp_dir					   ;\
		cd $$temp_dir							   ;\
		[ -n "$(EMACS_23)" ] && curl -O $(ERT)				   ;\
		[ -n "$(EMACS_23)" ] && curl -O $(ERTX)				   ;\
		[ -n "$(EMACS_23)" ] && curl -o cl-lib.el $(CL_LIB)		   ;\
		USE_TEMP_DIR= $(MAKE) check-core				   ;\
	else									    \
	        ${EMACS_BIN} -Q $(LOAD_PATH) $(OPTIONS)			            \
			     --eval "(require 'slime-tests)"			    \
			     --eval "(slime-setup '($(TEST_CONTRIBS)))"		    \
			     --eval "(setq inferior-lisp-program \"$(LISP_BIN)\")"  \
	         	     --eval "(slime-batch-test $(SELECTOR))"		   ;\
	fi

check-core: export TEST_CONTRIBS=
check-core: compile-core check

elpa: *.el
	@version=`grep -o "Version: .*" rspec-mode.el | cut -c 10-`; \
	dir=rspec-mode-$$version; \
	mkdir -p "$$dir"; \
	cp -r rspec-mode.el snippets rspec-mode-$$version; \
	echo "(define-package \"rspec-mode\" \"$$version\" \
	\"Enhance ruby-mode for RSpec\")" \
	> "$$dir"/rspec-mode-pkg.el; \
	tar cvf rspec-mode-$$version.tar --mode 644 "$$dir"

clean-fasls:
	rm -rf *.fasl contrib/*.fasl
clean: clean-fasls
	rm -rf *.elc contrib/*.elc

.PHONY: clean elpa compile compile-contribs check
.SECONDEXPANSION:

# #!/bin/sh

# # This code has been placed in the Public Domain.  All warranties
# # are disclaimed.

# version="1.2"
# dist="slime-$version"

# if [ -d $dist ]; then rm -rf $dist; fi

# mkdir $dist
# cp NEWS README HACKING PROBLEMS ChangeLog *.el *.lisp $dist/

# mkdir $dist/doc
# cp doc/Makefile doc/slime.texi doc/texinfo-tabulate.awk $dist/doc

# tar czf $dist.tar.gz $dist
