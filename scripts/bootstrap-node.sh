
# configure hosts file for our internal network defined by Vagrantfile
echo "
# vagrant environment nodes
192.168.29.2  kafkalab1
" > /etc/hosts
sudo yum install -y centos-release-ansible-29 python3 git curl
echo "
Host *
    StrictHostKeyChecking no
" > ~/.ssh/config
pip3 install ansible==2.9.5
echo "export  $PATH:~/.local/bin" >> ~/.profiles 
echo "export  $PATH:~/.local/bin" >> ~/.bashrc
source ~/.bashrc
sudo chmod 400 ~/.ssh/config
ssh-keygen -b 2048 -t rsa -f ~/sshkey -q -N ""
cat ~/sshkey.pub >> ~/.ssh/authorized_keys
ansible --private-key ~/sshkey -m ping -i localhost, all
# git clone https://github.com/confluentinc/demo-scene.git
# git clone https://github.com/confluentinc/examples.git
# git clone https://github.com/confluentinc/cp-all-in-one.git
# cd cp-all-in-one/cp-all-in-one
git clone https://github.com/confluentinc/cp-ansible.git
cd ~/cp-ansible/
ansible-playbook --private-key ~/sshkey -i hosts_lab.yml zookeeper.yml