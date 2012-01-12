function die()
{
    echo "${@}"
    exit 1
}

function make_old()
{
  for i in $* ; do
    if [[ ( -e $i ) || ( -h $i ) ]]; then
      echo "${i} has been renamed to ${i}.old"
      mv "${i}" "${i}.old.`date +%Y-%m-%d--%H-%M-%S`" || die "Could not move ${i} to ${i}.old"
    fi
  done
}

function rm_link()
{
  rm -f $1
  ln -s $2 $1 || die "Could not symlink: ${1}"
}

# prompt
# read -p "Enter:" var
