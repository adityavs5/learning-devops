#!/bin/bash
echo -e "The Backup script is not running, shortly the entire webserver directory shall be backed up"
cp -r /home/admin/index/ /backup/backup-$(date + %y-%m-%d )
echo -e "\nThe backup has been completed successfully"
