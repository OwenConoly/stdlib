DUNE=dev/with-rocq-wrap.sh dune

all:
	$(DUNE) build -p rocq-stdlib @install

install:
	$(DUNE) install --root . rocq-stdlib

build-% install-%:
	+$(MAKE) -C theories $@

# Make of individual .vo
theories/%.vo:
	$(DUNE) build $@

refman-html:
	$(DUNE) build --root . --no-buffer @refman-html

stdlib-html:
	$(DUNE) build --root . @stdlib-html

include Makefile.ci
