***WELSIM*** : WELSIM is the world's leading pre- and post-processor for the open-source solvers, including but not limited to CalculiX, Elmer FEM, FrontISTR, LAMMPS, MFEM,...

https://welsim.com/2023/04/05/welsim-releases-2023r2-supporting-open-source-electromagnetic-simulation-solver.html


***Palace***: 3D Finite Element Solver for Computational Electromagnetics  

https://awslabs.github.io/palace/stable/


***planetMagFields*** : A Python package for analyzing and plotting planetary magnetic field data (2024)


Python Simulation of Linear and Non-Linear Accelerator Elements  ; July 27, 2016

The PhD thesis ===>  https://lup.lub.lu.se/luur/download?func=downloadFile&recordOId=8890678&fileOId=8890685

The code is here ===> Differential-Algebra-Tracker ===>  https://github.com/OscarES/Differential-Algebra-Tracker


***Magpylib*** : Python package for computation of magnetic fields of magnets, currents and moments.   ===> https://github.com/magpylib/magpylib
Documentation  ===> https://magpylib.readthedocs.io/en/latest/index.html
https://pypi.org/project/magpylib/


***magcoilcalc*** - Axisymmetric circular current loops (coils) magnetic field calculator
https://github.com/sq-meng/coilcalc


MAGNETIC FIELD TOOLS, A C++/PYTHON LIBRARY FOR MAGNETIC FIELD PROCESSING (IPAC2023)
https://accelconf.web.cern.ch/ipac2023/pdf/WEPL126.pdf
https://gitlab.esrf.fr/IDM/magfieldtools/-/tree/master?ref_type=heads


An Open-Source Finite Element Quench Simulation Tool for Superconducting Magnets (2023)

https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=10077402


Undulator design etc
====================
https://github.com/radiasoft/sirepo ===> radiasoft sirepo    

https://github.com/hidecode221b  ===> Radia-MPW and U4Opt etc

https://github.com/hidecode221b/U4Opt ===> U4Opt : Undulator plot for the period optimization ====> good for writing python code yourself

https://github.com/radiasoft/Radia-Examples/tree/master?tab=readme-ov-file ===> Radia Examples

https://gitlab.esrf.fr/IDM/radia/radiaid ===> RadiaID : Python library for building undulator RADIA models. It can be used for building various undulator in Python.


**UNDUMAG** and **WAVE** have been developed at **HZB/BESSY**. They are used intensively to design undulators, 
and to understand their magnetic and synchrotron radiation properties, as well as their impact on the storage ring. 

UNDUMAG - WAVE RECENT DEVELOPMENTS (2023) ==> https://accelconf.web.cern.ch/ipac2023/pdf/MOPM105.pdf
http://gitlab.helmholtz-berlin.de/gep/undumag.git
http://gitlab.helmholtz-berlin.de/gep/wave.git
http://gitlab.helmholtz-berlin.de/gep/brill.git

**OSCARS**  (from BNL)
Open Source Code for Advanced Radiation Simulation  ===> examples are given
https://oscars.bnl.gov/index.php
https://oscars.bnl.gov/examples.php


**PyB2E** undulator radiation module (from ESRF)  ===> https://gitlab.esrf.fr/IDM/b2e-py

Package **xrt** (XRayTracer) is a python software library for ray tracing and wave propagation in x-ray regime.  
https://github.com/kklmn/xrt
https://xrt.readthedocs.io/  ==> Package xrt is a python software library for ray tracing and wave propagation in x-ray regime.


Modelling undulators in ray tracing simulations
https://arxiv.org/html/2410.13672v1 
The radiation emitted by the undulator exhibits distinct structures both in its spectrum, presenting peaks at some photon energies (resonances), and in its geometry (wavefront size and derived divergences). Sseveral software tools are available to compute the characteristics of the UR. Among them, SRW [codeSRW] and SPECTRA [Tanaka2001] are the most advanced.

Ray tracing packages create undulator sources by sampling rays according to the distributions given by the undulator theory. Several codes are available in the synchrotron community to calculate the undulator emission characteristics in different cases. The codes URGENT [codeURGENT] and US [codeUS] compute undulator emission in the far-field for undulators with a sinusoidal magnetic field. The codes SRW [codeSRW] and SPECTRA [Tanaka2001] are more generic as they calculate emission in the near and far-field for any electron trajectory (with different initial conditions) and submitted to an arbitrary magnetic field. We use pySRU [pySRU], an open source code developed in Python, that calculates the emission using equation (3). It is well integrated in python ecosystems, such as OASYS [codeOASYS], which includes the SHADOW4 user interface. Portions of pySRU have been incorporated into the internal code of SHADOW4.

