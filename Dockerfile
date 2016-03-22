FROM vektorlab/python3:latest

RUN apk add --no-cache g++ libstdc++ python3-dev && \
    pip install jupyter && \
    apk del g++ python3-dev

COPY kernel.json /root/.local/share/jupyter/kernels/keyvalue/
COPY keyvaluekernel.py /usr/lib/python3.5/site-packages/
COPY Sample.ipynb /tmp/

WORKDIR /tmp
EXPOSE 8888
CMD ["sh", "-c", "jupyter notebook --ip=*"]
