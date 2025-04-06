/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

git clone https://github.com/prajwalrajup/macStartupAnsible.git

// Prompts to install developer tools

python3 -m venv ansible-env
source ansible-env/bin/activate
pip install ansible