**RadiaMM** https://gitlab.esrf.fr/IDM/radia/radiamm
The Radia Multipole Magnets (radia_mm) module is dedicated to the simulations of accelerator electromagnet quadrupoles. radia_mm is based on the RADIA magnetostatic code. It inclules functions for building multipoles such as bending magnets, quadrupole lenses and higher order multipoles.

**RadiaID**  https://gitlab.esrf.fr/IDM/radia/radiaid
Python library for building undulator RADIA models. It can be used for building various undulator in Python. The undulators come as Python objects with longitudinal field plots, 3D geometry plots and other methods.

**MATLAB live scripts for Hands-on Accelerator Physics using MATLAB**  https://github.com/volkziem/HandsOnAccelerators?tab=readme-ov-file

**multipoles**   https://github.com/maroba/multipoles
It is a Python package for multipole expansions of the solutions of the Poisson equation (e.g. electrostatic or gravitational potentials). It can handle discrete and continuous charge or mass distributions. https://github.com/maroba/multipoles

**ROXIE homepage**   https://roxie.docs.cern.ch/index.html
You can install ROXIE on a private computer or within your institute. For users outside of CERN, plase note that you need an institute ROXIE license to run roxie.

**Fiqus** 
An Open-Source Finite Element Quench Simulation Tool for Superconducting Magnets (pdf)   https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=10077402
A transient magneto-thermal quench simulation of a no-insulation HTS pancake coil with FiQuS/Pancake3D, developed at CERN. 
https://github.com/sinaatalay/fiqus-pancake3d-example?tab=readme-ov-file

-----


**gprMax** is open source software that simulates electromagnetic wave propagation. 
It uses Yee's algorithm to solve Maxwell’s equations in 3D using the Finite-Difference Time-Domain (FDTD) method. 
The finite difference expressions for the spatial and temporal derivatives are central-difference in nature and second-order accurate.


**maxFEM**

https://sourceforge.net/projects/maxfem/


**Meep** is a free and open-source software package for electromagnetics simulation via the finite-difference time-domain (FDTD) method.  
https://meep-hr.readthedocs.io/en/latest/


------------

***COULOMB*** 3D Electric Field Simulation Software

Integrated Engineering Software, Inc. (not a freeware)

COULOMB is INTEGRATED's powerful 3D electric design and analysis software. COULOMB is well suited for applications where the design requires a large open field analysis and exact modeling of the boundaries. COULOMB combines the capabilities to analyze corona ring & partial discharge effects, electric field stress, lightning, transient events, maximum field strength and dielectric breakdown, among others,

Engineers/Scientists choose COULOMB for the design and analysis of electrical components such as:
    transformers 
    insulators, bushings, grounding electrodes
    high voltage shields
    power transmission lines
    high voltage switchgear
    telecommunication cables
    lenses for beam deflection
    capacitive transducers
    microelectromechanical systems
    parts and assemblies subject to electrical fields


Choosing the Best 3D CAD Software: A Comprehensive Guide 
https://formlabs.com/asia/blog/cad-software/?srsltid=AfmBOoqwzfuT-Ok1Jt3VCqhmh6XDxdxHCHa09aBDAJ689Gy2XLmXMq9G


**AutoMATES**: Automated Model Assembly from Text, Equations,and Software (2020)
https://arxiv.org/pdf/2001.07295
https://github.com/ml4ai/automates


**Particle Tracking** Module for Python     https://github.com/acanbay/apricot


**Tools That Can be Used in Control System Design**  

https://electronicsbeliever.com/tools-that-can-be-used-in-control-system-design/

( Matlab, Simulink, Spice Based Simulation Software (With Simetrix or any spiced based simulator you don’t need to derive the transfer function anymore), SimPowerSystems, 

    State Flow --> An emerging tool nowadays for control system design is state flow.
    Mathcad Template


Cool SHIT you can do with **DOCKER** (for your home lab) 
https://levelup.gitconnected.com/cool-shit-you-can-do-with-docker-for-your-home-lab-af857dfc206d


Further investigation
=====================

Study Assembly Modeling 

Study using FreeCAD for building information modeling (BIM) and FEM modeling for Elmer
