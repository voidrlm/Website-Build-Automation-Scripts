backup_dir="/backup/"  
backup_filename="codeBase_backup_$(date +'%Y%m%d%H%M%S').zip"
zip -r "$backup_dir/$backup_filename" .
echo "Website codebase backup completed successfully."
echo "Backup file: $backup_dir/$backup_filename"
sleep 5000