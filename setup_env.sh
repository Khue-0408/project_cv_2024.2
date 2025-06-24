#!/bin/bash

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "Creating .env file from template..."
    cp .env.template .env
    echo "Please edit the .env file with your specific paths"
else
    echo ".env file already exists"
fi

# Source the environment variables
set -a
source .env
set +a

# Validate required paths
echo "Validating environment setup..."
required_vars=("DATASET_ROOT" "PRETRAINED_MODELS" "MAE_PRETRAINED_PATH" "RABIFPN_PRETRAINED_PATH")
missing_vars=0

for var in "${required_vars[@]}"; do
    if [ -z "${!var}" ]; then
        echo "Error: $var is not set in .env file"
        missing_vars=1
    elif [ ! -d "${!var}" ] && [[ ! "${!var}" == */last.pth ]] && [[ ! "${!var}" == */mae_pretrain_vit_base.pth ]]; then
        echo "Warning: Directory $var (${!var}) does not exist"
    fi
done

if [ $missing_vars -eq 1 ]; then
    echo "Please set all required variables in .env file"
    exit 1
fi

echo "Environment setup completed"