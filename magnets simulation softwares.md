To install the Radia package on Ubuntu, you'll need to compile it from the source code using the provided `Makefile`.

\<br\>
\<br\>

## Installation Steps

Here's a step-by-step guide to get Radia installed:

1.  **Clone the Repository**: First, you need to get a local copy of the Radia source code from its GitHub repository. Open a terminal and run the following command:

    ```bash
    git clone https://github.com/ochubar/Radia.git
    ```

2.  **Navigate to the Directory**: Move into the newly created Radia directory.

    ```bash
    cd Radia
    ```

3.  **Install Prerequisites**: The `Makefile` indicates that it compiles an external library, FFTW. However, you'll still need a C++ compiler and other essential build tools. Install these by running:

    ```bash
    sudo apt-get update
    sudo apt-get install build-essential gfortran libfftw3-dev python3-dev wget
    ```

      - **`build-essential`**: A meta-package containing essential build tools like `g++` (C++ compiler) and `make`.
      - **`gfortran`**: A Fortran compiler that might be a dependency for some of the underlying libraries.
      - **`libfftw3-dev`**: The development headers for FFTW, which the `Makefile` seems to use.
      - **`python3-dev`**: Necessary for compiling the Python bindings for the Radia library.
      - **`wget`**: Used by the `Makefile` to download the FFTW source if needed.

4.  **Compile the Package**: The provided `Makefile` has several targets. The `all` target is the most comprehensive as it compiles the FFTW library, the C++ core, and the Python library. Execute this command:

    ```bash
    make all
    ```

    This command will download the necessary files, compile them, and build the final libraries. The output may show some warnings, but as long as there are no critical errors, the process should complete successfully.

5.  **Test the Installation (Optional)**: After the compilation is complete, you can test if the Python library was built correctly. You can try to import the `radia` module from within the `env/radia_python` directory.

    ```bash
    cd env/radia_python
    python3
    >>> import radia
    ```

    If no errors appear, the installation was successful. You can now use the `radia` library in your Python scripts.

\<br\>
\<br\>

## `Makefile` Breakdown

The `Makefile` is a script that automates the compilation process. Here's what the key commands do:

  * **`make all`**: This is the main command you should use. It's a combination of `clean`, `fftw`, `core`, and `pylib`.
  * **`make fftw`**: Downloads and compiles the **FFTW** (Fastest Fourier Transform in the West) library, a common C library for computing the discrete Fourier transform. The `Makefile` downloads a specific version (`fftw-2.1.5`) and compiles it as a static library.
  * **`make core`**: Compiles the core **C++ library** of Radia. This is the main computational engine.
  * **`make pylib`**: Compiles the **Python wrapper** that allows you to use the C++ core library from within Python.
  * **`make clean`**: Removes all the compiled temporary files and libraries, essentially "resetting" the build environment.

  * 
================================

===> **Radia** : 3D Magnetostatics Open Source Computer Code. 



===> I also Installed **radia_ID**  in  /home/anunad/radiaid   today (22-9-2025)

===> **PyRadiaUndulators** : Python library for building undulator RADIA models. It can be used for building various undulator in Python.

===> Also Install  **MagFieldTools-swig**  provided at https://gitlab.esrf.fr/IDM/magfieldtools-swig

       See the paper  MAGNETIC FIELD TOOLS, A C++/PYTHON LIBRARY FORMAGNETIC FIELD PROCESSING  
         https://epaper.kek.jp/ipac2023/pdf/WEPL126.pdf

===> **RadiaMM**  
https://gitlab.esrf.fr/IDM/radia/radiamm


===> **rsradia** : The rsradia package contains utility functions and extensions for the Python version of the code Radia.

===> **jupyter_rs_radia** : Widget for visualizing 3D Radia models in a jupyter notebook

RadiaViewer allows users to render a magnet geometry and solve for its fields in a self-contained widget. The rendering is done by the VTK.js library.

===> The **Sirepo** is a generic framework for handling multiple open source codes through a browser interface. It supports physics codes like elegant, Warp, SRW, JSPEC, Zgoubi, and more. With it, you can configure, run, visualize, and share end-to-end HPC physical simulations on your browser.

Sirepo  consists  of  a  graphical  web  interface  based  on  JavaScript  with  a backend  server  (either  on  local  machine  or  a  remote  server)  able  to  serve  many  different  software  packages,  including  already  implemented  interfaces  with  Synchrotron  Radiation  Workshop  (SRW)  for  accurate  X-ray  source  and  optics simulations1,2,3, Shadow3  –  a ray optics code  with  many sophisticated features for X-ray  beamlines4,5, and a  number of codes  for particle  accelerators  simulations.

