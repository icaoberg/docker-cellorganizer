#!/bin/bash

# demo3D09
#
# Synthesize one 3D image with nuclear, cell shape, and lysosomal channels
# from LAMP2 model with sampling method set to render lysosomes as
# ellipsoids without convolution. Also render 2D mean projections along XY,
# XZ, and YZ axes of image. The model was trained from the Murphy Lab 3D
# HeLa dataset.
#
# Input 
# -----
# * a valid CellOrganizer model file
#
# Output
# ------
# * three TIFF files (nuclear, cell shape, and lysosomal channels)
# * one projection TIFF file
# * one projection PNG file
#
# Created: Ivan E. Cao-Berg
#
# Copyright (C) 2013-2018 Murphy Lab
# Lane Center for Computational Biology
# School of Computer Science
# Carnegie Mellon University
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published
# by the Free Software Foundation; either version 2 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.
#
# For additional information visit http://murphylab.web.cmu.edu or
# send email to murphy@cmu.edu

echo -e "options.seed = 12345;
try; state = rng( options.seed ); catch err; rand( 'seed', options.seed ); end;
options.targetDirectory = pwd;
options.numberOfSynthesizedImages = 1;
options.prefix = 'img';
options.image.compression = 'lzw';
options.microscope = 'none';
options.sampling.method = 'disc';
options.verbose = true;
filenames = {'/home/murphylab/cellorganizer/models/3D/lamp2.mat'};
" > input.txt

slml2img $(pwd)/input.txt
