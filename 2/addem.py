#!/usr/bin/env python

import sys

def addem(interval):
  x = 0
  while( x < 120):
    x = x + interval
    print(x)


if __name__ == '__main__':
  interval = int(sys.argv[1])
  addem(interval)
