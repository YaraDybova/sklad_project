FROM python:3.8-slim-buster
WORKDIR /myapp
COPY . /myapp
RUN pip install pylint
RUN pip install pylint-exit
RUN pip install sqlfluff
RUN pip install sqlalchemy
RUN pip install -r requirements.txt
RUN pylint ./app/*.py || pylint-exit $?
RUN sqlfluff lint ./sklad/sklad.sql || pylint-exit $?
ENV FLASK_APP=/myapp/app/app.py
ENV FLASK_RUN_HOST=0.0.0.0
EXPOSE 5000
CMD [ "python3", "-m" , "flask", "run" ] 