#pragma once

#include <sys/types.h>
#define NEW(type) ((type *)malloc(sizeof(type)))

typedef struct Buffer{
  uint size;
  u_int8_t *bytes;
} Buffer;
