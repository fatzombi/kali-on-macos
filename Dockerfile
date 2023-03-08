# Start from kali-rolling as our base image.
FROM kalilinux/kali-rolling:latest
ENV DEBIAN_FRONTEND noninteractive

# Grab our environmental variables.
ARG USERNAME=${USERNAME}

# Bring everything up to date.
RUN apt update; apt -y dist-upgrade

# Install anything and everything we desire.
RUN apt-get -y install \
bc \
burpsuite \
crackmapexec \
curl \
debootstrap \
dirb \
dirbuster \
enum4linux \
ethtool \
exploitdb \
exuberant-ctags \
file \
firefox-esr \
fonts-powerline \
freerdp2-x11 \
ftp \
gobuster \
golang-go \
gpg \
hashcat \
hashid \
hydra \
iputils-ping \
kali-linux-large \
man \
metasploit-framework \
mysql* \
nfs-common \
neovim \
netcat-traditional \
net-tools \
nikto \
nmap \
nodejs \
npm \
openvpn \
oscanner \
postgresql \
python3-pip \
python3-venv \
rsync \
seclists \
sipvicious \
smbclient \
smbmap \
smtp-user-enum \
snmp \
socat \
sslscan \
sqlmap \
squashfs-tools \
telnet \
tftp \
tmux \
tmuxinator \
tnscmd10g \
webshells \
wfuzz \
wget \
whatweb \
wireshark \
wkhtmltopdf \
wordlists \
zaproxy \
zsh

# Now's our chance to run random stuff that we'll need for later.

# Create the user that we'll be using, rather than just using root. (no password)
RUN useradd -G sudo,video ${USERNAME} --shell /bin/zsh -m

# Set the password to be the same as the username.
RUN echo "${USERNAME}:${USERNAME}" | chpasswd

# Clean it up
RUN apt-get -y autoremove

# Straight to a shell!
ENTRYPOINT zsh $@
