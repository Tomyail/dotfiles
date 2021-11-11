local status, indent_blankline= pcall(require, "indent_blankline")
if (not status) then return end

vim.opt.list = true
indent_blankline.init( {
    char = "|",
    buftype_exclude = {"terminal"},
	space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
})
