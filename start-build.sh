#!/usr/bin/env bash
startbuild_script_path="$( cd -P "$( dirname "$(readlink -f "$0")" )" && pwd )"
startbuild_work_dir="${startbuild_script_path}/build_work"
startbuild_alteriso2_branch="alteriso-2"
startbuild_alteriso3_branch="dev-stable"

startbuild_script_path="${startbuild_script_path%/}"
startbuild_work_dir="${startbuild_work_dir%/}"

msg_error() {
    echo -e "Error: ${@}" >&2
}


_help () {
    echo "usage ${0} [option] [channel]"
    echo
    echo "AlterISO Easy builder"
    echo "Get AlterISO and start build"
    echo 
    echo " General options:"
    echo "    -o [option]         Specify build options"
    echo "    -x                  Enable bash debug"
    echo "    -h                  This help message"
}


while getopts "o:xh" arg; do
  case ${arg} in
        o)
            OPTIONS="${OPTARG}"
            ;;
        x)
            set -xv
            ;;
        h)
            _help
            shift 1
            exit 0
            ;;
  esac
done

shift $((OPTIND - 1))
channel_name="${1}"


mkdir -p "${startbuild_work_dir}"
if [[ -n "$(ls "${startbuild_work_dir}" 2> /dev/null )" ]]; then
    msg_error "Working directory is not empty"
    exit 1
fi

git clone "https://github.com/FascodeNet/alterlinux.git" "${startbuild_work_dir}"
cp -r "${startbuild_script_path}/"*".add" "${startbuild_work_dir}/channels"

if [[ "$(cat "${startbuild_work_dir}/channels/${channel_name}.add/alteriso" 2> /dev/null)" = "alteriso=3.0" ]] || [[ "$(cat "${startbuild_work_dir}/channels/${channel_name}/alteriso" 2> /dev/null)" = "alteriso=3.0" ]]; then
    (
        cd "${startbuild_work_dir}"
        git checkout "${startbuild_alteriso3_branch}"
    )
else
    (
        cd "${startbuild_work_dir}"
        git checkout "${startbuild_alteriso2_branch}"
    )
fi

sudo "${startbuild_work_dir}/build.sh" -w "${startbuild_work_dir}/work" -o "${startbuild_script_path}/out" ${OPTIONS} ${channel_name}

sudo rm -rf "${startbuild_work_dir}"
