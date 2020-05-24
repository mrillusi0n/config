function fish_prompt
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
end

function fish_right_prompt
    basename (prompt_pwd)
end
