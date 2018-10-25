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
nmap <Space>po :FZF ~/Documents/PycharmProjects/OnePy/<CR>
nmap <Space>pp :FZF ~/Documents/CLionProjects/OnePyPlus<CR>
nmap <Space>pk :FZF ~/Documents/CLionProjects/test_python_boost<CR>
nmap <Space>pd :FZF ~/Documents/demo_files<CR>
nmap <Space>pc :FZF ~/Documents/Chandler_Notes<CR>

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

" set makeprg=gcc\ -std=c++17\ -Wall\ -omain\ main.cpp


" 通用快捷键
" ==============================
" 打开emacs配置文件
nmap <Space>e :FZF ~/.emacs.d<CR>

" FZF搜索文件
nmap <C-p> :FZF ~/Documents/<CR>


