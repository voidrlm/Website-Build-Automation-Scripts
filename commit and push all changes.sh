echo "Enter your commit message:"
read commit_message
git add .
git commit -m "$commit_message"
git push
echo Pushed to remote