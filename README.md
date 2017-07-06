[![Build Status](https://api.travis-ci.org/zerustech/vim-html.svg)](https://travis-ci.org/zerustech/vim-html)

ZerusTech Vim HTML Scripts
================================================
Vim Scripts for HTML. Currently, this repository only contains a refactored
indent script, based on the [work of Andy Wokula][2].

::: info-box note

This project only works with vim8.0 or later version.

:::

Improvements
------------
1. Fixed some bugs
1. Refactored almost everything
1. Reuse indent/css.vim for indenting CSS code inside `<style>...</style>`
   block.
1. Reuse indent/javascript.vim for indenting JavaScript code inside
   `<script>...</script>` block.
1. Support custom block tags and indent methods, so that it can be extended to
   support other templating systems, such as twig.
1. Added detailed comments.

Installation
------------
```bash
$ # Install vim-pathogen
$ cd ~/.vim/bundle
$ git clone  https://github.com/zerustech/vim-html
```

How to Add Custom Comment Tag
-----------------------------
Templating languages may introduce new comment tags on
top of the HTML language. In such case, it is possible to extend the HTML indent
script to support them. Take ``twig`` for example, the following ``ftplugin``
script adds ``{#`` and ``#}`` as a new pair of comment tags to HTML language,
and reuses the standard indent method:
```vim
" This file overrides the default configuration file at $VIMRUNTIME/ftplugin/<&filetype>.vim                             
                                                                                                                         
if exists("b:twig_did_ftplugin")                                                                                         
  finish                                                                                                                 
endif                                                                                                                    
                                                                                                                         
let b:twig_did_ftplugin = 1                                                                                              
                                                                                                                         
" Backup the compatibility options.                                                                                      
let s:save_cpo = &cpo                                                                                                    
                                                                                                                         
setlocal formatoptions-=t " Disables text-wrap for normal text.                                                          
                                                                                                                         
setlocal formatoptions+=croql " Enables text-wrap for comments.                                                          
                                                                                                                         
" Due to issue https://github.com/vim/vim/issues/1696, the middle part of three-piece comments must NOT be blank.        
" After issue #1696 has been fixed, configure three-piece comments to setlocal comments=s:{#,m:\ \ \ \ \ ,el:#}          
setlocal comments+=s1:{#,mb:#,ex:#}                                                                                      
                                                                                                                         
let b:html_indent_custom_block_tags = []                                                                                 
let custom_tag = ['{#', 7, '#}', 'comment', ':,:', '\zs:\ze,\zs:\ze', 's:Alien5']                                        
call add(b:html_indent_custom_block_tags, custom_tag)                                                                    
                                                                                                                         
" Restore the saved compatibility options.                                                                               
let &cpo = s:save_cpo
```

References
----------
* Andy Wokula's [indent/html.vim][2]
* Vim issue [#1696][3]
* The [zerustech/vim-html][5] project
* The [zerustech/vim-twig][6] project

[1]: http://vimdoc.sourceforge.net/htmldoc/uganda.html "The VIM LICENSE"
[2]: http://www.vim.org/scripts/script.php?script_id=2075 "indent/html.vim by Andy Wokula"
[3]: https://github.com/vim/vim/issues/1696 "vim issue #1696"
[4]: https://github.com/tpope/vim-pathogen "pathogen.vim"
[5]: https://github.com/zerustech/vim-html "zerustech/vim-html"
[6]: https://github.com/zerustech/vim-twig "zerustech/vim-twig"

License
-------
The *ZerusTech Terminal Component* is published under the [VIM LICENSE][1].
