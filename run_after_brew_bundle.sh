#!/bin/bash

# Run brew bundle --global after Brewfile is updated
echo "Running brew bundle --global..."
brew bundle --global || true
