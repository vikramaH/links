**Onelab**

====> Onelab is an exploring tool and a test platform with a flexible and highly customisable implementation allowing new features to be implemented. (written in a A CERN paper on HTS magnets)

General Goal of the ONELAB Project : Develop a platform for integrating free Finite Element Analysis (FEA) software

Two difficulties associated with free FEA sodware :

• Heterogeneity of the tools

• Missing “expert” layer and documentation


ONELAB Guiding Principles

* Don’t reimplement, interface

• Make it easy to provide templates, with interactive parameter modification

• Make it as small and as easy to maintain as possible (no solver dependent code in the interface)

ONELAB Features

(1) Abstract interface to FEA codes

(2) Development and documentaIon of templates (“meta-­models”)

  (2.1) Model: backbox, parameterizable via abstract interface
 
  (2.2) Meta-­model: set of models + selection logic


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

Run on low end machines and/or machines with no graphical interface.

Parametric Modeling: Create parametric models with a few clicks.

Physical Groups: Group and organize entities into physical groups.

Post-processing: Visualize, analyze and compare results with ease. ==> visualize and export computational results in a great variety of ways. Gmsh can display scalar, vector and tensor datasets, perform various operations on the resulting post-processing views (see Post-processing module), can export plots in many
different formats (see General options list), and can generate complex animations (see General tools, and t8.geo).

built-in plug-ins ===> such as applying cuts, clips, and thresholding

Scripting: Create powerful scripts with the built-in scripting language.

Parallel computing of mesh ???  ===> From 2019, Multi-Threaded 3D meshing (fine-grained), STL remeshing. 

Gmsh is not a multi-bloc mesh generator: all meshes produced by Gmsh are conforming in the sense of finite element meshes;

Create repeatative geometries.


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
   analytical design of the magnet, to 2D model, to 2D simulation and 2D results to 3D model and 3D results  and optimization.

   (b) creating (or modifying) the .pro file for getdp

   (c) creating .sif file for Elmersolve

   (d) same .geo file can take form of different geometry, depending on parameters selectrd by the user.

3. GetDP is a comprehensive software application for solving boundary value problems using the finite element method. Its versatility, flexibility, meshing capabilities, numerical solvers, parallel computing support, visualization tools, and extensive documentation make it a valuable tool for engineers, researchers, and students working on a wide range of simulation tasks.

3A. getdp is so useful that CERN has brought its own version called cerngetdp. cerngetdp utilizes vast magnetic properties database of cern.
   so it simplifies the .pro (problem file) creation.

4. The "Run Control" section in ElmerSolver's .sif file is a relatively newer and very powerful addition that significantly enhances Elmer's capabilities for parametric studies, optimization, and complex transient simulations within a single input file.

   Before "Run Control," if you wanted to run, say, 10 different simulations where only one parameter varied (e.g., material conductivity), you would typically need 10 separate .sif files or manage the variations with an external script (e.g., Python, Bash). "Run Control" streamlines this.

==============

Generally, coupling of application codes requires taking output data from one application code simulation and
transforming it to input (e.g., boundary conditions or electromagnetic field maps) for a different application code simulation. Coupling different application codes involves finding solutions for a number of inherent complexities that limit the ability of accelerator scientists and engineers to work efficiently:

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

(0)  GetDP is an environment open to various couplings
Any coupling between
• Physical problems (electromagnetic, thermal, mechanical, ...)
• Numerical methods (finite element methods, integral methods, ...)
• Geometries (1D, 2D, 3D)
• Time states (static, harmonic, transient, eigen values)

  How?
    • Clear mathematical definitions/structure
    • Directly transcribed into 10 interdependent objects

1) It is Free and Open Source.

2) It is capable of solving Single or Multiphysics with various couplings

3) Flexibility to define application specific physics

4) Modern scripting langue allowing repeatable analysis

5) Graphical user interface provided via Gmsh, through ONELAB interface

6) available on Linux, Windows and Mac

7) It is light and fast.
  
8) It is able to solve 1D, 2D, 3D problems

9) DC analysis (or steady state analysis), time harmonic and time domain analysis

10) It provides for creating custom menus and parametric analysis (using GMSH)

12) It is used in CERN for superconducting magnet design (FiQuS)

13) It can be used for parallel computing using GetDDM.

14) It can easily be used with optimization programs ( suc as CONVEKS )

15) **stranded & massive conductor** simulation --> good performance even where ROXIE does not perform well, for example in HTS conductors.

