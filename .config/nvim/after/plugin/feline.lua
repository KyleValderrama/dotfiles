local line_ok, feline = pcall(require, "feline")
if not line_ok then
	return
end

local rose_pine = {
	fg = "#e0def4",
	bg = "#151031",
	green = "#9ccfd8",
	yellow = "#f6c177",
	purple = "#c4a7e7",
	orange = "#ea9a97",
	peanut = "#907aa9",
	red = "#eb6f92",
	aqua = "#3e8fb0",
	darkblue = "#2a273f",
	dark_red = "#44415a",
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "yellow",
	VISUAL = "purple",
	LINES = "orange",
	BLOCK = "dark_red",
	REPLACE = "red",
	COMMAND = "aqua",
}

local c = {
	vim_mode = {
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
			},
		},
		hl = function()
			return {
				fg = "darkblue",
				bg = require("feline.providers.vi_mode").get_mode_color(),
				style = "bold",
				name = require("feline.providers.vi_mode").get_mode_color(),
			}
		end,
		left_sep = {
			str = "left_rounded",
			hl = function()
				return {
					fg = require("feline.providers.vi_mode").get_mode_color(),
					bg = "transparent",
				}
			end
		},
		right_sep = "█",
		icon = ""
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = "purple",
			bg = "transparent",
			style = "bold",
		},
		right_sep = {
			str = " ",
			hl = {
				fg = "transparent",
				bg = "transparent"
			}
		},
		left_sep = {
			str = " ",
			hl = {
				fg = "transparent",
				bg = "transparent"
			}
		}
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "green",
			bg = "transparent",
		},
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "red",
			bg = "transparent",
		},
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "fg",
			bg = "transparent",
		},
	},
	separator = {
		provider = "",
		hl = {
			fg = "bg",
			bg = "transparent"
		}
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				type = "base-only",
				colored_icon = false,
				file_readonly_icon = "",
			},
		},
		hl = {
			bg = "bg"
		},
		left_sep = " ",
		right_sep = {
			str = "█",
			hl = {
				fg = "bg",
				bg = "transparent"
			}
		}
	},
	fileinfo_winbar = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative",
				path_sep = "  ",
				file_readonly_icon = "",
			},
		},
		hl = {
			bg = "transparent",
		},
		left_sep = ""
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = {
			fg = "red",
			bg = "transparent"
		},
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = {
			fg = "yellow",
			bg = "transparent"
		},
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = "aqua",
			bg = "transparent"
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info",
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = "purple",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "left_filled",
		right_sep = "block",
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
				case = "titlecase",
			},
		},
		hl = {
			fg = "red",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_encoding = {
		provider = "file_encoding",
		hl = {
			fg = "orange",
			bg = "darkblue",
			style = "italic",
		},
		left_sep = "block",
		right_sep = "block",
	},
	position = {
		provider = "position",
		hl = {
			fg = "green",
			bg = "bg",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			bg = "aqua",
			style = "bold",
		},
		left_sep = "block",
		right_sep = {
			str = "",
			hl = {
				fg = "aqua",
				bg = "transparent"
			}
		}
	},
	scroll_bar = {
		provider = "scroll_bar",
		hl = {
			fg = "yellow",
			style = "bold",
		},
	},
}

local left = {
	c.vim_mode,
	c.fileinfo,
	c.diagnostic_errors,
	c.diagnostic_warnings,
	c.diagnostic_info,
	c.diagnostic_hints,
}

local middle = {
	c.separator,
	hl = {
		bg = "transparent"
	}

}

local right = {
	c.gitDiffAdded,
	c.gitDiffRemoved,
	c.gitDiffChanged,
	c.gitBranch,
	c.position,
	c.line_percentage,

}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
		right,
	},
}

local left_winbar = {
	c.fileinfo_winbar,
}

feline.setup({
	components = components,
	theme = rose_pine,
	vi_mode_colors = vi_mode_colors,
})


require('feline').winbar.setup({
	components = {
		active = {
			left_winbar
		}
	}
})
