(1) https://github.com/AI4Bharat/indicnlp_catalog ===> This is a Github repository named <b>indicnlp_catalog</b>. There is a great list of advanced language computing resources here.

(2) https://pypi.org/project/PyMultiDictionary/ ===> PyMultiDictionary is a Dictionary Module for Python 2 to get meanings, translations, synonyms and antonyms of words in 20 different languages

(3) <b>ZunZunSite3 Online Curve Fitting and Surface Fitting Web Site</b> http://findcurves.com/   

**procedure for using this application**
(1) select any 'field of use' from 2D or 3D  (eg, 3D Bioscience)
(2) from there, choose a particular function (eg,  Logistic Growth 3D)
(3) select 'fitting target' from the menu and it will give options such as 'Lowest sum of squared absolute error' ,
    'Lowest sum of squared orthogonal distance' and several others.

**Database for particle accelerator centres**
* DABATASE FOR NSLS-II ACCELERATOR OPERATION_2017  https://epaper.kek.jp/ipac2017/papers/wepab121.pdf
* A Software System for Measurement of  Accelerator Magnets Using a Relational  Database
  https://www.academia.edu/107141004/A_software_system_for_measurement_of_accelerator_magnets_using_a_relational_database
* 

Online Computing applications
============================
1) https://www.rollapp.com/apps ===> many applications including paraview, gmsh  

also see : OnWorks ,  Distrowatch, https://gnuplot.io/ (for gnuplot)

2) 109 Useful Websites & Online Applications You Should Know About

3) Particle Tracking Module for Python https://github.com/acanbay/apricot

4) Engineering Design Utilities (Okawa Electric Design)    http://sim.okawa-denshi.jp/en/

5) https://fossee.in/    FOSSEE, IIT Mumbai

6) Scilab on the cloud    https://cloud.scilab.in/

7) Scicos on the cloud     https://xcos.scilab.in/

8) Octave Online     https://octave-online.net/

9) Modelica by Examples     https://mbe.modelica.university/

10) Infineon  PowerEsim Switch Mode Power Supply Design Tool     https://www.poweresim.com/

11) ZunZunSite3 Online Curve Fitting and Surface Fitting Web Site    https://www.findcurves.com

12) Convert any blog or website to an interactive learning platform for data science   https://github.com/datacamp/datacamp-light



Magnetic Field calculation codes
================================

Python package for computation of magnetic fields of magnets, currents and moments.   ===> https://github.com/magpylib/magpylib
Magpylib Documentation  ===> https://magpylib.readthedocs.io/en/latest/index.html
https://pypi.org/project/magpylib/


magcoilcalc - Axisymmetric circular current loops (coils) magnetic field calculator
https://github.com/sq-meng/coilcalc


MAGNETIC FIELD TOOLS, A C++/PYTHON LIBRARY FOR MAGNETIC FIELD PROCESSING (IPAC2023)
https://accelconf.web.cern.ch/ipac2023/pdf/WEPL126.pdf
https://gitlab.esrf.fr/IDM/magfieldtools/-/tree/master?ref_type=heads

An Open-Source Finite Element Quench Simulation Tool for Superconducting Magnets (2023)
https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=10077402


planetMagFields: A Python package for analyzing and plotting planetary magnetic field data (2024)


Python Simulation of Linear and Non-Linear Accelerator Elements  ; July 27, 2016
The PhD thesis ===>  https://lup.lub.lu.se/luur/download?func=downloadFile&recordOId=8890678&fileOId=8890685
The code is here ===> Differential-Algebra-Tracker ===>  https://github.com/OscarES/Differential-Algebra-Tracker


Further investigation
=====================

Study Assembly Modeling 

Study using FreeCAD for building information modeling (BIM) and FEM modeling for Elmer

Choosing the Best 3D CAD Software: A Comprehensive Guide 
https://formlabs.com/asia/blog/cad-software/?srsltid=AfmBOoqwzfuT-Ok1Jt3VCqhmh6XDxdxHCHa09aBDAJ689Gy2XLmXMq9G

Generative Design 101 ===> https://formlabs.com/asia/blog/generative-design/

AutoMATES: Automated Model Assembly from Text, Equations,and Software (2020)
https://arxiv.org/pdf/2001.07295
https://github.com/ml4ai/automates


Undulator design etc
===============
https://github.com/radiasoft/sirepo ===> radiasoft sirepo    

https://github.com/hidecode221b  ===> Radia-MPW and U4Opt etc

https://github.com/hidecode221b/U4Opt ===> U4Opt : Undulator plot for the period optimization ====> good for writing python code yourself

https://github.com/radiasoft/Radia-Examples/tree/master?tab=readme-ov-file ===> Radia Examples

https://gitlab.esrf.fr/IDM/radia/radiaid ===> RadiaID : Python library for building undulator RADIA models. It can be used for building various undulator in Python.


UNDUMAG and WAVE have been developed at **HZB/BESSY**. They are used intensively to design undulators, 
and to understand their magnetic and synchrotron radiation properties, as well as their impact on the storage ring. 
UNDUMAG - WAVE RECENT DEVELOPMENTS (2023) ==> https://accelconf.web.cern.ch/ipac2023/pdf/MOPM105.pdf
http://gitlab.helmholtz-berlin.de/gep/undumag.git
http://gitlab.helmholtz-berlin.de/gep/wave.git
http://gitlab.helmholtz-berlin.de/gep/brill.git

**OSCARS**  (from BNL)
Open Source Code for Advanced Radiation Simulation  ===> examples are given
https://oscars.bnl.gov/index.php
https://oscars.bnl.gov/examples.php


PyB2E undulator radiation module (from ESRF)  ===> https://gitlab.esrf.fr/IDM/b2e-py

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

----

**Tools That Can be Used in Control System Design**  https://electronicsbeliever.com/tools-that-can-be-used-in-control-system-design/
( Matlab, Simulink, Spice Based Simulation Software (With Simetrix or any spiced based simulator you don’t need to derive the transfer function anymore), SimPowerSystems, 
    State Flow --> An emerging tool nowadays for control system design is state flow.
    Mathcad Template

---
29-12-2025

ChatGPT is Old-Age. These are the 10X better Alternative Tools You Should Be Using 
https://beingpax.medium.com/chatgpt-is-old-age-these-are-the-10x-better-alternative-tools-you-should-be-using-094d5f765a93

Fabric: The Best AI Tool That Nobody is Talking About    
https://beingpax.medium.com/why-fabric-ai-can-change-the-way-you-use-ai-973e725354da
--> **fabric** is an open-source framework for augmenting humans using AI. It provides a modular framework for solving specific problems using a crowdsourced set of AI prompts that can be used anywhere.  https://github.com/danielmiessler/fabric

Top 15 Trending GitHub Repositories For AI Developement  
https://blog.stackademic.com/top-15-trending-github-repositories-for-ai-developement-ca05acb9d390

EASY Web Scraping with Google Gemini 2.0  
https://ai.gopubby.com/easy-web-scraping-with-google-gemini-2-0-88d3a8d0b2a8

Do Not Use LLM or Generative AI For These Use Cases 
https://pub.towardsai.net/do-not-use-llm-or-generative-ai-for-these-use-cases-a819ae2d9779

Cool SHIT you can do with DOCKER (for your home lab) 
https://levelup.gitconnected.com/cool-shit-you-can-do-with-docker-for-your-home-lab-af857dfc206d

----

https://manasganit.com/bhartiya-vidya-saar-bhartiya-vigyan-parampara/  

----

Ollama
https://dasarpai.com/dsblog/exploring-ollama
