**Onelab**

General Goal of the ONELAB Project : Develop a platform for integrating free Finite Element Analysis (FEA) software

Two difficulWes associated with free FEA sodware :

• Heterogeneity of the tools

• Missing “expert” layer and documentaIon


ONELAB Guiding Principles

* Don’t reimplement, interface

• Make it easy to provide templates, with interacWve parameter modificaWon

• Make it as small and as easy to maintain as possible (no solver dependent code in the interface)

ONELAB Features

(1) Abstract interface to FEA codes

(2) Development and documentaIon of templates (“meta-­‐models”)

  (2.1) Model: backbox, parameterizable via abstract interface
 
  (2.2) Meta-­‐model: set of models + selecWon logic


**Features of Gmsh**

Advanced Solvers: Solve equations with advanced numerical solvers.

Advanced Visualization: Visualize meshes in 3D with advanced rendering techniques.

CAD Conversion: Convert CAD models to meshes quickly and accurately.

CAD Integration: Import and export CAD models from a variety of sources.

Geometry Modeling: Construct and edit complex 3D geometries with powerful tools.

HPC Support: Support for high performance computing clusters.

Mesh Generation: Automatically generate meshes of various shapes with ease.

Mesh Morphing: Morph meshes between different geometries.

Mesh Optimization: Optimize meshes for high performance computing.

Mesh Refinement: Smoothly refine and improve mesh quality.

Multi-platform: Compatible with Windows, Linux, Mac and more.

Parametric Modeling: Create parametric models with a few clicks.

Physical Groups: Group and organize entities into physical groups.

Post-processing: Visualize, analyze and compare results with ease.

Scripting: Create powerful scripts with the built-in scripting language.


-------------------------------------------

**In praise of GMSH DefineConstant and parameter menu**

Opera3D etc do not have this feature. Making change in unparametric design is hardest. Making changes in text script responsible for parametric design is a bit easier. But a GUI menu, that too dynamically responsive menu, is easiest. And that is GMSH.

It has feature to make it coloured, read-only, visible/unvisible, slider, automatic change, looping in single or coupled loops, help text, communication with onelab etc.

Syntax :

DefineConstant name = {default, choices, label, highlight, help, autocheck, readonly, closed};


--------

https://github.com/jeromerobert/gmsh/tree/master

1. gmsh can be very useful for

   (a) creating magnet design workflow starting from chosing type of magnet followed by main specs to
   analytical design of the magnet, to 2D model, to 2D simulation and 2D results to 3D model and 3D results and optimization.

   (b) creating (or modifying) the .pro file for getdp

   (c) creating .sif file for Elmersolve

   (d) same .geo file can take form of different geometry, depending on parameters selectrd by the user.

3. GetDP is a comprehensive software application for solving boundary value problems using the finite element method. Its versatility, flexibility, meshing capabilities, numerical solvers, parallel computing support, visualization tools, and extensive documentation make it a valuable tool for engineers, researchers, and students working on a wide range of simulation tasks.

3A. getdp is so useful that CERN has brought its own version called cerngetdp. cerngetdp utilizes vast magnetic properties database of cern.
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

* Application codes perform simulations on different, often incompatible computational meshes.

* Application codes have developed their own data formats that are generally incompatible with other application codes.

* Application code input file formats differ, so translation codes are needed to take the output from one code and use it as input for another.

* Particle accelerator application codes are often executed on clusters, and efficiently managing parallel computing resources is difficult.

**steam-FiQuS**  

https://gitlab.cern.ch/steam/fiqus

FiQuS is based solely on open-source software and uses Python to generate geometries and meshes with Gmsh and compute solutions with GetDP. FiQuS scripts have a modular structure to accommodate a broad range of geometries and simulation requirements, focusing mainly on superconducting accelerator magnets. FiQuS is organized into multiple Python scripts. The code is constituted by a mix of built-in functions, third-party libraries, and Gmsh API commands and command-line interface (CLI) calls to GetDP. Its structure is modular.

Three specific capabilities of FiQuS that represent the basis upon which the future modules will be built,
mainly: 

(1) enabling cooperative simulations and the Single Source Of Truth (SSOT) practice;

(2) seamlessly integrating magnet design details around a set of input files;

(3) enabling parametric analysis and multi-objective optimization with Dakota software developed by Sandia National Laboratories.

# Components of a good tool-chain for design of Accelerator Magnets

1) Preprocessor -- powerful script for parametric modelling, able to import/export in other file formats, good and flexible meshing capability
2) Solver -- parallel, nonlinear, adaptive time, fast, rugged, 
3) Postprocessor -- shaould have a minimal beam dynamics calculator in it, 
4) Optimizer
5) 'App developer' -- applictin deployment

**Other required characteristics**
* easy to learn and use
* available on multiple plateforms (Linux, windows, Mac etc..)
* free / open source ,
* with good GUI, good API and good control through scripts
* input and output file formats should be open and standard,
* should have good materials library,
* easy and flexible boundary conditions
* easy and flexible sources specification (linear & nonlinear materials, anisotropic materials, ..)
* should be easy to configure,
* should be able to do multiphysics (at least electromagnetics, thermal, structural) 
* should be able to do 1D, 2D and 3D simulation,
* should be able to do steady state, harmonic or time analysys,
* should have facilities, such as library of in-built coils
* well validated and discussed (should not be very new)
* sufficiently big user base
* active discussion group
* good documentation
* 

**Why use GetDP**

1) It is Open Source.

2) It solves Coupled problems

3) It is light and fast.

4) It provides for creating custom menus and parametric analysis (using GMSH)

5) It can easily be used with optimization programs ( suc as CONVEKS )

6) It is used in CERN for superconducting magnet design (FiQuS)

7) It can be used for parallel computing using GetDDM.
