# This code produces a chart of the Single Elims in a tournament
  
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
if (!require("pacman")) install.packages("pacman")
pacman::p_load("DiagrammeR","DiagrammeRsvg","magrittr","rsvg")

# I went crazy trying to work out how to properly order the top 16.
 # The solution was to not try. Check the label to see where in the order it is not the node.
  
  
# Enter  name of Tournament
tournament <- "Bologna Kotei 2019"

# Clan Colors
crab <- '4C5660'
crane <- '98AEAB'
dragon <- '567C63'
lion <- 'AF9445'
phoenix <- 'B47741'
scorpion <- '8C3D2E'
unicorn <- '6D5472'
neutral <- '888888'



 - Scorpion (Hatamoto)
 - Crane (Hatamoto)
 - Scorpion
 - Unicorn (Hatamoto)
 - Lion (Hatamoto)
 - Unicorn
 - Crab (Hatamoto)
 - Crane

# Players in Seed order
seed01 <- "Norbert Vincze"
clan01 <- scorpion
seed02 <- "Alessandro Apicella"
clan02 <- crane
seed03 <- "Pietro Sebastiano Monari"
clan03 <- scorpion
seed04 <- "Terék Milán"
clan04 <- unicorn
seed05 <- "Marios Bounakis"
clan05 <- lion
seed06 <- "John Papadakis"
clan06 <- unicorn
seed07 <- "Daniel Correas"
clan07 <- crab
seed08 <- "Lorenzo Becchetti"
clan08 <- crane


# Enter names and color codes for top 8
name8e <- seed01; clan8e <- clan01 #1
name8f <- seed08; clan8f <- clan08 #2
name8h <- seed04; clan8h <- clan04 #3
name8g <- seed05; clan8g <- clan05 #4
name8c <- seed02; clan8c <- clan02 #5
name8d <- seed07; clan8d <- clan07 #6
name8a <- seed03; clan8a <- clan03 #7
name8b <- seed06; clan8b <- clan06 #8

# Enter names and color codes for top 4
name4c <- name8f; clan4c <- clan8f #1
name4d <- name8g; clan4d <- clan8g #2
name4b <- name8d; clan4b <- clan8d #3
name4a <- name8a; clan4a <- clan8a #4

# # Modifications
# name4c <- ""
# clan4c <- neutral #1
# name4d <- ""
# clan4d <- neutral #2
# name4b <- ""
# clan4b <- neutral #3
name4a <- "Pietro\nSebastiano Monari"
# clan4a <- neutral #4

# Enter names and color codes for top 2
name2b <- name4d; clan2b <- clan4d #1
name2a <- name4a; clan2a <- clan4a #2

# To clear while games are in progress
# name2a <- ""; clan2a <- neutral
# name2b <- ""; clan2b <- neutral


# Enter names and color codes for winner
name1 <- name2a; clan1 <- clan2a

# To clear while games are in progress
# name1 <- ""; clan1 <- neutral

x <- paste0("
            digraph boxes_and_circles {
            # a 'graph' statement
            graph [bgcolor = white, overlap = true, fontsize = 50, fontname = Arial, rankdir = LR, labelloc='t', label='IA - ",tournament," - Top 8']
            
            # several 'node' statements
            node [	shape = box,
            fixedsize = true,
            style = filled,
            width = 4,
            height = 1,
            fontsize = 22
            fontname = Arial]
            Top8a [label='",name8e,"' fillcolor = '#",clan8e,"' fontcolor = white];
            Top8b [label='",name8f,"' fillcolor = '#",clan8f,"' fontcolor = white];
            Top8c [label='",name8h,"' fillcolor = '#",clan8h,"' fontcolor = white];
            Top8d [label='",name8g,"' fillcolor = '#",clan8g,"' fontcolor = white];
            Top8e [label='",name8a,"' fillcolor = '#",clan8a,"' fontcolor = white];
            Top8f [label='",name8b,"' fillcolor = '#",clan8b,"' fontcolor = white];
            Top8g [label='",name8c,"' fillcolor = '#",clan8c,"' fontcolor = white];
            Top8h [label='",name8d,"' fillcolor = '#",clan8d,"' fontcolor = white];
            
            node [	shape = box,
            fixedsize = true,
            style = filled,
            width = 4,
            height = 2,
            fontsize = 26
            fontname = Arial]
            Top4a [label='",name4c,"' fillcolor = '#",clan4c,"' fontcolor = white];
            Top4b [label='",name4d,"' fillcolor = '#",clan4d,"' fontcolor = white];
            Top4c [label='",name4a,"' fillcolor = '#",clan4a,"' fontcolor = white];
            Top4d [label='",name4b,"' fillcolor = '#",clan4b,"' fontcolor = white];
            Top2a [label='",name2b,"' fillcolor = '#",clan2b,"' fontcolor = white];
            Top2b [label='",name2a,"' fillcolor = '#",clan2a,"' fontcolor = white];
            
            
            node [	shape = box,
            fixedsize = true,
            style = filled,
            width = 4,
            height = 3,
            fontsize = 30
            fontname = Arial]
            Top1 [label='",name1,"' fillcolor = '#",clan1,"' fontcolor = white];
            
            # several 'edge' statements
            Top8a->Top4a Top8b->Top4a Top8c->Top4b Top8d->Top4b Top8e->Top4c Top8f->Top4c
            Top8g->Top4d Top8h->Top4d Top4a->Top2a Top4b->Top2a Top4d->Top2b Top4c->Top2b
            Top2a->Top1 Top2b->Top1
            
            }
            ")
grViz(x)
grViz(x) %>%
  export_svg %>% charToRaw %>% rsvg_png("top8.png")