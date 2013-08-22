DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

FILES=( ".bash" ".bashrc" ".gemrc" ".gvimrc" ".tmux.conf" ".vimrc" ".vim" ".zshrc")

for FILE in ${FILES[@]}; do
  SOURCE="$DIR/$FILE"
  TARGET="$HOME/$FILE"

  if [ -d "${TARGET}" ] ; then
    echo "${FILE} exists, moving to ${FILE}.old"
    mv -f $TARGET $TARGET.old
  else
    if [ -f "${TARGET}" ]; then
      echo "${FILE} exists, moving to ${FILE}.old"
      mv -f $TARGET $TARGET.old
    else
      exit 1
    fi
  fi
  echo
  echo "Symlinking $SOURCE to $TARGET"
  ln -s $SOURCE $TARGET
  echo
done
