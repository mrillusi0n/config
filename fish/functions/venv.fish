function venv --description "<name of the virtual env>"
	set venv_home "$HOME/venv"
	echo "Choosing Python Virtual Env: $venv_home/$argv[1]/bin/activate.fish"
	source "$venv_home/$argv[1]/bin/activate.fish"
end
