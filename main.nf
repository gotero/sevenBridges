nextflow.enable.dsl=2

process sevenBridges {

    input:
        path jsonFile
        path sifFile
        path yamlFile

    cpus 36
    executor 'slurm'
    queue 'gpu-dev'


    script:
    """
        source /etc/profile.d/modules.sh
        module load singularity/3.8.4

        cwltool --singularity --outdir ${params.outputDir} ${jsonFile} ${params.yaml}
    """

}

params.workflow = '/scratch/vpagano/sb/graf-germline-workflow-1-2.json'
params.sif = '/scratch/vpagano/sb/gral-rasm-stats-1-2-2.sif'
params.outputDir = '/scratch/vpagano/results/outputs_small'
params.yaml = '/scratch/vpagano/sb/inputs_small.yaml'

workflow {
    sevenBridges(params.workflow, params.sif, params.yaml)
}