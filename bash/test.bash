#!/bin/bash
rails g slim:scaffold organization name requisites contact_data:references contacts:references
if [ "$1" -eq "s" ]
then rails s
fi
