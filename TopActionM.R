library(rvest)
library(dplyr)

link1 = "https://www.imdb.com/search/title/?genres=action&explore=title_type,genres&pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=e0da8c98-35e8-4ebd-8e86-e7d39c92730c&pf_rd_r=SYHH4FD7196BTVC4TG07&pf_rd_s=center-2&pf_rd_t=15051&pf_rd_i=genre&ref_=ft_gnr_pr2_i_2"
link2 = "https://www.imdb.com/search/title/?genres=action&start=51&explore=title_type,genres&ref_=adv_nxt"
page1 = read_html(link1)
page2 = read_html(link2)


nameAm1 = page1 %>% html_nodes(".lister-item-header a") %>% html_text()
nameAm2 = page2 %>% html_nodes(".lister-item-header a") %>% html_text() 
rating = page1 %>% html_nodes(".imdbRating strong") %>% html_text()
year = page1 %>% html_nodes(".titleColumn span") %>% html_text()

