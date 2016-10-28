# stat159-fall2016-project2

Andrea Widjaja & Priscilla Hartono

STAT 159 Project 2 - Predictive Modeling

This is project 2 of STAT 159 held in fall 2016. It is largely based on chapter 6: Linear Model Selection and Regularization of 'An Introduction to Statistical Learning' by James et al.
The idea of the project is to perform a predictive modeling process applied on the data set Credit.
We have to build various models to predict the variable Balance in terms of ten predictors: Income, Limit, Rating, Cards, Age, Education, Gender, Student, Married, and Ethnicity. 

The structure of the project will be as follows:  
* stat159-fall2016-project2
	* README.md
	* Makefile
	* LICENSE
	* session-info.txt
	* .gitignore
	* code
		* functions
			* ...
		* scripts
			* ...
		* tests
			* ...
	* data
		* Credit.csv
		* ...
	* images
		* ...
	* report
		* report.pdf
		* report.Rmd
		* sections
			* 00-abstract.Rmd
			* 01-introduction.Rmd
			* 02-data.Rmd
			* 03-methods.Rmd
			* 04-analysis.Rmd
			* 05-results.Rmd
			* 06-conclusions.Rmd
	* slides
		* ...
	

To reproduce, clone this repo, download the dataset Credit, and run with make.

A list of Make commands for phony targets are below:
* all
* data
* tests
* eda
* ols
* ridge
* lasso
* pcr
* plsr
* regressions
* report
* slides
* session
* clean

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

MIT License

Copyright (c) [2016] [Andrea Widjaja & Priscilla Hartono]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
