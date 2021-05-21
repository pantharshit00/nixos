" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "C:\\Users\\harshit\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\harshit\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\harshit\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\harshit\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\harshit\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["emmet-vim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\emmet-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim"
  },
  kommentary = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\kommentary"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim"
  },
  ["night-owl.vim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\night-owl.vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-bqf"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-compe"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspinstall"
  },
  ["nvim-miniyank"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-miniyank"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter-refactor"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"
  },
  playground = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\rust-tools.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\undotree"
  },
  vim = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-bbye"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-floaterm"
  },
  ["vim-graphql"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-graphql"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-matchup"
  },
  ["vim-prisma"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-prisma"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-rooter"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip-integ"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-wakatime"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vista.vim"
  },
  ["vscode-es7-javascript-react-snippets"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vscode-es7-javascript-react-snippets"
  },
  ["vscode-rust"] = {
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vscode-rust"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "C:\\Users\\harshit\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\which-key.nvim"
  }
}

time("Defining packer_plugins", false)
-- Config for: trouble.nvim
time("Config for trouble.nvim", true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time("Config for trouble.nvim", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: which-key.nvim
time("Config for which-key.nvim", true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time("Config for which-key.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
