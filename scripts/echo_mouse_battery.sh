#!/bin/bash
battery=`ioreg -l | grep "BatteryPercent"`
echo ${battery##*=}%
