# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目简介

历史练习应用 - 初中历史知识点练习与测试网站。

## 项目地址

- **GitHub**: https://github.com/tgcf-franklin/history-quiz-app
- **官方域名**: https://his.juntop.me
- **Pages 域名**: https://history-quiz-app.pages.dev

## Cloudflare Pages 信息

- **项目 ID**: `c5f0d6ec-546e-4eb6-bcfc-a6d43b1f3964`
- **Subdomain**: history-quiz-app.pages.dev
- **创建时间**: 2025-12-20 15:22
- **生产分支**: main
- **Worker 脚本**:
  - Production: `pages-worker--9869167-production`
  - Preview: `pages-worker--9869167-preview`

### 自定义域名

- **域名**: his.juntop.me
- **域名 ID**: db00fb28-9c0e-4ba1-839c-b2dc92b7c19b
- **绑定时间**: 2025-12-21 14:01
- **DNS 记录**: CNAME his.juntop.me → history-quiz-app.pages.dev
- **SSL 证书**: Google Trust Services 自动颁发
- **Cloudflare 代理**: 已启用

### 最新部署

- **部署 ID**: e6475207-ff14-4d1f-9c39-fbd0aaca8ea8
- **部署时间**: 2025-12-20 15:41
- **状态**: 成功
- **Git Commit**: 9e5f0bb2ebde5edcda5ae1724e078d88b4765ea1
- **访问地址**: https://e6475207.history-quiz-app.pages.dev

## 项目结构

```
history-quiz-app/
├── index.html          # 首页入口
├── history-quiz.html   # 练习页面
└── questions_full.js   # 题库数据
```

## 部署

使用 Cloudflare Pages 部署，通过 Wrangler CLI：

```bash
# 部署到 Cloudflare Pages
CLOUDFLARE_API_KEY=<your-key> CLOUDFLARE_EMAIL=<your-email> wrangler pages deploy . --project-name history-quiz-app
```

## API 操作

查询 Pages 项目信息：

```bash
# 账户 ID
ACCOUNT_ID="eaaa9d46c21426b02ee27b4736880da3"

# 列出所有 Pages 项目
curl -X GET "https://api.cloudflare.com/client/v4/accounts/$ACCOUNT_ID/pages/projects" \
  -H "X-Auth-Email: $CLOUDFLARE_EMAIL" \
  -H "X-Auth-Key: $CLOUDFLARE_API_KEY" \
  -H "Content-Type: application/json"

# 查询特定项目
curl -X GET "https://api.cloudflare.com/client/v4/accounts/$ACCOUNT_ID/pages/projects/history-quiz-app" \
  -H "X-Auth-Email: $CLOUDFLARE_EMAIL" \
  -H "X-Auth-Key: $CLOUDFLARE_API_KEY" \
  -H "Content-Type: application/json"
```

## Git 操作

远程仓库使用 SSH 方式：

```bash
# 推送代码
git add .
git commit -m "提交信息"
git push origin main
```

## 开发记录

### 2025-12-20

1. **初始化项目**
   - 从 History 目录拷贝文件（排除 doc 文档）
   - 保留 HTML、JS 文件

2. **Git 配置**
   - 初始化 Git 仓库
   - 设置远程仓库为 SSH 方式
   - 推送到 GitHub

3. **Cloudflare Pages 部署**
   - 安装 Wrangler CLI
   - 创建 Pages 项目
   - 首次部署

4. **添加首页**
   - 创建 index.html 作为入口页面
   - 重新部署
