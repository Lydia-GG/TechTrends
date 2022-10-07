# set the base image. Since we're running 
# a Python application a Python base image is used
FROM python:3.8
# expose an application port 
EXPOSE 3111
# copy files from the host to the container filesystem. 
# For example, all the files in the current directory
# to the  `/app` directory in the container
COPY ./techtrends /app
#  defines the working directory within the container
WORKDIR /app
# run commands within the container. 
# to install dependencies defined in the requirements.txt file. 
RUN pip install -r requirements.txt
# run database 
RUN python init_db.py
# provide a command to run on container start. 
CMD [ "python", "app.py" ] 