**some shortcomings of GetDP**
1) steep learning curve because it is more dependent on programming. (It can be assumed its strength too.)

2) material libraries are not available like those in commercial softwares.

3) GetDP requires users to define almost everything from scratch. (But once created, it becomes re-usable.)
   
    
 **How Boundary Conditions Simplify Models**
 (1) boundary conditions simplify models by enabling the use of symmetry.
 
 (2) Representing Open Domains:  In problems like electromagnetics or acoustics, the field can extend to infinity. Since you can't model an infinite space, you use absorbing boundary conditions (such as perfectly matched layers or PMLs) to truncate the computational domain. This allows the model to be a manageable size while preventing waves from reflecting back into the simulation, which would produce inaccurate results.
 
 (3) Replacing Complex Sub-Systems: 
 
 (4) Handling Thin Layers: For models with very thin layers of material (e.g., a thin-film coating or a highly conductive metal sheet), it's often computationally expensive to mesh the thickness of the layer. Boundary conditions can replace these layers by applying a mathematical constraint that mimics the physical behavior of the thin layer, significantly reducing the mesh size and complexity. For instance, a very conductive material can be modeled with a shielding boundary condition that assumes a constant potential across its thickness.

**Tricky use of boundary conditions in Magnetic FEM simulation**

There are several tricky and non-obvious ways to use boundary conditions in magnetics FEM simulations to simplify models or solve complex problems. These methods often go beyond standard Dirichlet or Neumann conditions:

(1) Representing a Magnetic Core with a Single Boundary

Instead of modeling a magnetic core with many small elements, which can be computationally expensive, you can use a Perfect Magnetic Conductor (PMC) boundary condition. This assumes that the core has infinite permeability, meaning the magnetic field lines enter it perpendicularly. While this is an idealization, it's a good approximation for very high permeability materials and can dramatically simplify the model by eliminating the need to mesh the core's volume.

Similarly, a Perfect Electric Conductor (PEC) can be used to represent a shield or a container that completely confines the magnetic field. This is based on the idea that magnetic fields cannot penetrate a perfectly conducting surface.

2. Sourcing Current with a Boundary Condition

Instead of modeling a coil with thousands of individual wire turns, you can sometimes apply a current directly as a Neumann boundary condition on a surface. This is a common simplification for problems where the exact geometry of the winding isn't critical. By applying a surface current density, you can generate the same magnetic field as the coil, but with a much simpler model. This is particularly useful for linear problems or for when you're only interested in the far-field effects.

3. Modeling Eddy Currents with an Impedance Boundary

In problems involving high-frequency fields or moving parts, eddy currents are a major concern. Instead of meshing a thin conducting sheet with a very fine mesh to capture the skin effect, you can use an impedance boundary condition. This condition combines the field value and its derivative on the surface to approximate the effect of the eddy currents. It's a "Robin-type" boundary condition that links the electric and magnetic fields on the surface, allowing you to model the energy dissipation from eddy currents without explicitly modeling their volume. This can provide significant computational savings, especially for large models with many conducting parts.

4. Simulating a Magnetic Gap or Air Gap with a Boundary Condition

Modeling thin air gaps in a magnetic circuit can be challenging due to the need for a very fine mesh in a small region. A jump boundary condition can be used to handle this. Instead of a physical air gap, you can apply a boundary condition that enforces a discontinuity (a "jump") in the magnetic potential across the surface. This allows you to represent the effect of the air gap without actually meshing it, which is useful in both 2D and 3D magnetostatics problems.

--------

**Formulations in electromagnetics**

Magnetostatics is the subfield of electromagnetics describing a static magnetic field, such as the one generated by a steady electric current or a permanent magnet. 

Developing finite element models includes writing the differential problem describing the chosen physics into an alternative form, called a **formulation**, that is suited for a practical implementation of the finite element method. 

In the context of Finite Element Method (FEM) simulations for electromagnetics, a formulation refers to the specific set of unknown variables (degrees of freedom) and the corresponding governing equations derived from Maxwell's equations that are solved for on the mesh.

The choice of formulation is critical because it determines:

* What you solve for : The primary unknown (e.g., magnetic vector potential A, magnetic field H, scalar potential φ).

* Physical Phenomena Captured : Whether the formulation includes static fields, eddy currents, motion, etc.

* Computational Efficiency : Some formulations have more unknowns and are more computationally expensive.

* Ease of Applying Boundary Conditions : Some make it easier to set certain boundary conditions (like tangential H fields).

* Numerical Stability : Some are less prone to numerical errors like "cancelation errors" in regions of high permeability.

