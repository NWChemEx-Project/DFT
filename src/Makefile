INCLUDES = -I../include

include ../arch.mac

OBJECTS	= cpsd.o inner_loop.o Kinetic.o Coulomb.o Pseudopotential.o Ion.o Ewald.o Pneb.o PGrid.o Strfac.o Balance.o lattice.o d3db.o Mapping3.o hilbert.o d1db.o Mapping1.o Parallel.o psi.o v_exc.o util_date.o control.o rtdb.o rtdb_seq.o hdbm.o compressed_io.o util.o


LIBDIR1 = ../lib
LDFLAGS += -L$(LIBDIR1)

#LIBDIR2 = /Users/bylaska/lib
#LIBDIR2 = /home/bylaska/lib
#LDFLAGS += -L$(LIBDIR2)

#LIBRARY = ../lib/libfftpack.a ../BLAS/blas_LINUX.a 
#LIBRARY = ../lib/libfftpack.a ../lib/lapack_LINUX.a ../lib/blas_LINUX.a  -lgfortran
#LIBRARY = -lfftw3 -llapack -lcblas -latlas
LIBRARY = -lfftpack -llapack -lblas

cpsd.x:	$(OBJECTS)
	$(C++) -o cpsd.x $(C++FLAGS) $(OBJECTS) $(LDFLAGS) $(LIBRARY)

cpsd.o: 	cpsd.C PGrid.C PGrid.h Parallel.h rtdb.h control.h util_date.h d1db.h d3db.h lattice.h inner_loop.h psi.h Pneb.h Strfac.h

inner_loop.o: 	inner_loop.C inner_loop.h Parallel.h control.h PGrid.h Ion.h Ewald.h Pseudopotential.h

Pseudopotential.o: Pseudopotential.h Pseudopotential.C Ion.h Ion.C PGrid.C PGrid.h

Kinetic.o:	Kinetic.h Kinetic.C Pneb.h PGrid.h 

Coulomb.o:	Coulomb.h Coulomb.C Pneb.h PGrid.h 

Ion.o:		Ion.C Ion.h

Ewald.o:	Ewald.C Ewald.h Ion.h

v_exc.o:	v_exc.C v_exc.h

PGrid.o:	PGrid.C PGrid.h util.h d3db.h

Strfac.o:	Strfac.C Strfac.h PGrid.h Ion.h util.h lattice.h

Pneb.o:		Pneb.C Pneb.h PGrid.h Parallel.h d1db.h

Balance.o:	Balance.C Balance.h

lattice.o:	lattice.C lattice.h

d3db.o:	d3db.C d3db.h Mapping3.h util.h

Mapping3.o:	Mapping3.C Mapping3.h

d1db.o:	d1db.C d1db.h Mapping1.h

Mapping1.o:	Mapping1.C Mapping1.h

hilbert.o:	hilbert.C hilbert.h

Parallel.o:	Parallel.C Parallel.h

util.o:	util.C util.h

rtdb.o:	rtdb.C 

control.o:	control.C control.h

util_date.o:	util_date.C util_date.h

psi.o:	psi.C psi.h control.h compressed_io.h Pneb.h Parallel.h

compressed_io.o:	compressed_io.C compressed_io.h

rtdb_seq.o:	rtdb_seq.c 

hdbm.o:	hdbm.c hdbm.h
#	$(C++) $(C++FLAGS) -c $<

clean:
	rm -f *.o cpsd.x

run:
	./cpsd.x -np 4

run2:
	./cpsd.x -np 2

run8:
	./cpsd.x -np 8
