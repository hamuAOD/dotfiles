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

zle -N auto-pair

for key in '"' "'" '(' '[' '{' ')' ']' '}'; do
  bindkey -M viins "$key" auto-pair
done

function backward-delete-pair() {
local left="${LBUFFER[-1]}"
local right="${RBUFFER[1]}"

if [[ "$left$right" == '""' ||
      "$left$right" == "''" ||
      "$left$right" == '()' ||
      "$left$right" == '[]' ||
      "$left$right" == '{}' ]]; then
  LBUFFER="${LBUFFER[1,-2]}"
  RBUFFER="${RBUFFER[2,-1]}"
else
  zle backward-delete-char
fi
}

zle -N backward-delete-pair
bindkey -M viins '^?' backward-delete-pair
