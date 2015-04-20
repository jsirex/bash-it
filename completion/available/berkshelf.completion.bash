__berkshelf_goals () {
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  commands="apply contingent cookbook help info init install list outdated package search shelf show update upload vendor verify version viz"

  if [ $COMP_CWORD == 1 ]
  then
    COMPREPLY=($(compgen -W "${commands}" -- ${cur}))
    return 0
  fi

  if [ $COMP_CWORD == 2 ]
  then
    case "$prev" in
      help)
        COMPREPLY=( $(compgen -W "${commands}" -- ${cur} ))
        return 0
        ;;

      *)
        ;;
    esac
  fi
}

complete -F __berkshelf_goals berks

