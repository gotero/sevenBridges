# Seven Bridges GRAF Aligner Pipeline

This nextflow pipeline will run the Seven GRAF Aligner workflow and output the results.

## Running a simple pipeline

There are very few options for the Seven Bridges Pipeline. The only required parameter is the input yaml file. For example to run the small input pipeline, run:

    nextflow run https://github.com/v-pagano/sevenBridges --yaml small_inputs.yaml

You can also set the directory to output file the results:

    nextflow run https://github.com/v-pagano/sevenBridges --yaml small_inputs.yaml --outputDir /scratch/vpagano/results

Lastly, to run on the dback cluster on the defq queue:

    nextflow run https://github.com/v-pagano/sevenBridges --yaml small_inputs.yaml --outputDir /scratch/vpagano/results -profile dback

### Optional parameters 

| Modification                          | Command Line Parameter |
|---------------------------------------|------------------------|
| Input YAML File                       | --yaml                 |
| JSON file with cwl workflow to run    | --jsonFile             |
| Directory to output results           | --outputDir            |
| SIF File with optional stats workflow | --sif                  |

