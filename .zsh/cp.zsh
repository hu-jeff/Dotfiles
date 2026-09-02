function crun {
  if [[ -z "$1" ]]; then
    echo "No file specified."
    return 1
  fi

  echo "Compiling $1.cc"

  if g++ -std=c++20 -Wall -O2 -Wextra -Wno-unused-result "$1".cc -o "$1"; then
    ./"$1"
    echo
    rm "$1"
  fi
}

function cdebug {
  if [[ -z "$1" ]]; then
    echo "No file specified."
    return 1
  fi

  echo "Compiling $1.cc"

  if g++ -std=c++20 -Wall -fsanitize=address -O0 -g "$1".cc -o "$1"; then
    lldb "$1"
    echo
    rm "$1"
  fi
}

function ccompile {
  if [[ -z "$1" ]]; then
    echo "No file specified."
    return 1
  fi

  echo "Compiling $1.cc"

  if g++ -std=c++20 -Wall -O0 -g -Wextra -Wno-unused-result "$1".cc -o "$1"; then
    echo
  fi
}

