" Maintainer:    Sergey Silaev
" Last Change:   2025-11-16
" Version:       1.0
" Description:   Minimalist sesav color scheme

set background=dark
highlight clear
highlight clear CursorLineNr

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'sesav'

" Palette
  "let s:bg = '#322d39'
"let s:bg       = '#1f1a23'
let s:bg       = '#26222a'
let s:bg_light = '#2a2a2a'
let s:bg_popup = '#1f1c23'
let s:fg       = '#c7c7c7'
let s:fg_white = '#ffffff' 
let s:accent   = '#88b88e'
let s:purple   = '#ab83ba'
let s:yellow   = '#d9c362'
let s:subtle   = '#4a4a4a'

" Editor
exe 'hi Normal guifg=' . s:fg . ' guibg=' . s:bg
exe 'hi Cursor guibg=' . s:fg . ' guifg=' . s:bg
exe 'hi CursorLine guibg=' . s:bg_light
exe 'hi LineNr guifg=' . s:subtle
exe 'hi CursorLineNr guifg=' . s:accent . ' guibg=' . s:bg_light
exe 'hi VertSplit guifg=' . s:subtle
exe 'hi ColorColumn guibg=' . s:bg_light
exe 'hi SignColumn guibg=' . s:bg

" UI
exe 'hi StatusLine guifg=' . s:fg . ' guibg=' . s:bg_light
exe 'hi StatusLineNC guifg=' . s:purple . ' guibg=' . s:bg_light
exe 'hi Pmenu guifg=' . s:fg . ' guibg=' . s:bg_popup
exe 'hi PmenuSel guifg=' . s:fg_white . ' guibg=' . s:purple . ' gui=bold'
exe 'hi PmenuSbar guibg=' . s:bg_popup
exe 'hi PmenuThumb guibg=' . s:subtle
exe 'hi FloatBorder guifg=' . s:accent . ' guibg=' . s:bg_popup
exe 'hi NormalFloat guifg=' . s:fg . ' guibg=' . s:bg_popup
exe 'hi TabLine guifg=' . s:purple . ' guibg=' . s:bg_light
exe 'hi TabLineSel guifg=' . s:fg . ' guibg=' . s:bg
exe 'hi TabLineFill guibg=' . s:bg_light

" Visual & Search
exe 'hi Visual guibg=' . s:subtle
exe 'hi Search guifg=' . s:bg . ' guibg=' . s:yellow
exe 'hi IncSearch guifg=' . s:bg . ' guibg=' . s:yellow . ' gui=bold'
exe 'hi MatchParen guifg=' . s:accent . ' guibg=' . s:bg_light . ' gui=bold'

" Folding
exe 'hi Folded guifg=' . s:purple . ' guibg=' . s:bg_light
exe 'hi FoldColumn guifg=' . s:purple

" Diff
exe 'hi DiffAdd guifg=' . s:accent
exe 'hi DiffChange guifg=' . s:purple
exe 'hi DiffDelete guifg=' . s:subtle
exe 'hi DiffText guifg=' . s:purple . ' guibg=' . s:bg_light . ' gui=bold'

" Messages
exe 'hi ModeMsg guifg=' . s:accent
exe 'hi MoreMsg guifg=' . s:accent
exe 'hi Question guifg=' . s:accent
exe 'hi WarningMsg guifg=' . s:purple . ' gui=bold'
exe 'hi ErrorMsg guifg=' . s:fg . ' guibg=' . s:bg_light . ' gui=bold'

" Misc
exe 'hi NonText guifg=' . s:subtle
exe 'hi SpecialKey guifg=' . s:subtle
exe 'hi Directory guifg=' . s:accent
exe 'hi Title guifg=' . s:purple . ' gui=bold'

" Syntax
exe 'hi Comment guifg=' . s:accent . ' gui=italic'
exe 'hi String guifg=' . s:purple
exe 'hi Function guifg=' . s:accent
exe 'hi Type guifg=' . s:accent
exe 'hi Delimiter guifg=' . s:purple
exe 'hi Statement guifg=' . s:purple . ' gui=NONE'
exe 'hi Keyword guifg=' . s:yellow . ' gui=NONE'
exe 'hi Constant guifg=' . s:purple . ' gui=NONE'
exe 'hi Identifier guifg=' . s:accent . ' gui=NONE'
exe 'hi PreProc guifg=' . s:accent . ' gui=NONE'
exe 'hi Special guifg=' . s:yellow . ' gui=NONE'
