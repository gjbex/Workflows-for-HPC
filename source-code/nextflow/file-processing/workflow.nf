params.input_dir = "input"
params.output_dir = "output"

process ProcessFile {
    label 'array_job'
    publishDir "${projectDir}/${params.output_dir}"

    input:
    path input_file

    output:
    path "result_${input_file.baseName.substring(5)}.txt"

    script:
    """
    python ${projectDir}/process.py \
        --input_file $input_file \
        --output_file "result_${input_file.baseName.substring(5)}.txt"
    """
}

workflow {
    file_channel = channel.fromPath("${projectDir}/${params.input_dir}/data_*.dat")
    ProcessFile(file_channel).view()
}
