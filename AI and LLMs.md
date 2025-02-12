What Exactly Is an AI Engineer?
=====

Unlike data scientists or machine learning engineers who often train models from scratch, 
AI engineers focus on integrating pre-trained models into applications or products.

What is an AI model?
===
An AI model is a program that has been trained on a set of data to recognize certain patterns or make certain decisions without further human intervention.
Simply put, an AI model is defined by its ability to autonomously make decisions or predictions, rather than simulate human intelligence.

While all ML models are AI, not all AI involves ML. The most elementary AI models are a series of if-then-else statements, with rules programmed explicitly by a data scientist. Such models are alternatively called rules engines, expert systems, knowledge graphs or symbolic AI.


Generative models vs. discriminative models  ==> One way to differentiate machine learning models is by their fundamental methodology: most can be categorized as either generative or discriminative. The distinction lies in how they model the data in a given space.


AI models can be used to generate new data
===

A model can generate new data similar to the training data, for example, by using a Generative Adversarial Network (GAN). 

AI models can also be used to generate completely new data sets (synthetic data) or artificially bloat existing data (data augmentation) to train more robust algorithms.


AI models can be used to automate tasks
===

To apply AI models in business, they are integrated into pipelines. A pipeline consists of several steps, including data acquisition, transformation, data analysis, and data output.

In computer vision applications, a vision pipeline acquires the video stream and applies image processing before feeding individual images into the DL model. When applied in manufacturing, for example, this can be used to automate visual inspection or perform automated object counting of bottles on conveyor belts.


List of the Most Popular AI Models
===

    AI Model #1: Linear Regression
    AI Model #2: Deep Neural Networks
    AI Model #3: Logistic Regression
    AI Model #4: Decision Trees
    AI Model #5: Linear Discriminant Analysis
    AI Model #6: Naive Bayes
    AI Model #7: Support Vector Machines
    AI Model #8: Learning Vector Quantization
    AI Model #9: K-nearest Neighbors
    AI Model #10: Random Forest
    AI Model #11: Linear Regression
    


Known challenges of LLMs
=====

*    Presenting false information when it does not have the answer.
*    Presenting out-of-date or generic information when the user expects a specific, current response.
*    Creating a response from non-authoritative sources.
*    Creating inaccurate responses due to terminology confusion, wherein different training sources use the same terminology to talk about different things.


What is Retrieval-Augmented Generation (RAG)?
=====

RAG is an LLM optimization method introduced by Meta AI in a 2020 paper.

RAG is the process of optimizing the output of a large language model, 
so it references an authoritative knowledge base outside of its training data sources before generating a response. 
Large Language Models (LLMs) are trained on vast volumes of data and use billions of parameters to generate original 
output for tasks like answering questions, translating languages, and completing sentences. 
RAG extends the already powerful capabilities of LLMs to specific domains or an organization's internal knowledge base, 
all without the need to retrain the model. It is a cost-effective approach to improving LLM output so it remains relevant, accurate, and useful in various contexts.

* ===> Goodbye RAG? Gemini 2.0 Flash Have Just Killed It!
* ===> Will RAG Be Killed by Long-Context LLMs? ===> From my perspective, the answer is “NO.” The development of the RAG technology has just begun and will continue to evolve.


What is fine-tuning?
===

Fine-tuning is the process of retraining a pretrained model on a smaller, more focused set of training data to give it domain-specific knowledge. The model then adjusts its parameters—the guidelines governing its behavior—and its embeddings to better fit the specific data set.


RAG vs. fine-tuning
====
RAG and fine-tuning are two methods enterprises can use to get more value out of large language models (LLMs). 
Both work by tailoring the LLM to the specific use cases, but the methodologies behind them differ significantly.

The difference between RAG and fine-tuning is that RAG augments a natural language processing (NLP) model 
by connecting it to an organization’s proprietary database, while **fine-tuning** optimizes deep learning models for domain-specific tasks. 

Full fine-tuning vs. parameter-efficient fine-tuning
===


When to Use Retrieval-Augmented Generation (RAG)?
===
For most enterprise use cases, RAG is a better fit than fine-tuning because it’s more secure, more scalable, and more reliable.
* RAG allows for enhanced security and data privacy
* RAG is cost-efficient and scalable
  Fine-tuning a large AI model is resource-intensive, requiring significant time and compute power.

Building a RAG System
===
RAG System === DeepSeek R1 1.5B + Ollama + 16GB RAM PC +  
                  libraries ( (1) LangChain: For document processing and retrieval (2) Streamlit: For the web interface)

