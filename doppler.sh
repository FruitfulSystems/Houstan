echo "Installing Doppler"
# Install pre-reqs
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

# Add Doppler's GPG key and apt Repo | install Doppler cli
curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' | sudo apt-key add -
echo "deb https://packages.doppler.com/public/cli/deb/debian any-version main" | sudo tee /etc/apt/sources.list.d/doppler-cli.list
sudo apt-get update && sudo apt-get install -y doppler

# Setup Doppler 
export HISTIGNORE='doppler*'
echo ${DOPPLER_PERSONAL_TOKEN} | doppler configure set token --scope ./
find -name doppler.yaml -execdir doppler setup --no-interactive  \;