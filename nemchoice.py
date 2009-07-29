#! /usr/bin/python

import nominate_combo
from datetime import datetime
import time

def _fixup_nominee_validity(c):
  newcombos = []
  for i in range(0, len(c)):
    cur = c[i]
    next = None
    if i < len(c) - 1:
      next = c[i + 1]['time']
    newcombos.append([cur['combo'], cur['time'], next])
  return newcombos

NEMELEX_COMBOS = _fixup_nominee_validity(
  nominate_combo.find_previous_nominees())
NEMELEX_SET = set([x[0] for x in NEMELEX_COMBOS])

def _to_date(when):
  if when.endswith('D') or when.endswith('S'):
    when = when[:-1]
  return datetime(*(time.strptime(when, '%Y%m%d%H%M%S')[0:6]))

def current_nemelex_choice():
  return NEMELEX_COMBOS and NEMELEX_COMBOS[-1]

def previous_nemelex_choices():
  return NEMELEX_COMBOS and [x[0] for x in NEMELEX_COMBOS[:-1]] or []

def is_nemelex_choice(combo, when):
  """Returns true if the given combo for a game that ended at the given
  datetime is a chosen combo for the Nemelex' Choice banner."""
  if combo in NEMELEX_SET:
    if isinstance(when, str) or isinstance(when, unicode):
      when = _to_date(when)
    for c in NEMELEX_COMBOS:
      if c[0] == combo and when >= c[1] and (not c[2] or when < c[2]):
        return True
  return False