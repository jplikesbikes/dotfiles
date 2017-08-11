# Windows
I don't use tabs

+ `<c-h>`, `<c-j>`, `<c-k>`, `<c-l>` move to window left, down, up, right
+ `<c-w>s` split current window horizontally `<c-w>v` split current window vertically
+ `<c-w>q` close current window

# Movement

+ `h`, `j`, `k`, `l` -> left, down, up, right

# Search

+ `f` forward `F` backward char search on line
+ `/` forward `?` backward multiline regex search

# Coding help

## Ctrl-p
<https://ctrlpvim.github.io/ctrlp.vim/>

+ `<c-p>` ctrl-p to fuzzy search filenames
+ `<c-b>` calls ctrl-p's `:CtrlPBuffer` to search open buffers

## Git-Gutter
<https://github.com/airblade/vim-gitgutter>

+ `\hp` preview hunk changes
+ `\hu` undo hunk changes
+ `]c` jump to next hunk (change)
+ `[c` jump to previous hunk (change)

## vim.surround
`:h surround` <https://github.com/tpope/vim-surround>

+ `cs` change surround example `cs'"` 'hello' -> "hello"
+ `ds` delete surround example `ds"` "hello" -> hello
+ `ys` you surround example `ys }` hello -> { hello }

## vim.commentary
`:h commentary` <https://github.com/tpope/vim-commentary>

+ `gc{motion}` Comment or uncomment lines that {motion} moves over
+ `gcc` Comment or uncomment [count] lines
+ `{Visual}gc` Comment or uncomment the highlighted lines

## Projectionist
Plug 'tpope/vim-projectionist'

## Json
Plug 'tpope/vim-jdaddy'

## File contents search
Plug 'mhinz/vim-grepper'

## JSdoc
Plug 'heavenshell/vim-jsdoc'
Plug 'pangloss/vim-javascript'

# Keep Window Buffer Delete
Plug 'rgarver/Kwbd.vim'
@todo: give better mapping

Plug 'scrooloose/nerdtree'

# Helpers
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'digitaltoad/vim-pug'
Plug 'Raimondi/delimitMate'
 - setup *'delimitMate_insert_eol_marker'*
 
# checkout
https://github.com/tpope/vim-vinegar
https://github.com/tpope/vim-obsession

