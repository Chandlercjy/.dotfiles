" ==============================
" 个性化设定
" ==============================

let g:startify_bookmarks = [
            \ { 'p': '~/Documents/PycharmProjects/junk.py' },
            \ { 'c': '~/Documents/CLionProjects/junk.cpp' },
            \ { 'la': '~/Documents/PycharmProjects/chandler_algorithms/leetcode/array' },
            \ ]


" ==============================
" 临时测试中的设定
" ==============================
nmap <Space>o :FZF ~/Documents/PycharmProjects/OnePy/<CR>
"nmap <Space>o :FZF ~/Downloads/OnePy-master/<CR>
nmap <Space>p :FZF ~/Documents/CLionProjects/OnePyPlus<CR>
nmap <Space>k :FZF ~/Documents/CLionProjects/test_python_boost<CR>


" 快速编译
"nmap <leader>1 :wa<CR>:AsyncRun -raw cd ~/Documents/CLionProjects/OnePyPlus/src/ && clang -std=c++17 -Wall  main.cpp -o ./main && ./main<CR>
nmap <leader>1 :wa<CR>:AsyncRun -raw cd ~/Documents/CLionProjects/OnePyPlus/build && cmake .. && make && ../bin/demo_OnePy<CR>
nmap <leader>2 :wa<CR>:AsyncRun -raw cd ~/Documents/CLionProjects/OnePyPlus/build && cmake .. && make && ../bin/test_OnePy<CR>
nmap <leader>3 :wa<CR>:AsyncRun -raw cd ~/Documents/CLionProjects/OnePyPlus/build && cmake .. && make && python ../lib/main.py<CR>
"nmap <leader>3 :wa<CR>:AsyncRun -raw cd ~/Documents/CLionProjects/OnePyPlus/ && clang++ -std=c++17 -Wall -g -I ./include/  main.cpp -o ./main && ./main<CR>
nmap <leader>4 :wa<CR>:AsyncRun -raw cd ~/Documents/PycharmProjects/OnePy/tests/ && pytest<CR>
nmap <leader>5 :wa<CR>:AsyncRun -raw cd ~/Documents/CLionProjects/boost-python-examples/ && make<CR>
nmap <leader>6 :wa<CR>:AsyncRun -raw cd ~/Documents/CLionProjects/test_python_boost/build && cmake .. && make && python ../lib/main.py<CR>
nmap <leader>7 :wa<CR>:AsyncRun -raw cd ~/CLionProjects/untitled/build && cmake .. && make && ../bin/main<CR>


set makeprg=gcc\ -std=c++17\ -Wall\ -omain\ main.cpp

"let g:asyncrun_rootmarks = ['.git', '.root']
"set tags=./tags;,tags
"let g:gen_tags#gtags_default_map = 0


nmap <F8> :SSave! default<CR>
nmap <F9> :SLoad default<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" unmap from easymotion
"unmap <C-i>
"
