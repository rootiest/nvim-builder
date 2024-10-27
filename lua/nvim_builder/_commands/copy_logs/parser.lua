--- The main parser for the `:NvimBuilder copy-logs` command.
---
---@module 'nvim_builder._commands.copy_logs.parser'
---

local cmdparse = require("nvim_builder._cli.cmdparse")

local M = {}

---@return cmdparse.ParameterParser # The main parser for the `:NvimBuilder copy-logs` command.
function M.make_parser()
    local parser = cmdparse.ParameterParser.new({ "copy-logs", help = "Get debug logs for NvimBuilder." })

    parser:add_parameter({
        "log",
        required = false,
        help = "The path on-disk to look for logs. If no path is given, a fallback log path is used instead.",
    })

    parser:set_execute(function(data)
        ---@cast data nvim_builder.NamespaceExecuteArguments
        local runner = require("nvim_builder._commands.copy_logs.runner")

        runner.run(data.namespace.log)
    end)

    return parser
end

return M
