# Start here
# ssh as auser/buser/cuser using the football key
ssh -i football auser@vps387343.ovh.net

# restart salt
$ sudo systemctl restart salt-master
$ sudo systemctl restart salt-minion

# Install cron state
$ salt 'vps387343.ovh.net' state.sls logger

# Create users state
$ salt 'vps387343.ovh.net' state.sls users

Note that pub/piv keys are inside pillar file.. Using users-formula as requested

# salt config from scratch:

If you want to recreate the whole env just install salt, put "srv" directory inside "/" and configure salt as follows:

$ cat /etc/salt/master
file_roots:
  base:
    - /srv/salt
    - /srv/formulas/users-formula

pillar_roots:
  base:
    - /srv/pillar

james@vps387343:~$ tree /srv
/srv
├── formulas
│   └── users-formula
│       └── users
│           ├── bashrc.sls
│           ├── files
│           │   ├── bashrc
│           │   │   └── bashrc
│           │   ├── profile
│           │   │   └── profile
│           │   ├── user
│           │   └── vimrc
│           │       └── vimrc
│           ├── googleauth.sls
│           ├── init.sls
│           ├── map.jinja
│           ├── profile.sls
│           ├── sudo.sls
│           ├── user_files.sls
│           └── vimrc.sls
├── pillar
│   ├── data.sls
│   ├── init.sls
│   ├── top.sls
│   └── users.sls
└── salt
    ├── logger
    │   ├── init.sls
    │   └── logger.sh
    └── top.sls

11 directories, 18 files
