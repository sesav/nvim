" Vim color file
" Name:         Synthe Color Scheme
" Maintainer:   Sergey Silaev <hello@8am.dev>
" Initial:      2025-11-16
" Home page:    https://github.com/sesav/synthe-theme/
"
" Description: A Vim theme dripping in neon greens and electric purples. Built
" for hackers who code at medium brightness, and actually take a lot of notes or
" write documentation.

set background=dark
highlight clear
highlight clear CursorLineNr

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'synthe'

" GUI Palette
let s:bg       = '#26222a'
let s:bg_light = '#2a2a2a'
let s:bg_popup = '#1f1c23'
let s:fg       = '#c7c7c7'
let s:fg_white = '#ffffff'
let s:accent   = '#88b88e'
let s:purple   = '#ab83ba'
let s:yellow   = '#d9c362'
let s:subtle   = '#4a4a4a'

" Terminal (cterm) color mappings
" Using 256-color palette approximations
let s:cterm_bg       = '235'  " closest to #26222a
let s:cterm_bg_light = '235'  " closest to #2a2a2a
let s:cterm_bg_popup = '234'  " closest to #1f1c23
let s:cterm_fg       = '251'  " closest to #c7c7c7
let s:cterm_fg_white = '15'   " white
let s:cterm_accent   = '108'  " closest to #88b88e (green)
let s:cterm_purple   = '139'  " closest to #ab83ba
let s:cterm_yellow   = '179'  " closest to #d9c362
let s:cterm_subtle   = '239'  " closest to #4a4a4a

" Helper function to set highlight with both GUI and terminal colors
function! s:Hi(group, guifg, guibg, ctermfg, ctermbg, attr)
  let l:cmd = 'hi ' . a:group
  if a:guifg != ''
    let l:cmd .= ' guifg=' . a:guifg
  endif
  if a:guibg != ''
    let l:cmd .= ' guibg=' . a:guibg
  endif
  if a:ctermfg != ''
    let l:cmd .= ' ctermfg=' . a:ctermfg
  endif
  if a:ctermbg != ''
    let l:cmd .= ' ctermbg=' . a:ctermbg
  endif
  if a:attr != ''
    let l:cmd .= ' gui=' . a:attr . ' cterm=' . a:attr
  endif
  exe l:cmd
endfunction

" Editor
call s:Hi('Normal',       s:fg,       s:bg,       s:cterm_fg,       s:cterm_bg,       '')
call s:Hi('Cursor',       s:bg,       s:fg,       s:cterm_bg,       s:cterm_fg,       '')
call s:Hi('CursorLine',   '',         s:bg_light, 'NONE',           s:cterm_bg_light, '')
call s:Hi('LineNr',       s:subtle,   '',         s:cterm_subtle,   'NONE',           '')
call s:Hi('CursorLineNr', s:accent,   s:bg_light, s:cterm_accent,   s:cterm_bg_light, '')
call s:Hi('VertSplit',    s:subtle,   '',         s:cterm_subtle,   'NONE',           '')
call s:Hi('ColorColumn',  '',         s:bg_light, 'NONE',           s:cterm_bg_light, '')
call s:Hi('SignColumn',   '',         s:bg,       'NONE',           s:cterm_bg,       '')

" UI
call s:Hi('StatusLine',   s:fg,       s:bg_light, s:cterm_fg,       s:cterm_bg_light, '')
call s:Hi('StatusLineNC', s:purple,   s:bg_light, s:cterm_purple,   s:cterm_bg_light, '')
call s:Hi('Pmenu',        s:fg,       s:bg_popup, s:cterm_fg,       s:cterm_bg_popup, '')
call s:Hi('PmenuSel',     s:fg_white, s:purple,   s:cterm_fg_white, s:cterm_purple,   'bold')
call s:Hi('PmenuSbar',    '',         s:bg_popup, 'NONE',           s:cterm_bg_popup, '')
call s:Hi('PmenuThumb',   '',         s:subtle,   'NONE',           s:cterm_subtle,   '')
call s:Hi('FloatBorder',  s:accent,   s:bg_popup, s:cterm_accent,   s:cterm_bg_popup, '')
call s:Hi('NormalFloat',  s:fg,       s:bg_popup, s:cterm_fg,       s:cterm_bg_popup, '')
call s:Hi('TabLine',      s:purple,   s:bg_light, s:cterm_purple,   s:cterm_bg_light, '')
call s:Hi('TabLineSel',   s:fg,       s:bg,       s:cterm_fg,       s:cterm_bg,       '')
call s:Hi('TabLineFill',  '',         s:bg_light, 'NONE',           s:cterm_bg_light, '')

