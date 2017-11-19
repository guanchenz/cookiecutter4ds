# cookiecutter4ds

Simple cookiecutter for data science project

## Project template

The cookiecutter creates the following project template for you:

```
.
|-- CITATION
|-- README.md
|-- LICENSE
|-- data
|-- doc
|-- results
|-- src
|-- <project_name>.json
```

## Install

```bash
git clone https://github.com/guanchenz/cookiecutter4ds.git
cd cookiecutter4ds

# make it your own
rm -rf .git && git init
```

## How to use

```bash
bash cookiecutter4ds.sh
```

The command will create a new project folder in the parent directory. Please follow the prompts to setup your project template.