training options
===
**Proper way to train model on my data and load into Ollama?**
Your options are RAG or fine-tuning. There are RAG implementations for ollama in the community integrations. RAG doesn't "understand" the document, though, it just searches based on a query and responds with a result synthesized from the search results. Fine-tuning options include unsloth, llama factory and axolotl. The problem with fine-tuning is it takes time to generate the new model, if you are receiving daily doc dumps it might not be fit for purpose. A new entry in to the scene is instructlab, which from the sound of it is a more iterative approach to fine-tuning, so might fit your use case better. I haven't used it yet so my understanding may be incorrect.

Ollama
==
Aside from managing and running models locally, Ollama can also generate custom models using a **Modelfile** configuration file that defines the model’s behavior. In other words, you can use the Modelfile in Ollama to change how an existing LLM behaves when user interacts with it. So a Modelfile is a blueprint that that Ollama uses to set up and run a Large Language Model (LLM). 

The Ollama Modelfile is a configuration file that facilitates the specification of a base model and the setting of various parameters, such as temperature and num_ctx, which alter the model’s behavior. 

**Using the Modelfile with Ollama**

To use your Modelfile:

    Save the Modelfile content to a file (e.g., Custom_Assistant_modelfile).

    Create a model based on this file:

      ollama create my-custom-assistant -f Custom_Assistant_modelfile

    Run the model:

      ollama run my-custom-assistant

**Ollama’s library** provides a wealth of Modelfiles for different applications, from simple assistants to more complex models. Accessing these files can inspire your creations or serve as a direct foundation for your projects. The ollama show command is particularly useful for displaying the Modelfile of any local model, offering insights into its configuration and potentially serving as a template for your custom models.

**A few key ollama commands:**

ollama list  ==> To check which models are locally available, type in cmd

ollama show --modelfile llama2:7b  ==> To check which SHA file applies to a particular model, type in cmd (e.g. for instance, checking llama2:7b model)

ollama rm llama2:7b  ==> To remove a model

ollama serve ==> To server models

ollama pull llama2-uncensored:7b ==> download this model locally

ollama run llama2:7b "your prompt" ==> to run a downloaded model ;  ollama run model_name:params

==> **Quantization** is all about reducing the weights of costs of loosing model’s precision. In simple terms, quantization adjusts weight precision, decreases model size, and allows running on less powerful hardware without significant accuracy loss. **Ollama supports quantized models**
Normally a model will use 16-bit floating point values for parameters; however, by clipping these values to smaller units (8/4-bit) the size can be reduced with minimal to no quality drop, resulting in lower memory usage and faster results.

modelfile ==> for integrating models from other sources, or your own model

Ollama-powered (Python) apps to make devs life easier ==> Ollama running in background is accessible as any regular REST API. 
* pip install ollama
* import ollama 

RAM requirement for running LLM
===
The actual size of the model you can run is going to be dependent on how much memory you have available.
A decent rule is that the model will occupy 2x the memory of the parameter size: 2b/4gb, 7b/14gb, etc. 
The main exception to this rule is models that have been modified to use smaller values for stored parameters (quantization). 

Unsloth
===
Unsloth makes finetuning LLMs 2x faster, use 70% less memory, and with no degradation in accuracy! 
Finetuning can be very slow and requires high end Nvidia GPUs. Unsloth.ai makes it possible to finetune models using free GPUs in Google Colab. 

*By the end of this tutorial, you will create a custom chatbot by finetuning Llama-3 with Unsloth for free. It can run locally via Ollama on your PC, or in a free GPU instance through Google Colab.

*A few months ago, when I needed to finetune a multi-modal model, I had to rent an Nvidia GPU from Runpod and setup a virtual environment. Then I discovered Unsloth.ai — not only is it convenient, but it’s also fast and easy to use with Google Colab! 

Ollama  + Unsloth + Llama-3 + CSV finetuning.ipynb


OllamaTrain ???
===
Ollama Train is a powerful tool designed to facilitate the fine-tuning of large language models (LLMs) like OLMo 1B.

---
* The Artificial Intelligence (AI) field has been fueled by **open source initiatives** from the very beginning, from data sets used in model training, frameworks, libraries and tooling, to the models themselves. 
* A model is a representation of the patterns an algorithm has learned from analyzing data it was fed during its training phase. The goal of a Machine Learning model is to make predictions or decisions based on new, unseen data.
* By the end of its training phase, a model will be distributed as either a set of multiple files including the patterns it learned, configuration files, or a single file containing everything it needs. The number of files will vary depending on the frameworks and tools used to train it, and most tools today can adapt to the different ways a model is distributed.
* Ollama was originally developed with the idea of enabling people to run LLMs locally on their own computers, but that doesn’t mean you can’t use it on an H100 PCIe GPU Instance; in fact, its vast amount of resources will supercharge your experience.
* The Ollama model library showcases a variety of models you can try out on your own helping you decide what’s the best tool for the job, be it a compact model, such as TinyLlama or a big one, like Llama2; there are multimodal models, like LLaVA, which include a vision encoder that enables both visual and language understanding. There are also models made for specific use cases, such as Code Llama, an LLM that can help in the software development process, or Samantha Mistral, a model trained in philosophy, psychology, and personal relationships.
* Ollama supports **embedding models** . Embedding models are models that are trained specifically to generate vector embeddings: long arrays of numbers that represent semantic meaning for a given sequence of text:

