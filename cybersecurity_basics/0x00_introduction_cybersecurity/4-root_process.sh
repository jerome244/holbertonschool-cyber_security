#!/bin/bash
ps -eo user,pid,vsz,rss,comm | awk -v u="$(id -un)" '$1==u && $3>0 && $4>0'