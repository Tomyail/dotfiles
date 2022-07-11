-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

  local status_ok, nvim_tree = pcall(require, "nvim-tree")
  if not status_ok then
	return
  end

  local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if not config_status_ok then
	return
  end

  local tree_cb = nvim_tree_config.nvim_tree_callback

--   nnoremap sf :NvimTreeFindFile<CR>

  local list = {
	{ key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
	{ key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
	{ key = "<C-v>",                        cb = tree_cb("vsplit") },
	{ key = "<C-x>",                        cb = tree_cb("split") },
	{ key = "<C-t>",                        cb = tree_cb("tabnew") },
	{ key = "<",                            cb = tree_cb("prev_sibling") },
	{ key = ">",                            cb = tree_cb("next_sibling") },
	{ key = "P",                            cb = tree_cb("parent_node") },
	{ key = "<BS>",                         cb = tree_cb("close_node") },
	{ key = "<S-CR>",                       cb = tree_cb("close_node") },
	{ key = "<Space><Space>",               cb = tree_cb("preview") },
	{ key = "K",                            cb = tree_cb("first_sibling") },
	{ key = "J",                            cb = tree_cb("last_sibling") },
	{ key = "I",                            cb = tree_cb("toggle_ignored") },
	{ key = ".",                            cb = tree_cb("toggle_dotfiles") },
	{ key = "R",                            cb = tree_cb("refresh") },
	{ key = "N",                            cb = tree_cb("create") },
	{ key = "d",                            cb = tree_cb("remove") },
	{ key = "r",                            cb = tree_cb("rename") },
	{ key = "<C-r>",                        cb = tree_cb("full_rename") },
	{ key = "x",                            cb = tree_cb("cut") },
	{ key = "c",                            cb = tree_cb("copy") },
	{ key = "p",                            cb = tree_cb("paste") },
	{ key = "y",                            cb = tree_cb("copy_name") },
	{ key = "Y",                            cb = tree_cb("copy_path") },
	{ key = "yy",                           cb = tree_cb("copy_absolute_path") },
	{ key = "[c",                           cb = tree_cb("prev_git_item") },
	{ key = "]c",                           cb = tree_cb("next_git_item") },
	{ key = "-",                            cb = tree_cb("dir_up") },
	{ key = "s",                            cb = tree_cb("system_open") },
	{ key = "q",                            cb = tree_cb("close") },
	{ key = "g?",                           cb = tree_cb("toggle_help") },
  }

  nvim_tree.setup {
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {
	  "startify",
	  "dashboard",
	  "alpha",
	},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	hijack_directories= {
	  enable = true,
	  auto_open = true,
	},
	diagnostics = {
	  enable = true,
	  icons = {
		hint = "",
		info = "",
		warning = "",
		error = "",
	  },
	},
	update_focused_file = {
	  enable = false,
	  update_cwd = true,
	  ignore_list = {},
	},
	system_open = {
	  cmd = nil,
	  args = {},
	},
	filters = {
	  dotfiles = false,
	  custom = {},
	},
	git = {
	  enable = true,
	  ignore = true,
	  timeout = 500,
	},
	view = {
	  width = 30,
	  height = 30,
	  hide_root_folder = false,
	  side = "left",
	  mappings = {
		custom_only = false,
		list = list,
	  },
	  number = false,
	  relativenumber = false,
	},
	renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },
	trash = {
	  cmd = "trash",
	  require_confirm = true,
	},
	actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  }
