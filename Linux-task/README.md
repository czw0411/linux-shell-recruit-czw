# Linux-task：第 1 题 Project Hunt 解题过程

## 题目

1. 在 \workspace/\ 中找到隐藏的项目编号，写入 \output/01_project_id.txt\。
2. 写出从 \workspace/src/utils/\ 访问该文件的相对路径，写入 \output/01_relative_path.txt\。

## 解题步骤

### 1. 找到 workspace 目录

项目目录为 \/home/chen/linux-shell-recruit/workspace\。

### 2. 查找包含 PROJECT_ID 的文件

\workspace/\ 下有 \.project\（隐藏目录）、\project\、\src\ 三个目录。
用递归搜索找出包含 \PROJECT_ID\ 的文件：

\\\ash
cd /home/chen/linux-shell-recruit/workspace
grep -rIl 'PROJECT_ID' .
# 输出：.project/metadata
\\\

隐藏目录 \.project\ 用普通 \ls\ 看不到，需要 \ls -a\ 或直接搜索。

### 3. 读取项目编号

\\\ash
cat .project/metadata
\\\

内容：

\\\
PROJECT_NAME=linux-shell-recruit
PROJECT_ID=LSR-2026-0831
VERSION=1.0
\\\

项目编号为 \LSR-2026-0831\。

### 4. 计算相对路径

从 \workspace/src/utils/\ 到 \workspace/.project/metadata\：

- \..\ 回到 \workspace/src/\
- \../..\ 回到 \workspace/\
- 再进入 \.project/metadata\

所以相对路径是 \../../.project/metadata\。

### 5. 写入答案并验证

\\\ash
cd /home/chen/linux-shell-recruit
echo 'LSR-2026-0831' > output/01_project_id.txt
echo '../../.project/metadata' > output/01_relative_path.txt
./check.sh 01
# 输出：[PASS] 01 Project Hunt
\\\

## 结果

- \output/01_project_id.txt\：\LSR-2026-0831\
- \output/01_relative_path.txt\：\../../.project/metadata\
