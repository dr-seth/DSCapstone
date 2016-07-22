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


## Loading the original data set
blogs <- readLines("~/DSCapstone/data/en_US.blogs.txt", encoding = "UTF-8", skipNul=TRUE)
news <- readLines("~/DSCapstone/data/en_US.news.txt", encoding = "UTF-8", skipNul=TRUE)
twitter <- readLines("~/DSCapstone/data/en_US.twitter.txt", encoding = "UTF-8", skipNul=TRUE)

## Generating a random sapmle of all sources
sampleTwitter <- sample(twitter, 150000)
sampleNews <- sample(news, 150000)
sampleBlogs <- sample(blogs, 150000)
textSample <- c(sampleTwitter,sampleNews,sampleBlogs)

## Save sample
writeLines(textSample, "~/DSCapstone/data/bigTextSample.txt")
