
src_dir="src"

dest_dir="E:\Test"

# Check if the source directory exists
if [ ! -d "$src_dir" ]; then
    echo "Source directory '$src_dir' does not exist."
    exit 1
fi

if [ ! -d "$dest_dir" ]; then
    mkdir -p "$dest_dir"
fi

cp -r "$src_dir" "$dest_dir"

echo "Copied src directory '$src_dir' to '$dest_dir"
sleep 10