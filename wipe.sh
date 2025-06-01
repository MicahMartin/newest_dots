#!/bin/bash
# tryna get in the habit
set -euo pipefail
IFS=$'\n\t'
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
BOLD="$(tput bold)"
RESET="$(tput sgr0)"
ask_confirm() {
  local prompt="${1:-Are you sure?}"
  local answer

  while true; do
    echo -n "${YELLOW}${prompt}${RESET} [y/N] "
    read -r answer

    # Empty input defaults to “no”
    if [[ -z "$answer" ]]; then
      return 1
    fi

    case "$answer" in
      [Yy]) return 0 ;;
      [Nn]) return 1 ;;
      *)
        echo -e "${RED}Please answer y or n.${RESET}"
        ;;
    esac
  done
}

echo -e "${BOLD}${RED}⚠️ === Wiping local nvim settings === ⚠️${RESET}"
if ask_confirm "You sure about this?"; then
  echo -e "${GREEN}→ OK, wiping now...${RESET}"

  rm -rfv ~/.local/share/nvim
  rm -rfv ~/.local/state/nvim
  rm -rfv ~/.cache/nvim

  echo -e "${GREEN}✅ Outa there.${RESET}"
else
  echo -e "${BLUE}→ Aborted. No files were touched.${RESET}"
  exit 1
fi
