#!/bin/bash

# We assume running this from the script directory
lls=('d-deltah')

places=('TI', 'SG', 'BS', 'GR', 'LU', 'BL', 'SZ', 'AG', 'SH', 'GE', 'ZH', 'VD', 'FR', 'BE')

for place in ${places[@]}; do
  for ll in ${lls[@]}; do
    Rscript COVID-pomp/scripts/build_canton_pomp.R -p ${place} -l ${ll} -r 3 -o 8 -j 16
    Rscript COVID-pomp/scripts/filter_canton_pomp.R -p ${place} -l ${ll} -o 8 -n 1000
    Rscript COVID-pomp/scripts/plot_filter_canton_pomp.R -p ${place} -l ${ll}
  done
done
