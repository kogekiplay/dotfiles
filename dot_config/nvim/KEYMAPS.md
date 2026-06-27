# Neovim 快捷键参考

## 基础操作
- `Space` - Leader 键
- `jk` 或 `Esc` - 退出插入模式
- `<leader>w` - 保存文件
- `<leader>q` - 退出

## 文件操作
- `<leader>ff` - 查找文件
- `<leader>fg` - 全局搜索
- `<leader>fb` - 查找缓冲区
- `<leader>fr` - 最近文件
- `<leader>e` - 切换文件树
- `<leader>o` - 聚焦文件树

## 窗口操作
- `Ctrl+h/j/k/l` - 窗口间移动
- `<leader>sv` - 垂直分屏
- `<leader>sh` - 水平分屏
- `<leader>sx` - 关闭分屏

## 代码操作
- `gd` - 跳转到定义
- `gr` - 查找引用
- `gI` - 跳转到实现
- `<leader>D` - 类型定义
- `<leader>ds` - 文档符号
- `<leader>ws` - 工作区符号
- `<leader>rn` - 重命名
- `<leader>ca` - 代码操作
- `K` - 悬停文档
- `<leader>cf` - 格式化代码

## Git 操作
- `<leader>ghs` - 暂存 hunk
- `<leader>ghr` - 重置 hunk
- `<leader>ghp` - 预览 hunk
- `<leader>ghb` - 查看 blame
- `]h` / `[h` - 下一个/上一个 hunk

## 搜索操作
- `<leader>/` - 当前缓冲区模糊搜索
- `<leader>fd` - 查找诊断
- `<leader>fs` - 查找符号
- `<leader>fw` - 搜索光标下的单词

## 终端操作
- `<leader>tt` - 切换终端
- `<leader>tf` - 浮动终端
- `<leader>th` - 水平终端
- `<leader>tv` - 垂直终端
- `Ctrl+\` - 切换终端

## 编辑操作
- `gcc` - 注释/取消注释行
- `gc` - 注释/取消注释选中
- `ysiw)` - 给单词加括号
- `ds)` - 删除括号
- `cs)"` - 将括号改为引号

## 诊断操作
- `]d` / `[d` - 下一个/上一个诊断
- `<leader>xx` - 切换诊断列表
- `<leader>xX` - 当前缓冲区诊断

## LSP 操作
- `<leader>th` - 切换内联提示
- `Ctrl+Space` - 触发补全
- `Tab` / `Shift+Tab` - 选择补全项
- `Enter` - 确认补全
