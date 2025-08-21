process Summarize_A {
    publishDir "${projectDir}/results", mode: 'copy'

    output:
    path "summary_A.csv"

    script:
    """
    python ${projectDir}/sum_group.py \
        --input_file ${projectDir}/data/data_A.csv \
        --column_name A \
        --output_file summary_A.csv
    """
}

process Summarize_B {
    publishDir "${projectDir}/results", mode: 'copy'

    output:
    path "summary_B.csv"

    script:
    """
    python ${projectDir}/mean_group.py \
        --input_file ${projectDir}/data/data_B.csv \
        --column_name B \
        --output_file summary_B.csv
    """
}

process Summarize_C {
    publishDir "${projectDir}/results", mode: 'copy'

    output:
    path "summary_C.csv"

    script:
    """
    python ${projectDir}/sum_group.py \
        --input_file ${projectDir}/data/data_C.csv \
        --column_name C \
        --output_file summary_C.csv
    """
}

process JoinData {
    publishDir "${projectDir}/results", mode: 'copy'

    input:
    path summary_A
    path summary_B
    path summary_C

    output:
    path "summary.csv"

    script:
    """
    python ${projectDir}/join_data.py \
        --input_files $summary_A $summary_B $summary_C \
        --output_file summary.csv
    """
}

workflow {
    summaryA_channel = Summarize_A()
    summaryB_channel = Summarize_B()
    summaryC_channel = Summarize_C()
    JoinData(summaryA_channel, summaryB_channel, summaryC_channel).view()
}
