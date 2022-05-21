import os

line = "//Keegan Tosland: 1546409\n"

for root, dirs, files in os.walk(os.getcwd()): 
    if("node_modules" in dirs):
        dirs.remove("node_modules")
        print("Skipped directory#")
    for filename in files:
        if filename.endswith(".ts"):
             with open(os.path.join(root, filename), 'r+', encoding='utf-8') as f: 
                if(f.readline() != line): 
                    content = f.read()
                    f.seek(0, 0)
                    f.write(line.rstrip('\r\n') + '\n' + content)
                    print(os.path.join(root, filename))
                else:
                    print(filename + "Line already commented")