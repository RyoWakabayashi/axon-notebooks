#!/bin/bash

/app/bin/livebook start &

jupyter lab --allow-root --ip=0.0.0.0 --no-browser --notebook-dir=/home/livebook &

wait -n

exit $?