===> the full Maxwell’s equations describe wave phenomena, whereas the magnetodynamics equations define a diffusion problem.
The magnetodynamic (or magneto-quasistatic) approximation of Maxwell’s equations consists in neglecting the electric displacement current ∂td in the Ampere-Maxwell’s law.

===> Maxwell's equations is completed by constitutive following relations. For isotropic materials, three scalar parameters are introduced and define the relations

b = µh,        d = εe,        j = σe

with µ the permeability (H/m), ε the permittivity (F/m) and σ the electrical conductivity (S/m).
In general, constitutive relations are nonlinear and the three parameters µ, ε and σ can be
complicated functionals or functions of, e.g., position, temperature, magnetic field, electric field
or mechanical stress and strain. 

===> In COMSOL, these are the proposed formulations (1) Magnetic Fields, No Current; (2) Magnetic Fields only ; (3) Magnetic and Electric Fields;  and (4) Magnetic Field Formulation. These are sometimes called Vm, A, A-V, and T formulations, respectively.

The A–V Formulation

The A Formulation can be combined with The V Formulation to take into account static electric fields. This formulation, referred to as the A–V formulation, is used by The Magnetic and Electric Fields Interface. The A–V formulation solves two dependent variables — A and V in a fully coupled way. For more details, see the Theory for the Magnetic and Electric Fields Interface.


The A–Vm Formulation

(Vm is magnetic scalar potential)

Mixed formulations are also used in computational electromagnetics. These formulations use different formulations that are more suitable for specific computation domains. One of the most famous mixed formulations is the A–Vm formulation, which is a combination of The A Formulation and The Vm Formulation. In this mixed formulation, The A Formulation is used to model current-carrying domains, and The Vm Formulation is used to model the air gap and other nonconducting domains. The two formulations are coupled on their common interfacing boundaries. The A–Vm formulation is used by The Rotating Machinery, Magnetic Interface.


T-A formulation

In recent years, the T-A formulation has emerged as an efficient approach for modelling the
electromagnetic behaviour of high-temperature superconductor (HTS) tapes in the form of
coated conductors (CCs). HTS CCs are characterized by an extremely large width-to-thickness
ratio of the superconducting layer, normally up to 1000 ∼ 6000, which in general leads to a very
large number of degrees of freedom. The T-A formulation considers the superconducting layer
to be infinitely thin. The magnetic vector potential A is used to calculate the magnetic field
distribution in all simulated domains. The current vector potential T is used to calculate the
current density in the superconducting layer, which is a material simulated with a highly
nonlinear power-law resistivity.


Standard and Mixed Finite Element Formulations

h-φ , a , h-φ-a, t-a, h-φ-b, and a-j 

h - magnetic field  ,  a - mag vector potential , φ - scaler magnetic potential,  T - electric vector potential, b - magnetic flux density, j - current density.

The h-φ-formulation is a weak form of Faraday’s law.

(ref : This thesis : Standard and Mixed Finite Element Formulations for Systems with Type-II Superconductors)

===> We highlight the fact that the best formulation is problem-dependent and we give general recommendations for obtaining
efficient time-stepping and linearization techniques.

Summary Table
Formulation	Primary Unknowns	Key Application	Pros	Cons
a (A)	Magnetic Vector Potential	General 3D Magnetostatics	Robust, handles currents & magnets	3 unknowns/node, expensive
ϕ	Scalar Potential	Magnetostatics (no currents)	Very efficient (1 unknown/node)	Cannot model regions with current
h-φ (H-φ)	H-Field, Scalar Potential	Magnetostatics (high-μ materials)	Avoids numerical cancelation	More complex than simple ϕ
a-φ (A-φ)	A-Vector Potential, φ-Scalar	3D Eddy Currents (AC)	Industry standard for AC	Computationally expensive
t-Ω (T-Ω)	T-Vector Potential, Ω-Scalar	Eddy Currents in conductors	Efficient for eddy-dominated problems	Less common, harder to find sources
h-φ-a (H-φ-A)	H, φ, A	Hybrid AC/Motors	Accuracy in iron + efficiency in air	Complex setup & coupling
a-j (A-J)	A-Vector Potential, J-Current	Superconductors	Directly models nonlinear E-J law	Specialized use case

In practice, modern simulation software (like COMSOL, ANSYS Maxwell, JMAG) often chooses the optimal formulation automatically based on the physics interfaces you add (e.g., "Magnetic Fields" vs. "Magnetic Fields, No Currents") but allows advanced users to select and modify them for specific needs.
=====================================================

