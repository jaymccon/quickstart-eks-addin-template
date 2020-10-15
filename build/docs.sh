#!/bin/bash -xe
pyenv
python docs/boilerplate/.utils/generate_parameter_tables.py
asciidoctor --base-dir docs/ --backend=html5 -o ../docs/index.html -w --doctype=book -a toc2 -a production_build docs/boilerplate/index.adoc
echo file://docs/index.html