For the impact on the electron beam, there are two objects of interest that Radia can export. The ﬁrst, a magnetic ﬁeld map, may be imported directly into a beam dynamics code such as elegant. A second object of export that is commonly used for undulators is a kick map. This represents the total kick an electron will receive due to a ﬁxed longitudinal domain of the undulator. Also, the on-axis magnetic ﬁeld of an undulator can be by exported and importing into a synchrotron radiation code such as SRW, and the radiation may be conveniently computed. 

Sirepo  is  distributed  in  several  formats.

**Recent developments to the Radia magnetostatics code for improved performance and interface** (Dec 2022)
Radia is a 3D magnetostatics code that is widely used to model a range of magnets for particle accelerators, with particularly broad usage within the synchrotron light source community. Recently, Radia has been released as open source and made available for collaborative development on GitHub. A US DOE SBIR grant has been obtained for its upgrade and extension. The ongoing improvements are focused on the core physics engine, performance enhancements, and the development of a graphical user interface. Additionally, a new Python API (PyRadia) has been developed to allow for wider use of Radia outside of the existing Mathematica API. We have implemented the majority of the Radia examples in Python scripts and in Jupyter notebooks, including advanced visualization features for interactively viewing 3D geometries based on the VTK toolkit. The interaction matrix and field calculations have been parallelized using MPI and show good scaling performance on a variety of cluster architectures. The parallel Radia may be accessed via Python scripts or using the Jupyter interface. A Sirepo application is under development to provide a browser based interface to the Radia code allowing modeling of synchrotron light source magnets, with a focus on undulators. Kick maps and field maps may be exported for use in electron storage ring modeling codes such as elegant or AT, and tabulated undulator files may be exported for x-ray optics computation in a physical optics code such as Synchrotron Radiation Workshop.

-----------

===> BESSY II houses 13 permanent magnet undulators: 7 APPLE II devices, 5 out of vacuum planar devices, and 1 cryogenic permanent magnet undulator (CPMU). The MLS is home to one planar undulator. All devices have been modelled, designed, built and measured in house and continue to act as brilliant photon sources to many of HZBs beamlines. 

(in year 2023) The codes **UNDUMAG** and **WAVE** have been developed at HZB/BESSY. They are used intensively to design undulators, and to understand their magnetic and synchrotron radiation properties, as well as their impact on the storage ring.

**UNDUMAG** is a stand-alone FORTRAN program to calculate magnetic fields of magnets, iron poles, and electric coils. In addition, an electron trajectory through the field and the corresponding synchtron radiation at a given point can be calculated.

**WAVE** has been developed at BESSY over the years to calculate synchrotron radiation for almost arbitrary magnetic fields with high precision.
WAVE has been used for the design of all insertion devices and the investigation of the insertion_device – electron_beam interaction, in particular of the superconducting wave-length shifters and wigglers at the storage ring BESSY I

Simulation of insertion device performance : WAVE
https://www.helmholtz-berlin.de/forschung/oe/wi/undulators/software-for-undulators/wavepage_en.html 


**pybrill** : Sometimes there is no need for a sophisticated detailed calculation of undulator radiation, one only wants a quick
brilliance of spectrum calculation. This is accomplished by the Python script pyBrill.py .


Undumag, Wave and Brill can be downloaded from
http://gitlab.helmholtz-berlin.de/gep/undumag.git
http://gitlab.helmholtz-berlin.de/gep/wave.git
http://gitlab.helmholtz-berlin.de/gep/brill.gi


## Magnet Simulation Software in Various labs
Several electromagnetic software packages have been widely used for the 3D ﬁeld simulation, such as OPERA, ROXIE, RADIA, ANSYS. For an iron-free coil, the magnetic ﬁeld can be computed in terms of Biot-Savart type integrals which do not require the meshing of the coil.

ESRF ===> Radia
BESSY ===> Undumag & Wave
CERN ===> ROXY, CERNGetDP
MAX IV ===>  2D simulations were performed using FEMM for all magnet elements. 3D simulations were performed using Radia for dipoles and quads as standalone magnets, ie no 3D simulations of the full magnet blocks.


====> The field simulations in Radia for IVW on Mathematica can be reproduced in Python on macOS on both Intel and Arm architectures, and the model can be visualized in open-source ParaView and PyVista based on a visualization toolkit (VTK)


=================================


24-9-2025

ROXIE ==>  THE ROUTINE FOR THE OPTIMIZATION OF MAGNET X-SECTIONS, INVERSE FIELD COMPUTATION 
                      AND COIL END DESIGN

Designed by S. Russenschuck


The ROXIE program was created by Stephan Russenschuck at CERN for the electromagnetic simulation 
and optimization of accelerator magnets. ROXIE combines powerful geometry macros with the numerical 
accuracy of BEM-FEM coupling, hundreds of design variables and objective parameters, powerful optimization 
algorithms, and CAD/CAM interfaces.


