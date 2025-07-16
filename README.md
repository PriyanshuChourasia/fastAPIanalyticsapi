# Analytics Api using Python and FASTAPI


## Introduction
<p>The intention of this project is to learn the structure of fastapi and learn how to push it to production</p>



### To start this project
1. Install Python and create virtual environment inside root folder

<br/>

```
python3 -m venv .venv
```
<br/>

### DockerFile
To create docker file we need to go step by step command. 
First Choose a package from which you want pull the library or get support to run your project
```
FROM python:3.10.10-alpine
```
<br/>
Then Run the commands you want to run aur do the operations you want to perform
Here I want to create virtual env first to support my projects requirements

```
RUN python -m venv /opt/.venv
```
Then I need to run virtual environment So I will declare its PATH, Here we are going to run this project in linux environment 
that's the reason we have given bin as a path

```
ENV PATH=/opt/.venv/bin:$PATH
```
Then Upgrade pip
```
RUN pip install --upgrade pip
```
Then Run to install packages or dependencies your Virtual machine needs

```
RUN api-get update && apt-get install -y \
    # for postgres \
    libpq-dev \
    # for pillow \
    libjpeg-dev \
    # for CairoSVG \
    libcairo2 \
    # other \
    gcc \
    && rm -rf /var/lib/apt/lists/* \
```

Copy whole src code inside a code folder which will be created inside vm

```
RUN mkdir -p /code
```

#### To RUN DOCKER

build: this options build the package of this project
-t: defines the tag name
run: Runs the project
```
docker build -t analytics-api
docker run
```



#### Reference
GitHub: https://github.com/codingforentrepreneurs/analytics-api
<br>
Youtube: https://www.youtube.com/watch?v=tiBeLLv5GJo
<br>
Channel name: Coding Entrepreneurs