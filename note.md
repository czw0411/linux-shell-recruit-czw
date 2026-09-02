# task 01

## 用到的命令

cd /home/chen/linux-shell-recruit   进入目录

ls -la    显示目录全部内容（包括隐藏文件）

grep -rIl 'PROJECT_ID'   递归搜索包含PROJECT_ID的文件，只列出文件名

cat .project/metadata   查看文件内容，得到项目编号LSR-2026-0831

echo 'LSR-2026-0831' > output/01_project_id.txt   把内容写入文件（重定向）

./check.sh 01   运行校验脚本，确认答案正确

##
