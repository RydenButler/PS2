print.benfords <- function(x, type='m'){
  source("calc_benfords.R")
  Values <- calc.benfords(x=x, type=type)
  output <- list()
  if(type == 'm' | type == 'both'){
    M <- Values$LeemisM
    M <- ifelse(M < 0.851, M, # This ifelse chain appends the stars
                ifelse(M < 0.967, M <- paste0(M, '*'),
                       ifelse(M < 1.212, M <- paste0(M, '**'),
                              M <- paste0(M, '***'))))
    output$LeemisM <- M
  }
  if(type == 'd' | type == 'both'){
    D <- Values$ChoGainsD
    D <- ifelse(D < 1.212, D, # This ifelse chain appends the stars
                ifelse(D < 1.330, D <- paste0(D, '*'),
                       ifelse(D < 1.569, D <- paste0(D, '**'),
                              D <- paste0(D, '***'))))
    output$ChoGainsD <- D
  }
  Header <-     " ---- Calculations of Benford's Law ----\n\n"
  Title.M <-    "             Leemis's M                 \n"
  Title.D <-    "            Cho-Gains's D               \n"
  Title.Both <- "     Leemis's M      Cho-Gains's D     \n"
  Bottom <-     "\n________________________________________\n     "
  Sig <- output$Sig <- "*p<0.10; **p<0.05; ***p<0.01"
  if(type == 'm'){
    cat(Header, Title.M, 
        '            ', M, 
        Bottom, Sig, "\n\n")
  }
  if(type == 'd'){
    cat(Header, Title.D, 
        '           ', D, 
        Bottom, Sig, "\n\n")
  }
  if(type == 'both'){
    cat(Header, Title.Both, 
        '    ', M, '       ', D, 
        Bottom, Sig, "\n\n")
  }
  
  
  return(output)
}

