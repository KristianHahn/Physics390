#include <stdio.h>
#include <stdlib.h>
#include "pdfs.hh"
#include "sampling.hh"

unsigned do_count_reject=1;
unsigned count_reject=0, count_metro=0;

int main(int argc, char** argv) {

  srand(strtoul(argv[1],NULL,10));
  
  double params[1] = {0.5};
  double range_i = 0;
  double range_f = 5;

  double x,y;
  for( int i=0; i<500000; i++ ) { 
    x = sample_pdf_rejection( &pdf_exponential, (double*)&params, range_i, range_f);
    y = cdf_exponential(x, (double*)&params);
    printf( "%d %lf %lf\n", i, x, y);
  }


}