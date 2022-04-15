process petageneCompressFastq {

    input:
        tuple val(meta), path(fq)
        val species
        val encrypt
        val datasteward

    output:
        tuple val(meta), path("*.fasterq")

    cpus 24
    
    script:
    """
        source /etc/profile.d/modules.sh
        module load petagene/protect_1.3.11
        petasuite --compress ${encrypt ? '--encrypt' : ''} -m lossless -v off --datasteward ${datasteward} -s ${species} ${fq[0]}
        petasuite --compress ${encrypt ? '--encrypt' : ''} -m lossless -v off --datasteward ${datasteward} -s ${species} ${fq[1]}
    """

}

process petageneCompressBAM {

    input:
        tuple val(meta), path(bam)
        val species
        val encrypt
        val datasteward

    output:
        tuple val(meta), path("*.fasterq")

    cpus 24
    
    script:
    """
        source /etc/profile.d/modules.sh
        module load petagene/protect_1.3.11
        petasuite --compress ${encrypt ? '--encrypt' : ''} -m lossless -v off --datasteward ${datasteward} -s ${species} ${fq[0]}
        petasuite --compress ${encrypt ? '--encrypt' : ''} -m lossless -v off --datasteward ${datasteward} -s ${species} ${fq[1]}
    """

}


process petageneExpandFasterq {

    input:
        tuple val(meta), path(fq)
        val species
        val datasteward

    output:
        tuple val(meta), path("*.fastq.gz")
    
    cpus 24

    script:
    """
        source /etc/profile.d/modules.sh
        module load petagene/protect_1.3.11
        petasuite --decompress -m lossless -v off --datasteward ${datasteward} -s ${species} ${fq[0]}
        petasuite --decompress -m lossless -v off --datasteward ${datasteward} -s ${species} ${fq[1]}
    """

}