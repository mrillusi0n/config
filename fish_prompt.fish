function fish_prompt
    if test $status -ne 0
        echo -n (set_color red)'❯❯❯ '
    else
        echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    end
    set_color normal
end

function fish_right_prompt
    set_color blue
    basename (prompt_pwd)
    set_color normal
end
