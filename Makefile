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

report: report/report.Rmd
	cd report; Rscript -e "library(rmarkdown); render('report.Rmd', 'pdf_document')"

slides:
	cd slides; Rscript -e "library(rmarkdown); render('presentation.Rmd', 'ioslides_presentation')"

data:
	cd data; curl -O http://www-bcf.usc.edu/~gareth/ISL/Credit.csv >> Credit.csv

clean:
	cd report; rm -f report/report.pdf

session: code/scripts/session-info-script.R
	bash session.sh
