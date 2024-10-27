--- A collection of types to be included / used in other Lua files.
---
--- These types are either required by the Lua API or required for the normal
--- operation of this Lua plugin.
---
---@module 'nvim_builder.types'
---

---@alias vim.log.levels.DEBUG number Messages to show to plugin maintainers.
---@alias vim.log.levels.ERROR number Unrecovered issues to show to the plugin users.
---@alias vim.log.levels.INFO number Informative messages to show to the plugin users.
---@alias vim.log.levels.TRACE number Low-level or spammy messages.
---@alias vim.log.levels.WARN number An error that was recovered but could be an issue.

---@class nvim_builder.Configuration
---    The user's customizations for this plugin.
---@field cmdparse nvim_builder.ConfigurationCmdparse?
---    All settings that control the command mode tools (parsing, auto-complete, etc).
---@field commands nvim_builder.ConfigurationCommands?
---    Customize the fallback behavior of all `:NvimBuilder` commands.
---@field logging nvim_builder.LoggingConfiguration?
---    Control how and which logs print to file / Neovim.
---@field tools nvim_builder.ConfigurationTools?
---    Optional third-party tool integrations.

---@class nvim_builder.ConfigurationCmdparse
---    All settings that control the command mode tools (parsing, auto-complete, etc).
---@field auto_complete nvim_builder.ConfigurationCmdparseAutoComplete
---    The settings that control what happens during auto-completion.

---@class nvim_builder.ConfigurationCmdparseAutoComplete
---    The settings that control what happens during auto-completion.
---@field display {help_flag: boolean}
---    help_flag = Show / Hide the --help flag during auto-completion.

---@class nvim_builder.ConfigurationCommands
---    Customize the fallback behavior of all `:NvimBuilder` commands.
---@field goodnight_moon nvim_builder.ConfigurationGoodnightMoon?
---    The default values when a user calls `:NvimBuilder goodnight-moon`.
---@field hello_world nvim_builder.ConfigurationHelloWorld?
---    The default values when a user calls `:NvimBuilder hello-world`.

---@class nvim_builder.ConfigurationGoodnightMoon
---    The default values when a user calls `:NvimBuilder goodnight-moon`.
---@field read nvim_builder.ConfigurationGoodnightMoonRead?
---    The default values when a user calls `:NvimBuilder goodnight-moon read`.

---@class nvim_builder.LoggingConfiguration
---    Control whether or not logging is printed to the console or to disk.
---@field level (
---    | "trace"
---    | "debug"
---    | "info"
---    | "warn" | "error"
---    | "fatal"
---    | vim.log.levels.DEBUG
---    | vim.log.levels.ERROR
---    | vim.log.levels.INFO
---    | vim.log.levels.TRACE
---    | vim.log.levels.WARN)?
---    Any messages above this level will be logged.
---@field use_console boolean?
---    Should print the output to neovim while running. Warning: This is very
---    spammy. You probably don't want to enable this unless you have to.
---@field use_file boolean?
---    Should write to a file.
---@field output_path string?
---    The default path on-disk where log files will be written to.
---    Defaults to "/home/selecaoone/.local/share/nvim/plugin_name.log".

---@class nvim_builder.ConfigurationGoodnightMoonRead
---    The default values when a user calls `:NvimBuilder goodnight-moon read`.
---@field phrase string
---    The book to read if no book is given by the user.

---@class nvim_builder.ConfigurationHelloWorld
---    The default values when a user calls `:NvimBuilder hello-world`.
---@field say nvim_builder.ConfigurationHelloWorldSay?
---    The default values when a user calls `:NvimBuilder hello-world say`.

---@class nvim_builder.ConfigurationHelloWorldSay
---    The default values when a user calls `:NvimBuilder hello-world say`.
---@field repeat number
---    A 1-or-more value. When 1, the phrase is said once. When 2+, the phrase
---    is repeated that many times.
---@field style "lowercase" | "uppercase"
---    Control how the text is displayed. e.g. "uppercase" changes "hello" to "HELLO".

---@class nvim_builder.ConfigurationTools
---    Optional third-party tool integrations.
---@field lualine nvim_builder.ConfigurationToolsLualine?
---    A Vim statusline replacement that will show the command that the user just ran.

---@alias nvim_builder.ConfigurationToolsLualine table<string, nvim_builder.ConfigurationToolsLualineData>
---    Each runnable command and its display text.

---@class nvim_builder.ConfigurationToolsLualineData
---    The display values that will be used when a specific `nvim_builder`
---    command runs.
---@diagnostic disable-next-line: undefined-doc-name
---@field color vim.api.keyset.highlight?
---    The foreground/background color to use for the Lualine status.
---@field prefix string?
---    The text to display in lualine.
