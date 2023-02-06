if exists('g:loaded_translate')
  finish
endif

" let g:vim_translate_lang = 'en:tr'

" Define a function for translating the word under the cursor
function! translate#TranslateWord() abort

  if !exists('g:vim_translate_lang')
	  echoerr 'please set g:vim_translate_lang variable'
	  return
  endif
  " Save the word under the cursor in a register
  normal! "zyiw

  " Use the 'translate-shell' command to translate the word
  " from English to Spanish and save the result in a register
  let result = system('trans -b '. g:vim_translate_lang.' "'.@z.'"')

  " Replace the word under the cursor with the translation
  exe 'normal! evbc'.result
endfunction

function! translate#TranslateWordSelected() abort

  if !exists('g:vim_translate_lang')
	  echoerr 'please set g:vim_translate_lang variable'
	  return
  endif

  " Save the word under the cursor in a register
  normal! cis

  " Use the 'translate-shell' command to translate the word
  " from English to Spanish and save the result in a 
  let result = system('trans -b '.g:vim_translate_lang.' "'.@".'"')

  normal! gv

  " Replace the word under the cursor with the translation
  exe 'normal! c'.result
endfunction

" Map the function to a key so that it can be easily invoked
" noremap <Leader>t :call translate#TranslateWord()<CR>
" xnoremap <Leader>t :call translate#TranslateWordSelected()<CR>
" vnoremap <Leader>t :call translate#TranslateWordSelected()<CR>

let g:loaded_translate = 1
