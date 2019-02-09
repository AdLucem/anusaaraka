"""Using some system processing tools to get a
decent map of the code"""


import os

"""Format to store a file or directory in:
[{
    "name": name
    "is_file": <f/d>,
    "children": [children]
}]
"""


def get_objects(dirname):
    """Go through the software and get all the files and
    directories, put into a recursive list"""

    objects = os.listdir(dirname)
    temp_map = []

    for obj in objects:

        fpath = os.path.join(dirname, obj)

        if fpath[0:2] == "./":
            fpath = fpath[2:]

        # if the object is a file, store it as a file
        if os.path.isfile(fpath):

            temp_map.append({"name": fpath,
                             "is_file": True,
                             "children": []})

        # else, assume the object is a directory
        else:

            children_map = get_objects(fpath)
            temp_map.append({"name": fpath,
                             "is_file": False,
                             "children": children_map})

    return temp_map


def walkthrough(software_map):
    """Perform a walkthrough of the software map structure
    and structure a documentation directory/files based on it"""

    for i in software_map:

        if not i["is_file"]:

            # for each directory: make a index.md
            dname = "./docs/" + i["name"]
            index = "./docs/" + i["name"] + "/index.md"
            print(index)
            os.mkdir(dname)

            with open(index, "w+") as f:

                children = i["children"]

                # list files
                f.write("Files:\n\n")
                for i in children:
                    if i["is_file"]:

                        fname = i["name"]
                        fext = fname.split(".")
                        if len(fext) == 2:
                            fext = fext[1]
                        else:
                            fext = "none"
                        # for each file, note name and extension
                        f.write(fname + " : " + fext + "\n")

                # list subdirectories
                f.write("\nSubdirectories:\n\n")
                for i in children:
                    if not i["is_file"]:

                        dirname = i["name"]

                        # note the number of files and subdirs in it
                        num_files, num_dirs = 0, 0
                        for child in i["children"]:
                            if child["is_file"]:
                                num_files += 1
                            elif not child["is_file"]:
                                num_dirs += 1

                        # note down name and numbers for each dir
                        f.write(dirname + " : " + str(num_files) + " files, " +
                                str(num_dirs) + " directories\n")

    # goto subdir
    if len(i["children"]) > 0:
        walkthrough(i["children"])


if __name__ == "__main__":

    # make a data structure of all the files
    # and directories in the software
    software_map = get_objects("./")

    # make a documentation directory
    os.mkdir("docs")

    walkthrough(software_map)
