
#include <ga.h>
#include <mpi.h>
#include <macdecls.h>
#include <ga-mpi.h>
#include "dft/dft.hpp"

int main(int argc, char* argv[])
{
  MPI_Init(&argc,&argv);
  GA_Initialize();
  MA_init(MT_DBL, 8000000, 20000000);

  int mpi_rank;
  MPI_Comm_rank(MPI_COMM_WORLD, &mpi_rank);

  dftlib();

  GA_Terminate();
  MPI_Finalize();

  return 0;
}



