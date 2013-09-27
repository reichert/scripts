#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y

# Instalar o básico
sudo apt-get install -y vim terminator whois
sudo apt-get install -y python-dev python3-dev
sudo apt-get install -y python-pip
pip install vitualenvwrapper

# Reconfigurar para não usar o dash
sudo dpkg-reconfigure dash
sudo dpkg-reconfigure tzdata

# TODO: Instalar locales

# Instalar o java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer

# Instalar o pycharm
cd ~/Downloads
wget http://download-ln.jetbrains.com/python/pycharm-professional-3.0.tar.gz
tar -zxvf pycharm-professional-3.0.tar.gz
sudo mv pycharm-3.0/ /opt/
/opt/pycharm-3.0/bin/pycharm.sh &

# Instala o postgree 9.1
sudo apt-get install -y postgresql postgresql-server-dev-all postgresql-contrib postgresql-client

# Edita o pg_hba.conf (veja http://cesarakg.freeshell.org/sed-1.html)
sed -e '85,90s/peer/trust/' /etc/postgresql/9.1/main/pg_hba.conf > /tmp/pg_hba.conf
echo "Colocar o postgresql em modo promíscuo?"
select yn in Sim Não
do
	case $REPLY in
		[SsYy]* ) cp /tmp/pg_hba.conf /etc/postgresql/9.1/main/pg_hba.conf; break;;
		[Nn]* ) break;;
	esac
done

# Itens para o oscar
sudo apt-get install -y libjpeg-dev

