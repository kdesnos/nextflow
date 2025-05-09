#!/usr/bin/env nextflow 

params.in = "$baseDir/data/sample.fa"


/*
 * For each sequence that is sent over the 'seq' channel
 * the below task is executed
 */
process ampaTask {

    input:
    path seq

    output:
    path 'result'

    // The BASH script to be executed - for each - sequence
    script:
    """
    AMPA.pl -in=${seq} -noplot -rf=result -df=data
    """

}

workflow {
    channel.fromPath(params.in) |
            splitFasta(file:true) |
            ampaTask |
            view { it.text }
}

