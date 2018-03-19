#!/bin/bash

# demo3D03
#
# Synthesize one 3D image with nuclear, cell shape, and vesicular channels
# from all vesicular object models (nucleoli, lysosomes, endosomes, and
# mitochondria) with sampling method set to sample vesicular objects from
# Gaussians at density 75 without convolution. The model was trained from
# the Murphy Lab 3D HeLa dataset.
#
# Input
# -----
# * a list of valid CellOrganizer model files
#
# Output
# ------
# * six TIFF files (nuclear, cell shape, nucleolar, lysosomal, endosomal,
#   and mitochondrial channels)
#
# Created: Robert F. Murphy
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

wget -nc --quiet http://www.cellorganizer.org/Downloads/v2.7/docker/demo3D03.tgz

mkdir -p ../../../images/HeLa/3D

tar -xvf demo3D03.tgz -C ../../../images/HeLa/3D/

rm -f demo3D03.tgz

echo -e "options.seed = 12345;
try; state = rng( options.seed ); catch err; rand( 'seed', options.seed ); end;
options.targetDirectory = pwd;
options.prefix = 'img';
options.compression = 'lzw';
options.microscope = 'none';
options.sampling.method = 'sampled';
options.sampling.density = 75;
options.numberOfGaussianObjects = 25;
options.verbose = true;
options.debug = false;
filenames = {'/home/murphylab/cellorganizer/models/3D/nuc.mat','/home/murphylab/cellorganizer/models/3D/lamp2.mat','/home/murphylab/cellorganizer/models/3D/tfr.mat','/home/murphylab/cellorganizer/models/3D/mit.mat'};
" > input.txt

slml2img $(pwd)/input.txt