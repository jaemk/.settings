#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Error: project name required"
    exit 1
fi

name="$1"
cap="$(tr '[:lower:]' '[:upper:]' <<< ${name:0:1})${name:1}"

echo "Creating dune project: $name"
mkdir "$name"
cd "$name"


git init
cat > .gitignore <<EOF
_build
.merlin
EOF


echo " * creating lib dir: $name/"
mkdir "$name"
cat > "$name/dune" <<EOF
(library
 (public_name $name)
 (libraries batteries))
EOF

cat > "$name/$name.opam" <<EOF
opam-version: "2.0"
name: "$name"
version: "0.1.0"
synopsis: "Thing"
maintainer: "James Kominick <james@kominick.com>"
authors: "James Kominick <james@kominick.com>"
license: "MIT"
homepage: "example.com"
depends: ["batteries" {>= "2"}]
build: ["dune" "build" "-p" name]
EOF

cat > "$name/core.ml" <<EOF
let hello () =
  print_endline "hello!"
EOF


echo " * creating bin/"
mkdir "bin"
cat > bin/dune <<EOF
(executables
 (names main)
 (libraries $name))
EOF

cat > bin/main.ml <<EOF
let () =
  $cap.Core.hello ()
EOF


echo " * creating test/"
mkdir "test"
cat > "test/dune" <<EOF
(tests
 (names test)
 (libraries $name ounit))
EOF

cat > "test/test.ml" <<EOF
open OUnit2


let suite =
    "suite">:::
        ["works">:: (fun _ -> assert_equal 100 100)]

let () =
    run_test_tt_main suite
EOF
