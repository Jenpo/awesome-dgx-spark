# Awesome DGX Spark [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> A curated list of awesome tools, guides, playbooks, and resources for the [NVIDIA DGX Spark](https://www.nvidia.com/en-us/products/workstations/dgx-spark/), the GB10 Grace Blackwell personal AI supercomputer.

DGX Spark is a desktop machine built on the GB10 Grace Blackwell Superchip (SM 12.1 / sm_121), with 128 GB of unified CPU+GPU memory. You can link two units over 200 Gb/s networking to run larger models. This list collects community projects for setting it up, serving models, fine-tuning, benchmarking, and day-to-day operation.

**Platform essentials:** `aarch64` · `CUDA 13.x` · `sm_121` · `128 GB unified memory` · `200 Gb/s NVLink-C2C`

This list has two tiers. **Tested on my Spark** is what I have personally run on real GB10 hardware and judged above the bar. **Seen** is the broader landscape: Spark-specific and tracked, but not personally verified.

## Contents

- [Tested on my Spark](#tested-on-my-spark)
- [Seen — the landscape](#seen--the-landscape)
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

## Tested on my Spark

> Run on a real DGX Spark (GB10) and judged above the bar. Personally verified and opinionated.

Nothing here yet. I am working through the Seen list on hardware; entries graduate here as I run them.

## Seen — the landscape

> Spark-specific and tracked, but not personally verified yet. The sections below are the landscape.

## Official

- [NVIDIA/dgx-spark-playbooks](https://github.com/NVIDIA/dgx-spark-playbooks) - Official step-by-step playbooks for AI/ML workloads on DGX Spark: vLLM, SGLang, Ollama, unsloth, ComfyUI, FLUX, multi-node, and more.

## Setup & Configuration

- [GuigsEvt/dgx_spark_config](https://github.com/GuigsEvt/dgx_spark_config) - End-to-end setup for AI workloads on DGX Spark.
- [JetBrains-Hardware/spark-setup](https://github.com/JetBrains-Hardware/spark-setup) - DGX Spark setup and vLLM deployment scripts for Qwen, GPT-OSS, and Nemotron 3.
- [natolambert/dgx-spark-setup](https://github.com/natolambert/dgx-spark-setup) - Setup guide focused on ML training (GB10 Blackwell, CUDA 13, aarch64).
- [raphaelamorim/spark-playbooks](https://github.com/raphaelamorim/spark-playbooks) - Community playbooks and recipes for deploying AI models and workloads on DGX Spark.
- [Sggin1/DGX-SPARK](https://github.com/Sggin1/DGX-SPARK) - Research and tests with containers and benchmarks for GB10 (SM 12.1).

## Inference & Serving

### vLLM

- [AEON-7/vllm-dflash](https://github.com/AEON-7/vllm-dflash) - DGX Spark vLLM image wiring DFlash speculative decoding and NVFP4, 64 tok/s single-stream on GB10.
- [Avarok-Cybersecurity/dgx-vllm](https://github.com/Avarok-Cybersecurity/dgx-vllm) - vLLM Docker image for DGX Spark.
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

- [BTankut/dgx-spark-sglang-moe-configs](https://github.com/BTankut/dgx-spark-sglang-moe-configs) - SGLang MoE kernel configs for DGX Spark (GLM-4.7-FP8).
- [mark-ramsey-ri/sglang-dgx-spark](https://github.com/mark-ramsey-ri/sglang-dgx-spark) - Run SGLang on 1-to-N DGX Spark servers (single Spark, 2 via direct cable, or 3+ via switched fabric) to serve or benchmark LLMs.
- [ridanuae/dgx-spark-sglang-qwen35](https://github.com/ridanuae/dgx-spark-sglang-qwen35) - Run Qwen3.5-35B-A3B on DGX Spark with SGLang (Docker image and guide).

### Other Engines

- [antirez/ds4](https://github.com/antirez/ds4) - DeepSeek 4 Flash local inference engine in C with a dedicated `cuda-spark` build target and published GB10 benchmarks.
- [calico88x/DGX-Model-Manager](https://github.com/calico88x/DGX-Model-Manager) - Single-file web UI for managing Ollama, SGLang, vLLM, llama.cpp, LocalAI, and ComfyUI on DGX Spark.
- [dataforgex/dgx_spark](https://github.com/dataforgex/dgx_spark) - Multi-model LLM serving with vLLM, web UI, and tool calling.
- [wshobson/minimax-dgx-spark](https://github.com/wshobson/minimax-dgx-spark) - MiniMax M2 inference server for DGX Spark.

## Fine-tuning

- [alicankiraz1/DGX-Spark-Asus-Ascent-Nvidia-GB10-SFT-Finetuner](https://github.com/alicankiraz1/DGX-Spark-Asus-Ascent-Nvidia-GB10-SFT-Finetuner) - No-code SFT fine-tuning tool for DGX Spark.
- [kreuzhofer/dgx-spark-unsloth-qwen3.5-training](https://github.com/kreuzhofer/dgx-spark-unsloth-qwen3.5-training) - BF16 LoRA fine-tuning of Qwen3.5-35B-A3B on a single DGX Spark with unsloth.
- [MoHussein197/dgx-spark-finetune-llm](https://github.com/MoHussein197/dgx-spark-finetune-llm) - Fine-tune LLMs with LoRA adapters and quantization on DGX Spark.
- [riomus/dgx-spark-unsloth](https://github.com/riomus/dgx-spark-unsloth) - Unsloth usage on DGX Spark using UV and NVIDIA's Docker image.
- [waybarrios/dgx-spark-finetune-llm](https://github.com/waybarrios/dgx-spark-finetune-llm) - LLM fine-tuning with LoRA + NVFP4/MXFP8 on DGX Spark.

## Quantization & NVFP4

GB10's Blackwell architecture supports NVFP4 (4-bit floating point) in hardware. It runs faster than INT4 at similar quality.

- [AEON-7/Gemma-4-26B-A4B-it-Uncensored-NVFP4](https://github.com/AEON-7/Gemma-4-26B-A4B-it-Uncensored-NVFP4) - NVFP4 Gemma 4 26B MoE on DGX Spark with DFlash speculative decoding, 39-155 tok/s single-stream.
- [AEON-7/Gemma-4-31B-DECKARD-HERETIC-Uncensored-NVFP4](https://github.com/AEON-7/Gemma-4-31B-DECKARD-HERETIC-Uncensored-NVFP4) - NVFP4-quantized Gemma 4 31B for DGX Spark with deployment guide.
- [AEON-7/Gemma-4-31B-Uncensored-NVFP4-DFlash](https://github.com/AEON-7/Gemma-4-31B-Uncensored-NVFP4-DFlash) - vLLM image for DGX Spark serving NVFP4 Gemma 4 31B (Deckard Heretic) with z-lab DFlash speculative decoding.
- [AEON-7/Nemotron-3-Nano-Omni-AEON-Ultimate-Uncensored](https://github.com/AEON-7/Nemotron-3-Nano-Omni-AEON-Ultimate-Uncensored) - Source-built vLLM image for DGX Spark serving abliterated Nemotron-3-Nano-Omni multimodal in BF16 and NVFP4.
- [AEON-7/Qwen3.6-27B-AEON-Ultimate-Uncensored-DFlash](https://github.com/AEON-7/Qwen3.6-27B-AEON-Ultimate-Uncensored-DFlash) - Prebuilt vLLM container for DGX Spark with abliterated Qwen3.6-27B (NVFP4 + DFlash), sm_121a-patched for 37.6 tok/s vs 10.5 raw.
- [AEON-7/Qwen3.6-NVFP4-DFlash](https://github.com/AEON-7/Qwen3.6-NVFP4-DFlash) - Source-built vLLM image with 7 sm_121a patches serving NVFP4 Qwen3.6-35B-A3B at 84 tok/s with DFlash speculative decoding.
- [AEON-7/supergemma4-26b-abliterated-multimodal-nvfp4](https://github.com/AEON-7/supergemma4-26b-abliterated-multimodal-nvfp4) - NVFP4 (AWQ) SuperGemma4-26B abliterated multimodal for DGX Spark, as a prebuilt vLLM container.
- [JungkwanBan/SPARK_Qwen3.5-122B-A10B-NVFP4](https://github.com/JungkwanBan/SPARK_Qwen3.5-122B-A10B-NVFP4) - 122B Qwen3.5 MoE on a single GB10 via NVFP4 W4A4, 24.5 tok/s with MTP speculative decoding.
- [localai-org/apex-quant](https://github.com/localai-org/apex-quant) - MoE-aware mixed-precision GGUF quant recipe, quality and throughput benchmarked on GB10.
- [Logos-Flux/optimized-CUDA-GB10](https://github.com/Logos-Flux/optimized-CUDA-GB10) - CUDA kernels (RMSNorm, GELU) for GB10 sm_121, the first sm_121 kernels on the Hugging Face Kernel Hub.

## Models & Benchmarks

- [adadrag/qwen3.5-dgx-spark](https://github.com/adadrag/qwen3.5-dgx-spark) - Guide to running Qwen3.5-35B-A3B on DGX Spark (GB10) with vLLM: installation, benchmarks, vision features, and troubleshooting.
- [albond/DGX_Spark_Qwen3.5-122B-A10B-AR-INT4](https://github.com/albond/DGX_Spark_Qwen3.5-122B-A10B-AR-INT4) - Qwen3.5-122B-A10B on DGX Spark, tuned from 28.3 to 51 tok/s (+80%).
- [bigs/deepseek-v4-flash-dgx-spark](https://github.com/bigs/deepseek-v4-flash-dgx-spark) - Runtime experiments and serving harness for DeepSeek-V4-Flash on a single DGX Spark.
- [Kleybrink/dgx-spark-bench](https://github.com/Kleybrink/dgx-spark-bench) - Benchmarking framework measuring throughput, latency, VRAM, and accuracy with LLM-as-a-Judge.
- [lmxxf/deepseek-v4-deployment-on-dgx-spark](https://github.com/lmxxf/deepseek-v4-deployment-on-dgx-spark) - DeepSeek-V4 deployment guide for DGX Spark.
- [martimramos/dgx-spark-ml-guide](https://github.com/martimramos/dgx-spark-ml-guide) - Guide to running PyTorch and ML workloads on DGX Spark.
- [Memoriant/dgx-spark-kv-cache-benchmark](https://github.com/Memoriant/dgx-spark-kv-cache-benchmark) - KV cache quantization on GB10: dequantization cliff (q4_0 −37% gen tps at 110K), unified-memory paradox, prefill immunity.
- [nabe2030/dense-27b-31b-dgx-spark](https://github.com/nabe2030/dense-27b-31b-dgx-spark) - Benchmark of Qwen 3.5/3.6-27B and Gemma 4-31B on DGX Spark.
- [nabe2030/gemma4-vs-qwen35-dgx-spark](https://github.com/nabe2030/gemma4-vs-qwen35-dgx-spark) - Gemma 4 vs Qwen 3.5 MoE benchmark with llama.cpp.
- [rossingram/Spark-DGX-Benchmark](https://github.com/rossingram/Spark-DGX-Benchmark) - Benchmark script testing compute, memory bandwidth, diffusion, and LLM throughput on DGX Spark.
- [wengzhiwen/DeepSeek-OCR-DGX-Spark](https://github.com/wengzhiwen/DeepSeek-OCR-DGX-Spark) - DeepSeek OCR on DGX Spark (ARM64 + CUDA 13.0).

## Multi-node

You can connect two DGX Spark units directly over 200 Gb/s QSFP for double the memory and compute.

- [ArgentAIOS/dgx-spark-cluster](https://github.com/ArgentAIOS/dgx-spark-cluster) - 2-node setup with EXO inference, NCCL tuning, NVMe-TCP storage, and 200 Gb/s fabric.
- [bkrabach/dgx-spark-cluster](https://github.com/bkrabach/dgx-spark-cluster) - Dual-node LLM cluster setup kit with Ray + vLLM.
- [cesarb-ai/dgx-spark-cluster-compass](https://github.com/cesarb-ai/dgx-spark-cluster-compass) - Guide to clustering DGX Spark nodes for multi-node vLLM inference (NCCL, RoCE, Ray).
- [makiisthenes/dgx-spark-multinode-vllm-ray](https://github.com/makiisthenes/dgx-spark-multinode-vllm-ray) - Dual-DGX Spark vLLM deployment with NVIDIA vLLM 26.04, Ray, and 200 GbE QSFP.
- [pfn/spark-vllm-compose](https://github.com/pfn/spark-vllm-compose) - Multi-node Docker Compose configuration for vLLM on DGX Spark.

## Image & Media Generation

- [AEON-7/comfyui-aeon-spark](https://github.com/AEON-7/comfyui-aeon-spark) - ComfyUI Docker for DGX Spark with SageAttention v3 compiled for sm_121a, CUDA 13, NVFP4, and Flux 2 / LTX 2.3 pre-bundled.
- [dr-vij/Trellis2-DGX-Spark-Docker](https://github.com/dr-vij/Trellis2-DGX-Spark-Docker) - Trellis2 3D generation on DGX Spark.
- [ecarmen16/SparkyUI](https://github.com/ecarmen16/SparkyUI) - ComfyUI + SageAttention for DGX Spark (ARM64, sm_121).
- [luix93/DGX-Spark-ComfyUI](https://github.com/luix93/DGX-Spark-ComfyUI) - Setup for running ComfyUI on DGX Spark.
- [mmartial/ComfyUI-Nvidia-Docker](https://github.com/mmartial/ComfyUI-Nvidia-Docker) - Multi-platform ComfyUI Docker (x86_64, Blackwell, DGX Spark) with notes for compiling SageAttention on sm_121a.
- [phaserblast/ComfyUI-DGXSparkSafetensorsLoader](https://github.com/phaserblast/ComfyUI-DGXSparkSafetensorsLoader) - Zero-copy model loader for ComfyUI on DGX Spark using the fastsafetensors library.
- [raibid-entertainment/dgx-pixels](https://github.com/raibid-entertainment/dgx-pixels) - Stable Diffusion + LoRA pipeline for pixel art generation on DGX Spark.

## Audio & Speech

- [AEON-7/qwen3-asr-server](https://github.com/AEON-7/qwen3-asr-server) - OpenAI /v1/audio/transcriptions server for Qwen3-ASR-0.6B, vLLM-native with sm_120 flash-attn 2, hot-path RTF 16x.
- [AEON-7/qwen3-tts-server](https://github.com/AEON-7/qwen3-tts-server) - OpenAI /v1/audio/speech server for Qwen3-TTS-1.7B-VoiceDesign with sm_120 flash-attn 2, hot-path RTF 1.30x and free-form voice conditioning.
- [Logos-Flux/spark-voice-pipeline](https://github.com/Logos-Flux/spark-voice-pipeline) - Real-time voice assistant on DGX Spark achieving ~766 ms latency to first audio.
- [Mekopa/whisperx-blackwell](https://github.com/Mekopa/whisperx-blackwell) - GPU-accelerated WhisperX on Blackwell (sm_121) for DGX Spark.
- [rappdw/transcribe-dgx](https://github.com/rappdw/transcribe-dgx) - Audio transcription with speaker diarization for DGX Spark using WhisperX.

## Remote Access & Desktop

- [eelbaz/dgx-spark-headless-sunshine](https://github.com/eelbaz/dgx-spark-headless-sunshine) - Headless remote desktop setup for DGX Spark using Sunshine streaming.
- [seanGSISG/dgx-spark-sunshine-setup](https://github.com/seanGSISG/dgx-spark-sunshine-setup) - Headless 4K remote desktop to DGX Spark over Sunshine.

## Tools & Monitoring

- [ateska/dgx-spark-prometheus](https://github.com/ateska/dgx-spark-prometheus) - Prometheus metrics exporter for DGX Spark clusters.
- [chronosolidus/dgxsparkmonitor](https://github.com/chronosolidus/dgxsparkmonitor) - Cyberpunk-themed real-time monitoring dashboard for DGX Spark over SSH.
- [DanTup/dgx_dashboard](https://github.com/DanTup/dgx_dashboard) - Simple monitoring dashboard for DGX Spark.
- [jasonacox/dgx-spark](https://github.com/jasonacox/dgx-spark) - Tools for the NVIDIA DGX Spark AI personal supercomputer.
- [paul-aviles/NVIDIA-DGX-Spark-Dashboard](https://github.com/paul-aviles/NVIDIA-DGX-Spark-Dashboard) - Browser-based monitoring dashboard for DGX Spark nodes.
- [thx0701/dgx-spark-status](https://github.com/thx0701/dgx-spark-status) - Real-time system monitoring dashboard built with SvelteKit and SSE.

## Operating Systems & Containers

- [graham33/nixos-dgx-spark](https://github.com/graham33/nixos-dgx-spark) - Nix and NixOS on DGX Spark with USB images and flake templates.
- [scitrera/cuda-containers](https://github.com/scitrera/cuda-containers) - CUDA container builds for version consistency and reproducibility on DGX Spark.
- [straylight-software/nixos-dgx-spark](https://github.com/straylight-software/nixos-dgx-spark) - NixOS configuration for DGX Spark (GB10).

## Community & Resource Collections

- [jeremyeder/dgx-agentskills](https://github.com/jeremyeder/dgx-agentskills) - Claude Code integration for DGX Spark: local model serving, GPU monitoring, and VM management.
- [odnodn/dgx-spark](https://github.com/odnodn/dgx-spark) - Curated collection of NVIDIA DGX Spark resources and self-hosted AI projects.

## Contributing

Contributions are welcome. Read the [contribution guidelines](contributing.md) before opening a pull request.
