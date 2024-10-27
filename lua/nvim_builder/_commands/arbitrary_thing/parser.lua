--- The main parser for the `:NvimBuilder arbitrary-thing` command.
---
---@module 'nvim_builder._commands.arbitrary_thing.parser'
---

local cmdparse = require("nvim_builder._cli.cmdparse")

local M = {}

---@return cmdparse.ParameterParser # The main parser for the `:NvimBuilder arbitrary-thing` command.
function M.make_parser()
    local parser = cmdparse.ParameterParser.new({ "arbitrary-thing", help = "Prepare to sleep or sleep." })

    parser:add_parameter({ "-a", action = "store_true", help = "The -a flag." })
    parser:add_parameter({ "-b", action = "store_true", help = "The -b flag." })
    parser:add_parameter({ "-c", action = "store_true", help = "The -c flag." })
    parser:add_parameter({ "-v", action = "store_true", count = "*", destination = "verbose", help = "The -v flag." })
    parser:add_parameter({ "-f", action = "store_true", count = "*", help = "The -f flag." })

    parser:set_execute(function(data)
        ---@cast data nvim_builder.NamespaceExecuteArguments
        local runner = require("nvim_builder._commands.arbitrary_thing.runner")

        local names = {}

        for _, argument in ipairs(data.input.arguments) do
            table.insert(names, argument.name)
        end

        runner.run(names)
    end)

    return parser
end

return M