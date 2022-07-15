## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  echo = TRUE
)

## ----setup--------------------------------------------------------------------
library(dots)
library(ggplot2)
library(sf)

## -----------------------------------------------------------------------------
data("suffolk")

## -----------------------------------------------------------------------------
dots::dots(shp = suffolk, cols = vap_hisp)

## -----------------------------------------------------------------------------
dots::dots(shp = suffolk, cols = c(vap_hisp, vap_white))

## -----------------------------------------------------------------------------
dots::dots(shp = suffolk, cols = c(vap_hisp, vap_white), divisor = 1250)

## -----------------------------------------------------------------------------
dots::dots(shp = suffolk, cols = c(vap_hisp, vap_white), divisor = 1250) +
  scale_color_brewer(name = 'Race/Ethnicity', palette = 'Accent')

## -----------------------------------------------------------------------------
dots::dots(shp = suffolk, cols = c(vap_hisp, vap_white), divisor = 1250) +
  scale_color_brewer(name = 'Race/Ethnicity', palette = 'Accent') + 
  labs(
    title = 'White and Hispanic Adults in Suffolk County, MA',
    caption = 'One point per 1250 adults.'
  ) + 
  theme_void()

## -----------------------------------------------------------------------------
dots::dots_points(shp = suffolk, cols = c(vap_hisp, vap_white), divisor = 1250)  %>% 
  ggplot() +
  geom_sf(data = suffolk, fill = NA, color = 'black') +
  geom_sf(aes(color = dots_type)) +
  scale_color_brewer(name = 'Race/Ethnicity', palette = 'Accent') + 
  labs(
    title = 'White and Hispanic Adults in Suffolk County, MA',
    caption = 'One point per 1250 adults.'
  ) + 
  theme_void()

## -----------------------------------------------------------------------------
dots::dots_points(shp = suffolk, cols = c(vap_hisp, vap_white), divisor = 1250)  %>% 
  dplyr::mutate(dots_type = dplyr::case_when(
    dots_type == 'vap_white' ~ 'White',
    dots_type == 'vap_hisp' ~ 'Hispanic'
  )) %>% 
  ggplot() +
  geom_sf(data = suffolk, fill = NA, color = 'black') + 
  geom_sf(aes(color = dots_type), size = 0.75) + # change size
  scale_color_brewer(name = 'Race/Ethnicity', palette = 'Accent') + 
  labs(
    title = 'White and Hispanic Adults in Suffolk County, MA',
    caption = 'One point per 1250 adults.'
  ) + 
  theme_void()

