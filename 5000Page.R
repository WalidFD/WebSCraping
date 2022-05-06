library(rvest)
library(dplyr)
library(DBI)
con <- DBI::dbConnect(odbc::odbc(), .connection_string = "Driver={MySQL ODBC 8.0 Unicode Driver};",
            server = "localhost",Database = "data",UID = "root", PWD = 845231, Port = 3306 )

Film = data.frame()

for (ir in seq(from = 1, to =5001 , by = 50)) {
  link = paste0("https://www.imdb.com/search/title/?title_type=feature&genres=musical&sort=user_rating,desc&start=",ir,"&explore=genres&ref_=adv_nxt")
  page = read_html(link)
  Name = page %>% html_nodes(".lister-item-header a") %>% html_text()
  Rating = page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
  Year = page %>% html_nodes(".text-muted.unbold") %>% html_text()
  print(paste("Page :",ir))
  
  Film = rbind(Film, data.frame(Name,Rating ,Year))
  }
View(Film)


Type = list(Name="varchar(50)",Rating ="Int(25)",Year="varchar(50)")
db_write_table(con,"Movies",value = Film, field.types= Type, row.names = FALSE )

dbWriteTable(con,name = "Movies",value = Film, field.types= Type, row.names = FALSE )
