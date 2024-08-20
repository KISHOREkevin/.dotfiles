#!/usr/bin/env bash

echo $(brightnessctl -m | awk -F ',' '{print $4}')
