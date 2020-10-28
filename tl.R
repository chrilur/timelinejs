#Lage tidslinje

#Laste inn mal
mal <- read.csv("data/tltest.csv")
kolonner <- names(mal)

#Lese skjemasvar
data <- read.csv("tidslinjesvar.csv", fileEncoding = "UTF-8")

#Trekk ut år, måned og dag
fodt.aar <- substring(data$Fødselsdato,7,10)
fodt.mnd <- substring(data$Fødselsdato,4,5)
fodt.dag <- substring(data$Fødselsdato,1,2)

# Gjør om til tall                    
fodt.aar <- as.integer(fodt.aar)
fodt.mnd <- as.integer(fodt.mnd)
fodt.dag <- as.integer(fodt.dag)

kjonn <- data$Du.er.

#La headline være navnet
headline <- data$Ditt.navn

#La text være det gøye som skjedde
txt <- paste("Det gøye som skjedde i fødselsåret mitt:", data[,4])

video <- data[,5]

#Lag tidslinje
tldf <- data.frame(Year = fodt.aar, Month = fodt.mnd, Day = fodt.dag, Time = "", End.Year = "", End.Month = "", 
                   End.Day = "", End.Time = "", Display.Date = "", Headline = headline, Text = txt, Media = video, Media.Credit = "YouTube",
                   Media.Caption = "", Media.Thumbnail = "", Type = "", Group = kjonn, Background = "#fb8989")

write.csv(tldf, "tidslinje_ferdig.csv", row.names = FALSE)
