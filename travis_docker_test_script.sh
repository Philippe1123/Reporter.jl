#!/bin/bash

JULIAVER=$1                     # the first and only argument to the script is the version
JULIABIN=/test/julia-$JULIAVER/bin/julia

## install the image (when necessary)
/test/install-julia.sh $JULIAVER

cd /mnt && if [[ -a .git/shallow ]]; then git fetch --unshallow; fi

# run tests
PYTHON=""
PYTHONPATH=""
$JULIABIN -e "using Pkg; Pkg.test(; coverage=true)"
