#!/bin/bash -ue
source /etc/profile.d/modules.sh
module load singularity/3.8.4

cwltool --singularity --outdir /scratch/vpagano/results/outputs_small /scratch/vpagano/sb/graf-germline-workflow-1-2.json /scratch/vpagano/sb/inputs_small.yaml
