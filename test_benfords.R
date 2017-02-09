#' Test Benfords Functions
#' 
#' Tests all Benfords functions for errors.
#' Note: This is not a function. It requires testing each function individually.
#' 
#' @export

  # source in all benfords functions
  source('calc_benfords.R')
  source('print_benfords.R')
  source('store_benfords.R')
  
  # Create vector, matrix, and dataframe for testing function
  test.vector <- sample(1:9, 1000, replace = T)
  test.matrix <- matrix(test.vector, ncol=10)
  test.df <- data.frame(test.matrix)
  
  # Test general errors
  calc.benfords(test.df) 
  calc.benfords(test.vector, type='a')
  
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
  print.benfords(test.vector)
  print.benfords(test.vector, 'd')
  print.benfords(test.vector, 'both')
  
  # Test store for Leemis, Cho-Gains, and both
  store.benfords(test.vector)
  store.benfords(test.vector, 'd')
  store.benfords(test.vector, 'both')
  read.csv('benford.csv')
  

