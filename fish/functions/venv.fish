function venv --description "<path to the virtual env>"
	set VIRTUAL_ENVS "$HOME/venv"
	echo "Choosing Python Virtual Env: $VIRTUAL_ENVS/$argv[1]/bin/activate.fish"
	source "$VIRTUAL_ENVS/$argv[1]/bin/activate.fish"
end
