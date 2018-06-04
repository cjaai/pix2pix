#pix2pix-tensorflow环境搭建

#開発環境：
AMD Ryzen 7 1700 Eight-Core Processor 3.00GHz, 
NVIDIA GeForce GTX 1070
Windows 10(64 bit),
Visual studio 2015 (v140)
GPU, cuda_9.0, cudnn-9.0
Anaconda,
Python35,
TensorFlow,
Pix2pix

参照					
https://www.kunihikokaneko.com/dblab/tensorflow/pix2pix.html					
https://affinelayer.com/pix2pix/					
https://github.com/affinelayer/pix2pix-tensorflow


#手順										
## １．Visual studio 2015 (v140)										
										
## ２．cuda_9.0, cudnn-9.0のインストール、cudnnのdll,lib,includeフィアルをcudaへCOPY																				
## ３．Anaconda のインストール										
										
## ４．Anaconda での新しい Python 環境の作成										
Anaconda prompt										
conda create -n Python35TensorFlowGPU python=3.5 anaconda										
activate Python35TensorFlowGPU										
										
## ５．tensorflow-gpu パッケージをインストール (GPUを使用）										
activate Python35TensorFlowGPU										
pip install --ignore-installed --upgrade tensorflow-gpu										
										
## ６．pix2pixのインストール										
https://www.imagemagick.org/script/download.php#windows										
										
ImageMagick-7.0.7-32-Q8-x64-dll.exe										
										
activate Python35TensorFlowGPU										
										
## ７．データをDownloadする										
python tools\download-dataset.py facades										
train val test 推荐比例是8:1:1										
										
## ８．モデルのトレーニングを行う操										
										
Anaconda prompt										
CD D:\pix2pix-tensorflow-master										

```python
python pix2pix.py --mode train --output_dir facades_train --max_epochs 200 --input_dir facades\train  --which_direction BtoA		
```

```python										
python pix2pix.py --mode test --output_dir facades_test --input_dir facades/val --checkpoint facades_train
```

#概要図

<img src="attach:1.png">

