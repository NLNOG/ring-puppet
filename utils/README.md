RING utilities
================

Please install the hooks and scripts in this directory into your local .git directory. Especially the pre-commit script is very useful.

hooks/pre-commit
----------------

### Usage:

On your local machine: 

    sudo apt-get install puppet 
    cp hooks/pre-commit ../.git/hooks/
    chmod +x ../.git/hooks

newmodule
---------

Set's up a few example files if you want to create a new puppet module

Usage:
    ./newmodule $packagename

