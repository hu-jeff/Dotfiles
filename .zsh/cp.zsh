# For competitive programming

function crun {
  if [[ -z "$1" ]]; then
    echo "No file specified."
    return 1
  fi

  echo "Compiling $1.cc"

  if g++ -std=c++20 -Wall -Wextra -Wno-unused-result "$1".cc -o "$1"; then
    ./"$1"
    rm "$1"
  fi
}

