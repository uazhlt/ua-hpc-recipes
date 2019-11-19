
## Getting started: custom kernels

If you wish to use a set of custom dependencies and/or a custom kernel, take a look at the following tutorials:


1. [**Installing custom Python environments**](../install-custom-python-environments/README.md)  

2. [**Installing custom Jupyter kernels**](../install-custom-jupyter-kernels/README.md)

## Launching a jupyter notebook

At the time of this writing, notebooks on the HPC must be launched using the Open OnDemand portal (https://ood.hpc.arizona.edu/).

### Step 1: Configure

From the **Interactive Apps** dropdown menu, select **ElGato Jupyter Notebook** under the **Servers** block (see [**Why El Gato?**](#why-el-gato) for an explanation).  Here are a few things to keep in mind:

- It is highly recommended that you avoid using the windfall queue queue for notebooks, as your task may be preempted by jobs running in one of the high priority queues.  Students should contact their academic advisor or supervisor to request use of a queue such as **Standard**.  
- Ensure you've specified a group in the **PI Group** field that has be delegated hours on whatever queue you've selected in the dropdown menu.  
- Use caution when determining the runtime of your notebook server.  If your requested time expires, your connection will abruptly terminate.  


Once you are satisified with your configuation, click **Launch**.

![](./images/elgato-interactive-app-2.png)

### Step 2: Launch

It may take a moment for the notebook server to become available.  Once ready, a **Connect to Jupyter** button will appear.  Click it to launch the notebook server.

![](./images/elgato-interactive-app-3.png)

## Using a custom kernel   

If you've followed along with installing a [custom python environment](../install-custom-python-environments/README.md) and [jupyter kernel](../install-custom-jupyter-kernels/README.md), your custom kernel will should appear as an option:

![](./images/elgato-interactive-app-4.png)

<!-- ## Shutting down jupyter

If you've finished your task prior to exhausting the time specified in the **Run Time**, you may kill the notebook server from the ood menu depicted in the following image:
![](./images/elgato-interactive-job-1.png) -->


## Launching a GPU-powered notebook

In order to access a GPU from the notebook, you'll need to specify the `ngpus=` option under **Special Options**.  For example, to allocate a single GPU, use `ngpus=1`.

![](./images/elgato-interactive-app-gpu-jupyter.png)


If you're trying to make use of a GPU with a deep learning framework such as [`PyTorch`](https://pytorch.org), ensure that you've installed the appropriate version of the library and have loaded the necessary CUDA version ([see the **Loading custom Modules** tutorial](../load-custom-modules/README.md)).



# FAQ

## Why El Gato?[](#why-el-gato)

You can run jupyter notebooks on either cluster, but El Gato currently seems to offer more flexibility.  While Ocelote is equipped with newer hardware than the El Gato cluster, at the time of this writing, El Gato runs a newer version of CentOS (v7.x vs v6.x) that allows one easily build a number of libraries from source (see, for example, this issue: https://github.com/pytorch/pytorch/issues/14274).  