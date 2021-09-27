SRCDIR = ../_src
FIGURES = $(patsubst %.mp, %.svg, $(notdir $(wildcard $(SRCDIR)/*.mp)))
ASSETS = $(notdir $(wildcard ../assets/*.png))

all: $(FIGURES)
	cp ../assets/*.png .
	chmod 644 *.png

%.png: ../assets/%.png
	@echo cp $< $@

%.svg: $(SRCDIR)/%.mp
	mpost $<

.PHONNY: distclean clean

distclean: 
	rm -f $(wildcard *.log)
	
clean: distclean
	rm -f $(wildcard *.svg)