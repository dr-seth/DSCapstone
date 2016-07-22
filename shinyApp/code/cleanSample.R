################################################################################
##                                                                            ##
##                        Data Science Capstone Project                       ##
##                                                                            ##            
##                              Seth E Dobrin                                 ##
##                                                                            ##
##           Github Repo: https://github.com/drseth/DSCapstone                ##
##                                                                            ##
################################################################################
setwd('~/DSCapstone')
suppressPackageStartupMessages(c(
  require(RWekajars),
  require(qdapDictionaries),
  require(qdapRegex),
  require(qdapTools),
  require(RColorBrewer),
  require(qdap),
  require(NLP),
  require(tm),
  require(SnowballC),
  require(slam),
  require(RWeka),
  require(rJava),
  require(dplyr)))

## Building a clean corpus

theSampleCon <- file("~/DSCapstone/data/newTextSample.txt")
theSample <- readLines(theSampleCon)
close(theSampleCon)

profanityWords <- read.table("~/DSCapstone/data/profanityfilter.txt", header = FALSE)

## Build the corpus, and specify the source to be character vectors 
cleanSample <- Corpus(VectorSource(theSample))


## Make it work with the new tm package
cleanSample <- tm_map(cleanSample,
                      content_transformer(function(x) 
                        iconv(x, to="UTF-8", sub="byte")),
                      mc.cores=2)

## Convert to lower case
cleanSample <- tm_map(cleanSample, content_transformer(tolower), lazy = TRUE)

## remove punction, numbers, URLs, stop, profanity and stem wordson
cleanSample <- tm_map(cleanSample, content_transformer(removePunctuation))
cleanSample <- tm_map(cleanSample, content_transformer(removeNumbers))
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x) 
cleanSample <- tm_map(cleanSample, content_transformer(removeURL))
cleanSample <- tm_map(cleanSample, stripWhitespace)
cleanSample <- tm_map(cleanSample, removeWords, stopwords("english"))
cleanSample <- tm_map(cleanSample, removeWords, profanityWords)
cleanSample <- tm_map(cleanSample, stemDocument)
cleanSample <- tm_map(cleanSample, stripWhitespace)

## Saving the final corpus
saveRDS(cleanSample, file = "~/DSCapstone/data/finalCorpus.RData")


