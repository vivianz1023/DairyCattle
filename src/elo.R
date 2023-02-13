library(lubridate)
library(EloRating)

## generate plots for inclass presentation
load("./data/replacement_with_THI.rda")
master_feed_replacement_all <- replacement_THI
water_winter <- master_feed_replacement_all[which((master_feed_replacement_all$date >= "2020-12-01")&(master_feed_replacement_all$date <= "2021-02-01")&(master_feed_replacement_all$Bin_type == "Water")),]
water_summer <- master_feed_replacement_all[which((master_feed_replacement_all$date >= "2020-07-15")&(master_feed_replacement_all$date <= "2020-09-15")&(master_feed_replacement_all$Bin_type == "Water")),]
water_winter$index <- seq(1, nrow(water_winter))
water_summer$index <- seq(1, nrow(water_summer))

## Order replacements
elo_water_winter <- water_winter[order(water_winter$hour),c("Actor_cow", "Reactor_cow","hour", "Bin", "date")]
colnames(elo_water_winter)=c("winner","loser","time","bin", "date")
elo_water_winter$index <- seq(1, nrow(elo_water_winter))

elo_water_summer <- water_summer[order(water_summer$hour),c("Actor_cow", "Reactor_cow","hour", "Bin", "date")]
colnames(elo_water_summer)=c("winner","loser","time","bin", "date")
elo_water_summer$index <- seq(1, nrow(elo_water_summer))


#Calculate the ELO scores 
elo_package_result_winter=elo.seq(winner=as.character(elo_water_winter$winner),
                           loser=as.character(elo_water_winter$loser),
                           Date=substring(elo_water_winter$date,1,10),
                           k=20,
                           #presence=presence_comb,
                           runcheck = F,
                           progressbar=T)

elo_package_result_summer=elo.seq(winner=as.character(elo_water_summer$winner),
                           loser=as.character(elo_water_summer$loser),
                           Date=substring(elo_water_summer$date,1,10),
                           k=20,
                           #presence=presence_comb,
                           runcheck = F,
                           progressbar=T)


cows <- Reduce(intersect, list(elo_package_result_summer$allids,elo_package_result_winter$allids))


eloplot(elo_package_result_winter, ids=cows, interpolate="no", from="start", to="end",
        color=TRUE)
eloplot(elo_package_result_summer, ids=cows, interpolate="no", from="start", to="end",
        color=TRUE)


##
logtable <- elo_package_result[["logtable"]]
logtable$index <- seq(1, nrow(logtable))

logtable2 <- logtable[, c("winner","loser", "Apost","Bpost", "index")]

logtable3 <- merge(logtable2, elo.repl.list)
logtable3$bin <- NULL