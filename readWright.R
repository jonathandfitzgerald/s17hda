WRIGHT = list.files("data/wright-txt",full.names = TRUE)

readWRIGHTtext = function(file) {
  message(file)
  text = paste(scan(file, sep="\n",what="raw",strip.white = TRUE))
  WRIGHT = tibble(fileID=file,text=text) %>% group_by(fileID) %>% summarise(text = paste(text, collapse = " "))
  return(WRIGHT)
}

allWRIGHTtext = tibble(fileID=WRIGHT) %>% 
  group_by(fileID) %>% 
  do(readWRIGHTtext(.$fileID)) 