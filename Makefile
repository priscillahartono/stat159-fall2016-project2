PHONY: all data dataproc tests eda ols ridge lasso pcr plsr regressions report slides session clean

all: eda regressions report

tests:
	cd code/functions; Rscript -e "library(testthat); test_file('test-that.R')"

eda:
	cd code/scripts; Rscript -e eda-script.R

dataproc:
	cd code/scripts; Rscript -e data-process.R

ols:
	cd code/scripts; Rscript -e 'source("ordinary-least-squares.R")'

ridge: dataproc
	cd code/scripts; Rscript -e 'source("ridge-regression.R")'

lasso: dataproc
	cd code/scripts; Rscript -e 'source("lasso-regression.R")'

pcr: dataproc
	cd code/scripts; Rscript -e 'source("principal-components-regression.R")'

plsr: dataproc
	cd code/scripts; Rscript -e 'source("partial-least-squares.R")'

regressions:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

report:
	cd report; Rscript -e "library(rmarkdown); render('report.Rmd', 'pdf_document')"

slides:
	cd slides; Rscript -e 

session:
	bash session.sh

data:
	cd data; curl -O http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

clean:
	rm -f report/report.pdf
