" Dump leader mappings by first key after <leader>
command! DumpLeaderFamilies call DumpLeaderFamilies()

function! DumpLeaderFamilies()
  " Get all normal-mode leader mappings
  redir => output
  silent verbose nmap <leader>
  redir END

  " Split output into lines
  let lines = split(output, "\n")

  " Loop over each line
  for line in lines
    " Skip empty lines
    if empty(line)
      continue
    endif

    " Try to extract the first key after <leader>
    " Match something like '<leader>a', '<leader>A', etc.
    let m = matchlist(line, '\v<leader>(.)')
    if !empty(m)
      let key = m[1]
      " Clean filename: map upper/lower letters separately
      let fname = expand('~/leader_family_'.key.'.txt')
      " Append this mapping line to the file
      call writefile([line], fname, 'a')
    endif
  endfor

  echom "Leader mappings dumped into family files (a-z, A-Z, etc.)"
endfunction
