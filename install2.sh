if [ ! -f "`which yadm`" ]; then
  echo 'Installing YADM'
  git clone https://github.com/TheLocehiliosan/yadm.git ~/.yadm-project
  ln -s ~/.yadm-project/yadm ~/usr/local/bin/yadm
else
  echo 'Updating YADM'
  cd ~/.yadm-project
  git pull
fi