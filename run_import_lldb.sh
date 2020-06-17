#!/bin/bash

export PYTHONPATH=$(lldb -P):$PYTHONPATH
python -c "import lldb"
