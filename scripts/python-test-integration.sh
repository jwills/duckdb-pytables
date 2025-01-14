#!/bin/bash

set -e;

if [ -z "$GOOGLE_APPLICATION_CREDENTIALS" ]; then
   echo "Please specify a path to your Google credentials file via GOOGLE_APPLICATION_CREDENTIALS";
   exit 1;
fi
   
echo "Entering python land..."
cd pythonpkgs/

echo "Checking that we have a python..."
which python3.9

# Create a virtual environment
echo "Creating our virtual environment"
python3.9 -m venv myenv
echo "Sourcing the env"
source myenv/bin/activate

cd ducktables;

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install dependencies
echo "Installing dependencies"
pip install -r requirements.txt

cd ../../

export PYTHONPATH=pythonpkgs/ducktables
./build/release/test/unittest --test-dir . "[ducktables-integration]"
