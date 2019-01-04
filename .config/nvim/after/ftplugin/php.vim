setlocal foldmethod=manual

EnableFastPHPFolds

autocmd! BufWritePost * EnableFastPHPFolds
