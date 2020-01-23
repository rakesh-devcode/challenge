import os


def print_file(dir_path):
# Walking through files and folders
    for path, dirs, files in os.walk(dir_path):
        for file in files:
            formatted_path = path.replace("\\","/")
            file_path = formatted_path + '/' + file

            # To avoid the current script includes in output
            if file_path != __file__:
                with open(file_path, 'r') as openfile:
                    lines = openfile.readlines()
                    for line in lines:
                        if "TODO" in line:
                            out_file_path = file_path
                            print(out_file_path)




if __name__ == "__main__":
    dir_path = os.path.abspath(os.path.join(os.path.dirname(__file__)))
    print_file(dir_path)