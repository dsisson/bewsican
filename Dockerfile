FROM python:3.6.1
# alpine:3.5

# Create the working directory (and set it as the working directory)
RUN mkdir -p /beswican
WORKDIR /beswican

# Install the package dependencies (this step is separated
# from copying all the source code to avoid having to
# re-install all python packages defined in requirements.txt
# whenever any source code change is made)
COPY requirements.txt /beswican
RUN pip install --no-cache-dir -r requirements.txt

# Copy the source code into the container
COPY . /beswican

RUN pip3 install -r requirements.txt

CMD python3 runserver.py