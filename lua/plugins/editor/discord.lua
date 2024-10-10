return {
  "IogaMaster/neocord",

  name = "Neocord",

  event = "VeryLazy",

  config = function()
    require("neocord").setup({
      client_id = "445957680729817088"
    })
end
}
