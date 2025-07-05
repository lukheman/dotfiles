#!/usr/bin/bash

sudo dnf module reset php -y
sudo dnf module enable php:remi-$1 -y
sudo dnf remove php -y
sudo dnf install php -y