Material library

Model library

Examples library

Benchmark library


===============================================================

**Multi-physics simulations for electrical machine development**

Design of electrical machines requires a good command of multi-physical phenomena including electromagnetism, mechanics, thermodynamics, structural dynamics, vibration, noise, fluid dynamics, and fatigue. The functioning of the machines rises from electromagnetic phenomena connected with mechanical rotation and connected electrical circuits.

===> . The parallel performance of Elmer exceeds the results of GetDP, as GetDP utilises parallel computation only in linear solvers, whereas Elmer also in linear system assembly. Furthermore, in the test cases, Elmer shows a good parallel performance with rotating electrical machine models.

===> As electrical machines design is inheritably multi-physical, its accurate three-dimensional (3D) modelling has been out-of-question until recently. The computational burden has been too heavy for traditional computation tools and hardware. 

Numerical 2D electromagnetic computation is a standard tool in design and analysis of electromechanical apparatuses. 

===> SMEKlib
2D-FEA Library for Electrical Machines in Matlab
https://github.com/AnttiLehikoinen/SMEKlib


=============================================


The main feature differentiating GetDP from other tools is that the formulation of a discrete
problem is given by user in ASCII data files with syntax close to the symbolic mathematical
expressions of this problem. GetDP thus gives user advanced developing tools and a large
freedom in adding new functionalities only by writing a new ASCII file, without changing the
source code.

Gmsh has four modules: geometry, mesh, solver and post-processing, where the
solver is by default GetDP. The input to these modules can be done either interactively using
the graphical user interface or with ASCII script files using Gmsh's own syntax.

Both GetDP and Gmsh are originated from University of Liège, Belgium. 

===> Electrical machine models need a model for rotor rotation and for the
connected electrical circuits. There are two main types of different models allowing the rotor
mesh to rotate relative to the stator mesh: sliding surface models and moving band methods.

GetDP uses moving band method, where a band of mesh exists in the air-gap between stator and rotor meshes which provides conformity. 

---> Elmer can deal with a great number of different equations, which may be coupled in a generic
manner making Elmer a versatile tool for multi-physical simulations. Elmer includes physical
models of e.g. fluid dynamics, structural mechanics, electromagnetics, heat transfer and
acoustics. In some research intensive fields, Elmer is the globally leading code, e.g. glaciology 3D ice flow simulation. 
Moreover, Elmer’s strengths are in multi-physical problems and in massive parallelisation. ( For some solvers,
the parallel performance may scale up to thousands of cores.)

Within the present decade, there has been effort to
develop Elmer towards electromagnetics problems; for example edge elements, indispensable
for electrodynamic simulations, were implemented few years ago. The first solver to use edge
elements, WhitneyAVSolver, was implemented by Juha Ruokolainen in 2010 with the help of
Saku Suuriniemi from Tampere University of Technology.

Elmer’s rotation air-gap model is of sliding air-gap type, based on the so-called mortar method. The method is more suitable for 3D compared to moving band method used in GetDP.

===> FEMM's electrical machine modelling is very limited due to lack of a time-dependent solver and a rotation model.


=========================================================================

**Getting started with Onelab & Python**
https://github.com/jackbkennedy/onelab/tree/master

**very good manual** of GetDP 3.5.0
https://getdp.info/doc/texinfo/getdp.html#Magnetodynamics

https://GetDP 4.0.0 (development version)  
getdp.info/dev/doc/texinfo/getdp.html


===> Python API Tutorial: Getting Started with APIs

https://www.geeksforgeeks.org/python/python-api-tutorial-getting-started-with-apis/


=====================================================================================

19-9-2025

1) I was able to save data in gmsh format (*.msh) and visualize it with GMSH. For this, a new solver section should be added like the following (using 'results output' in Elmer model --> Equation --> Add) :

Solver 3
  Equation = Result Output
  Procedure = "ResultOutputSolve" "ResultOutputSolver"
  Exec Solver = after saving  !!! Note this !!!
  Output File Name = gmsh_output
  Output Format = Gmsh
  Binary Output = False

  Save Geometry Ids = True
  Save Nodal Fields = True
  Save Elemental Fields = True

  Vector Field 1 = Magnetic Flux Density

  Vector Field 2 = Current Density

  Scalar Field 1 = Jfix

End

2) In Elmer, vtu files can be made in many parts also, like case_air.vtu , case_winding.vtu . This helps to have smaller files.

