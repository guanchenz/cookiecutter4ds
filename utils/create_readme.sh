#! /bin/sh

function create_readme {
    PROJECT=$1
    FILE_PATH=$2
    DESC=$3

    cat > "$FILE_PATH/README.md" << EOF
# $PROJECT

$DESC

EOF
}