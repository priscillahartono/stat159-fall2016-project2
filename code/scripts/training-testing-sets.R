scaled_credit <- read.csv('../../data/scaled-credit.csv')

set.seed(10)

training <- sample(1:400, 300)
testing <- (! training)

training_set <- credit[training,]
testing_set <- credit[testing,]
