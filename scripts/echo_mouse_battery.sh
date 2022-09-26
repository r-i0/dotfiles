#!/bin/bash
ioreg -l | grep "BatteryPercent" | awk '{print $8}' | sed 's/$/%/g'
