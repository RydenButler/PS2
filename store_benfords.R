store.benfords <- function(x, type='m', directory=getwd()){
  source('print_benfords.R')
  write.csv(print.benfords(x=x, type=type), 
              file=paste0(getwd(), '/benford.csv'))
  print('File saved as benford.csv')
}

