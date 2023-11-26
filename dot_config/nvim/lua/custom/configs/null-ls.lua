local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.diagnostics.flake8.with {
    extra_args = {
      "--ignore",
      "E501,W503,E203",
    },
  },
  b.diagnostics.mypy.with {
    temp_dir = "/tmp",
    extra_args = {
      "--ignore-missing-imports",
    },
  },
  b.formatting.black.with {
    "--line-length",
    "100",
  },
  b.formatting.isort.with {
    extra_args = {
      "--profile",
      "black",
      "--line-length",
      "100",
      "--lines-after-imports",
      "2",
      "--combine-as",
    },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
