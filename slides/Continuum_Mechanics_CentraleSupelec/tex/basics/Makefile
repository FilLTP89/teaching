# [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
#	Installation des fontes dd avec METAFONT
# [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
#	DUREISSEIX David    L.M.T. STRUCTURES et CMAO  le 15 / 07 / 95
#
#	make -r
# ======================================================================
SHELL = /bin/sh
#
# resolution de base
DEFF = 300
# magnification
MAGG = 0.0
# mode
#MFMODE = laserwriter
MFMODE = cx
# destination
#MFTEMP =
MFTEMP = /usr/local/lib/texmf/fonts/tmp/pk/cx
#
.SUFFIXES: .ps .dvi .tex .fd .sty .dtx .$(DEFF)pk .$(DEFF)gf .tfm .mf .329pk .329gf .360pk .360gf .432pk .432gf .518pk .518gf .622pk .622gf .746pk .746gf
#
LATEX = /usr/local/bin/latex2e
TEX   = /usr/local/bin/tex
DVIPS = /usr/local/bin/dvips
MF    = /usr/local/bin/mf
MTP   = /usr/local/bin/MakeTeXPK
GFTPK = /usr/local/bin/gftopk
TAR   = tar
#
RACINST  = /usr/local
MFFILES  = bbdd5.mf bbdd6.mf bbdd7.mf bbdd8.mf bbdd9.mf bbdd10.mf
BBDD     = bbddmathit.mf bbddgreekl.mf bbddgreeku.mf bbddromanl.mf
DTXFILES = bbdd.dtx
FDFILES  = Ubbdd.fd
STYFILES = $(DTXFILES:.dtx=.sty) fonttabl.sty
TARFILE  = $(DTXFILES:.dtx=.tar)
TEXFILES = test.tex exemple.tex
#
TFMFILES = $(MFFILES:.mf=.tfm)
PKFILES  = $(TFMFILES:.tfm=.$(DEFF)pk)
ALLPKFILES  = $(PKFILES) $(PKFILES:.300pk=.329pk) \
		  $(PKFILES:.300pk=.360pk) $(PKFILES:.300pk=.432pk) \
		  $(PKFILES:.300pk=.518pk) $(PKFILES:.300pk=.622pk) \
		  $(PKFILES:.300pk=.746pk)
GFFILES  = $(PKFILES:pk=gf)
ALLGFFILES = $(ALLPKFILES:pk=gf)
PSFILES  = $(TEXFILES:.tex=.ps)  $(DTXFILES:.dtx=.ps)
DVIFILES = $(TEXFILES:.tex=.dvi) $(DTXFILES:.dtx=.dvi)
#
ALLFILES = README CONTENTS Makefile $(MFFILES) $(BBDD) $(DTXFILES) $(TEXFILES) $(DVIFILES) $(PSFILES)

default :
	@echo 'usage :'
	@echo '  make -r clean   : pour le menage'
	@echo '  make -r install : pour installer
	@echo '  make -r cdc     : pour les tests'
	@echo '  make -r package : pour un package'
	@echo '  make -r veryclean  : ne laisse que les sources (danger)'
	@echo '  make -r pk  : construit les pk files'

install : $(ALLPKFILES) $(TFMFILES)
	chmod go-rwx $(MFFILES) $(BBDD)
	- cp $(BBDD) $(RACINST)/lib/texmf/fonts/src/public/bbdd/.
	- cp $(MFFILES) $(RACINST)/lib/texmf/fonts/src/public/bbdd/.
	- mv $(TFMFILES) $(RACINST)/lib/texmf/fonts/tfm/.
	- mv $(ALLPKFILES) $(RACINST)/lib/texmf/fonts/pk/cx/.
	- cp $(FDFILES) $(RACINST)/lib/texmf/tex/latex2e/supported/.
	- cp $(STYFILES) $(RACINST)/lib/texmf/tex/latex2e/supported/.
	- cp $(DTXFILES) $(RACINST)/lib/texmf/tex/latex2e/supported/.
	- mv $(DTXFILES:.dtx=.ps) $(RACINST)/lib/texmf/doc/.
	@echo ' '
	@echo '====================='
	@echo 'Installation terminee'
	@echo '====================='

