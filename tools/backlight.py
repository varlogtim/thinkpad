#!/usr/bin/env python
import os
import sys

backlight_dir = '/sys/class/backlight/intel_backlight/'
brightness_path = '{}{}'.format(backlight_dir, "brightness")
max_brightness_path = '{}{}'.format(backlight_dir, "max_brightness")

USAGE = '''
Purpose:
    To adjust screen backlight to a specified percentage
Usage:
    {scriptname} <percentage>
Example:
    {scriptname} 69
'''.format(scriptname=sys.argv[0])

if os.getuid() != 0:
    raise ValueError("This script must be run as root")

try:
    target_percentage = int(sys.argv[1])
except Exception:
    print(USAGE)
    sys.exit(1)

max_brightness = int(open(max_brightness_path, 'r').read().strip())
set_brightness = int(max_brightness * (target_percentage / 100))

if set_brightness < 0 or set_brightness > max_brightness:
    raise ValueError("Brightness bounds error")

open(brightness_path, 'w').write(str(set_brightness))

msg = "Backlight set to {}% ({})".format(target_percentage, set_brightness)
print(msg)
