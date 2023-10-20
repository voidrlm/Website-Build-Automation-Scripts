destination_directory="./dummy/"
if [ ! -d "$destination_directory" ]; then
  echo "directory does not exist: $destination_directory"
  sleep 3
fi
cp -r ./* "$destination_directory"
  echo "Files copied successfully."
fi
