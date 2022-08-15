"" Make sure that the plugin is not loaded more than once
if exists("g:loaded_hybrid_relative_numbers")
    finish
endif
let g:loaded_hybrid_relative_numbers = 1

"" TODO(hector): What's the minimum required version
""   for using this?
if !has('nvim-0.7')
    echohl WarningMsg
    echom "HybridRelativeNumbers needs Neovim >= 0.8"
    echohl None
    finish
endif

command! -bar HybridLineNumbersOn lua require("hybrid-relative-numbers").activate_number_toggle()
command! -bar HybridLineNumbersOff lua require("hybrid-relative-numbers").deactivate_number_toggle()
