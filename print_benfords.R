#' Prints Benford Statistics
#'
#' Prints Leemis' M, Cho-Gains' D, or both statistics in a table.
#'
#' @param x A vector or matrix of vote totals
#' @param type 'm' (default) calculates Leemis' M; 'd' calcualtes Cho-Gains D; 
#' 'both' returns both statistics.
#'
#' @return A list containing each statistic and information about displayed
#' significance thresholds.
#'
#'
#' @export

print.benfords <- function(x, type='m'){
  # source in calc.benfords function
  source("calc_benfords.R")
  # calculate desired Benford statistics
  Values <- calc.benfords(x=x, type=type)
  # create empty list to append desired statistics
  output <- list()
  # logical statement: evaluated if calculating Leemis' M or both
  if(type == 'm' | type == 'both'){
    # store Leemis' M value
    M <- Values$LeemisM
    # ifelse chain evaluates appropriate significance threshold and pastes stars
    M <- ifelse(M < 0.851, M,
                ifelse(M < 0.967, M <- paste0(M, '*'),
                       ifelse(M < 1.212, M <- paste0(M, '**'),
                              M <- paste0(M, '***'))))
    # store M statistic in list
    output$LeemisM <- M
  }
  # logical statement: evaluated if calculating Cho-Gains' D or both
  if(type == 'd' | type == 'both'){
    # store Cho-Gains' D value
    D <- Values$ChoGainsD
    # ifelse chain evaluates appropriate significance threshold and pastes stars
    D <- ifelse(D < 1.212, D, 
                ifelse(D < 1.330, D <- paste0(D, '*'),
                       ifelse(D < 1.569, D <- paste0(D, '**'),
                              D <- paste0(D, '***'))))
    # store D statistic
    output$ChoGainsD <- D
  }
  # format graphical output of function
  # each line corresponds to a line in the printed output
  Header <-     " ---- Calculations of Benford's Law ----\n\n"
  Title.M <-    "             Leemis's M                 \n"
  Title.D <-    "            Cho-Gains's D               \n"
  Title.Both <- "     Leemis's M      Cho-Gains's D     \n"
  Bottom <-     "\n________________________________________\n     "
  Sig <- output$Sig <- "*p<0.10; **p<0.05; ***p<0.01"
  # output for M only
  if(type == 'm'){
    cat(Header, Title.M, 
        '            ', M, 
        Bottom, Sig, "\n\n")
  }
  # output for D only
  if(type == 'd'){
    cat(Header, Title.D, 
        '           ', D, 
        Bottom, Sig, "\n\n")
  }
  # output for both
  if(type == 'both'){
    cat(Header, Title.Both, 
        '    ', M, '       ', D, 
        Bottom, Sig, "\n\n")
  }
  
  # returned list is invisible, but can be accessed if necessary
  invisible(output)
}

