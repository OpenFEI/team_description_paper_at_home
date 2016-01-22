NAME  = RoboFEI_At_Home_TDP_2016
SHELL = bash
PWD   = $(shell pwd)

all: text clean

clean:
	rm -f *.{acn,acr,alg,aux,bbl,blg,fls,glg,glo,gls,glsdefs,hd,idx,ilg,ind,ins,ist,log,loa,loe,lof,lot,mw,nav,out,sbl,snm,sym,toc,xdy,fdb_latexmk,gz}

text:
	"/Library/TeX/texbin/pdflatex" -synctex=1 -interaction=nonstopmode $(NAME).tex
	"/Library/TeX/texbin/bibtex" $(NAME).aux
	"/Library/TeX/texbin/pdflatex" -synctex=1 -interaction=nonstopmode $(NAME).tex
	"/Library/TeX/texbin/pdflatex" -synctex=1 -interaction=nonstopmode $(NAME).tex