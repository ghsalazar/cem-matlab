PANDOC_HTML =  --webtex --filter ~/.local/bin/pandoc-eqnos

all:
	make -C images

.PHONNY: distclean clean

distclean:
	make -C images	$@
	make -C _src		$@

clean:
	make -C images $@
