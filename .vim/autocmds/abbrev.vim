inoremap ,mtt Fe\textsubscript{3}O\textsubscript{4}
iabbrev mtt Fe\textsubscript{3}O\textsubscript{4} 
iabbrev peel  FeBCC-FeO2term-PEEL 
inoremap ,mod Modelización  
inoremap ,hoy <Esc>:read !echo $HOY<CR>0i<BS><Esc>A
nnoremap ,o i<CR><Esc>
"python comments quick
inoremap ,pc #MDF-COMMENT
"matlab comments quick
inoremap ,mc %MDF-COMMENT
"debug stop for python
inoremap ,pdb pdb.set_trace()
nnoremap ,opr yiwi_<ESC>}i<CR><TAB>@property<CR>def <ESC>pa(self):<CR>return self._<ESC>po<CR>@<ESC>pa.setter<CR>def <ESC>pa(self, value):<CR>""" """<CR>self._<ESC>pa = value<ESC>o<C-O>

