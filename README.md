# Start here
ssh as auser/buser/cuser using the football key
ssh -i football auser@vps387343.ovh.net

$ sudo su -

# salt config:
$ cat /etc/salt/master
file_roots:
  base:
    - /srv/salt
    - /srv/formulas/users-formula

pillar_roots:
  base:
    - /srv/pillar

# restart salt
$ sudo systemctl restart salt-master
$ sudo systemctl restart salt-minion

# Install cron state
$ salt 'vps387343.ovh.net' state.sls logger

# Create users state
$ salt 'vps387343.ovh.net' state.sls users

Note that pub/piv keys are inside pillar file.. Using users-formula as requested
