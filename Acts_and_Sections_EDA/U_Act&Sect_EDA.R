
# Read the data
df <- read_excel("df.xlsx", col_types = c("text", "numeric", "text", "text", "date", "text", "text", "date"))

dim(df)

library(DataExplorer)
create_report(df)

# Extract Case Number, Type and Year
extract_case_number<-function(s){
  posarr=gregexpr("-",s)
  locs=tail(posarr[[1]],2)
  case_num=substr(s,locs[1]+1,locs[2]-1)
  return(case_num)
}

extract_case_type<-function(s){
  posarr=gregexpr("-",s)
  locs=tail(posarr[[1]],2)
  case_type=substr(s,1,locs[1]-1)
  return(case_type)
}

extract_case_year<-function(s){
  posarr=gregexpr("-",s)
  locs=tail(posarr[[1]],1)
  case_year=substr(s,locs[1]+1,nchar(s))
  return(case_year)
}


df$case_number=apply(df[,1],1,extract_case_number)
df$case_type=apply(df[,1],1,extract_case_type)
df$case_year=apply(df[,1],1,extract_case_year)

#write.csv(df,"df_new.csv")

