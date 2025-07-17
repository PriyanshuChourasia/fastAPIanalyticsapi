FROM python:3.10.10-slim-bullseye

RUN python -m venv /opt/.venv

#set the virtual environment as the current locaton
ENV PATH=/opt/.venv/bin:$PATH

# Upgrade pip
RUN pip install --upgrade pip

# set python related environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install os dependencies for our mini vm
RUN apt-get update && apt-get install -y \
    # for postgres
    libpq-dev \
    # for Pillow
    libjpeg-dev \
    # for CairoSVG
    libcairo2 \
    # other
    gcc \
    && rm -rf /var/lib/apt/lists/*

#create the mini vm's code directory
RUN mkdir -p /code

#set the working directory
WORKDIR /code

# Copy requirements file into container
COPY requirements.txt /tmp/requirements.txt

# Copy code into containers working directory
COPY ./src /code

# Install python project requirements
RUN pip install -r /tmp/requirements.txt

# make the bash script executable
COPY ./boot/docker-run.sh /opt/run.sh
RUN chmod +x /opt/run.sh

# clean the cache to reduce image size
RUN apt-get remove --purge -y \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Run the FastAPi project
CMD ["/opt/run.sh"]
