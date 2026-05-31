#!/bin/bash
set -euo pipefail

VERSION_PREFIX="${VERSION_PREFIX:-v1.0}"
RUN_ID="${GITHUB_RUN_ID}"

# ==============================================
# 🔥 核心修复：先检查本次 RUN_ID 是否已绑定版本号
# ==============================================
# 1. 遍历所有已发布的Release，查找是否有与当前run_id绑定的版本
EXISTING_RELEASE=$(gh release list \
  | awk -v p="$VERSION_PREFIX" '$0~p{print $1}' \
  | while read -r tag; do
      # 检查该Release的标题或备注是否包含当前run_id
      if gh release view "$tag" | grep -q "构建ID:$RUN_ID"; then
        echo "$tag"
        break
      fi
    done)

if [ -n "$EXISTING_RELEASE" ]; then
  # 已绑定，直接复用该版本号
  RELEASE_TAG="$EXISTING_RELEASE"
  echo "✅ 检测到本次构建已绑定版本: $RELEASE_TAG"
else
  # 未绑定，生成新的连续版本号
  echo "🔄 首次分配版本号..."
  NEXT_NUM=$(gh release list | awk -v p="$VERSION_PREFIX" '$0~p{print $1}' | sort -Vr | head -n1 | grep -oE '[0-9]+$' || echo 0)
  BASE_TAG="${VERSION_PREFIX}.$((NEXT_NUM + 1))"
  RELEASE_TAG="${BASE_TAG}-${RUN_ID}"
  echo "✅ 生成新版本: $RELEASE_TAG"
fi

echo "release_tag=${RELEASE_TAG}" >> "$GITHUB_OUTPUT"
echo "status=success" >> "$GITHUB_OUTPUT"

echo "============================================="
echo "发布核心固件到Release"
echo "版本标签：$RELEASE_TAG"
echo "固件目录：$FIRMWARE"
echo "说明文件：$RELEASE_NOTES"
echo "============================================="

# 创建Release（如果不存在）
if ! gh release view "$RELEASE_TAG" >/dev/null 2>&1; then
  echo -e "\n🔄 创建新版本标签..."
  # 在标题中写入构建ID，用于后续识别
  gh release create "$RELEASE_TAG" \
    --title "${RELEASE_TAG%-*} (构建ID:${RUN_ID})" \
    --notes-file "$RELEASE_NOTES"
else
  echo -e "\n⚠️ 版本标签已存在，跳过创建"
fi

echo -e "\n🔄 上传核心固件中 ..."
gh release upload "$RELEASE_TAG" \
  "${FIRMWARE}"/* \
  --clobber

echo -e "\n✅ 核心固件上传完成！"
