#' Stores Benford Statistics in .csv File
#'
#' Writes a .csv file containing desired Benfords statistics.
#' Each statistic is stored in a separate column, with significance levels
#' stored in a final column.
#'
#' @param x A vector or matrix of vote totals
#' @param type 'm' (default) calculates Leemis' M; 'd' calcualtes Cho-Gains D; 
#' 'both' returns both statistics.
#'
#' @return None. A 'benfords.csv' file is saved in the working directory.
#' A message is printed to notify the user of completion.
#'
#'
#' @export
#' 
store.benfords <- function(x, type='m', directory=getwd()){
  # source in print.benfords function
  source('print_benfords.R')
  # calls print.benfords
  # saves output in .csv file
  write.csv(print.benfords(x=x, type=type), 
              file=paste0(getwd(), '/benford.csv'))
  # shows user a message when complete
  print('File saved as benford.csv')
}

