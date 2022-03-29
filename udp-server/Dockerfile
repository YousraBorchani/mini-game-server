# Get the latest base image for python
FROM python:latest
# Put files at the image '/server/' folder.
ADD udp_server.py /server/
# '/server/' is base directory
WORKDIR /server/
# Expose port 7778 in the container
EXPOSE 7778

# ENV 
ENV SERVER_TTL=600

# execute the command
CMD [ "python3","-u", "/server/udp_server.py" ]