" Visual & Search
call s:Hi('Visual',       '',         s:subtle,   'NONE',           s:cterm_subtle,   '')
call s:Hi('Search',       s:bg,       s:yellow,   s:cterm_bg,       s:cterm_yellow,   '')
call s:Hi('IncSearch',    s:bg,       s:yellow,   s:cterm_bg,       s:cterm_yellow,   'bold')
call s:Hi('MatchParen',   s:accent,   s:bg_light, s:cterm_accent,   s:cterm_bg_light, 'bold')

" Folding
call s:Hi('Folded',       s:purple,   s:bg_light, s:cterm_purple,   s:cterm_bg_light, '')
call s:Hi('FoldColumn',   s:purple,   '',         s:cterm_purple,   'NONE',           '')

" Diff
call s:Hi('DiffAdd',      s:accent,   '',         s:cterm_accent,   'NONE',           '')
call s:Hi('DiffChange',   s:purple,   '',         s:cterm_purple,   'NONE',           '')
call s:Hi('DiffDelete',   s:subtle,   '',         s:cterm_subtle,   'NONE',           '')
call s:Hi('DiffText',     s:purple,   s:bg_light, s:cterm_purple,   s:cterm_bg_light, 'bold')

" Messages
call s:Hi('ModeMsg',      s:accent,   '',         s:cterm_accent,   'NONE',           '')
call s:Hi('MoreMsg',      s:accent,   '',         s:cterm_accent,   'NONE',           '')
call s:Hi('Question',     s:accent,   '',         s:cterm_accent,   'NONE',           '')
call s:Hi('WarningMsg',   s:purple,   '',         s:cterm_purple,   'NONE',           'bold')
call s:Hi('ErrorMsg',     s:fg,       s:bg_light, s:cterm_fg,       s:cterm_bg_light, 'bold')

" Misc
call s:Hi('NonText',      s:subtle,   '',         s:cterm_subtle,   'NONE',           '')
call s:Hi('SpecialKey',   s:subtle,   '',         s:cterm_subtle,   'NONE',           '')
call s:Hi('Directory',    s:accent,   '',         s:cterm_accent,   'NONE',           '')
call s:Hi('Title',        s:purple,   '',         s:cterm_purple,   'NONE',           'bold')

" Syntax
call s:Hi('Comment',      s:accent,   '',         s:cterm_accent,   'NONE',           'italic')
call s:Hi('String',       s:purple,   '',         s:cterm_purple,   'NONE',           '')
call s:Hi('Function',     s:accent,   '',         s:cterm_accent,   'NONE',           '')
call s:Hi('Type',         s:accent,   '',         s:cterm_accent,   'NONE',           '')
call s:Hi('Delimiter',    s:purple,   '',         s:cterm_purple,   'NONE',           '')
call s:Hi('Statement',    s:purple,   '',         s:cterm_purple,   'NONE',           'NONE')
call s:Hi('Keyword',      s:yellow,   '',         s:cterm_yellow,   'NONE',           'NONE')
call s:Hi('Constant',     s:purple,   '',         s:cterm_purple,   'NONE',           'NONE')
call s:Hi('Identifier',   s:accent,   '',         s:cterm_accent,   'NONE',           'NONE')
call s:Hi('PreProc',      s:accent,   '',         s:cterm_accent,   'NONE',           'NONE')
call s:Hi('Special',      s:yellow,   '',         s:cterm_yellow,   'NONE',           'NONE')

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim
