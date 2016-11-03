scaled_credit <- read.csv('../../data/scaled-credit.csv')

set.seed(100)

training <- sample(1:400, 300)
testing <- (1:400)[-training]

training_set <- scaled_credit[training,]
testing_set <- scaled_credit[testing,]

save(training_set, testing_set, file='../../data/training-testing-sets.RData')




