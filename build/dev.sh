#!/bin/bash -xe

which pyenv &> /dev/null || { echo "pyenv must be installed. See https://github.com/pyenv/pyenv#installation" ; exit 1 ; }
which pyenv-virtualenv &> /dev/null || { echo "pyenv-virtualenv must be installed. See https://github.com/pyenv/pyenv-virtualenv#installation" ; exit 1 ; }
pyenv install 3.8.6 -s || { echo "Your pyenv does not have python version 3.8.6, you likely need to update pyenv." ; exit 1 ; }
pyenv virtualenv 3.8.6 eks-quickstart-dev || true
eval "$(pyenv init -)"
pyenv shell eks-quickstart-dev
pip install -qq --upgrade awscli taskcat cfn-lint git+https://github.com/aws-quickstart/qs-cfn-lint-rules.git
