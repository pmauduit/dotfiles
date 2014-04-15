set bg=dark
syn on
filetype plugin indent on   " Useful plugins
set wildmode=list:longest,full
set showcmd                 " Useful live command status
set ruler                   " Useful highlightned status line
set laststatus=2

set autoindent              " Autoindentation refering to the previous line
set smartindent             " Syntax auto indent, ie following braces...
set expandtab               " Tabs with spaces, not tabs
set smarttab                " After a blank line, reset the autoindentation
set softtabstop=2           " One tab equals to two spaces
set shiftwidth=2    


function! ShortTabLine()
    let ret = ''
    for i in range(tabpagenr('$'))
  "Select the color group for highlighting active tab
  if i + 1 == tabpagenr()
      let ret .= '%#errorMsg#'
  else
      let ret .= '%#TabLine#'
  endif

  "Find the buffername for the tablabel
  let buflist = tabpagebuflist(i+1)
  let winnr = tabpagewinnr(i+1)
  let buffername = bufname(buflist[winnr - 1])
  let filename = fnamemodify(buffername, ':t')
  "Check if there is no name
  if filename == ''
      let filename = 'noname'
  endif
  "Only show the first 18 letters of the name and
  ".. if the filename is more than 20 letters long
  if strlen(filename) >= 8
      let ret .= '['.filename[0:10].'..]'
  else
      let ret .= '['.filename.']'
  endif
    endfor

    "After the last tab fill with TabLineFill and reset tab page #
    let ret .= '%#TabLineFill#%T'
    return ret
endfunction

set tabline=%!ShortTabLine()

set listchars=tab:██

set list

hi NonText ctermfg=1
hi SpecialKey ctermfg=1

autocmd BufWritePre *.py :%s/\s\+$//e
