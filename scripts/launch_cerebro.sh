#!/usr/bin/env bash

old_pwd=$PWD
cd "/home/berger/cerebro"
PATH="$PATH:/home/berger/.linuxbrew/bin"
yarn run dev 1>/dev/null 2>&1 &
cd ${old_pwd}
