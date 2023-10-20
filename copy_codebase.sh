destination_directory="E:\dummy"
echo "Copying to destination directory $destination_directory"
if [ ! -d "$destination_directory" ]; then
  echo "directory does not exist: $destination_directory"
  sleep 2
fi
# add your exclusions hereeee below
exclude_list=("copy_base.sh" "node_modules" ".git" "dist" ".vscode") 

for item in ./*; do
  item_name=$(basename "$item")
  exclude=false
  for excluded_item in "copy_base.sh" "node_modules" ".git" "dist" ".vscode"; do
    if [ "$item_name" = "$excluded_item" ]; then
      exclude=true
      break
    fi
  done

  if [ "$exclude" = false ]; then
    cp -r "$item" "$destination_directory"
  fi
done
for hidden_item in .[^.]*; do
  if [ -f "$hidden_item" ]; then
    cp "$hidden_item" "$destination_directory"
  fi
done
if [ $? -eq 0 ]; then
  echo "Files copied successfully."
else
  echo "Error copying files."
  exit 1
fi