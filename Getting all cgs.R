library(minfi)
library(BSgenome.Hsapiens.UCSC.hg19)
chrs <- names(Hsapiens)[!grepl("upstream", names(Hsapiens))]
CGs <- lapply(chrs, function(x) start(matchPattern("CG",Hsapiens[[x]])))
names(CGs) <- chrs
str(CGs)
promoters_5330<-read.csv("/Users/chadpollard/Desktop/5330_Most_Regulated_Promoter_Sites.csv",row.names = 1)
head(promoters_5330)

for (i in rownames(promoters_5330)) {
  promoter<-i
  chr<-promoters_5330[i,"chr"]
  start<-promoters_5330[i,"start"]
  stop<-promoters_5330[i,"stop"]
  if (i == "A2M-AS1"){
    for (i in CGs$chr12){
      if ((i > start)&&(i < stop)){
        print(i)
      }
    }
  }
}
write.csv(CGs$chr1,"/Users/chadpollard/Desktop/Temp/random.csv")


