library(rvest)
library(dplyr)

link = "https://www.imdb.com/india/top-rated-indian-movies/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=461131e5-5af0-4e50-bee2-223fad1e00ca&pf_rd_r=EJ2XZ7JHJ7WJX7HR6JPF&pf_rd_s=center-1&pf_rd_t=60601&pf_rd_i=india.toprated&ref_=fea_india_ss_toprated_india_tr_india250_hd"
page = read_html(link)

name = page %>% html_nodes(".titleColumn a") %>% html_text()
rating = page %>% html_nodes(".imdbRating strong") %>% html_text()
year = page %>% html_nodes(".titleColumn span") %>% html_text()


TopI250M = data.frame(name,rating,year)
View(TopI250M)
write.csv(TopI250M,"C:\\Users\\walid\\Desktop\\Proj\\WebCraping\\TopI250M.csv", row.names = FALSE)

