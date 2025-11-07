#Use offical Python runtime as base image
FROM python:3.9-slim

#Set working directory inside container
WORKDIR /app

#Copy all project files into container
COPY . /app

#Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

#Expose Flask app port
EXPOSE 8001

#Command to run the app
CMD ["python", "app.py"]
