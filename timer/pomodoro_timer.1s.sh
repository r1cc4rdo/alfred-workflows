#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# <bitbar.title>Timer</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Riccardo Gherardi</bitbar.author>

# [
# {"duration": 300, "desc": ":tomato:", "color": "green", "start_time": 1506929429.546524},
# {"duration": 600, "desc": ":alarm_clock:", "color": "red", "start_time": 1506924700.0}
# ]

import os
import math
import time
import json

timers = []
timers_filename = '/tmp/timers.json'
if os.path.isfile(timers_filename):
    with open(timers_filename, 'r') as f:
        timers = json.load(f)

output = ''
color = 'black'
for timer in timers:

    end_time = timer['start_time'] + timer['duration']
    left = end_time - time.time()  # remaining seconds

    if left > 0:
        num = int(math.ceil(left / (60.0 if left >= 60.0 else 1.0)))
        output += '{} {}'.format(num, timer['desc'])
        color = timer['color']

print '{}|color={}'.format(output, color)
