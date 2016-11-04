PHONY: all data dataproc eda ols ridge lasso pcr plsr regressions report slides session clean

all: eda regressions report

eda:
	cd code/scripts; Rscript -e 'source("eda-script.R")'

dataproc:
	cd code/scripts; Rscript -e 'source("data-process.R")'

ols:
	cd code/functions; Rscript -e 'source("ordinary-least-squares.R")'

ridge: dataproc
	cd code/functions; Rscript -e 'source("ridge-regression.R")'

lasso: dataproc
	cd code/functions; Rscript -e 'source("lasso-regression.R")'

pcr: dataproc
	cd code/functions; Rscript -e 'source("principal-components-regression.R")'

plsr: dataproc
	cd code/functions; Rscript -e 'source("partial-least-squares.R")'

regressions:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

paper/paper.md: paper/sections/00-abstract.md paper/sections/01-introduction.md paper/sections/02-discussion.md paper/sections/03-conclusions.md
	cd paper/sections; pandoc *.md -s -o paper.md
	cd paper/sections; mv paper.md ../
report:
	cd report; report/sections/00-abstract.Rmd report/sections/01-introduction.Rmd report/sections/02-data.Rmd report/sections/03-methods.Rmd report/sections/04-analysis.Rmd report/sections/05-results.Rmd
	cd report; Rscript -e "library(rmarkdown); render('report.Rmd', 'pdf_document')"

slides:
	cd slides; Rscript -e "library(rmarkdown); render('presentation.Rmd', 'ioslides_presentation')"

session:
	bash session.sh

data:
	cd data; curl -O http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

clean:
	rm -f report/report.pdf
