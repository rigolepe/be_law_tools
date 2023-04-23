FROM python:3.9-bullseye

# RUN apt update -y && apt install -y nano pipenv
# RUN cd /opt && git clone https://github.com/openjusticebe/be_law_tools
# COPY . /opt/be_law_tools

ARG jupyter_token
WORKDIR /work
ENV PYTHONPATH=/work/:$PYTHONPATH

RUN pip3 install --upgrade pip
COPY requirements.txt . 
RUN pip3 install -r requirements.txt 
RUN pip3 install jupyter notebook 

ENV JUPYTER_TOKEN=${jupyter_token}
EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--ip=0.0.0.0", "--allow-root"]

# ENTRYPOINT ["python", "/opt/be_law_tools/justel2md.py"]
