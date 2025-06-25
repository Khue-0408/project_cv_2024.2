# Polyp Segmentation Project

This repository contains implementation of various deep learning models for polyp segmentation, including U-Net, U-Net++, PraNet, and our novel MAE-RaBit approach.

## Demo

Check out our demo video `demo.mp4` showcasing the performance of all implemented models on various polyp segmentation tasks.

[Click here to watch the demo video](demo.mp4)

## Dataset

The dataset used in this project can be downloaded from [Kaggle ComVisDataPrime](https://www.kaggle.com/datasets/nguynvngckhu/comvisdataprime). It contains 5 benchmark datasets for Polyp Segmentation:
- Kvasir-SEG
- CVC-ClinicDB
- CVC-ColonDB
- ETIS-LaribPolypDB
- CVC-300

## Pre-trained Models

### Traditional Models
Download the pre-trained weights for U-Net, U-Net++, and PraNet from [Google Drive - Traditional Models](https://drive.google.com/drive/folders/1HUs984wjC4P-F-y3R-kqASUNoGLFpdQ9)

### MAE-RaBit Models
Download the pre-trained MAE Encoder and RaBiFPN weights from [Google Drive - MAE-RaBit](https://drive.google.com/drive/folders/1gLY3ylcQzSOvYCeeXmfpz2ZtCbk1y39x)

## Configuration

Before running the models, you need to set up your local paths in the configuration files:

1. Create a `.env` file in the root directory with the following content:
```
DATASET_ROOT=/path/to/your/dataset
PRETRAINED_MODELS=/path/to/pretrained/models
```

2. For MAE-RaBit model, update the following configuration files:
- `MAE_RABIT/pretrain/configs/pretrain.yaml`: Update dataset paths
- `MAE_RABIT/downstream/configs/mae/*/mae_base_meta.py`: Update model and dataset paths

## Project Structure

```
.
├── demo.mp4                    # Demo video of the models in action
├── PraNet-NoDSV.ipynb         # PraNet implementation without Deep Supervision
├── pranet.ipynb               # Original PraNet implementation notebook
├── unet-cv.ipynb              # U-Net implementation notebook
├── unetplusplus.ipynb         # U-Net++ implementation notebook
└── MAE_RABIT/                 # MAE-RaBit implementation
    ├── downstream/            # Downstream tasks implementation
    │   ├── configs/          # Model configurations
    │   ├── mmseg_custom/     # Custom segmentation models
    │   └── multitask/        # Multi-task learning implementation
    └── pretrain/             # Pre-training implementation
        ├── configs/          # Pre-training configurations
        ├── dataset/          # Dataset handling
        ├── model/            # Model architectures
        └── trainer/          # Training utilities
```

## How to Run

### 1. Traditional Models (U-Net, U-Net++, PraNet)

These models can be run directly through their respective Jupyter notebooks:
- `unet-cv.ipynb`: Implementation of U-Net model
- `unetplusplus.ipynb`: Implementation of U-Net++ model
- `pranet.ipynb`: Implementation of PraNet with deep supervision
- `PraNet-NoDSV.ipynb`: Implementation of PraNet without deep supervision

### 2. MAE-RaBit Model

#### Environment Setup
1. Create a Python virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

#### Pre-training Phase
1. Navigate to the pretrain directory:
```bash
cd MAE_RABIT/pretrain
```

2. Install requirements:
```bash
pip install -r requirements.txt
```

3. Update configurations:
- Edit `configs/pretrain.yaml` with your dataset paths
- Set environment variables in `.env` file

4. Run pre-training:
```bash
bash scripts/run_pretrain.sh
```

#### Downstream Tasks
1. Navigate to the downstream directory:
```bash
cd MAE_RABIT/downstream
```

2. Install requirements:
```bash
bash install_requirements.sh
```

3. Update configurations:
- Edit config files in `configs/mae/` with your paths
- Ensure .env file is properly configured

4. For single-task training:
```bash
bash train_damage.sh
```

5. For multi-task training:
```bash
bash train_multitask.sh
```

## Model Descriptions

1. **U-Net**: A classical encoder-decoder architecture with skip connections, effective for medical image segmentation.

2. **U-Net++**: An enhanced version of U-Net with nested and dense skip connections, providing better feature representation.

3. **PraNet**: Parallel Reverse Attention Network, specifically designed for polyp segmentation with two versions:
   - With Deep Supervision (`pranet.ipynb`)
   - Without Deep Supervision (`PraNet-NoDSV.ipynb`)

4. **MAE-RaBit**: Our novel approach combining:
   - MAE (Masked Autoencoder) for self-supervised pre-training
   - RaBiFPN (Rapid and Balanced Feature Pyramid Network) for efficient feature fusion
   - Multi-task learning capabilities for improved segmentation
