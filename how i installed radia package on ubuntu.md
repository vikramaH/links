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

===> **Radia** : 3D Magnetostatics Computer Code


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

===> The **Sirepo** gateway supports physics codes like elegant, Warp, SRW, JSPEC, Zgoubi, and more. With it, you can configure, run, visualize, and share end-to-end HPC physical simulations on your browser.

Sirepo  consists  of  a  graphical  web  interface  based  on  JavaScript  with  a backend  server  (either  on  local  machine  or  a  remote  server)  able  to  serve  many  different  software  packages,  including  already  implemented  interfaces  with  Synchrotron  Radiation  Workshop  (SRW)  for  accurate  X-ray  source  and  optics simulations1,2,3, Shadow3  –  a ray optics code  with  many sophisticated features for X-ray  beamlines4,5, and a  number of codes  for particle  accelerators  simulations.

Sirepo  is  distributed  in  several  formats.


