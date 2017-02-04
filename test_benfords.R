source('calc_benfords.R')
source('print_benfords.R')
source('store_benfords.R')

# Create vector and matrix for testing function
test.vector <- rep(1,1000)
test.matrix <- sample(1:9, 1000, replace = T)

# Test Leemis calculation on each object type
calc.benfords(test.vector)
calc.benfords(test.matrix)
# Test Cho-Gains calculation on each object type
calc.benfords(test.vector, type = 'd')
calc.benfords(test.matrix, type = 'd')
# Test both calculation on each object type
calc.benfords(test.vector, type = 'both')
calc.benfords(test.matrix, type = 'both')

# Test print for Leemis, Cho-Gains, and both
print.benfords(rep(1,10000))
print.benfords(rep(1,10000), 'd')
print.benfords(rep(1,10000), 'both')

# Test store for Leemis, Cho-Gains, and both
store.benfords(rep(1,1000))
store.benfords(rep(1,1000), 'd')
store.benfords(rep(1,1000), 'both')
read.csv('benford.csv')
