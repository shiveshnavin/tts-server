# Use the base image with Python 3.8.3 on Ubuntu 20.04
FROM brunneis/python:3.8.3-ubuntu-20.04

# Set the working directory
WORKDIR /app

# Copy the packages.txt and requirements.txt files to the container
COPY packages.txt .
COPY requirements.txt .

# Install the system packages listed in packages.txt
RUN apt-get update && \
    xargs -a packages.txt apt-get install -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm packages.txt

# Install Python dependencies from requirements.txt
RUN pip install -r requirements.txt

# Add your application files and code here, if necessary

# Specify the command to run your application
CMD ["/bin/bash"]
