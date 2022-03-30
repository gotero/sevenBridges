nextflow.enable.dsl=2

process sevenBridges {

    cpus 36


    script:
    """
        cwltool --singularity --outdir ${params.outputDir} ${params.jsonFile} ${params.yaml}
    """

}

params.jsonFile = '/scratch/vpagano/sb/graf-germline-workflow-1-2.json'

workflow {
    sevenBridges()
}