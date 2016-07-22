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

## Budilding the n-grams

finalCorpus <- readRDS("~/DSCapstone/data/finalCorpus.RData")
finalCorpusDF <-data.frame(text=unlist, stringsAsFactors = FALSE)

## Building the tokenization function for the n-grams
ngramTokenizer <- function(theCorpus, ngramCount) {
  ngramFunction <- RWeka::NGramTokenizer(theCorpus, 
                                         RWeka::Weka_control(min = ngramCount, max = ngramCount, 
                                                             delimiters = " \\r\\n\\t.,;:\"()?!"))
  ngramFunction <- data.frame(table(ngramFunction))
  ngramFunction <- ngramFunction[order(ngramFunction$Freq, 
                                       decreasing = TRUE),][1:10,]
  colnames(ngramFunction) <- c("String","Count")
  ngramFunction
}

unigram <- ngramTokenizer(finalCorpusDF, 1)
saveRDS(unigram, file = "~/DSCapstone/data/unigram.txt")
bigram <- ngramTokenizer(finalCorpusDF, 2)
saveRDS(bigram, file = "~/DSCapstone/data/bigram.txt")
trigram <- ngramTokenizer(finalCorpusDF, 3)
saveRDS(trigram, file = "~/DSCapstone/data/trigram.txt")
quadgram <- ngramTokenizer(finalCorpusDF, 4)
saveRDS(quadgram, file = "~/DSCapstone/data/quadgram.txt")
