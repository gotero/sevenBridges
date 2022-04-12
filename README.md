# Seven Bridges GRAF Aligner Pipeline

This nextflow pipeline will run the Seven GRAF Aligner workflow and output the results.

## Running a simple pipeline

There are very few options for the Seven Bridges Pipeline. The only required parameter is the input fastq files. For example to run the small input pipeline, run:

    nextflow run https://github.com/v-pagano/sevenBridges --input "/scratch/vpagano/sb/fastqs/*R{1,2}.fastq.gz"

You can also set the directory to output the results:

    nextflow run https://github.com/v-pagano/sevenBridges --input "/scratch/vpagano/sb/fastqs/*R{1,2}.fastq.gz" --outputDir /scratch/vpagano/results

Lastly, to run on the dback cluster on the defq queue:

    nextflow run https://github.com/v-pagano/sevenBridges --input "/scratch/vpagano/sb/fastqs/*R{1,2}.fastq.gz" --outputDir /scratch/vpagano/results -profile dback

### Optional parameters 

| Modification                              | Command Line Parameter |
|-------------------------------------------|------------------------|
| Path to fastq files                       | --input                |
| JSON file with cwl workflow to run        | --jsonFile             |
| Directory to output results               | --outputDir            |
| SIF File with optional stats workflow     | --sif                  |
| Skip running against Pan Genome Reference | --skipPangenome        |
| Skip running against AMR Reference        | --skipAMR              |

