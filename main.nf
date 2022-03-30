nextflow.enable.dsl=2

process sevenBridges {

    input:
        path sifFile

    cpus 36

    executor 'slurm'
    queue 'gpu-dev'

    script:
    """
        module load singularity/3.8.4
        cwltool --singularity --outdir ${params.outputDir} ${params.jsonFile} ${params.yaml}
    """

}

params.jsonFile = '/scratch/vpagano/sb/graf-germline-workflow-1-2.json'

workflow {
    sevenBridges('/scratch/vpagano/sb/gral-rasm-stats-1-2-2.sif')
}