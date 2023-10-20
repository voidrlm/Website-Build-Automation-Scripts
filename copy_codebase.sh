destination_directory="./dummy/"
if [ ! -d "$destination_directory" ]; then
  echo "directory does not exist: $destination_directory"
  sleep 3
fi
cp -r ./* "$destination_directory"
if [ $? -eq 0 ]; then
  echo "Files copied successfully."
else
  echo "Error copying files."
  exit 1
fi