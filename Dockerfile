FROM python:3.8-slim-buster
WORKDIR /myapp
COPY . /myapp
RUN pip install pylint pylint-flask
RUN pip install -r requirements.txt
RUN pip pylint --load-plugins pylint_flask ./*.py
ENV FLASK_APP=/myapp/app/app.py
ENV FLASK_RUN_HOST=0.0.0.0
EXPOSE 5000
CMD [ "python3", "-m" , "flask", "run" ] 