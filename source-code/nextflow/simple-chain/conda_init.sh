# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/vsc-hard-mounts/leuven-data/301/vsc30140/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/vsc-hard-mounts/leuven-data/301/vsc30140/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/vsc-hard-mounts/leuven-data/301/vsc30140/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/vsc-hard-mounts/leuven-data/301/vsc30140/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/vsc-hard-mounts/leuven-data/301/vsc30140/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/vsc-hard-mounts/leuven-data/301/vsc30140/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
