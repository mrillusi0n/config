function fish_prompt
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
end

function fish_right_prompt
    if test ! $status -eq 0
        set_color red
    else
        set_color blue
    end
    basename (prompt_pwd)
    set_color normal
end
