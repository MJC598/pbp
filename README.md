# PBP

This repository hosts the notebooks and R scripts used to process request data gathered for the Prison Book Program (PBP). In it, we attempt to surmise and produce a write up usable for the board of PBP to decern new purchase directions and funding allocations.

## Data Gathering

The data was gathered via individual letters received and processed between May and July of 2025. Each letter was hand read and then genres were determined based on a single individual's opinion. The starting genre list was provided by PBP from the genre list maintained at the same time by the organization. Requests that could not fit into a known genre were attributed to the closest possible genre or marked as "special title" and "special author" respectively.

## Analysis

The analysis was done with R 4.5.1 on a Windows Machine. Libraries such as ggplot2 and tidyverse were used to help generate summaries and graphics.

## Reporting

The report is written as a standard analysis report in an Rmd file found in the notebooks section. It was knitted together into a single word document for review by the book acquisition committee (formed in response to the Better World Books Grant) and then presented to the board.