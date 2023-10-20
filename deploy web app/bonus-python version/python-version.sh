# pip install requests -required modules
import requests #to fetch files
import subprocess #to run npm commands
import os #to change directory 
import shutil #For zipping

#step 1
def downloadFile(url):
    try:
        response = requests.get(url, stream=True)
        response.raise_for_status()

        with open("userpool-details.txt", 'wb') as file:
            for chunk in response.iter_content(chunk_size=8192):
                if chunk:
                    file.write(chunk)

        print(f"Downloaded env file data from server")
        buildEnvFile()      
    except Exception as e:
        print(f"Error: {e}")
#step 2
def buildEnvFile():
    try:
        with open('userpool-details.txt', 'r') as file:
            lines = file.readlines()
            with open('./BaseBuild/.env.production', 'w') as env_file:
                env_file.write('\n'.join(lines))
                print('Environment file generated')
                createBuild()
    except Exception as e:
        print(f"Error: {e}")
#step 3
def createBuild():
    print('Creating production build...')
    npm_command = 'npm run build'
    try:
        os.chdir('./BaseBuild/') 
        completed_process = subprocess.run(
            npm_command,
            shell=True,  
            check=True,
            stdout=subprocess.PIPE, 
            stderr=subprocess.PIPE, 
            universal_newlines=True,
        )
        print("Standard Output:")
        print(completed_process.stdout)
        print("Standard Error:")
        print(completed_process.stderr)
        print('Dist folder has been created')
        zipFolder()
    except subprocess.CalledProcessError as e:
        print(f"Error executing npm command: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")
#step 4
def zipFolder():
    try:
        shutil.make_archive('../upload', 'zip', './dist')
        print('Zipped successfully')
        uploadFile()
    except Exception as e:
        print(f'An error occurred: {e}')
#step 5
def uploadFile():
    server_url = "http://localhost:8000/upload"  #TODO paste your upload url or code segment here instead
    try:
        print('Uploading to server')
        with open('../upload.zip', 'rb') as file:
            files = {'file': file}
            response = requests.post(server_url, files=files)
            if response.status_code == 200:
                print("File uploaded successfully.")
            else:
                print(f"Failed to upload file. Status code: {response.status_code}")
    except Exception as e:
     print(f"An error occurred: {e}")


#main function
if __name__ == "__main__":
    env = input("dev or prod: ") #can you env value as query parameter in the URL at line 86 if needed
    id = input("Please enter  Id: ") #can you id as query parameter in the URL at line 86 if needed
    print('Automating deployment for ' + id + ' for '+ env+ ' environment')
    url = "https://www.w3.org/TR/2003/REC-PNG-20031110/iso_8859-1.txt"  #TODO: replace your URL with something
    downloadFile(url)