
INC = [
  include_directories('..'),
]

daily_temperatures = executable(
          'daily_temperatures',
          'daily_temperatures.c',
          install: false,
          link_with: common_lib,
          include_directories: INC,
)

rotate_list = executable(
          'rotate_list',
          'rotate_list.c',
          install: false,
          link_with: common_lib,
          include_directories: INC,
)
