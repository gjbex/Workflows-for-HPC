alias module='module --redirect -r'
	module ()
	{ 
	    if [ -z "${LMOD_SH_DBG_ON+x}" ]; then
	        case "$-" in 
	            *v*x*)
	                __lmod_sh_dbg='vx'
	            ;;
	            *v*)
	                __lmod_sh_dbg='v'
	            ;;
	            *x*)
	                __lmod_sh_dbg='x'
	            ;;
	        esac;
	    fi;
	    if [ -n "${__lmod_sh_dbg:-}" ]; then
	        set +$__lmod_sh_dbg;
	        echo "Shell debugging temporarily silenced: export LMOD_SH_DBG_ON=1 for Lmod's output" 1>&2;
	    fi;
	    eval "$($LMOD_CMD shell "$@")" && eval "$(${LMOD_SETTARG_CMD:-:} -s sh)";
	    __lmod_my_status=$?;
	    if [ -n "${__lmod_sh_dbg:-}" ]; then
	        echo "Shell debugging restarted" 1>&2;
	        set -$__lmod_sh_dbg;
	    fi;
	    unset __lmod_sh_dbg;
	    return $__lmod_my_status
	}

__LMOD_REF_COUNT_MODULEPATH=/apps/leuven/etc/modules:2;/apps/leuven/rocky8/skylake/2023b/modules/all:1;/apps/leuven/rocky8/skylake/2023a/modules/all:1;/apps/leuven/rocky8/skylake/2022b/modules/all:1;/apps/leuven/rocky8/skylake/2022a/modules/all:1;/apps/leuven/rocky8/skylake/2021a/modules/all:1;/apps/leuven/rocky8/skylake/2019b/modules/all:1;/apps/leuven/rocky8/skylake/2018a/modules/all:1;/apps/leuven/common/modules/all:1;/etc/modulefiles:1;/usr/share/modulefiles:1;/usr/share/modulefiles/Linux:1;/usr/share/modulefiles/Core:1;/usr/share/lmod/lmod/modulefiles/Core:1

LOADEDMODULES=cluster/genius/login

MODULEPATH=/apps/leuven/etc/modules:/apps/leuven/rocky8/skylake/2023b/modules/all:/apps/leuven/rocky8/skylake/2023a/modules/all:/apps/leuven/rocky8/skylake/2022b/modules/all:/apps/leuven/rocky8/skylake/2022a/modules/all:/apps/leuven/rocky8/skylake/2021a/modules/all:/apps/leuven/rocky8/skylake/2019b/modules/all:/apps/leuven/rocky8/skylake/2018a/modules/all:/apps/leuven/common/modules/all:/etc/modulefiles:/usr/share/modulefiles:/usr/share/modulefiles/Linux:/usr/share/modulefiles/Core:/usr/share/lmod/lmod/modulefiles/Core

MODULEPATH_ROOT=/usr/share/modulefiles

MODULESHOME=/usr/share/lmod/lmod
