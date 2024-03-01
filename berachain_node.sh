#!/bin/bash

# Define the bin file's name
BIN_FILE="github_install_script"

# Create the bin file and grant execution permission
cat <<EOF > $BIN_FILE
#!/bin/bash

# Function to execute a command with feedback
execute_command() {
    echo "Executing: \$1"
    \$1
    sleep 2 # Adding a delay for better readability
}

# Update and upgrade packages
execute_command "apt-get update && sudo apt-get upgrade -y"

# Install dependencies
execute_command "apt-get install git make screen jq -y"

# Download and install Go
execute_command "wget https://golang.org/dl/go1.21.4.linux-amd64.tar.gz"
execute_command "tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz"
execute_command "export PATH=\$PATH:/usr/local/go/bin"
execute_command "go version"

# Install Foundry
execute_command "curl -L https://foundry.paradigm.xyz | bash"
execute_command "source /root/.bashrc"
execute_command "foundryup"

# Clone Polaris repository
execute_command "cd \$HOME"
execute_command "git clone https://github.com/berachain/polaris"
execute_command "cd polaris"
execute_command "git checkout main"

# Start application
execute_command "make start"

echo "Installation completed successfully."
EOF

# Grant execution permission to the bin file
chmod +x $BIN_FILE

echo "Installation script '$BIN_FILE' created."

