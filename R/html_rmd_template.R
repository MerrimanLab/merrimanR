html_rmd  <- function() {
  rstudioapi::insertText(
    '---
title: "Untitled"
author: ""
date: "`r format(Sys.Date())`"
output: html_document
---"\n\n```{r}\n\n```')
}
