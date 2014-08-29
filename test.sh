containsElement () {
    local e
      for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 1; done
        return 0
      }

array=(1 3 4)
containsElement 1 "${array[@]}"
if [ $? -eq 1 ]
then
  echo "yep"
else
  echo "nope"
fi
