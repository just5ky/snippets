#!/bin/bash 

# This script pulls all git repositories in the directory 
ls | xargs -I{} git -C {} pull
