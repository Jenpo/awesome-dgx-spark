# Awesome DGX Spark [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> A curated list of awesome tools, guides, playbooks, and resources for the [NVIDIA DGX Spark](https://www.nvidia.com/en-us/products/workstations/dgx-spark/) — the GB10 Grace Blackwell personal AI supercomputer.

DGX Spark packs a GB10 Grace Blackwell Superchip (SM 12.1 / sm_121) with 128 GB of unified CPU+GPU memory into a desktop form factor. Two units can be linked over 200 Gb/s networking to run larger models. This list collects community projects for setting it up, serving models, fine-tuning, benchmarking, and operating it day to day.

**Platform essentials:** `aarch64` · `CUDA 13.x` · `sm_121` · `128 GB unified memory` · `200 Gb/s NVLink-C2C`

## Contents

- [Official](#official)
- [Setup & Configuration](#setup--configuration)
- [Inference & Serving](#inference--serving)
  - [vLLM](#vllm)
  - [llama.cpp](#llamacpp)
  - [SGLang](#sglang)
  - [Other Engines](#other-engines)
- [Fine-tuning](#fine-tuning)
- [Quantization & NVFP4](#quantization--nvfp4)
- [Models & Benchmarks](#models--benchmarks)
- [Multi-node](#multi-node)
- [Image & Media Generation](#image--media-generation)
- [Audio & Speech](#audio--speech)
- [Remote Access & Desktop](#remote-access--desktop)
- [Tools & Monitoring](#tools--monitoring)
- [Operating Systems & Containers](#operating-systems--containers)
- [Community & Resource Collections](#community--resource-collections)

## Official

- [NVIDIA/dgx-spark-playbooks](https://github.com/NVIDIA/dgx-spark-playbooks) - Official step-by-step playbooks for AI/ML workloads on DGX Spark: vLLM, SGLang, Ollama, unsloth, ComfyUI, FLUX, multi-node, and more.

## Setup & Configuration

- [GuigsEvt/dgx_spark_config](https://github.com/GuigsEvt/dgx_spark_config) - Complete end-to-end setup for maximizing DGX Spark compute for AI workloads.
- [JetBrains-Hardware/spark-setup](https://github.com/JetBrains-Hardware/spark-setup) - DGX Spark setup and vLLM deployment scripts for Qwen, GPT-OSS, and Nemotron 3.
- [natolambert/dgx-spark-setup](https://github.com/natolambert/dgx-spark-setup) - Setup guide focused on ML training (GB10 Blackwell, CUDA 13, aarch64).
- [raphaelamorim/spark-playbooks](https://github.com/raphaelamorim/spark-playbooks) - Community playbooks and recipes for deploying AI models and workloads on DGX Spark.
- [Sggin1/DGX-SPARK](https://github.com/Sggin1/DGX-SPARK) - Research and tests with containers and benchmarks for GB10 (SM 12.1).

## Inference & Serving

### vLLM

- [Avarok-Cybersecurity/dgx-vllm](https://github.com/Avarok-Cybersecurity/dgx-vllm) - Optimized vLLM Docker image dedicated to DGX Spark.
- [eelbaz/dgx-spark-vllm-setup](https://github.com/eelbaz/dgx-spark-vllm-setup) - One-command vLLM installation for DGX Spark with Blackwell GB10 GPUs (sm_121 architecture).
- [eugr/spark-vllm-docker](https://github.com/eugr/spark-vllm-docker) - Docker configuration for running vLLM on dual DGX Sparks with Ray/PyTorch distributed mode.
- [gyohng/spark-vllm-compose](https://github.com/gyohng/spark-vllm-compose) - Run vLLM on DGX Spark with Docker Compose.
- [jleighfields/vllm-dgx-spark](https://github.com/jleighfields/vllm-dgx-spark) - Tools for hosting vLLM on DGX Spark.
- [mark-ramsey-ri/vllm-dgx-spark](https://github.com/mark-ramsey-ri/vllm-dgx-spark) - Run vLLM on 1-to-N DGX Spark servers (single Spark, 2 via direct cable, or 3+ via switched fabric) to serve or benchmark LLMs.
- [spark-arena/sparkrun](https://github.com/spark-arena/sparkrun) - Launch, manage, and stop LLM inference workloads on DGX Spark systems.

### llama.cpp

- [croll83/llama.cpp-dgx](https://github.com/croll83/llama.cpp-dgx) - Fork of llama.cpp optimized for DGX Spark with NVFP4, TurboQuant, and DFlash MTP.
- [DandinPower/llama.cpp_bench](https://github.com/DandinPower/llama.cpp_bench) - Benchmarking scripts and performance reports for llama.cpp on DGX Spark.
- [shamily/gemma4-llama-dgx-spark](https://github.com/shamily/gemma4-llama-dgx-spark) - Dockerized Gemma 4 inference with llama.cpp for GB10 (ARM64 + CUDA 13).
- [ZengboJamesWang/Qwen3.5-35B-A3B-openclaw-dgx-spark](https://github.com/ZengboJamesWang/Qwen3.5-35B-A3B-openclaw-dgx-spark) - Run Qwen3.5-35B-A3B with llama.cpp and openclaw on DGX Spark (GB10).

### SGLang

- [BTankut/dgx-spark-sglang-moe-configs](https://github.com/BTankut/dgx-spark-sglang-moe-configs) - Optimized SGLang MoE kernel configs for DGX Spark (GLM-4.7-FP8).
- [mark-ramsey-ri/sglang-dgx-spark](https://github.com/mark-ramsey-ri/sglang-dgx-spark) - Run SGLang on 1-to-N DGX Spark servers.
- [ridanuae/dgx-spark-sglang-qwen35](https://github.com/ridanuae/dgx-spark-sglang-qwen35) - Run Qwen3.5-35B on DGX Spark with SGLang (Docker image + guide).

### Other Engines

- [antirez/ds4](https://github.com/antirez/ds4) - DeepSeek 4 Flash local inference engine in C with a dedicated `cuda-spark` build target and published GB10 benchmarks.
- [calico88x/DGX-Model-Manager](https://github.com/calico88x/DGX-Model-Manager) - Single-file web UI for managing Ollama, SGLang, vLLM, llama.cpp, LocalAI, and ComfyUI on DGX Spark.
- [dataforgex/dgx_spark](https://github.com/dataforgex/dgx_spark) - Multi-model LLM serving with vLLM, web UI, and tool calling.
- [wshobson/minimax-dgx-spark](https://github.com/wshobson/minimax-dgx-spark) - MiniMax M2 inference server for DGX Spark.

## Fine-tuning

- [alicankiraz1/DGX-Spark-Asus-Ascent-Nvidia-GB10-SFT-Finetuner](https://github.com/alicankiraz1/DGX-Spark-Asus-Ascent-Nvidia-GB10-SFT-Finetuner) - No-code SFT fine-tuning tool for DGX Spark.
- [kreuzhofer/dgx-spark-unsloth-qwen3.5-training](https://github.com/kreuzhofer/dgx-spark-unsloth-qwen3.5-training) - BF16 LoRA fine-tuning of Qwen3.5-35B on a single DGX Spark with unsloth.
- [MoHussein197/dgx-spark-finetune-llm](https://github.com/MoHussein197/dgx-spark-finetune-llm) - Fine-tune LLMs with LoRA adapters and quantization on DGX Spark.
- [riomus/dgx-spark-unsloth](https://github.com/riomus/dgx-spark-unsloth) - Unsloth usage on DGX Spark using UV and NVIDIA's Docker image.
- [waybarrios/dgx-spark-finetune-llm](https://github.com/waybarrios/dgx-spark-finetune-llm) - LLM fine-tuning with LoRA + NVFP4/MXFP8 on DGX Spark.

## Quantization & NVFP4

GB10's Blackwell architecture natively supports NVFP4 (4-bit floating point), enabling higher throughput while retaining quality over INT4.

- [AEON-7/Gemma-4-31B-DECKARD-HERETIC-Uncensored-NVFP4](https://github.com/AEON-7/Gemma-4-31B-DECKARD-HERETIC-Uncensored-NVFP4) - NVFP4-quantized Gemma 4 31B for DGX Spark with deployment guide.
- [AEON-7/Qwen3.6-27B-AEON-Ultimate-Uncensored-DFlash](https://github.com/AEON-7/Qwen3.6-27B-AEON-Ultimate-Uncensored-DFlash) - NVFP4-quantized Qwen3.6-27B for DGX Spark.
- [JungkwanBan/SPARK_Qwen3.5-122B-A10B-NVFP4](https://github.com/JungkwanBan/SPARK_Qwen3.5-122B-A10B-NVFP4) - vLLM + Qwen3.5-122B-A10B NVFP4 on DGX Spark with Docker build.
- [Logos-Flux/optimized-CUDA-GB10](https://github.com/Logos-Flux/optimized-CUDA-GB10) - Optimized CUDA kernels for NVIDIA GB10 Blackwell (sm_121).
- [mudler/apex-quant](https://github.com/mudler/apex-quant) - Adaptive precision for expert models: MoE-aware mixed-precision quantization.

## Models & Benchmarks

- [adadrag/qwen3.5-dgx-spark](https://github.com/adadrag/qwen3.5-dgx-spark) - Complete guide to running Qwen3.5-35B-A3B on DGX Spark (GB10) with vLLM: installation, benchmarks, vision features, and troubleshooting.
- [albond/DGX_Spark_Qwen3.5-122B-A10B-AR-INT4](https://github.com/albond/DGX_Spark_Qwen3.5-122B-A10B-AR-INT4) - Qwen3.5-122B-A10B on DGX Spark, tuned from 28.3 to 51 tok/s (+80%).
- [bigs/deepseek-v4-flash-dgx-spark](https://github.com/bigs/deepseek-v4-flash-dgx-spark) - Investigation of DeepSeek-V4-Flash on a single DGX Spark.
- [Kleybrink/dgx-spark-bench](https://github.com/Kleybrink/dgx-spark-bench) - Benchmarking framework measuring throughput, latency, VRAM, and accuracy with LLM-as-a-Judge.
- [lmxxf/deepseek-v4-deployment-on-dgx-spark](https://github.com/lmxxf/deepseek-v4-deployment-on-dgx-spark) - DeepSeek V4 deployment guide for DGX Spark.
- [martimramos/dgx-spark-ml-guide](https://github.com/martimramos/dgx-spark-ml-guide) - Definitive guide to running PyTorch and ML workloads on DGX Spark.
- [Memoriant/dgx-spark-kv-cache-benchmark](https://github.com/Memoriant/dgx-spark-kv-cache-benchmark) - KV cache quantization benchmarks on GB10.
- [nabe2030/dense-27b-31b-dgx-spark](https://github.com/nabe2030/dense-27b-31b-dgx-spark) - Benchmark of Qwen 3.5/3.6-27B and Gemma 4-31B on DGX Spark.
- [nabe2030/gemma4-vs-qwen35-dgx-spark](https://github.com/nabe2030/gemma4-vs-qwen35-dgx-spark) - Gemma 4 vs Qwen 3.5 MoE benchmark with llama.cpp.
- [rossingram/Spark-DGX-Benchmark](https://github.com/rossingram/Spark-DGX-Benchmark) - Comprehensive benchmark script testing compute, memory, diffusion, and LLM throughput on DGX Spark.
- [wengzhiwen/DeepSeek-OCR-DGX-Spark](https://github.com/wengzhiwen/DeepSeek-OCR-DGX-Spark) - DeepSeek OCR optimized for DGX Spark (ARM64 + CUDA 13.0).

## Multi-node

Two DGX Spark units can be directly cabled together via 200 Gb/s QSFP for doubled memory and compute.

- [ArgentAIOS/dgx-spark-cluster](https://github.com/ArgentAIOS/dgx-spark-cluster) - Complete 2-node setup with EXO inference, NCCL tuning, NVMe-TCP storage, and 200 Gb/s fabric.
- [bkrabach/dgx-spark-cluster](https://github.com/bkrabach/dgx-spark-cluster) - Dual-node LLM cluster setup kit with Ray + vLLM.
- [cesarb-ai/dgx-spark-cluster-compass](https://github.com/cesarb-ai/dgx-spark-cluster-compass) - Practical guide to clustering DGX Spark nodes for multi-node vLLM inference.
- [makiisthenes/dgx-spark-multinode-vllm-ray](https://github.com/makiisthenes/dgx-spark-multinode-vllm-ray) - Dual-DGX Spark vLLM deployment with NVIDIA vLLM 26.04, Ray, and 200 GbE QSFP.
- [pfn/spark-vllm-compose](https://github.com/pfn/spark-vllm-compose) - Multi-node Docker Compose configuration for vLLM on DGX Spark.

## Image & Media Generation

- [dr-vij/Trellis2-DGX-Spark-Docker](https://github.com/dr-vij/Trellis2-DGX-Spark-Docker) - Trellis2 3D generation on DGX Spark.
- [ecarmen16/SparkyUI](https://github.com/ecarmen16/SparkyUI) - ComfyUI + SageAttention for DGX Spark (ARM64, sm_121).
- [luix93/DGX-Spark-ComfyUI](https://github.com/luix93/DGX-Spark-ComfyUI) - Optimized setup for running ComfyUI on DGX Spark.
- [mmartial/ComfyUI-Nvidia-Docker](https://github.com/mmartial/ComfyUI-Nvidia-Docker) - ComfyUI in Docker with DGX Spark build notes and Blackwell NVFP4 support.
- [phaserblast/ComfyUI-DGXSparkSafetensorsLoader](https://github.com/phaserblast/ComfyUI-DGXSparkSafetensorsLoader) - Fast zero-copy model loader for ComfyUI on DGX Spark leveraging unified memory.
- [raibid-entertainment/dgx-pixels](https://github.com/raibid-entertainment/dgx-pixels) - Stable Diffusion + LoRA pipeline for pixel art generation on DGX Spark.

## Audio & Speech

- [Logos-Flux/spark-voice-pipeline](https://github.com/Logos-Flux/spark-voice-pipeline) - Real-time voice assistant on DGX Spark achieving ~766 ms latency to first audio.
- [Mekopa/whisperx-blackwell](https://github.com/Mekopa/whisperx-blackwell) - GPU-accelerated WhisperX on Blackwell (SM_121) for DGX Spark.
- [rappdw/transcribe-dgx](https://github.com/rappdw/transcribe-dgx) - Audio transcription with speaker diarization for DGX Spark using WhisperX.

## Remote Access & Desktop

- [eelbaz/dgx-spark-headless-sunshine](https://github.com/eelbaz/dgx-spark-headless-sunshine) - Headless remote desktop setup for DGX Spark using Sunshine streaming.
- [seanGSISG/dgx-spark-sunshine-setup](https://github.com/seanGSISG/dgx-spark-sunshine-setup) - Headless remote desktop to DGX Spark in crystal-clear 4K.

## Tools & Monitoring

- [ateska/dgx-spark-prometheus](https://github.com/ateska/dgx-spark-prometheus) - Prometheus metrics exporter for DGX Spark clusters.
- [chronosolidus/dgxsparkmonitor](https://github.com/chronosolidus/dgxsparkmonitor) - Real-time cyberpunk-themed monitoring dashboard via SSH.
- [DanTup/dgx_dashboard](https://github.com/DanTup/dgx_dashboard) - Simple monitoring dashboard for DGX Spark.
- [jasonacox/dgx-spark](https://github.com/jasonacox/dgx-spark) - Helpful tools for the NVIDIA DGX Spark AI personal supercomputer.
- [paul-aviles/NVIDIA-DGX-Spark-Dashboard](https://github.com/paul-aviles/NVIDIA-DGX-Spark-Dashboard) - Lightweight real-time browser-based monitoring dashboard for DGX Spark nodes.
- [thx0701/dgx-spark-status](https://github.com/thx0701/dgx-spark-status) - Real-time system monitoring dashboard built with SvelteKit and SSE.

## Operating Systems & Containers

- [graham33/nixos-dgx-spark](https://github.com/graham33/nixos-dgx-spark) - Use Nix and NixOS on your DGX Spark with USB images and flake templates.
- [scitrera/cuda-containers](https://github.com/scitrera/cuda-containers) - CUDA container builds for version consistency and reproducibility on DGX Spark.
- [straylight-software/nixos-dgx-spark](https://github.com/straylight-software/nixos-dgx-spark) - NixOS configuration for DGX Spark (GB10).

## Community & Resource Collections

- [jeremyeder/dgx-agentskills](https://github.com/jeremyeder/dgx-agentskills) - Claude Code integration for DGX Spark: local model serving, GPU monitoring, and VM management.
- [odnodn/dgx-spark](https://github.com/odnodn/dgx-spark) - NVIDIA DGX Spark resources: self-hosted AI infrastructure, dockerized applications, and research-assistant projects.

## Contributing

Contributions are welcome! Please read the [contribution guidelines](contributing.md) before opening a pull request.
