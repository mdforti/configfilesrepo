function! GenerateText(text)
    " Define how to handle output from the job
    function! s:JobHandler(channel, message)
        " Append output directly into the current buffer or handle as needed
        call append(line('.'), a:message)
    endfunction

    " Start the AI script as a background job
    let s:job = job_start(['python3', '/home/mariano/ai_script.py'], {'in_io': 'pipe',
		 \ 'out_io': 'buffer',
		 \ 'out_name': 'ai_output',
		 \ 'out_cb': 's:JobHandler',
		 \})

    " Send text to the job and close the input stream
    call job_send(s:job, [a:text . "\n"])
    call job_send(s:job, [''])  " Send an empty string to indicate EOF to the Python script
endfunction

" Custom command to use the function
command! -nargs=1 AIWrite call GenerateText(<q-args>)

