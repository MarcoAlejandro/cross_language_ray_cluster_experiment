# Creates a ray docker image with Java on it. 
# And also contains the fat .jar of the application.

FROM rayproject/ray:nightly

# Install OpenJDK-8
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-8-jdk && \
    sudo apt-get install -y ant && \
    sudo apt-get clean;

# Fix certificate issues
RUN sudo apt-get update && \
    sudo apt-get install ca-certificates-java && \
    sudo apt-get clean && \
    sudo update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
WORKDIR /home/ray

# Setup the CLASSPATH environment variable for Java
# Might be necessary for running the job.
COPY scala-pi.jar /home/ray
ENV CLASSPATH /home/ray/scala-pi.jar
RUN export CLASSPATH

# Copy the run on head script
COPY run-on-head/run_on_head_script.py /home/ray/run_on_head_script.py

# Copy the K8s Job entry point
COPY run-k8s-job/job.py /home/ray/job.py

ENTRYPOINT /bin/bash