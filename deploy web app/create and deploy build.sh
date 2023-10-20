curl -o ".env.production" "https://example.com/some-text-file.txt" #TODO: replace your URL with something to download the environment variable from a link
mv ".env.production" "./BaseBuild"
cd ./BaseBuild
npm run build
zip -r dist.zip dist
# Upload code here
curl -F "file=dist.zip" https://example.com/upload  #TODO paste your upload url or code segment here instead
npx serve dist