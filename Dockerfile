FROM ubuntu:18.04
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt update \
    && apt install -y htop python3-dev wget

RUN mkdir -p /home/app/model/
COPY model/iris_clf.pkl model/model.py /home/app/model/
COPY main.py requirements.txt /home/app/

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_23.5.2-0-Linux-x86_64.sh \
    && mkdir root/.conda \
    && sh Miniconda3-py38_23.5.2-0-Linux-x86_64.sh -b \
    && rm -f Miniconda3-py38_23.5.2-0-Linux-x86_64.sh

RUN conda create -y -n test_env python=3.7
RUN /bin/bash -c "cd /home/app/ \
    && source activate test_env"

RUN cd /home/app && pip install -r requirements.txt

CMD cd /home/app && uvicorn main:app --host 0.0.0.0 --port 80