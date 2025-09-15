install.packages("data.table")
install.packages("ggplot2")
install.packages("reshape2")
library(data.table)
library(ggplot2)
library(reshape2)

total_letters <- c(30, 174, 25, 62, 55, 12, 213, 131)
dt <- fread("data.csv")
dt_rates <- data.table(Genre = dt$Genre)

for (i in seq(1, length(total_letters))) {
    dt_idx <- i + 1
    colname <- colnames(dt)[dt_idx]
    dt_rates[[colname]] <- dt[[colname]] / total_letters[i]
}

dt_rates <- dt_rates[order(dt_rates$"r7", decreasing = TRUE)]
genres <- dt_rates$Genre

tposed <- as.data.frame(t(dt_rates[, -1]))
rownames(tposed) <- NULL
tposed <- setNames(tposed, genres)

n <- 20
transposed <- tposed[, 1:n]


plot <- ggplot(melt(transposed), aes(variable, value)) +
    geom_boxplot() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    labs(x = "Genres", y = "Probability for Request in a Letter")

ggsave("my_plot.png",
    plot = plot,
    width = 6,
    height = 8,
    units = "in",
    dpi = 300)

dt_summary <- as.data.frame(summary(tposed))

write.csv(dt_summary, file = "summary.csv", row.names = FALSE)
