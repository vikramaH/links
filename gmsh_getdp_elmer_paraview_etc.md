1. gmsh can be very useful for
   (a) creating magnet design workflow starting from chosing type of magnet followed by main specs to
   analytical design of the magnet, to 2D model, to 2D simulation and 2D results to 3D model and 3D results and optimization.
   (b) creating (or modifying) the .pro file for getdp
   (c) creating .sif file for Elmersolve
   (d) same .geo file can take form of different geometry, depending on parameters selectrd by the user.

2. getdp is so useful that CERN has brought its own version called cerngetdp. cerngetdp utilizes vast magnetic properties database of cern.
   so it simplifies the .pro (problem file) creation.

4. The "Run Control" section in ElmerSolver's .sif file is a relatively newer and very powerful addition that significantly enhances E
   lmer's capabilities for parametric studies, optimization, and complex transient simulations within a single input file.
   Before "Run Control," if you wanted to run, say, 10 different simulations where only one parameter varied (e.g., material conductivity),
   you would typically need 10 separate .sif files or manage the variations with an external script (e.g., Python, Bash). "Run Control" streamlines this.

==============

Generally, coupling of application codes requires taking output data from one application code simulation and
transforming it to input (e.g., boundary conditions or electromagnetic field maps) for a different application code
simulation. Coupling different application codes involves finding solutions for a number of inherent complexities
that limit the ability of accelerator scientists and engineers to work efficiently:

 Application codes perform simulations on different, often incompatible computational meshes.

 Application codes have developed their own data formats that are generally incompatible with other application codes.

 Application code input file formats differ, so translation codes are needed to take the output from one code and use it as input for another.

 Particle accelerator application codes are often executed on clusters, and efficiently managing parallel computing resources is difficult.

=====
steam-FiQuS  

https://gitlab.cern.ch/steam/fiqus

FiQuS is based solely on open-source software and uses Python to generate geometries and meshes with Gmsh and compute solutions with GetDP. FiQuS scripts have a modular structure to accommodate a broad range of geometries and simulation requirements, focusing mainly on superconducting accelerator magnets. FiQuS is organized into multiple Python scripts. The code is constituted by a mix of built-in functions, third-party libraries, and Gmsh API commands and command-line interface (CLI) calls to GetDP. Its structure is modular.

Three specific capabilities of FiQuS that represent the basis upon which the future modules will be built,
mainly: 
(1) enabling cooperative simulations and the Single Source Of Truth (SSOT) practice;
(2) seamlessly integrating magnet design details around a set of input files;
(3) enabling parametric analysis and multi-objective optimization with Dakota software developed by Sandia National Laboratories.

