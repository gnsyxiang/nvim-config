
local opts = {
    on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = 'Git: ' .. desc })
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then
                vim.cmd.normal({']c', bang = true})
            else
                gitsigns.nav_hunk('next')
            end
        end, '跳转到下一个 Git 变更块')

        map('n', '[c', function()
            if vim.wo.diff then
                vim.cmd.normal({'[c', bang = true})
            else
                gitsigns.nav_hunk('prev')
            end
        end, '跳转到上一个 Git 变更块')

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, '暂存当前行变更')
        map('v', '<leader>hs', function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, '暂存当前选中变更')
        map('n', '<leader>hS', gitsigns.stage_buffer, '暂存当前文件变更')

        map('n', '<leader>hr', gitsigns.reset_hunk, '撤销当前行变更')
        map('v', '<leader>hr', function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, '撤销当前选中变更')
        map('n', '<leader>hR', gitsigns.reset_buffer, '撤销当前文件变更')

        map('n', '<leader>hp', gitsigns.preview_hunk, '预览当前行变更块的差异')
        map('n', '<leader>hi', gitsigns.preview_hunk_inline, '行内预览当前行变更块的差异')

        map('n', '<leader>hb', function() gitsigns.blame_line({ full = true }) end, '显示当前行的完整 Blame 信息')

        map('n', '<leader>hd', gitsigns.diffthis, '对比当前文件与暂存区的差异')
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end, '对比当前文件与上一个提交版本的差异')

        map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, '将整个仓库的所有变更块放入快速修复列表')
        map('n', '<leader>hq', gitsigns.setqflist, '将当前文件的所有变更块放入快速修复列表')

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, '切换当前行的 Blame 显示状态')
        map('n', '<leader>tw', gitsigns.toggle_word_diff, '切换单词级差异显示')

        -- Text object
        map({'o', 'x'}, 'ih', gitsigns.select_hunk, '选中当前光标所在的变更块')
    end
}

require('gitsigns').setup(opts)

