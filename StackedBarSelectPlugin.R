# BOXPLOTS

#projectPath = "/Users/stebliankin/Desktop/GWI_2022/experiment_runs/03-25-2022-bwt2_ABR/"
#setwd(projectPath)
library(ggpubr)
dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
source("RIO.R")


input <- function(inputfile) {
   parameters <<- readParameters(inputfile)
   
   groups <<- readSequential(paste(prefix(), parameters["groupfile", 2], sep="/")) 
     

#### RPKM
assay <<- read.table(paste(prefix(), parameters["csvfile", 2], sep="/"), header = TRUE, sep=',')
assay$group <<- groups

species_combined_list <<- readSequential(paste(prefix(), parameters["species", 2], sep="/"))
}

run <- function() {

}

output <- function(outputfile) {

for(species in species_combined_list) {
  
  but_plot <- ggboxplot(assay, x="group" , y = species,
                        color = "black", palette = "jco", fill="group") +
    # theme(axis.title.x = element_text(size=0, face="bold"), axis.text.x =element_text(size=12, face="bold")) +
     theme_gray() #+ ylim(1,3.5)
  but_plot
  ggsave(paste(species,'.png', sep=''), path=outputfile, plot=but_plot, device = "png", dpi = 600)
}

}
