#ifndef H_UTIL
#define H_UTIL

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>
#include <float.h>
#include <time.h>
#include <string.h>

#include "dsp.h"

int32_t quiet;

extern void win_return();
extern int32_t gettime();
extern  double roundoff(double x);
extern  int32_t roundup(double x);
extern float getfloat();
extern  int32_t smallprimes(int32_t x);
extern  int32_t nextsprime(int32_t x);
extern  double log_b(double x);
extern  uint32_t rand_u32();
extern  double dblrand();
extern  uint16_t fread_le_short(FILE *file);
extern  uint32_t fread_le_word(FILE *file);
extern  void fwrite_le_short(uint16_t s, FILE *file);
extern  void fwrite_le_word(uint32_t w, FILE *file);
extern char *getstring();
extern int32_t str_isnumber(char *string);

#endif
