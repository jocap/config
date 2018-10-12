# vi: ft=sh

# login shell

if [ -x /usr/bin/ssh-agent -a -z "${SSH_AGENT_PID}" ]; then
	eval $(ssh-agent -s)
fi

echo $KSH_VERSION | grep 'PD KSH' && export ENV="$HOME/.kshrc"
