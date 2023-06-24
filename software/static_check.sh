#!/bin/bash

set -eu

echo "[isort]"
isort quel_clock_master consoleapps
echo "[black]"
black quel_clock_master consoleapps
echo "[pflake8]"
pflake8 quel_clock_master consoleapps
echo "[mypy]"
mypy --check-untyped-defs quel_clock_master consoleapps


# TODO: examples are temporarily excluded. Don't forget add it again.