**Convergence Problem in Elmer**
Absurd results or convergence problem can arise in Elmer due to inappropriate sequence of equations. I have the following experience- 
1) Active Solvers (3) 2 3 1  ===> does NOT indicate that the sequence is 2, 3, 1.

2) It olnly indicates which solvers are active (to be used). Others not included in this list may NOT execute. ===> But I have seen that "Execute solver" should also be equal to 'never' to do this.


===============================================================

the following is   from  https://www.nic.funet.fi/index/elmer/courses/cource_may2010/DerivedDataInElmer_May2010.pdf

**Great solvers not available in ElmerGUI**

===> Only the most important solvers are supported by the GUI.

===> There are more than 100 minimalistic test cases in Elmer. Among these, it is possible to find most of the implemented solvers.


**Derived data in Elmer** 

===> There exists a number of auxiliary solvers for computing derived
fields ( Grad, Div, Curl, Streamlines, … Solvers for dimensional reduction: 3D -> 2D ; Averaging over time or space dimension ; Solvers for outputting 0D data such as Energy, flux, time, CPU time, number of iterations, etc…)
===> Typically these solvers in advanced context are added by copy-paste.

===> Usually auxiliary data need to be computed only after the iterative solution is ready or needed for saving
• Exec Solver = after timestep
• Exec Solver = before saving


**DefUtils in Elmer**
The default utilities have many additional features that are automatically accessible via commands in the .sif file.


===================================

**Some more things about Elmer**
1) Scan
2) Slave solvers
3) transient restart
4) adaptive time steps
5) Rotational normals for rotating machine problems
6) WPotential Solve --->
7) using keywords introduced by the user
8) Defining parameters depending on field variables ===> Use MATC instead of FORTRAN as MATC has the benefit of being an interpreted language, making an additional compilation step with a compiler unnecessary.
Simple interpolating functions can be created by means of tabular data. The following example defines the parameter Density the value of which depends on the variable Temperature:
Density = Variable Temperature
 Real
  0 900
  273 1000
  300 1020
  400 1000
 End

9) In the solver input file an expression following the symbol $ is generally interpreted to be in MATC language. If
the solver input file contains the lines
$solvertype = "Iterative"
$tol = 1.0e-6
then one may define, e.g.,
Solver 1
...
Linear System Solver = $solvertype
Linear System Convergence Tolerance = $tol
...
End

10) Soft limiters ===> The user may set soft lower and upper limits to the values of the field variable.  The limiters may be applied to both boundary conditions and bodies.

11) Boundary conditions ===> Dirichlet, Neumann, Conforming conditions, periodic,

12) Solver activation ===> There is a large number of different ways how solvers need to be activated and deactivated. Mostly these needs are related to different kinds of multiphysical coupling schemes. If nothing else is specified, the solver is called every time in its order of appearance.

13) Solver execution by a master solver  ===> With special keywords a solver may activate the execution of another solver in a particular stage of the solution procedure. Here the solver which performs the activation is called a master solver.

14) Variable names ===> The variable name is presented in the Solver section by keyword Variable, for example
     Variable = Varname
    This name is used when setting Dirichlet conditions and initial conditions.

15) Active and passive elements ===> In Elmer it is possible to define certain areas of the modeled geometry to be passive during the solution. This feature also allows for deactivating and reactivating of the elements.

16) Meshing Utilities ===> ElmerSolver includes some internal possibilities to affect the mesh.

17) Coordinate transformation ===> scaling, rotaion, Coordinate transformations from Cartesian to cylindrical etc.

18) Mesh multiplication  ===> Mesh multiplication is the process where each mesh edge is split into two resulting to an increased number of elements.

19) 5 ways to run Elmer
      1. Compile from source code
      2. Install ready pre-compiled package (Linux, Windows)
      3. Run virtual appliance in virtual machine
      4. Run inside a pre-defined container (Docker)
      5. Run remotely on system with Elmer installation
      6. run on google colab
   
## Paraview

A highly useful feature in the ParaView GUI for generating pvpython code is the Python Trace tool. You can perform actions interactively in the GUI (e.g., load a file, apply a clip filter, change a color map), and the trace tool will automatically generate the equivalent **pvpython** script, which can then be saved and executed using pvpython or pvbatch.

pvpython is the Python interface to ParaView. You can think of pvpython as ParaView with a Python interface.

from paraview.simple import *

**===> in colab environment, use pyvista for visualization instead of paraview. Paraview is better for interactive visualization while pyvista is better for automated visualization.**
   




