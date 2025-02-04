params.movie_delay = 50
params.movie_loop = 0

process CreatePlot {
    input:
    val beta

    output:
    path "plot_${beta}.png"

    script:
    """
    python ${projectDir}/create_plot.py --beta ${beta} --output_dir .
    """
}

process ConvertPng2Gif {
    input:
    path png_file

    output:
    path "plot_${png_file.baseName.substring(5)}.gif"

    script:
    """
    convert ${png_file} "plot_${png_file.baseName.substring(5)}.gif"
    """
}

process Convert2Movie {
    publishDir "${projectDir}", mode: 'copy'

    input:
    path plots

    output:
    path "movie.gif"

    script:
    """
    sorted_plots=\$(echo $plots | xargs -n1 | sort | xargs)
    convert -delay ${params.movie_delay} -loop ${params.movie_loop} \$sorted_plots movie.gif
    """
}

workflow {
    beta_channel = channel.of(0..100).map {v -> String.format('%.3f', v/100.0)}
    png_channel = CreatePlot(beta_channel)
    gif_channel = ConvertPng2Gif(png_channel).collect(sort: true)
    Convert2Movie(gif_channel)
}
