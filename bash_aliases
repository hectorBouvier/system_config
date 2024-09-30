shopt -s expand_aliases
loop_dinosync(){ while [[ 1=1 ]] ; do watch -d -t -g ls -lR && rsync -a --exclude=".git" ./ -e ssh hbouvier@dinostrate://home/ldap/"$1"/ ; done }
dinosync(){ rsync -a --exclude=".git" ./ -e ssh hbouvier@dinostrate://home/ldap/"$1"/ ;}
alias di='cd /home/hbouvier/Documents/optinet/ && source venv/bin/activate'
alias pm='python main.py --param'
alias op='cd /home/hbouvier/Documents/laposte-optimisation-colis-transport-poc/assets/devenv && docker login docker.code.probayes.net -u "Hector Bouvier" -p my_hash && ./run.sh'
alias rh='cd /home/hbouvier/Documents/planification-rh'
alias nav='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias update='sudo apt update && sudo apt upgrade -y && sudo snap refresh && cargo install-update -a'
alias die='shutdown -h now'
alias getcompdb='cd release; cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..'
alias gdb-ctest='/home/hbouvier/.script/gdb-ctest'
alias pd='ipython -i -c "import pandas as pd"'
alias ide='vim -c "if filereadable(\".vimrc\") | source .vimrc | endif" $(git ls-files --recurse-submodules | grep -e "\.h$" -e "\.cpp$" -e "\.py$")'
alias sclk='sudo systemctl restart systemd-timesyncd.service'
alias bp='bpython'
alias cclf='ssh ubuntu@optimnet-out-cclf'
alias dpd='ssh ubuntu@optimnet-out-preprod'
alias auth='oathtool --totp --base32 --digits=6'
alias syncslot='dinosync hbouvier/optistow_slot_planning'
alias altsyncslot='dinosync hbouvier/alt_optistow_slot_planning'
full_test(){ PREPROC="$1"; OPTINET="$2"; cd preprocessing; python main.py --param "../$PREPROC"; cd ..; python preproc_to_optinet.py --preproc "$PREPROC" --optinet "$OPTINET"; python main.py --param "$OPTINET"; }
eval $(thefuck --alias)
