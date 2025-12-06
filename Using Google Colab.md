14-10-2025

At its core, Google Colab is a cloud-based Jupyter Notebook service. 
Colab eliminates one of the biggest challenges in data science: environment setup. With no installation required, learners and professionals can start coding immediately. 

===> The first time I met Google’s Colab was when we searched for a serverless solution to train our models. Until that point, our models were of a smaller size which enabled us to train them on our local machines.

**Why and how colabs excells**
0) Colab is basically an on-demand virtual machine on the Google Cloud.
1) It provides GPU and TPU
2) It provides full linux system, (a) which has many in-built python packages, (b) any package can be installed using !pip , (c) any application can be installed using !apt install d) LLMs like deepseek-ocr etc can be installed and tested
2A) it provides RAM (about 12 GB) and disk space also.
4) It provides gemini assistant
5) it provides the proper invironment
6) a lot of high end notebooks are available
7) integrated with google drive and the github
8) notebooks are available online from anywhere from any plateform.
9) perhaps also reduces data spending because big files are not downloaded to our systems
10) colab has a bash shell and you could download and run other software there. It can download and install anything you can download and install on your system. so it helps **getting started**.
12) some examples of installing on it- python packages like pyelmer, softwares like ngspice, compilers and comiling, LLMs,
13) it helps combine and make a very versatile application, for example gmsh + elmer + plotly can be much better than opera3D. we can make a great application for doing complex OCR process for big books and download only the final text output.
14) there can be (1) python packages containg binary of the main package (eg pygmsh) (2) python interfaces of binary packages (eg pyElmer) (3) binary packages which can be installed and run in colab using python code (eg ngspice)
15) colab text cells can be used to easily make markdown files, without pain of remembering markdown syntax.

**disadvantages**
1) data files and installed softares NOT persistent
2) it does not allow the graphics of applications such as paraview to be displayed. ==> try to use colab more as a data cruncher than visualizer. Compute  numeric functions to evaluate the output of a design than the graphics.

**Getting Started with Google Colab**
1. Go to the Google Colab website colab.research.google(dot)com and sign in with your Google account. 
2. Click on the "New Notebook" button to create a new notebook.
3. Give your notebook a name and select the Python 3 runtime environment.
4. You can now start writing Python code in the notebook.

**Using Google Colab for Python Computation**
1. Write your Python code in the notebook, using the standard Python syntax.
2. Use the `!` command to execute shell commands, such as installing packages or running scripts. 3. Use the `%%` command to execute magic commands, such as plotting or displaying images.
4. Use the `print()` function to display output.
5. Use the `import` statement to import libraries, such as NumPy or Pandas.

**Using Google Colab for Machine Learning Simulation**
1. Install the required machine learning libraries, such as TensorFlow or PyTorch, using the `!pip install` command.
2. Import the libraries in your Python code.
3. Load your dataset using the `pandas` library or other data loading libraries.
4. Preprocess your data using techniques such as normalization, feature scaling, or encoding.
5. Train your machine learning model using the `fit()` method.
6. Evaluate your model using metrics such as accuracy, precision, or recall.
7. Use the `%%` command to display visualizations, such as plots or heatmaps.

**Hosting Web Apps on Google Colab** ==> This project provides a convenient and 
cost-effective solution for testing AI-powered web applications using Google Colab 
Notebooks. It eliminates the need for hardware upgrades or expensive cloud services, 
making it accessible for developers and researchers.
https://github.com/MohamedEmad300/Hosting-Web-Apps-on-Colab


**Matlab and Python**

* Python has a lot of modules ==> means you can do anything.

* 10 Reasons Why Python is Better than Matlab

* Between Matlab and python, Python is a clear winner.

* Python Is The Ultimate MATLAB Toolbox – TechThought

