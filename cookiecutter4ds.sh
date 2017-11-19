#! /bin/sh

# ---------------------------------------------------
# cookiecutter4ds
# 
# A basic template generator for data science project
#
# Author: guanchenz
# Date: Nov. 19, 2017
#
# ---------------------------------------------------

# load utility functions
source ./utils/create_license.sh
source ./utils/create_readme.sh
source ./utils/arts.sh

CURRENT_DIR="$PWD"
PARENT_DIR="$(dirname "$CURRENT_DIR")"

# folders and files to be created in the template
FOLDERS=("data" "doc" "results" "src")
FILES=("CITATION" "README.md" "LICENSE")

# welcome ascii arts
welcome

echo "Creating new DSCI project in $PARENT_DIR..."
echo -n "Continue? [y/n]: "
read CONFIRM

if [ $CONFIRM = "y" ]
then
    # gather project information from user
    echo -n "Please enter a project name: "
    read PROJECT_NAME
    echo -n "Author: "
    read AUTHOR
    echo -n "Email: "
    read EMAIL
    echo -n "Year: "
    read YEAR
    echo -n "Description: "
    read DESC
    echo -n "Version: "
    read VERSION

    if [ $PROJECT_NAME != "." ] && [ $PROJECT_NAME != ".." ]
    then
        # create project in the parent dir
        PROJECT_DIR="../$PROJECT_NAME"
        mkdir -p $PROJECT_DIR
        if [ $? ]
        then
            # create sub-folders
            for FOLDER in "${FOLDERS[@]}"
            do
                mkdir -p "$PROJECT_DIR/$FOLDER"
            done
            # create files in project root
            for FILE in "${FILES[@]}"
            do
                touch "$PROJECT_DIR/$FILE"
            done

            # create project json file
            printf "{\"project_name\": \"$PROJECT_NAME\",\n\"author\": \"$AUTHOR\",\n\"year\": \"$YEAR\",\n\"description\": \"$DESC\",\n\"verson\": \"$VERSION\"}" > "$PROJECT_DIR/$PROJECT_NAME.json"

            # create license file
            echo "Choose an open-source license:"
            echo "1 - MIT"
            echo "2 - BSD"
            echo -n "Choose from 1, 2 [leave blank if no license]: "
            read LICENSE_TYPE

            create_license "$LICENSE_TYPE" "$AUTHOR" "$EMAIL" "$YEAR" "$PROJECT_DIR"

            # create README
            create_readme "$PROJECT_NAME" "$PROJECT_DIR" "$DESC"
            
            # success ascii arts
            success

            echo "Project created successfully."
            echo "------------------------------------------------------"
            echo "What now?"
            echo "Enter the following commands to view your new project:"
            echo ""
            echo "cd $PROJECT_DIR"
            echo "ls"
            echo "------------------------------------------------------"
        else
            echo "Oops ..."
            echo "Something went wrong when creating the project folder."
        fi
    else
        echo "Error: illegal project name."
    fi
else
    echo "See you next time!"
fi
