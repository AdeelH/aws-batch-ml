#!/bin/bash

NOTEBOOK_LOC=$1
NOTEBOOK_NAME=$2

aws s3 cp $NOTEBOOK_LOC $NOTEBOOK_NAME

jupyter nbconvert --ExecutePreprocessor.timeout=-1 --ExecutePreprocessor.allow_errors=True --execute --to notebook --inplace ./$NOTEBOOK_NAME

aws s3 cp $NOTEBOOK_NAME $NOTEBOOK_LOC