cdc : $(PSFILES)
	chmod go+rx-w $(PSFILES) $(DVIFILES) $(TEXFILES)
	@echo ' '
	@echo '====================='
	@echo 'Tests passes'
	@echo '====================='

clean :
	rm -f *.log *.aux *.ins $(ALLGFFILES)
	@echo ' '
	@echo '====================='
	@echo 'Menage effectue'
	@echo '====================='

veryclean : clean
	@echo $(TFMFILES) $(ALLPKFILES) $(ALLGFFILES) \
		$(DVIFILES) $(PSFILES) $(STYFILES) $(FDFILES)
	rm -f $(TFMFILES) $(ALLPKFILES) $(ALLGFFILES) \
		$(DVIFILES) $(PSFILES) $(STYFILES) $(FDFILES)

package : install cdc clean
	ll $(ALLFILES) > CONTENTS
	$(TAR) -cvf $(TARFILE) $(ALLFILES)
	chmod go-rwx $(TARFILE)
	@echo ' '
	@echo '====================='
	@echo 'Package cree'
	@echo '====================='

pk : $(ALLPKFILES)

$(ALLPKFILES) : $(TFMFILES)

$(TFMFILES) : $(BBDD) $(MFFILES)

$(DVIFILES) : $(TFMFILES) $(STYFILES)

# On cree les .$(DEFF)pk
# """"""""""""""""""""""

#.mf.300pk :;
#	$(MTP) $* 300 $(DEFF) "magstep(0.0)" $(MFMODE) $(MFTEMP)
#
#.mf.329pk :;
#	$(MTP) $* 329 $(DEFF) "magstep(0.5)" $(MFMODE) $(MFTEMP)
#
#.mf.360pk :;
#	$(MTP) $* 360 $(DEFF) "magstep(1.0)" $(MFMODE) $(MFTEMP)
#
#.mf.432pk :;
#	$(MTP) $* 432 $(DEFF) "magstep(2.0)" $(MFMODE) $(MFTEMP)
#
#.mf.518pk :;
#	$(MTP) $* 518 $(DEFF) "magstep(3.0)" $(MFMODE) $(MFTEMP)
#
#.mf.622pk :;
#	$(MTP) $* 622 $(DEFF) "magstep(4.0)" $(MFMODE) $(MFTEMP)
#
#.mf.746pk :;
#	$(MTP) $* 746 $(DEFF) "magstep(5.0)" $(MFMODE) $(MFTEMP)

.300gf.300pk :;
	$(GFTPK) $*.300gf $*.300pk && mv $*.300pk $(MFTEMP)

.329gf.329pk :;
	$(GFTPK) $*.329gf $*.329pk && mv $*.329pk $(MFTEMP)

.360gf.360pk :;
	$(GFTPK) $*.360gf $*.360pk && mv $*.360pk $(MFTEMP)

.432gf.432pk :;
	$(GFTPK) $*.432gf $*.432pk && mv $*.432pk $(MFTEMP)

.518gf.518pk :;
	$(GFTPK) $*.518gf $*.518pk && mv $*.518pk $(MFTEMP)

.622gf.622pk :;
	$(GFTPK) $*.622gf $*.622pk && mv $*.622pk $(MFTEMP)

.746gf.746pk :;
	$(GFTPK) $*.746gf $*.746pk && mv $*.746pk $(MFTEMP)

# On cree les .tfm (et les .$(DEFF)gf)
# """"""""""""""""

.mf.tfm :;
	$(MF) "\mode=$(MFMODE); mag=magstep($(MAGG)); input $*"

# On utilise le .dtx (pour creer la doc, la definition, le style)
# """"""""""""""""""

.dtx.dvi :;
	$(LATEX) $*.dtx

Ubbdd.fd : bbdd.dtx
	$(LATEX) $*.dtx

.dtx.sty :;
	$(LATEX) $*.dtx

fonttabl.sty : bbdd.dtx
	$(LATEX) $*.dtx

# On cree les .ps
# """""""""""""""

.dvi.ps :;
	$(DVIPS) -o $@ $*

# On cree les .dvi
# """"""""""""""""

test.dvi : test.tex
	$(TEX) $*.tex

.tex.dvi :;
	$(LATEX) $*.tex