Model merging 
==
Model merging is a technique that combines two or more LLMs into a single model. It’s a relatively new and experimental method to create new models for cheap (no GPU required). Model merging works surprisingly well and produced many state-of-the-art models on the Open LLM Leaderboard.

By combining models, we can create a powerful new LLM that leverages their collective strengths. 

In this tutorial, we will implement it using the **mergekit** library.


Open WebUI 
===
Open WebUI is a Web-based application that allows you to interact with AI models.

Open WebUI is an extensible, feature-rich, and user-friendly self-hosted AI platform designed to operate entirely offline. It supports various LLM runners like Ollama and OpenAI-compatible APIs, with built-in inference engine for RAG, making it a powerful AI deployment solution.


GGUF
==
GGUF models are quantized versions of large language models, enabling efficient use of system memory without sacrificing too much quality. With Ollama, you can experiment with various quantized models shared by the community on Hugging Face without needing to create new modelfiles.


Hugging Face
==
Hugging Face is a machine learning (ML) and data science platform and community that helps users build, deploy and train machine learning models.

It provides the infrastructure to demo, run and deploy artificial intelligence (AI) in live applications. Users can also browse through models and data sets that other people have uploaded. Hugging Face is often called the GitHub of machine learning because it lets developers share and test their work openly.

Compared with Ollama, **Huggingface has more than half a million models**. Wouldn’t it be cool, if we can create custom models from Huggingface with Ollama ? 

Ollama now offers easy integration with a huge vault of GGUF format language models hosted on Hugging Face. This new feature allows users to run any of the 45,000+ public GGUF checkpoints on their local machines using a single command.

Hugging Face is known for its Transformers Python library, which simplifies the process of downloading and training ML models. The library gives developers an efficient way to include one of the ML models hosted on Hugging Face in their workflow and create ML pipelines.

The platform is important because of its open source nature and deployment tools. It allows users to share resources, models and research and to reduce model training time, resource consumption and environmental impact of AI development.

**Did you know** you could train your custom models on Hugging Face Spaces!!!? Yes, its possible and super-easy to do with AutoTrain SpaceRunner 💥 All you need is a Hugging Face account (which you probably have already) and a payment method attached to your account (in case you want to use GPUs, CPU training is free!).

# Model Selection and Architecture Design
AI model's architecture and algorithm are selected based on the specific task and dataset. The architecture design involves choosing the number and type of layers, activation functions, loss functions, and optimization algorithms.

Best tools for this stage include popular machine learning frameworks like TensorFlow, PyTorch, Keras, or sci-kit-learn, which offer pre-built models and libraries for different tasks and architectures.

----

Ollama's storage is typically located at
/usr/share/ollama/.ollama

Here’s a quick command to run any model:
  ollama run hf.co/{username}/{repository}
Example :
  ollama run hf.co/bartowski/Llama-3.2-1B-Instruct-GGUF

    Use tools like curl to make HTTP requests to the Ollama API endpoint.

curl <http://localhost:11434/api/chat> -d '{
  "model": "phi",
  "messages": [
    { "role": "user", "content": "what is blockchain ?" }
  ]
}'

==> There are alternatives to Ollama, like vllm and aphrodite, but Ollama is surely the most popular one.

===> Open Source AI Repository Collection  https://github.com/thebigbone/opensourceAI

Best AI Model Repositories
===
* Hugging Face
* Ollama ??
* TensorFlow Hub
* PyTorch Hub
* Model Zoo by OpenAI
* Microsoft AI GitHub

**5 GitHub Repositories for Cutting-Edge AI Models** ===>
* karpathy/llama2.c 🦙
* facebookresearch/audiocraft 🔊🎶
* geekan/MetaGPT 🤖📚
* apple/ml-stable-diffusion 🍏🌌
* invictus717/MetaTransformer 🌐💡

# Defining Your Problem
Start by clarifying the problem you’re solving. Is it a classification, regression, or other task? Understanding your problem helps you choose the appropriate model type and architecture.

