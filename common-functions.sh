### Colors
R="\e[31m"
B="\e[34m"
Y="\e[33m"
N="\e[0m"

## Common Functions

### Print Functions
hint() {
	echo -e "➜ Hint: $1$N"
}
info() {
	echo -e " $1$N"
}
#success() {:;}
error() {
	echo -e "${R}✗  $1$N"
}

### Checking Root User or not
CheckRoot() {
LID=$(id -u)
if [ $LID -ne 0 ]; then 
	error "Your must be a root user to perform this command.."
	exit 1
fi
}

### Checking SELINUX
CheckSELinux() {
	STATUS=$(sestatusx | grep 'SELinux status:'| awk '{print $NF}')
	if [ "$STATUS" != 'disabled' ]; then 
		error "SELINUX Enabled on the server, Hence cannot proceed. Please Disable it and run again.!!"
		hint "Probably you can run the following script to SELINUX"
		info "curl -s https://raw.githubusercontent.com/indexit-devops/caput/master/vminit.sh | sudo bash"
		exit 1
	fi
}
