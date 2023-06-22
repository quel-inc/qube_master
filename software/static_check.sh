#!/bin/bash

set -eu

echo "[isort]"
isort quel_clock_master consoleapps examples
echo "[black]"
black quel_clock_master consoleapps examples
echo "[pflake8]"
pflake8 quel_clock_master consoleapps examples
echo "[mypy]"
mypy --check-untyped-defs quel_clock_master consoleapps examples
