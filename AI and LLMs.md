What Exactly Is an AI Engineer?
=====

Unlike data scientists or machine learning engineers who often train models from scratch, 
AI engineers focus on integrating pre-trained models into applications or products.


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
Aside from managing and running models locally, Ollama can also generate custom models using a **Modelfile** configuration file that defines the model’s behavior.

A Modelfile is a blueprint that that Ollama uses to set up and run a Large Language Model (LLM). 

The Ollama Modelfile is a configuration file that facilitates the specification of a base model and the setting of various parameters, such as temperature and num_ctx, which alter the model’s behavior. 

**Using the Modelfile with Ollama**

To use your Modelfile:

    Save the Modelfile content to a file (e.g., Custom_Assistant_modelfile).

    Create a model based on this file:

    ollama create my-custom-assistant -f Custom_Assistant_modelfile

    Run the model:

    ollama run my-custom-assistant

Ollama’s library provides a wealth of Modelfiles for different applications, from simple assistants to more complex models. Accessing these files can inspire your creations or serve as a direct foundation for your projects. The ollama show command is particularly useful for displaying the Modelfile of any local model, offering insights into its configuration and potentially serving as a template for your custom models.

**A few key ollama commands:**

ollama list  ==> To check which models are locally available, type in cmd

ollama show --modelfile llama2:7b  ==> To check which SHA file applies to a particular model, type in cmd (e.g. for instance, checking llama2:7b model)

ollama rm llama2:7b  ==> To remove a model

ollama serve ==> To server models

ollama pull llama2-uncensored:7b ==> download this model locally

ollama run llama2:7b "your prompt" ==> to run a downloaded model ;  ollama run model_name:params

==> Quantization is all about reducing the weights of costs of loosing model’s precision. In simple terms, quantization adjusts weight precision, decreases model size, and allows running on less powerful hardware without significant accuracy loss. **Ollama supports quantized models**
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

In this tutorial, we will implement it using the **mergekit** library. 


GGUF
==

Hugging Face
==
Hugging Face is a machine learning (ML) and data science platform and community that helps users build, deploy and train machine learning models.

It provides the infrastructure to demo, run and deploy artificial intelligence (AI) in live applications. Users can also browse through models and data sets that other people have uploaded. Hugging Face is often called the GitHub of machine learning because it lets developers share and test their work openly.

Hugging Face is known for its Transformers Python library, which simplifies the process of downloading and training ML models. The library gives developers an efficient way to include one of the ML models hosted on Hugging Face in their workflow and create ML pipelines.

The platform is important because of its open source nature and deployment tools. It allows users to share resources, models and research and to reduce model training time, resource consumption and environmental impact of AI development.

**Did you know** you could train your custom models on Hugging Face Spaces!!!? Yes, its possible and super-easy to do with AutoTrain SpaceRunner 💥 All you need is a Hugging Face account (which you probably have already) and a payment method attached to your account (in case you want to use GPUs, CPU training is free!).
