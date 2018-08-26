###########################################################################
TAG_CODE    = 0.4.10
CMT_MSG     = '细微优化'
###########################################################################
POD_NAME    = FYHelper
###########################################################################

update_pod:

# 给源代码打版本标签，与podspec文件中version一致即可
# shell不允许‘=’号两边有空格 DID_TAG=1
#	git tag $(TAG_CODE)
#	git push --tag

# 需要验证一下，以便提前发现问题。忽略警告
#	pod lib lint --use-libraries --allow-warnings

# 提交你的代码
	git add .                       # 将当前目录下所有文件和子目录的修改记录到Git索引中
#	git add ..                      # 将当前目录下所有文件和子目录的修改记录到Git索引中
	git status                      # 列出当前目录下被修改还未提交的状态
	git commit -m $(CMT_MSG)        # 提交被add的改动
	git push origin master          # push代码到Git

# 发布到CocoaPods  pod trunk push FYHelper.podspec --use-libraries --allow-warnings
	pod trunk push $(POD_NAME).podspec --use-libraries --allow-warnings

# 命令更新本地pod依赖树
	pod setup

# 搜索看是不是与TAG_CODE一致
	pod search $(POD_NAME)

# 提交过最新的代码 & 验证了podspec文件是可用的，再用！
publish_pod_and_check:
	git tag $(TAG_CODE)
	git push --tag
	pod trunk push $(POD_NAME).podspec --use-libraries --allow-warnings
	pod setup
	pod search $(POD_NAME)

