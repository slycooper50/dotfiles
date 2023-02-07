#!/usr/bin/env bash

rm -rf $HOME/.bash_profile
rm -rf $HOME/.bashrc

ln -s $PWD/bash_profile $HOME/.bash_profile
ln -s $PWD/bashrc $HOME/.bashrc