# Selecting the Right Framework
Different machine learning frameworks offer various levels of flexibility and ease of use. Choose a framework that aligns with your expertise and project requirements. Popular choices include **TensorFlow, PyTorch, and scikit-learn**.

# AI model architecture
* Model architecture is the arrangement of layers, connections, and components that determine how data flows through your machine learning model. A well-designed architecture can significantly impact the model’s performance, training speed, and generalization ability.

* An AI model is an algorithm/set of algorithms (we can also call it a program) fed with data and learning from it to find patterns as well as make predictions, classifications, and decisions without being strictly programmed for every single task. There are many types of AI models by structure and ways they're trained. Most AI models used in business today are either ML or DL-based.

* The choice of the model architecture depends on the type of problem being solved, the size and complexity of the dataset, and the available computing resources. Popular model architectures include decision trees for smaller datasets, and deep neural networks for larger datasets, including feedforward neural networks, convolutional neural networks, and transformers. The architecture of a machine learning model is a critical factor that determines its accuracy and performance, and it is often optimized through a process called hyperparameter tuning.

**tpes**

two major types--

(1) Machine learming (linear regression, Logistic Regression, Decision Trees, Random Forests, k-nearest neighbors)

(2) Deep learning (Neural networks (CNN, RNNs, advanced neural network architectures (e.g., transformers))

others - k-means clustering, generative adversarial networks (GANs), variational autoencoders (VAEs), diffusion models, LLMs etc.

Most common AI training models include linear and logistic regression, decision trees, random forests, support vector machines (SVMs), and neural networks.

**Learning methods**  include supervised, unsupervised, and semi-supervised. 


# Deep Learning
Connectionist architectures have existed for more than 70 years, but new architectures and graphical processing units (GPUs) brought them to the forefront of artificial intelligence. Deep learning isn't a single approach but rather a class of algorithms and topologies that you can apply to a broad spectrum of problems.

While deep learning is certainly not new, it is experiencing explosive growth because of the intersection of deeply layered neural networks and the use of GPUs to accelerate their execution. Big data has also fed this growth.

**6 Common Types of AI Models**

Machine Learning Models

Deep Learning Models

Natural Language Processing (NLP) Models

Computer Vision Models

Generative AI Models

Hybrid AI Models


# Pytorch, TensorFlow, Keras

Pytorch, Tensorflow (+ Keras), Pytorch Lightning, JAX, Flax

Github popularity :: Pytorch (81k) , TensorFlow (74k), Keras (61k)

Scaler (0D), vector (1D), matrix (2D), tensor (3D)

The concept of Deep Learning frameworks, libraries, and numerous tools exist to reduce the large amounts of manual computations that must otherwise be calculated.

PyTorch and TensorFlow both are open-source Python libraries that use graphs to perform numerical computations on data in deep learning applications. Both are used extensively in academic research and commercial code. Both are extended by a variety of APIs, cloud computing platforms, and model repositories.


The basic data structure for both TensorFlow and PyTorch is a tensor. 

Colab : An easy way to learn and use TensorFlow  
https://blog.tensorflow.org/2018/05/colab-easy-way-to-learn-and-use-tensorflow.html


# Google Colab
Google Colab is a tool that allows you to write, run and share Python code in your browser. Colab also has multiple features that make it a popular tool for data science, machine learning and artificial intelligence. Many of the machine learning tutorials you may see online, are written in Google Colab.

**Google Vertex AI** is designed for enterprises that require robust, scalable solutions for building, training, and deploying machine learning models in production environments. (pay-as-you-go pricing model)

 
# Jupyter Notebook
Jupyter Notebook's primary advantages include its interactive computing environment, allowing users to easily explore and analyze data with live code execution, rich documentation capabilities with Markdown and LaTeX, excellent data visualization tools, and the ability to collaborate with others on the same project simultaneously, making it ideal for data science and machine learning tasks

Jupyter notebook can be converted into html, markdown, pdf, python script etc.


# AI agents
AI agents are separated AI entities with specific roles, goals, abilities, etc.

It is an AI system that understands complex instructions and acts autonomously to solve real-world problems.

**agent frameworks** are software libraries that help you build applications that can perform tasks
automatically.

* Autogen (Microsoft’s Framework for Autonomous AI Agents)
* crewai (This is a Python library to create agents, tasks, and all that stuff)
* RASA (he Open-Source Framework for Conversational AI Agents)
* Semantic Kernel
* Promptflow
* Langchain
* Bonus: MemGPT
* LangGraph (The Future of Production-ready AI Agents)
* Microsoft Semantic Kernel (A Framework for Building Intelligent AI Agents)
* Hugging Face Transformers Agents
* LlamaIndex
