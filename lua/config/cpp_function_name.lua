local M = {}

local scope_types = {
  function_definition = "function",
  class_specifier = "class",
  struct_specifier = "struct",
  namespace_definition = "namespace",
}

function M.get_current_cpp_scope()
  local node = vim.treesitter.get_node()
  local scopes = {}

  while node do
    local label = scope_types[node:type()]
    if label then
      -- Get the name child node
      local name_node = node:field("name")[1] or node:field("declarator")[1]
      if name_node then
        local name = vim.treesitter.get_node_text(name_node, 0)
        -- For functions, extract just the name from declarator
        name = name:match("^([%w_:~]+)") or name
        table.insert(scopes, 1, label .. " " .. name)
      end
    end
    node = node:parent()
  end

  local result = #scopes > 0 and table.concat(scopes, " > ") or "Global scope"
  print(result)
  return result
end

function M.setup()
  vim.keymap.set("n", "<leader>cs", M.get_current_cpp_scope, { desc = "Show C++ scope" })
end

return M
