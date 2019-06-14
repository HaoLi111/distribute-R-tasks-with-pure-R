getMission = function(waitPath = getwd(),waitTime = 30,nWait = 200,n = 100){
  for(nWait in 1:nWait){
    message(nWait)
    
    for(i in 1:n){
      fileName = paste0(waitPath,"/task",i,'.R')
      if(file.exists(fileName)){
        if(!file.exists(paste0(waitPath,"/taskComplete",i,'.txt'))){
          message("processing")
          message(fileName)
          try({
            source(fileName)
          })
          write.table(matrix(0,1,1),paste0(waitPath,"/taskComplete",i,'.txt'))
        }
      }
    }
    Sys.sleep(waitTime)
  }
}

getMission(nWait = 60*2*5)