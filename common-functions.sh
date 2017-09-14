### Colors
R="\e[31m"
B="\e[34m"
Y="\e[33m"
N="\e[0m"

## Common Functions

### Print Functions
#info() {:;}
#success() {:;}
error() {
	echo -e "$R$1$N"
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
# Tes
}
