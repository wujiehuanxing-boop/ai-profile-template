# AI 个人档案模板

一份放在 GitHub **私有仓库**里的「AI 个人档案」：你的偏好、做事规矩、常用工具、进行中的项目。
Claude Code、Codex、Gemini 等 AI 工具开工前先读它，干完活把新经验写回去。
换 AI、换电脑，过去攒下的一切都还在。

> ⚠️ 本仓库是**公开模板**，里面只有示例。你自己的档案请放进**私有仓库**，不要公开。

## 为什么放 GitHub

1. **AI 能直接读写**：现在的 AI 助手底层都会敲命令行，git 天生就是干这个的，不用折腾接口。
2. **每次改动都有记录，能回退**：AI 改错了、删多了，一条命令退回任意旧版本。
3. **不绑定任何一家平台**：就是一堆 Markdown 文件，哪个 AI 都能读，Windows、Mac 都能用。

## 目录

```
MEMORY.md            索引：一行一条，告诉 AI 每个文件讲什么（AI 先读它）
README.md            给人和 AI 看的说明（读法与写回规矩）
memory/              档案正文，一个文件只记一件事
  user-profile.md        我是谁
  feedback_*.md          我的做事要求（AI 优先遵守）
  reference_*.md         本机工具、账号、资料在哪
  project_*.md           进行中的项目与进度
entry/               各家 AI 的入口文件（告诉它去哪读档案）
scripts/             自动同步脚本（Windows / Mac）
SETUP_PROMPT.md      一段提示词：发给你的 AI，让它帮你搭好整套
```

## 最快的搭法

把 [SETUP_PROMPT.md](SETUP_PROMPT.md) 里的整段提示词复制给你的 AI 助手（Claude Code、Codex 等能操作电脑的），它会：
建私有仓库 → 放进模板 → 装好各家入口文件 → 设好自动同步。你只需要登录一次 GitHub。

## 手动搭法

1. 在 GitHub 新建一个 **Private** 仓库（比如 `ai-profile`）。
2. 下载本模板，把 `MEMORY.md`、`memory/`、`README.md` 复制进去，删掉示例、写上你自己的。
3. 按 `entry/` 里的说明，把入口文件放到各家 AI 的位置：
   | AI | 入口文件位置 |
   |---|---|
   | Claude Code | `~/.claude/CLAUDE.md` |
   | Codex | `~/.codex/AGENTS.md` |
   | Gemini CLI / Antigravity CLI | `~/.gemini/GEMINI.md` |
4. 设自动同步：Windows 用 `scripts/sync.ps1` + 计划任务，Mac 用 `scripts/sync.sh` + cron（脚本里有说明）。

## 写档案的规矩

- 一个文件只记一件事，文件开头写一行简介，方便 AI 判断要不要细读。
- 新建文件后在 `MEMORY.md` 加一行索引。
- `feedback_` 文件写清 **为什么** 和 **怎么做**，AI 才能举一反三。
- 写日期用绝对日期（2026-11-24），不要写「昨天」「下周」。
- **不写密码、密钥、证件号、银行卡号。**

## 回退旧版

```bash
git log --oneline -- memory/某个文件.md     # 看这个文件改过几次
git checkout <版本号> -- memory/某个文件.md  # 退回那一版
git commit -m "退回某文件"
```

## 隐私提醒

档案越用越详细，迟早会写进家人、客户、工作上的信息。
**仓库务必设为 Private**；公开后即使改回私有，内容也可能已被抓取。

## 许可

MIT
