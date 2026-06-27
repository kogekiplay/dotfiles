# Neovim

现代 Vim 编辑器配置。

## 文件说明

- `init.lua` - 入口文件
- `lazy-lock.json` - 插件版本锁定
- `lua/config/` - 核心配置
  - `autocmds.lua` - 自动命令
  - `keymaps.lua` - 快捷键映射
  - `lazy.lua` - 插件管理器配置
  - `options.lua` - 编辑器选项
- `lua/plugins/` - 插件配置
  - `alpha.lua` - 启动界面
  - `cmp.lua` - 自动补全
  - `colorscheme.lua` - 主题
  - `editor.lua` - 编辑器增强
  - `format.lua` - 代码格式化
  - `gitsigns.lua` - Git 集成
  - `lang.lua` - 语言支持
  - `lint.lua` - 代码检查
  - `lsp.lua` - LSP 配置
  - `lualine.lua` - 状态栏
  - `neo-tree.lua` - 文件浏览器
  - `telescope.lua` - 模糊搜索
  - `treesitter.lua` - 语法高亮
- `KEYMAPS.md` - 快捷键说明
- `README.md` - 配置说明

## 相关链接

- [Neovim 官网](https://neovim.io/)
- [lazy.nvim 插件管理器](https://github.com/folke/lazy.nvim)
