#!/bin/bash

############################################################################
TAG_CODE    = 0.4.0
CMT_MSG     = '优化项目的结构'
############################################################################


POD_NAME    = FYHelper

DID_TAG     = 0
TAGS        = $(git tag)

############################################################################

# Run following command to enable credential caching.
git config credential.helper store
git push https://github.com/repo.git

# 给源代码打版本标签，与podspec文件中version一致即可
# shell不允许‘=’号两边有空格 DID_TAG=1
for tag in $TAGS ; do
	echo "include this tag >> $tag"
	if [ $tag = $TAG_CODE ] ; then
		DID_TAG=1
		break
	fi
done

if [ $DID_TAG = 1 ] ; then
	echo "已经有TAG: $TAG_CODE"
else
	git tag $TAG_CODE;
fi

git push --tag

# 需要验证一下，以便提前发现问题。忽略警告
pod lib lint --use-libraries --allow-warnings

# 提交你的代码
git add .                       # 将当前目录下所有文件和子目录的修改记录到Git索引中
# git add ..                      # 将上一级目录下所有文件和子目录的修改记录到Git索引中
git status                      # 列出当前目录下被修改还未提交的状态
git commit -m $CMT_MSG          # 提交被add的改动
git push origin master          # push代码到Git

# 发布到CocoaPods
pod trunk push $POD_NAME.podspec --use-libraries --allow-warnings

# 命令更新本地pod依赖树
pod setup

# 搜索看是不是与TAG_CODE一致
pod search $POD_NAME



