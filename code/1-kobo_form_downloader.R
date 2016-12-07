############################################################
#                                                          #
#                         Packages                         ####
#                                                          #
############################################################


#install.packages(httr)
#install.packages("dplyr")
#install.packages("tidyr")
#install.packages("readr")
#install.packages("readxl")
#install.packages(koboloadeR)


library(RCurl)

library(httr)
library(plyr)
library(dplyr)
library(tidyr)
library(readr)
library(readxl)
library(koboloadeR)
library(stringdist) ## used to fuzzy match column


############################################################
#                                                          #
#                 Uncomment the right one                  #
#                                                          #
############################################################

#apiurl = "https://kobocat.unhcr.org/api/v1/"
apiurl = "https://kc.humanitarianresponse.info/api/v1/"

## Store password & user name in another file -- not to be shared in github
source("perso/username.R")

kobo_dataset <- kobo_datasets (user = usernamepassword , api = apiurl)


#write.csv(kobo_dataset, "out/kobo_dataset.csv")


############################################################
#                                                          #
#                     Downloading info                     ####
#                                                          #
############################################################

##kobo_data_downloader(formid, user = NULL, api = "kobo", check = TRUE)

## Downloading data using
formid <- 1111
kobo_data_downloader(formid, user = usernamepassword , api = apiurl, check = TRUE)
write.csv(data_1111, "data/data_1111.csv")

## URL to get the form
URL1 <- sprintf(fmt = "%sforms/%s/form.xls", koboloadeR:::host(apiurl), formid)
form_tmp <- file("data/form.xls", open = "wb")
cat("\nDownloading form\n")
bin <- getBinaryURL(URL1, userpwd =usernamepassword , httpauth = 1L, ssl.verifypeer=FALSE  )
writeBin(bin, form_tmp)
close(form_tmp)

rm(apiurl,bin,FORM,formid,URL1,usernamepassword)
