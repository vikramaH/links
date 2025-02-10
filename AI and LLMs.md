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
