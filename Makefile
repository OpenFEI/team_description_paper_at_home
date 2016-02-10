NAME  = RoboFEI_At_Home_TDP_2016
SHELL = bash
PWD   = $(shell pwd)
OS    = $(shell uname -o)

all: text clean

clean:
	rm -f *.{acn,acr,alg,aux,bbl,blg,fls,glg,glo,gls,glsdefs,hd,idx,ilg,ind,ins,ist,log,loa,loe,lof,lot,mw,nav,out,sbl,snm,sym,toc,xdy,fdb_latexmk,gz}

text:
ifeq '$(OS)' 'GNU/Linux'
	pdflatex -synctex=1 -interaction=nonstopmode $(NAME).tex
	bibtex $(NAME).aux
	pdflatex -synctex=1 -interaction=nonstopmode $(NAME).tex
	pdflatex -synctex=1 -interaction=nonstopmode $(NAME).tex
else
	# Works on El Captain
	"/Library/TeX/texbin/pdflatex" -synctex=1 -interaction=nonstopmode $(NAME).tex
	"/Library/TeX/texbin/bibtex" $(NAME).aux
	"/Library/TeX/texbin/pdflatex" -synctex=1 -interaction=nonstopmode $(NAME).tex
	"/Library/TeX/texbin/pdflatex" -synctex=1 -interaction=nonstopmode $(NAME).tex
endif
