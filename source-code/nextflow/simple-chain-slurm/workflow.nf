// parameters for creating the environment
params.environment_name = 'workflows_for_hpc'
params.conda_init_file = 'conda_init.sh'

// parameters for the preprocess step
params.nr_points = 1000
params.points_file = 'points.txt'

// parameters for the process step
params.nr_processes = 2
params.batch_size = 250
params.distances_file = 'distances.txt'

// parameters for the postprocess step
params.nr_bins = 20
params.distribution_file = 'distribution.txt'

process CreateEnvironment {
    script
    """
    source ${projectDir}/${params.conda_init_file}
    conda activate ${params.environment_name}
    if [[ ! $status ]] then;
        conda env create -f ${projectDir}/conda_environment.yml
    fi
    """
}

process Preprocess {
    publishDir "${projectDir}/results", mode: 'copy'

    // Job parameters for Slurm executor
    clusterOptions '--cluster=wice --account=lpt2_sysadmin'
    cpus 1
    time '5min'

    input:
    val nr_points

    output:
    path "${params.points_file}"

    script:
    """
    python ${projectDir}/preprocess.py \
        --nr_points ${nr_points} \
        --points_file ${params.points_file}
    """
}

process Process {
    publishDir "${projectDir}/results", mode: 'copy'

    // Job parameters for Slurm executor
    clusterOptions '--cluster=wice --account=lpt2_sysadmin'
    cpus params.nr_processes
    time '15min'
    
    input:
    path points_file

    output:
    path "${params.distances_file}"

    script:
    """
    source ${projectDir}/conda_init_file
    conda activate ${params.conda_environment}
    python ${projectDir}/process.py \
        --points_file $points_file \
        --nr_processes ${params.nr_processes} \
        --batch_size ${params.batch_size} \
        --distances_file ${params.distances_file}
    """
}

process Postprocess {
    publishDir "${projectDir}/results", mode: 'copy'

    // Job parameters for Slurm executor
    clusterOptions '--cluster=wice --account=lpt2_sysadmin'
    cpus 1
    time '5min'

    input:
    path distances_file

    output:
    path "${params.distribution_file}"

    script:
    """
    python ${projectDir}/postprocess.py \
        --distances_file $distances_file \
        --nr_bins ${params.nr_bins} \
        --distribution_file ${params.distribution_file}
    """
}

workflow {
    parameter_channel = channel.of(params.nr_points)
    preprocess_channel = Preprocess(parameter_channel)
    process_channel = Process(preprocess_channel)
    Postprocess(process_channel).view()
}
