#!/bin/bash

hfdl() {
  local url="$1"
  local repo_path="${url#https://huggingface.co/}"
  local repo_name="${repo_path%%/*}"
  local model_name="${repo_path%%/resolve*}"
  local file_name="${url##*/}"
  echo "repo_path:  $repo_path"
  echo "repo_name:  $repo_name"
  echo "model_name: $model_name"
  echo "file_name:  $file_name"
  mkdir -pv "$MODELS_DIR/huggingface.co/$model_name"
  hf download --local-dir "$MODELS_DIR/huggingface.co/$model_name" "$model_name" "$file_name"
}

hfdl "$@"
