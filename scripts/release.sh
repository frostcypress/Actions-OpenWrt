#!/bin/bash
set -euo pipefail

# 直接用 v1 + run_id，不做任何计算
RELEASE_TAG="v1-${GITHUB_RUN_ID}"

echo "release_tag=${RELEASE_TAG}" >> "$GITHUB_OUTPUT"
echo "status=success" >> "$GITHUB_OUTPUT"

echo "============================================="
echo "发布核心固件到Release"
echo "版本标签：$RELEASE_TAG"
echo "固件目录：$FIRMWARE"
echo "说明文件：$RELEASE_NOTES"
echo "============================================="

# 不存在就创建，存在就跳过
if ! gh release view "$RELEASE_TAG" >/dev/null 2>&1; then
  echo -e "\n🔄 创建新版本标签..."
  gh release create "$RELEASE_TAG" \
    --title "$RELEASE_TAG" \
    --notes-file "$RELEASE_NOTES"
else
  echo -e "\n⚠️ 版本标签已存在，跳过创建"
fi

# 上传所有固件，覆盖同名文件
echo -e "\n🔄 上传核心固件中 ..."
gh release upload "$RELEASE_TAG" \
  "${FIRMWARE}"/* \
  --clobber

echo -e "\n✅ 核心固件上传完成！"
