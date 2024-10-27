--- Symbolic variables to use for all `hello-world say`-related commands.
---
---@module 'nvim_builder._commands.hello_world.say.constant'
---

return {
    Subcommand = { phrase = "phrase", word = "word" },
    Keyword = { style = { lowercase = "lowercase", uppercase = "uppercase" } },
}
