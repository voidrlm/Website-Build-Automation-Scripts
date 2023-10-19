date_formatForFile=$(date +'%d%b%Y')
release_date=$(date +"%dth %B %Y")
read -p "Enter the project name: " project
read -p "Enter the version for dev: " dev_version
read -p "Enter the version for prod: " prod_version
clear
echo Starting...
zip_file_name="${project}_dev_build_${date_formatForFile}"
npm run build_dev
zip -r "$zip_file_name.zip" dist
cat <<EOF > "$zip_file_name.txt"
DEVELOPMENT RELEASE
Date - $release_date (Version - $dev_version) - $project
Release Notes : -
EOF
zip_file_name="${project}_prod_build_${date_formatForFile}"
clear
npm run build_prod
zip -r "$zip_file_name.zip" dist
cat <<EOF > "$zip_file_name.txt"
PRODUCTION RELEASE
Date - $release_date (Version - $prod_version) - $project
Release Notes : -
EOF
clear
echo DEVELOPMENT AND PRODUCTION BUILDS CREATED
echo Update your release notes in the required release notes text files
sleep 500000000