FROM jupyter/base-notebook:python-3.8.4
WORKDIR /home/jovyan
COPY requirements.txt .
RUN pip install -r requirements.txt && pip install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable collapsible_headings/main && jupyter nbextension enable execute_time/ExecuteTime && jupyter nbextension enable toc2/main
RUN pip install black && jupyter nbextension install https://github.com/drillan/jupyter-black/archive/master.zip --user && jupyter nbextension enable jupyter-black-master/jupyter-black --user
RUN mkdir ./.jupyter/custom
COPY custom.css ./.jupyter/custom 