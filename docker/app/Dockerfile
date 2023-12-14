FROM batareya13337/sklad_project:latest

RUN pip install SQLAlchemy
RUN pip install alembic
RUN alembic init migration

CMD ["alembic", "upgrade", "head"]