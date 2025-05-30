#!/usr/bin/env nextflow

params.input = null
params.chunkSize = 1

process foo {
    debug true

    input:
    stdin()

    script:
    "cat -"
}

workflow {
    channel.fromPath(params.input)
        | splitFasta(by: params.chunkSize)
        | foo
}
