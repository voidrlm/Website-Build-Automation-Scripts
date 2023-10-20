destination_directory="E:\dummy"
echo Copying to destination directory
if [ ! -d "$destination_directory" ]; then
  echo "directory does not exist: $destination_directory"
  sleep 2
fi
# add your exclusions hereeee below
exclude_list=("copy_base.sh" "node_modules" ".git" "dist" ".vscode") 
sleep 3
for item in ./*; do
  if [ -d "$item" ] && [[ " ${exclude_list[*]} " == *" $(basename "$item") "* ]]; then
    continue  # Skip directories in the exclude list
  elif [[ " ${exclude_list[*]} " == *" $(basename "$item") "* ]]; then
    continue  # Skip files in the exclude list
  else
    cp -r "$item" "$destination_directory"
  fi
done
sleep 3
if [ $? -eq 0 ]; then
  echo "Files copied successfully."
else
  echo "Error copying files."
  exit 1
fi