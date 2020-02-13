# KernelBackend
Was made using Django 3 (Python). Can be opened as PyCharm project.

#### Note: Django Framework is available in PyCharm Professional but this server can be run just using Python (on port 8000, for example):
### `KernelBackend\venv\Scripts\python.exe manage.py runserver 8000`

#### Note 2: psycopg2 (is needed for PostgreSQL DB) works somehow strange with Python 3.8 (just a crash, nothing intresting). That's why KernelBackend\venv (virtual environment) was provided to this repository and Python 3.7.5 is recomended to be used.

Any database can be set up with the mind of Django migrations. Database settings are located in KernelBackend\KernelBackend\settings.py, where DB engine, name, user and password can be set.

Sql files, included in the root of this repository can be used to create and fill tables, but models migration can be used from server.
To create migration files, use
### `KernelBackend\venv\Scripts\python.exe manage.py makemigrations`
### `KernelBackend\venv\Scripts\python.exe manage.py makemigrations elevator`

To apply migrations on DB, use
### `KernelBackend\venv\Scripts\python.exe manage.py migrate`

# kernel-web
Was made using React (React App technology). Can be opened as PyCharm project.

Details, how to run this project, are best described in kernel-web\README.md (in project folder).
Server url can be changed in kernel-web/src/server_routes.js. If backend (Django) server is not located on this address, the application will be showing loading with network error. Relocate the server to this address, or address to this server.

Project has 3 localizations (uk, ru and en), selection of which depends on web-browser language settings (preferences). Backend main messages are localized too.
#### Note: full reload (but just F5 key) is needed to localize all the interface components.

Token authorization was realized to keep in perspective usage of certificates (SSL) and secure connections.

# Usage scenarios

0. Administrator account in a strange way happens in database records (if DB has been already connected), using:

### `KernelBackend\venv\Scripts\python.exe manage.py createsuperuser`

1. Administrator logs in and creates users from kernel-web application, when Django server is running too. Header must contain administration button for further actions.
2. Administrator registers elevators and locates staff on it (guardians, weighings and laboratory assistants), using header button, selecting appropriate management action and interacting fith CRUD grid (Create Read Update Delete).
3. Administrator registers providers.
4. Staff logs in and solves his/her tasks (typing LSDs, goods weights and properties).
5. Provider can view "Motion report and balances", entering cabinet and pressing appropriate button (<provider_username>_report.xlsx will be downloaded).
#### Note: Due to instability of some Microsoft products (Office for example), MS Excel can show only part of the document downloaded. You just need to enter "Editing mode" in Excel to hide this stupid bug :)
