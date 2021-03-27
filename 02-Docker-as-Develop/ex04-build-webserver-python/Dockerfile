FROM python:3.6
RUN useradd www && \
    mkdir /app && \
    mkdir /log && \
    chown www /log 

#usuario ativo logado no container 
USER www
VOLUME /log


#diretorio de trabalho
WORKDIR /app

# expor uma porta(Essa porta pode ser remapeada na hora de execucao do container)
# definida na aplicacao
EXPOSE 8000

# ponto de entrada: processo iniciado no momento de execucao do container:
ENTRYPOINT [ "/usr/local/bin/python" ]
#parametro passado para o ENTRYPOINT ==>  /usr/local/bin/python server-web-python.py
CMD ["server-web-python.py"]