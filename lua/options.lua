
local opt = vim.opt

local options = {
  clipboard = "unnamed,unnamedplus",      -- vim和系统剪贴板关联

  wrap = false,                           -- 禁止自动换行

  -- 自动缩进
  autoindent = true, 		                -- 继承上一行缩进
  smartindent = true,                     -- 根据代码语法智能缩进

  -- 缩进相关配置
  tabstop = 4,                            -- 每个Tab显示为4个空格宽度
  shiftwidth = 4,                         -- 自动缩进和 >>/<< 操作的空格数
  softtabstop = 4,                        -- 编辑时Tab键插入4个空格
  expandtab = true,                       -- 将Tab转换为空格


  number = true,                          -- 显示行号
  relativenumber = true,                  -- 显示相对行号
  cursorline = true,                      -- 高亮当前行
  cursorcolumn = true,                    -- 高亮当前列
  colorcolumn = "80",                     -- 右侧参考线
  ruler = true,                           -- 显示光标位置
  signcolumn = "yes",                     -- 始终显示符号列（避免窗口跳动）
}

vim.opt.shortmess:append 'c'
for k, v in pairs(options) do
  vim.opt[k] = v
end

