
backup_filename="codeBase_backup_$(date +'%Y%m%d%H%M%S').zip"
find . -type d \( -name .git -o -name node_modules -o -name dist \) -prune -o -type f \( ! -name "backup_codebase.sh" \) -exec zip "$backup_filename" {} +
echo "Website codebase backup completed successfully."
echo "Backup file: $backup_dir/$backup_filename"
sleep 5000