#!/bin/bash

# 历史练习应用 - 本地开发服务器启动脚本

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                                                                ║"
echo "║        📚 历史练习应用 v2.0 - 本地开发服务器                  ║"
echo "║                                                                ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "📁 项目目录: $SCRIPT_DIR"
echo ""

# 检查是否已有服务器运行
if lsof -Pi :8000 -sTCP:LISTEN -t >/dev/null 2>&1 ; then
    echo "⚠️  端口 8000 已被占用"
    echo "请选择:"
    echo "1. 使用其他端口"
    echo "2. 杀死现有进程"
    read -p "请输入选择 (1-2): " choice

    if [ "$choice" = "2" ]; then
        lsof -ti:8000 | xargs kill -9 2>/dev/null
        echo "✅ 已杀死现有进程"
    else
        read -p "请输入端口号 (默认 8001): " port
        port=${port:-8001}
    fi
else
    port=8000
fi

echo ""
echo "🚀 启动本地服务器..."
echo "   端口: $port"
echo ""

cd "$SCRIPT_DIR"

# 启动服务器
python3 -m http.server $port

echo ""
echo "✅ 服务器已启动"
echo ""
echo "📱 访问地址:"
echo "   首页:        http://localhost:$port/"
echo "   新版本:      http://localhost:$port/history-quiz-v2.html"
echo "   原始版本:    http://localhost:$port/history-quiz.html"
echo "   快速背题:    http://localhost:$port/gpt-index.html"
echo ""
echo "💡 提示:"
echo "   - 按 Ctrl+C 停止服务器"
echo "   - 打开浏览器开发者工具 (F12) 查看控制台"
echo "   - 检查 localStorage 中的学习进度"
echo ""
