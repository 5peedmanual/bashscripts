uinfo() #@ USAGE: uinfo file
{
printf "%12s: %s\n" \
	USER	"${USER:-No value assigned}" \
	PWD	"${PWD:-No value assigned}" \
	COLUMNS "${COLUMNS:-No value assigned}" \
	LINES	"${LINES:-No value assigned}" \
	SHELL	"${SHELL:-No value assigned}" \
	HOME	"${HOME:-No value assigned}" \
	TERM	"${TERM:-No value assigned}"
} > ${1:-/dev/fd/1}

uinfo



# mkdir bin
# PATH=$PATH:$HOME/bin
# bash bin/hw
# chmod
# $ hw
