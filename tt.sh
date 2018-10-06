free -m  && sync && echo 3 > /proc/sys/vm/drop_caches && free -m



#!/bin/bash

sync

echo 3 > /proc/sys/vm/drop_caches

