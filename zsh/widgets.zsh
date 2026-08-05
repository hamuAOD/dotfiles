function auto-pair() {
  local key="$KEYS"
  local close

  case "$key" in
    '"') close='"' ;;
    "'") close="'" ;;
    '(') close=')' ;;
    '[') close=']' ;;
    '{') close='}' ;;
    ')'|']'|'}')
      if [[ ${RBUFFER[1]} == "$key" ]]; then
        zle forward-char
      else
        LBUFFER+="$key"
      fi
      return
      ;;
    *) return ;;
  esac

  if [[ ${RBUFFER[1]} == "$close" ]]; then
    zle forward-char
  else
    LBUFFER+="${key}${close}"
    CURSOR=$(( CURSOR - 1 ))
  fi
}

function backward-delete-pair() {
  local left="${LBUFFER[-1]}"
  local right="${RBUFFER[1]}"

  case "$left$right" in
    '""'|"''"|'()'|'[]'|'{}')
      LBUFFER="${LBUFFER[1,-2]}"
      RBUFFER="${RBUFFER[2,-1]}"
      ;;
    *)
      zle backward-delete-char
      ;;
  esac
}

function setup_custom_widgets() {
  zvm_define_widget auto-pair
  zvm_define_widget backward-delete-pair

  for key in '"' "'" '(' '[' '{' ')' ']' '}'; do
    zvm_bindkey viins "$key" auto-pair
  done

  zvm_bindkey viins '^?' backward-delete-pair
}

zvm_after_init_commands+=(setup_custom_widgets)
