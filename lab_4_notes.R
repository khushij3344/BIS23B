if (!require(ggplot2, quietly = TRUE)) {install.packages("ggplot2")}

library(ggplot2)

if (!require(tidyverse, quietly = TRUE)) {install.packages("tidyverse")}

library(tidyverse)

source("contig_length_function.R")

contig_len_df <- readFastaAndGetLengths("lab1_lab2/megahit_out/final.contigs.fa")

# Sort data frame by decreasing length, using order() function
contig_len_df_decreasing <- contig_len_df[order(-contig_len_df$Length), ]

# Plot using ggplot2
myplot <- contig_len_df_decreasing %>% 
    filter(Length>1000) %>% 
  ggplot(aes(x = reorder(Contig, Length), y = Length)) +
  geom_col() +
  labs(x = "Contig", y = "Length (bp)", title = "Contig Length Distribution") +
  theme_minimal() +
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) # Hide x-axis labels for clarity
myplot

#Github: email:kayjain@ucdavis.edu; pass: Khushi12345$

ggsave("Contig_len_1000_khushi.png",plot= myplot, width = 6, height = 4, dpi = 300)

