# NOTE: This script can be modified for different atomic structures, 
# units, etc. See in.elastic for more info.
#

# Define the finite deformation size. Try several values of this
# variable to verify that results do not depend on it.
variable up equal 1.0e-6
 
# Define the amount of random jiggle for atoms
# This prevents atoms from staying on saddle points
variable atomjiggle equal 1.0e-5

# Uncomment one of these blocks, depending on what units
# you are using in LAMMPS and for output

# metal units, elastic constants in eV/A^3
#units		metal
#variable cfac equal 6.2414e-7
#variable cunits string eV/A^3

# metal units, elastic constants in GPa
units		metal
variable cfac equal 1.0e-4
variable cunits string GPa

# Define minimization parameters
variable etol equal 0.0 
variable ftol equal 1.0e-10
variable maxiter equal 100
variable maxeval equal 1000
variable dmax equal 1.0e-2

# generate the box and atom positions using a hcp lattice
variable a equal 1.01

boundary	  p p p

lattice custom   ${a}      &
    a1       5.7508478165         0.0000000000         0.0000000000      &
    a2      -2.8754239082         4.9803803024         0.0000000000      &
    a3      0.0000000000         0.0000000000         4.6552820206        &
	basis   0.660585003         0.830292587         0.750000000 &
	basis   0.830292598         0.660585031         0.250000000 &
	basis   0.830292594         0.169707520         0.250000000 &
	basis   0.169707522         0.830292587         0.750000000  &
	basis   0.169707520         0.339415040         0.750000000  &
	basis   0.339415009         0.169707520         0.250000000  &
	basis   0.666666682         0.333333365         0.750000000  &
	basis   0.333333365         0.666666730         0.250000000  &
	
#region   box  block    0   5   0   5  0   5   units  lattice
region		box prism 0 3.0 0 3.0 0 3.0 0.0 0.0 0.0  
create_box    2    box

create_atoms	2    region  box  &
basis  1  1  &
basis  2  1  &
basis  3  1  &
basis  4  1  &
basis  5  1  &
basis  6  1  &
basis  7  2  &
basis  8  2  &

# Need to set mass to something, just to satisfy LAMMPS
mass		   1 	47.8670 #Ti

mass		   2 	26.9815 #Al

write_data		data.txt
