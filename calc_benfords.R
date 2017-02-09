#' Calculate Bedford Statistics
#'
#' Calculates Bedford statistics from an input vector (or matrix) of vote totals
#' The default behavior is to calculate Leemis' M statistic, though
#' the Cho-Gains D statistic (or both statistics) can be returned.
#' 
#'
#' @param x A vector or matrix of vote totals
#' @param type 'm' (default) calculates Leemis' M; 'd' calcualtes Cho-Gains D; 
#' 'both' returns both statistics.
#'
#' @return A list containing each computed statistic.
#'
#' @export
#' 
calc.benfords <- function(x, type='m'){
  # check if valid type. If not 'm', 'd', or 'both' return error message
  if(!(type %in% c('m', 'd', 'both'))){
    return("Type must be 'm', 'd', or 'both'")
  }
  # check if valid input. If not vector or matrix, return error message
  if(!is.vector(x) & !is.matrix(x)){
    return("Input, x, must be a vector or matrix.")
  }
  # Convert all digits in x to strings. 
  # Remove all characters in each string except the leading coefficient
  # Convert the character digits to a factor from 1 to 9
    # This step guarantees that proportions of all digits will be evaluated,
    # even in the event that a digit does not appear as a leading coefficient.
  # Create a table of the digits, indicating frequencies in each cell
  # Divide each cell in the table by the number of observations in x
    # This converts the values to proportions of observed digits
  # These proportions are stored in a vector for future use in the function return
  digit.props <- table(factor(substr(as.character(x), 1, 1), levels = 1:9)) / length(x) 
  # Store digits proportions in the list that will be returned
  output <- list(DigitProportions = digit.props)
  # Subtract the right-hand quantity in the equation accounting for digit frequency
  digit.sub <- digit.props - log10(1 + 1/1:9)

  # Calculate Leemis M
  if(type == 'm' | type == 'both'){
    # Store in output list
    output$LeemisM <- max(digit.sub) # The maximum value in 'v' is Leemis M
  }
  # Calculate Cho-Gains D
  if(type == 'd' | type == 'both'){
    # Store in output list
    output$ChoGainsD <- sqrt(sum(digit.sub^2))
  }
  return(output)
}




