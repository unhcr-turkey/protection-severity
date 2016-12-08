############################################################
#                                                          #
#           This scripts allow to download both            ####
#           the data & the form from Kobotoolbox           ####
#                                                          #
############################################################

## It will ask for 
## Server i.e. UNHCR or OCHA
## user name /password
## then display the list of avaialble form
## ask for the form ID


############################################################
#                                                          #
#                         Packages load                    ####
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
#                 As users details                         ####
#                                                          #
############################################################



apichoose <- readline("Select the server you want to use - Enter 1 for UNHCR server or 0 for OCHA server: ")
user <- readline("Provide your username for the server you selected: ")
passw <- readline("Provide your password for the server you selected: ")
usernamepassword <- paste(user,passw,sep=":")

#apiurl = "https://kobocat.unhcr.org/api/v1/"
#apiurl <- "https://kc.humanitarianresponse.info/api/v1/"

if (apichoose=='1') {
  apiurl = "https://kobocat.unhcr.org/api/v1/"
} else {
  apiurl <- "https://kc.humanitarianresponse.info/api/v1/"
}

## Store password & user name in another file -- not to be shared in github
#source("perso/username.R")

kobo_dataset <- kobo_datasets (user = usernamepassword , api = apiurl)

kobo_dataset

formselect <- readline("Select the formid your want to pull from the list above: ")


#write.csv(kobo_dataset, "out/kobo_dataset.csv")


############################################################
#                                                          #
#                     Downloading info                     ####
#                                                          #
############################################################

##kobo_data_downloader(formid, user = NULL, api = "kobo", check = TRUE)

## Downloading data using
formid <- formselect
datadown <- kobo_data_downloader(formid, user = usernamepassword , api = apiurl, check = TRUE)
## save extracted data in data folder using formid as the name
write.csv(datadown,paste0("data/data_",formid,".csv"))

## save form in data folder using formid as the name
URL1 <- sprintf(fmt = "%sforms/%s/form.xlsx", koboloadeR:::host(apiurl), formid)
form_tmp <- file(paste0("data/form_",formid,".xlsx"), open = "wb")
bin <- getBinaryURL(URL1, userpwd =usernamepassword , httpauth = 1L, ssl.verifypeer=FALSE  )
writeBin(bin, form_tmp)
close(form_tmp)

rm(apiurl,bin,FORM,formid,URL1,usernamepassword,apichoose,user,passw,formselect,form_tmp)
