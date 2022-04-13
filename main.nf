nextflow.enable.dsl=2

process sevenBridges {

    input:
        tuple val(meta), val(yaml)
        path sifFile

    script:
    """
        module load singularity/3.8.4
        cwltool --singularity --tmpdir-prefix /scratch/vpagano/tmp --outdir ${params.outputDir} ${params.jsonFile} ${yaml}
    """

}

process writeYAML {

    input:
        tuple val(meta), val(fq)

    output:
        tuple val(meta), path("${meta.id}.yaml")

    cpus 1

    script:
    """
        sed 's+##SAMPLE##+${meta.id}+g;s+##FQ1##+${fq[0]}+g;s+##FQ2##+${fq[1]}+g' /scratch/vpagano/sb/sample.yaml > ${meta.id}.yaml
    """
}

process writeYAML_AMR {

    input:
        tuple val(meta), val(fq)

    output:
        tuple val(meta), path("${meta.id}_AMR.yaml")

    cpus 1

    script:
    """
        sed 's+##SAMPLE##+${meta.id}+g;s+##FQ1##+${fq[0]}+g;s+##FQ2##+${fq[1]}+g' /scratch/vpagano/sb/sample_AMR.yaml > ${meta.id}_AMR.yaml
    """
}

workflow {
//    fastq = Channel.fromFilePairs(params.input)
//    fastq = fastq.map{ [ [ id: it[0] ], it[1] ] }

    runFiles = Channel.fromPath(params.csvFile)
               .splitCsv(header: true)
               .filter{ it['Batch (Priority)'].toString()  == params.batch.toString() }
               .map{ row -> [ row, [ row.path + row['fastq file (R1)'], row.path + row['fastq file (R2)'] ] ] }

    fastq = runFiles.map { [ [ 'id': it[0].fileid ], it[1] ] }

    if (!params.skipPangenome) {
        writeYAML(fastq)
    }

    if (!params.skipAMR) {
        writeYAML_AMR(fastq)
    }
    samples = writeYAML.out.mix(writeYAML_AMR.out)
    sevenBridges(samples, params.sif)
    
}
