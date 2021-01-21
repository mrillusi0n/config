function fish_prompt
    if test $status -ne 0
        set_color red
    else
        set_color blue
    end
    echo -n "><> "
    set_color normal
end

function fish_right_prompt
	set_color cyan
    basename (prompt_pwd)
    set_color normal
end
