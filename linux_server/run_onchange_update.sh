#!/bin/sh
sudo apt-get update && sudo apt-get install $(grep -v '^#' .pkg | tr '\n' ' ')
