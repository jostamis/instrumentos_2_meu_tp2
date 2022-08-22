# Instrumentos de Análisis Urbano II
# MEU - UTDT

# Estudiante: TAMIS, Josefina

# Trabajo Práctico n° 2. Script #2 Análisis exploratorio

# 0. Importar librerias

library(tidyverse)
library(ggplot2)
library(ggthemes)

# a. Importar una base de datos

# Base de datos: Barrios Populares de Argentina
# .csv de Mapa de los barrios populares de Argentina registrados en el Registro Nacional de Barrios Populares actualizado al 15 de junio de 2022
# Modificaciones realizadas en Script #1

barrios_populares_ba <- read_csv(file =  "Data/barrios_ba.csv")

# b. Análisis exploratorio

# 1- Receta básica

ggplot(barrios_populares_ba, aes(x=c(id_renabap), 
                                 y=decada_de_creacion))

# 2- Geometría

ggplot(data = barrios_populares_ba) +
    geom_bar(
      mapping = aes(y=decada_de_creacion),
    ) 

# 3 - Theme

ggplot(data = barrios_populares_ba) +
  geom_bar(
    mapping = aes(y=decada_de_creacion),
  ) +
  labs(title = "Barrios populares según década de creación",  
       y = "Década de creación",  x = "Cantidad", 
       caption = "Fuente: RENABAP") +
  ggthemes::theme_gdocs()

# 4 - Scale

ggplot(data = barrios_populares_ba) +
  geom_bar(
    mapping = aes(y=decada_de_creacion, 
                  fill=clasificacion_barrio),
  ) +
  labs(title = "Barrios populares según década de creación",  
       y = "Década de creación",  x = "Cantidad", 
       caption = "Fuente: RENABAP", labs(color='Tipo')) +
  guides(fill = guide_legend(title = "Tipo Barrio Popular")) +
  scale_fill_brewer(palette = "Blues") +
  ggthemes::theme_gdocs()

# 5- Facet

ggplot(data = barrios_populares_ba) +
  geom_bar(
    mapping = aes(y=decada_de_creacion)) +
  facet_wrap(~ clasificacion_barrio, nrow = 1) +
  labs(title = "Barrios populares según década de creación",  
       y = "Década de creación",  x = "Cantidad", 
       caption = "Fuente: RENABAP") + 
  ggthemes::theme_gdocs()