#!/usr/bin/env bash

# Task 07: analyze server log
# Usage: ./scripts/analyze.sh FILE

# 没有参数时显示 Usage 并退出
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 FILE"
    exit 1
fi

FILE="$1"

# 文件不存在时报错并退出
if [[ ! -f "$FILE" ]]; then
    echo "Error: file not found: $FILE"
    exit 1
fi

# 统计 ERROR 条数
total=$(grep -c ERROR "$FILE")

# 找出出现最多的错误码（去掉次数前缀）
top_code=$(grep ERROR "$FILE" | grep -o 'code=[0-9]*' | sort | uniq -c | sort -rn | head -1 | sed 's/.*=//')

# 输出结果
echo "Total ERROR: $total"
echo "Top Code: $top_code"