(from a 2011 paper : Benchmark of COMSOL vs. ROXIE Codes for the Calculation of a Particle Accelerator Quadrupole) 
CERN's  ROXIE  code  is  widely  used as a reference software to calculate normal conducting and superconducting magnets  
for  particle  accelerator  applications.  ROXIE  uses  the  full  vector  potential  coupled  to the BEM-FEM method to develop the 
magnetostatic calculations, so it does not require  meshing  neither  the  coil  nor  the  air  region of the model. However, COMSOL 
Magnetic  Fields  Interface  uses  the  magnetic  vector  potential  FEM  and  requires  meshing  both the coil and the air regions.


Challanges : 

The design and optimization of these magnets is dominated by the requirement of a extremely uniform ﬁeld which is mainly 
deﬁned by the layout of the superconducting coils. Even very small geometrical effects such as the insufﬁcient keystoning of 
the cable (cable inner and outer diameter not following curvatures of circles), the insulation, grading of the current density 
in the cable due to different cable compaction and coil deformations due to collaring, cool down and electromagnet forces 
have to be considered for the ﬁeld calculation. In particular for the 3-D case, commercial software has proved to be hardly 
appropriate for this task.


Objectives:

The development of the program was driven by three main objectives:

1) To write an easy-to-use program for the design of superconducting coils in two and three dimensions considering ﬁeld quality, 
quench margin and persistent current multipoles.

2) To include the program into a mathematical optimization environment for ﬁeld optimization and inverse problem solving.

3) To include appropriate methods for the calculation of the iron magnetization without meshing of the coil and to develop 
an integrated design tool with sophisticated graphic routines and interfaces to CAD-CAM systems for the making of drawings 
and manufacture of coil end-spacers.

===> The use of a reduced vector potential formulation in FEM or the application of the BEM-FEM coupling method 
does not require the meshing of the coil for the numerical ﬁeld calculation of iron saturation effects.


Features :

* ROXIE  is  still  unbeatable  in  the  calculation  of  3D  superconducting  cosine  theta  magnets 
 (in  fact,  it  is  its  main  purpose).  These  magnets  use  very  complex  multi-turn  
coils  that  are  extremely  difficult  to  model  and  mesh in a FEM code. In addition, the 
keystoning of the cables and the grading of the current density are also very difficult to 
implement in multipurpose FEM codes. 

* creation of magnet geometry with GUI based input.

* export of geometry for Ansys, opera. Export of field . Export the geometry for CAD/CAM.

* ROXIE  automatically  calculates  the  harmonics  of  the  solution  in  the  post-processing and thus, 
   it is not necessary to use an external program.

* ROXIE  uses  the  same  geometrical dimensions on both 2D and 3D models.

* ROXIE has dedicated coil end design modules, though complexity may be more limited.

* Some coupling may be possible, but not its primary strength.

* Only requires meshing of the boundaries (conductor surfaces, iron surfaces). The air region is handled analytically.


Disadvantages of ROXIE:

1) Quarter symmetry has been used for the 2D model (of the Quadrupole magnet) because ROXIE does not allow 
using octant symmetry for the quadrupolar boundary  conditions. 

2) It is noticeable that the Newton-Raphson iterations converge in only 15 minutes, 
but the calculation of the fields in the aperture  (data  grid  for  the  harmonic  analyses,  
3D line data for plots, etc.) need a much longer processing time in the BEM-FEM code. 

3) ROXIE is not a multithreaded application (parallel) and it cannot use the multiple  cores  of  the  machine.

4) If  a  high  number  of  data  points  are  to  be  calculated  in  the  post-processing,  ROXIE  is  
much slower than COMSOL.

5) 3D simulation : Quasi 3D only.

6) ROXIE has very specialized coil block modelling (Rutherford cables, rectangular conductors,
   cos‑n theta geometries etc.), with detailed coil end modelling and also coil grading.




Disadvantages of COMSOL :
1) No in-built multipole calculation ===> A  MATLAB  program  has  been  developed  to calculate the 
                                                                     Fourier analysis of the  COMSOL  data. 

2) The  3D  harmonic  analysis  is  very  similar  to  the  2D  model,  but  averaging  the  results  on  
each  transverse  slice  of  the  quadrupole  for  Z between  0  to  0.2  m. 




===> BELFEM : a special purpose finite element code for the magnetodynamic modeling of high-temperature superconducting tapes






===============================



ROXIE Wabpage     https://roxie.docs.cern.ch/

AUTOMATED DESIGN OF A CORRECTION DIPOLE MAGNET FOR LHC

Magnetic and Mechanical Analysis of Bi-2212 Rutherford Cable in a Cos-Theta Sub-Scale Dipole Coil

Mechanical Design of a Second Generation LHC IR Quadrupole 
