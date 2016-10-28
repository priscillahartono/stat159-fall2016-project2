PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session clean

all: eda regressions report

tests:
	cd code/functions; Rscript -e "library(testthat); test_file('test-that.R')"

eda:
	cd code/scripts; Rscript eda-script.R

ols:
	cd code/scripts; Rscript eda-ols.R

ridge:
	cd code/scripts; Rscript eda-ridge.R

lasso:
	cd code/scripts; Rscript eda-lasso.R

pcr:
	cd code/scripts; Rscript eda-pcr.R

plsr:
	cd code/scripts; Rscript eda-plsr.R

regressions:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

report:
	cd report; Rscript -e "library(rmarkdown); render('report.Rmd')

slides:
	cd slides; Rscript -e 

session:
	cd code/scripts/session-info-script.R 

data:
	cd data; curl -O http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

clean:
	rm -f report/report.pdf
