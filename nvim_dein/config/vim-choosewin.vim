"" ===================== vim-choosewin ======================
   " use overlay feature
   let g:choosewin_overlay_enable = 1

   " workaround for the overlay font being broken on mutibyte buffer.
   let g:choosewin_overlay_clear_multibyte = 1

   " tmux-like overlay color
   let g:choosewin_color_overlay = {
               \ 'gui': ['DodgerBlue3', 'DodgerBlue3'],
               \ 'cterm': [25, 25]
               \ }
   let g:choosewin_color_overlay_current = {
               \ 'gui': ['firebrick1', 'firebrick1'],
               \ 'cterm': [124, 124]
               \ }

   let g:choosewin_blink_on_land      = 0 " don't blink at land
   let g:choosewin_statusline_replace = 0 " don't replace statusline
   let g:choosewin_tabline_replace    = 0 " don't replace tabline


   " +-----+-----------+----------------------------+
   " | Key | Action    | Description                |
   " +=====+===========+============================+
   " | 0   | tab_first | Select FIRST  tab          |
   " | [   | tab_prev  | Select PREVIOUS tab        |
   " | ]   | tab_next  | Select NEXT tab            |
   " | $   | tab_last  | Select LAST tab            |
   " | x   | tab_close | Close current tab          |
   " | ;   | win_land  | Navigate to current window |
   " | -   | previous  | Naviage to previous window |
   " | s   | swap      | Swap windows #1            |
   " | S   | swap_stay | Swap windows but stay #1   |
   " +-----+-----------+----------------------------+

