/tmp/logger.sh:
  file: 
    - managed                               
    - source: salt://logger/logger.sh 

bash /tmp/logger.sh:
  cron.present:
    - user: root
    - minute: '*/30'
