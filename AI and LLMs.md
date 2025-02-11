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
Aside from managing and running models locally, Ollama can also generate custom models using a Modelfile configuration file that defines the model’s behavior.
The Ollama Modelfile is a configuration file essential for creating custom models within the Ollama framework. It facilitates the specification of a base model and the setting of various parameters, such as temperature and num_ctx, which alter the model’s behavior. 

A few key commands:

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

