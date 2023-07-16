# This file should not be run directly; it is to be sourced from setup.sh.

platform="$(uname)"

case "${platform}" in
    Linux)
      version="$(lsb_release -rs)"
      codename="$(lsb_release -cs)"
      ;;
    Darwin)
      # TODO(bcox): What are the equivalents of lsb_release on Mac?
      version="11" # nope
      codename="monterey" # nope
      ;;
    *)
      version="1"
      codename="generic"
      ;;
esac

candidates=( \
    "./setup-${platform}.sh" \
    "./setup-${platform}_${codename}.sh" \
    "./setup-${platform}_${codename}_${version}.sh" \
)

for candidate in "${candidates[@]}"; do
    if [[ -f "${candidate}" ]]; then
        echo "Loading ${candidate}..."
        source "${candidate}"
    fi
done
