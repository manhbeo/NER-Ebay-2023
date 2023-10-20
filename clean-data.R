library(readr)
library(tidyverse)
tag_df = read.delim("Train_Tagged_Titles.tsv", sep="\t", header=TRUE, stringsAsFactors=FALSE, na.strings="", quote="")


# tag_df$Tag[1] = paste("B-", tag_df$Tag[1], sep="")
# for(i in 2:length(tag_df$Tag)){
#   if(is.na(tag_df$Tag[i])){
#     tag_df$Tag[i] = paste("I", substr(tag_df$Tag[i-1], 2, nchar(tag_df$Tag[i-1])), sep="")
#   }
#   else tag_df$Tag[i] = paste("B-", tag_df$Tag[i], sep="")
# }
# write.table(tag_df, "BI_train.tsv", sep = "\t", row.names = FALSE, quote = FALSE)

i = 1

while (i < length(tag_df$Tag)){
  if (is.na(tag_df$Tag[i])) {
    tag_df$Token[i-1] = paste(tag_df$Token[i-1], tag_df$Token[i])
    tag_df = tag_df[-i, ]
  }
  else i = i + 1
}

write.table(tag_df, "grouped_token.tsv", sep = "\t", row.names = FALSE, quote = FALSE)


# for (i in 2:length(tag_df$Tag)){
#   if(is.na(tag_df$Tag[i])) next
#   if(tag_df$Tag[i] == "No Tag") next
#   if(tag_df$Tag[i] == tag_df$Tag[i-1]){
#     print(i)
#   }
# }
# 
# for (i in 1:length(tag_df$Tag)){
#   if(paste("B" ,tag_df$Tag[i]) == tag_df$Tag[i]){
#     print(i)
#   }
#   if(paste("I" ,tag_df$Tag[i]) == tag_df$Tag[i]){
#     print(i)
#   }
# }
# 
# for (i in 1:length(tag_df$Tag)){
#   if(is.na(tag_df$Tag[i])){
#     tag_df$C[i] = "I"
#   }
#   else tag_df$C[i] = "B"
# }
# 
# write.table(tag_df, "partly_cleaned_train_data.tsv", sep = "\t", row.names = FALSE, quote = FALSE)
# 
# i = 1
# 
# while (i < length(tag_df$Tag)){
#   if (is.na(tag_df$Tag[i])) {
#     tag_df$Token[i-1] = paste(tag_df$Token[i-1], tag_df$Token[i])
#     tag_df = tag_df[-i, ]
#   }
#   else i = i + 1
# }
# 
# write.table(tag_df, "cleaned_train_data.tsv", sep = "\t", row.names = FALSE)
# 
# j=0
# record = FALSE
# token = FALSE
# 
# for (i in 1:length(tag_df$Tag)){
#   if(is.na(tag_df$Tag[i]))
#     token[j] = paste(token[j], tag_df$Token[i])
#   else{
#     j = j + 1
#     record[j] = tag_df$Record.Number[i]
#     token[j] = tag_df$Token[i]
#   }
# }
# 
# labeled_tokens = data.frame(record, token)
# 
# write.table(labeled_tokens, "labeled_tokens.tsv", sep = "\t", row.names = FALSE)
# 
# 
# untag_df = read.delim("Listing_Titles.tsv", sep="\t", header=TRUE, stringsAsFactors=FALSE, na.strings="", quote="")
# i = 1
# for (k in 2:20){#length(labeled_tokens$token)){
#   if(k != 1 & labeled_tokens$record[k-1] == labeled_tokens$record[k])
#     untag_df = rbind(untag_df, untag_df[i, ])
#   else i = i + 1
# }
# 
# untag_df = untag_df[order(untag_df$Record.Number), ]

