"
" Fruity Color Scheme
" ===================
"
" Author:   Armin Ronacher <armin.ronacher@active-4.com>
" Version:  0.2
"
" Modified By: Daniel Shapiro
"
set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "danielcolor"

" Default Colors
hi Normal       guifg=#ffffff   guibg=#000000
hi NonText      guifg=#444444   guibg=#000000
hi Cursor       guibg=#aaaaaa
hi lCursor      guibg=#aaaaaa

" Search
hi Search       guifg=#800000   guibg=#ffae00
hi IncSearch    guifg=#800000   guibg=#ffae00

" Window Elements
hi StatusLine   guifg=#000000   guibg=#8090a0   gui=bold
hi StatusLineNC guifg=#506070   guibg=#a0b0c0
hi VertSplit    guifg=#a0b0c0   guibg=#a0b0c0
hi Folded       guifg=#111111   guibg=#8090a0
hi FoldColumn   guibg=grey guifg=red gui=bold
hi IncSearch    guifg=#708090   guibg=#f0e68c
hi Pmenu        guifg=#ffffff   guibg=#10375E
hi PmenuSel     guifg=#000000
hi SignColumn   guibg=#111111
hi CursorLine   guibg=#000000
hi LineNr       guifg=#aaaaaa   guibg=#222222

" Specials
hi Todo         guifg=#e50808   guibg=#520000   gui=bold
hi Title        guifg=#ffffff                   gui=bold
hi Special      guifg=#fd8900

" Syntax Elements
hi String       guifg=#0086d2
hi Constant     guifg=#0086d2
hi Number       guifg=#0086f7                   gui=bold
hi Statement    guifg=#fb660a                   gui=bold
hi Function     guifg=#ff0086                   gui=bold
hi PreProc      guifg=#ff0007                   gui=bold
hi Comment      guifg=#00d2ff   guibg=#000000   gui=italic
hi Type         guifg=#cdcaa9                   gui=bold
hi Error        guifg=#ffffff   guibg=#ab0000
hi Identifier   guifg=#ff0086                   gui=bold
hi Label        guifg=#ff0086

" Python Highlighting for python.vim
hi pythonCoding guifg=#ff0086
hi pythonRun    guifg=#ff0086
hi pythonBuiltinObj     guifg=#2b6ba2           gui=bold
hi pythonBuiltinFunc    guifg=#2b6ba2           gui=bold
hi pythonException      guifg=#ee0000           gui=bold
hi pythonExClass        guifg=#66cd66           gui=bold
hi pythonSpaceError     guibg=#270000
hi pythonDocTest    guifg=#2f5f49
hi pythonDocTest2   guifg=#3b916a
hi pythonFunction   guifg=#FB660A               gui=bold
hi pythonClass      guifg=#ff0086               gui=bold
hi pythonStatement  guifg=#FB660A               gui=bold

" JavaScript Highlighting
hi javaScript                   guifg=#ffffff
hi javaScriptRegexpString       guifg=#aa6600
hi javaScriptDocComment         guifg=#aaaaaa
hi javaScriptCssStyles          guifg=#dd7700
hi javaScriptDomElemFuncs       guifg=#66cd66
hi javaScriptHtmlElemFuncs      guifg=#dd7700
hi javaScriptLabel              guifg=#00bdec   gui=italic
hi javaScriptPrototype          guifg=#00bdec
hi javaScriptConditional        guifg=#ff0007   gui=bold
hi javaScriptRepeat             guifg=#ff0007   gui=bold
hi javaScriptFunction           guifg=#ff0086   gui=bold

" CSS Highlighting
hi cssIdentifier            guifg=#66cd66       gui=bold
hi cssBraces                guifg=#00bdec       gui=bold

" Ruby Highlighting
hi rubyFunction     guifg=#0066bb               gui=bold
hi rubyClass        guifg=#ff0086               gui=bold
hi rubyModule       guifg=#ff0086               gui=bold,underline
hi rubyKeyword      guifg=#008800               gui=bold
hi rubySymbol       guifg=#aa6600
hi rubyIndentifier              guifg=#008aff
hi rubyGlobalVariable           guifg=#dd7700
hi rubyConstant                 guifg=#5894d2   gui=bold
hi rubyBlockParameter           guifg=#66cd66
hi rubyPredefinedIdentifier     guifg=#555555   gui=bold
hi rubyString           guifg=#0086d2
hi rubyStringDelimiter  guifg=#dd7700
hi rubySpaceError       guibg=#270000
hi rubyDocumentation    guifg=#aaaaaa
hi rubyData             guifg=#555555

" XML Highlighting
hi xmlTag           guifg=#00bdec
hi xmlTagName       guifg=#00bdec
hi xmlEndTag        guifg=#00bdec
hi xmlNamespace     guifg=#00bdec                   gui=underline
hi xmlAttribPunct   guifg=#cccaa9                   gui=bold
hi xmlEqual         guifg=#cccaa9                   gui=bold
hi xmlCdata         guifg=#bf0945                   gui=bold
hi xmlCdataCdata        guifg=#ac1446   guibg=#23010c   gui=none
hi xmlCdataStart        guifg=#bf0945                   gui=bold
hi xmlCdataEnd          guifg=#bf0945                   gui=bold

" HTML Highlighting
hi htmlTag          guifg=#00bdec               gui=bold
hi htmlEndTag       guifg=#00bdec               gui=bold
hi htmlSpecialTagName   guifg=#66cd66
hi htmlTagName      guifg=#66cd66
hi htmlTagN         guifg=#66cd66
hi htmlEvent        guifg=#ffffff

" Django Highlighting
hi djangoTagBlock   guifg=#C02FF5   guibg=#000000   gui=bold
hi djangoVarBlock   guifg=#C02FF5   guibg=#000000
hi djangoArgument   guifg=#0086d2   guibg=#000000
hi djangoStatement  guifg=#fb660a   guibg=#000000   gui=bold
hi djangoComment    guifg=#008800   guibg=#002300   gui=italic
hi djangoComBlock   guifg=#008800   guibg=#002300   gui=italic
hi djangoFilter     guifg=#ff0086   guibg=#000000   gui=italic

" Jinja Highlighting
hi jinjaTagBlock    guifg=#ff0007   guibg=#200000   gui=bold
hi jinjaVarBlock    guifg=#ff0007   guibg=#200000
hi jinjaString      guifg=#0086d2   guibg=#200000
hi jinjaNumber      guifg=#bf0945   guibg=#200000   gui=bold
hi jinjaStatement   guifg=#fb660a   guibg=#200000   gui=bold
hi jinjaComment     guifg=#008800   guibg=#002300   gui=italic
hi jinjaFilter      guifg=#ff0086   guibg=#200000
hi jinjaRaw         guifg=#aaaaaa   guibg=#200000
hi jinjaOperator    guifg=#ffffff   guibg=#200000
hi jinjaVariable    guifg=#92cd35   guibg=#200000
hi jinjaAttribute   guifg=#dd7700   guibg=#200000
hi jinjaSpecial     guifg=#008ffd   guibg=#200000

" ERuby Highlighting (for my eruby.vim)
hi erubyRubyDelim   guifg=#2c8a16                   gui=bold
hi erubyComment     guifg=#4d9b3a                   gui=italic

hi DiffAdd gui=bold guibg=green guifg=green
hi DiffChange gui=bold guibg=yellow guifg=yellow
hi DiffText gui=bold guibg=purple guifg=cyan
hi DiffDelete gui=bold guibg=red guifg=red
