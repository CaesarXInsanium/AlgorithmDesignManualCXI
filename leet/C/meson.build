project(
  'Leet',
  'c',
  version : '0.1',
  default_options : [
    'buildtype=debugoptimized',
    'warning_level=3',
    'werror=true',
    'debug=true',
    'optimization=3',
    'c_std=c11'
  ]
)

COMMON_SRC = [
  'common/common.c',
]

common_lib = library(
  'common_lib',
  COMMON_SRC,
)

subdir('code')
