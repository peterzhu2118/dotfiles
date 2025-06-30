update-discord() {
  echo -e "Killing Discord"
  # Killing all Discord processes.
  for KILLPID in `ps ax | grep Discord | awk ' { print $1;}'`; do
    kill -9 $KILLPID &> /dev/null
  done
  echo -e "Downloading latest version"
  # Pulling current version
  wget "https://discordapp.com/api/download?platform=linux&format=deb" -O /tmp/discord.deb > /dev/null 2>&1
  echo -e "Installing Discord"
  # Installing current version of Discord
  sudo dpkg -i /tmp/discord.deb > /dev/null
  # Removing temp .deb file
  rm -rf /tmp/discord.deb > /dev/null
  echo -e "Finished"
}
