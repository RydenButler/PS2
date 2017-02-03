print.benfords <- function(x, type='m'){

  Values <- fraud(x=x, type=type)
  if(type == 'm' | type == 'both'){
    M <- Values$LeemisM
    M <- ifelse(M < 0.851, M, # This ifelse chain appends the stars
                ifelse(M < 0.967, M <- paste0(M, '*'),
                       ifelse(M < 1.212, M <- paste0(M, '**'),
                              M <- paste0(M, '***'))))
  }
  if(type == 'd' | type == 'both'){
    D <- Values$ChoGainsD
    D <- ifelse(D < 1.212, D, # This ifelse chain appends the stars
                ifelse(D < 1.330, D <- paste0(D, '*'),
                       ifelse(D < 1.569, D <- paste0(D, '**'),
                              D <- paste0(D, '***'))))
  }
  
  cat(" ---- Calculations of Benford's Law ----\n",
      "\n",
      "     Leemis's M      Cho-Gains's D     \n",
      "    ", M, "       ", D, "\n",
      "_______________________________________\n",
      "     *p<0.10; **p<0.05; ***p<0.01")
}
print.benfords(rep(1,10000), 'both')

