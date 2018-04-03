library(ggplot2)
library(gguptake)



planetPallete <- c("#2196F3", #E
                   "#F44336", #M
                   "#795548", #J
                   "#FFC107", #S
                   "#009688", #U
                   "#303F9F", #N
                   "#607D8B"  #P
                   )

moons <- read.csv('~/moons.txt',sep = '\t')
moons$Planet <- factor(moons$Planet, levels = c('Earth','Mars','Jupiter','Saturn','Uranus','Neptune','Pluto'))

scale_fill_manual(values=planetPallete)
scale_colour_manual(values=planetPallete)


ggplot() + 
  theme_uptake(style = 'white') +
  scale_x_log10(limits=c(1e-6, 1e-2)) +
  scale_y_log10(limits=c(1e-6, 1e-2)) +
  geom_abline(linetype=2, color="#aaaaaa")+
  geom_rect(data=moons, aes(xmin=D_sun_min, 
                            xmax=D_sun_max, 
                            ymin=D_moon_min, 
                            ymax=D_moon_max,
                            fill=Planet, 
                            color=Planet)
            , alpha=0.75 ) +
  scale_fill_manual(values=planetPallete) +
  scale_colour_manual(values=planetPallete) +
  xlab('Size of Sun (radians in sky from planet)') +
  ylab('Size of Moon (radians in sky from planet)') +
  labs(title="Eclipse Possibility"
       , subtitle="Perceived size of Sun and Moons from various (dwarf) planets")

