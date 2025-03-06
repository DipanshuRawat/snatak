#  **Attendance API POC**

| **Author** | **Created on** | **Version** | **Last updated by**|**Internal Reviewer** |**Reviewer L0** |**Reviewer L1** |**Reviewer L2** |
|------------|---------------------------|-------------|---------------------|-------------|-------------|-------------|-------------|
| Dipanshu Rawat|   11-02-2025             | v1          | Dipanshu Rawat        |  Siddharth Pawar |  |   |      |

## Pre-Requisites

For running the Salary-API application we need to install below:

- [PostgreSQL](https://github.com/Snaatak-Skyops/Documentation/blob/SCRUM-14/Common/Software%20/PostgreSQL/POC-README.md)
- [Redis](https://github.com/Snaatak-Skyops/Documentation/blob/604a1e3234013de9c2cdf088c99bd4a6dbcf1cd0/Common/Software/Redis/POC-README.md)
# Steps for Building Attendance API

### **1. Clone the Repository**
```bash
git clone https://github.com/OT-MICROSERVICES/attendance-api.git
```
Clone remote repo in your local Machine

---

### **2. Update Package List**
```bash
sudo apt update
```
 Why run apt update?

- It ensures your system fetches the latest package versions and security updates, preventing installation issues with outdated packages.
---

### **3. Access PostgreSQL as the `postgres` User**
```bash
sudo -u postgres psql
```
Why we access PostgreSQL as the postgres User? 

- We use sudo -u postgres psql because the postgres user is the default superuser in PostgreSQL, and it has full administrative privileges.

**Note:-** If you have face PostgreSQL authentication fails due to an incorrect password for the user "postgres" on localhost (127.0.0.1) at port 5432, reset the password.

```bash
ALTER USER postgres PASSWORD 'password';
```

- Never use the default username and password when setting up your database.

---

### **4. Edit PostgreSQL Configuration**
```bash
sudo vi /etc/postgresql/16/main/postgresql.conf
```
change

```bash
listen_addresses = '<priv-ip>' 
```
- We change **listen_addresses** in postgresql.conf to <priv-ip> so that PostgreSQL listens for connections on the specified private IP, allowing remote access while restricting unauthorized connections.

---

### **5. Edit PostgreSQL Authentication Configuration**
```bash
sudo vi /etc/postgresql/16/main/pg_hba.conf
```
change

```bash
host    attendance_db             postgres           <priv-ip>/32              md5  
```
What Does this  Do?

- It allows the postgres user to connect to the attendance_db database only from the specified private IP address, requiring a password for authentication.

---

### **6. Restart PostgreSQL**

After making changes in configuration file, restart the PostgreSQL
```bash
sudo systemctl restart postgresql
```

---

### **7. Edit Redis Configuration**
```bash
sudo vi /etc/redis/redis.conf
```
  Opens the Redis configuration file for editing.
 To bind Redis to specific IP addresses (e.g., `127.0.0.1` and add private IP) for security and accessibility.

```bash
bind  127.0.0.1 <priv-ip>
```
This ensures Redis listens only on 127.0.0.1 and the specified private IP, enhancing security.

---

### **8. Restart Redis**

After making changes in configuration file, restart the Redis.

```bash
sudo systemctl restart redis
```

---

### **9. Install Poetry**
```bash
curl -sSL https://install.python-poetry.org | python3 -
```
  Installs Poetry, a dependency management and packaging tool for Python.
 The project uses Poetry to manage Python dependencies and virtual environments.

---

### **10. Add Poetry to PATH**
```bash
export PATH="$HOME/.local/bin:$PATH"
```
  Adds Poetry's installation directory to the system's `PATH`.
 To make the `poetry` command available globally in the terminal.

---

### **11. Reload Bash Configuration**
```bash
source ~/.bashrc
```
  Reloads the Bash shell configuration file.
 To apply changes to the `PATH` or other environment variables.

---

### **12. Add Python PPA**
```bash
sudo add-apt-repository ppa:deadsnakes/ppa
```
- What Does this Do?

  We add the `deadsnakes` PPA (Personal Package Archive) to the system.

  To access newer versions of Python (e.g., Python 3.11) that may not be available in the default repositories.

---

### **13. Install Python 3.11**

```bash
sudo apt install python3.11 -y
```
---

### **14. Install OpenJDK 11**
```bash
sudo apt install openjdk-11-jdk -y
```
 Required for running Liquibase, a database migration tool.

---

### **15. Add Liquibase Repository**
```bash
wget -O- https://repo.liquibase.com/liquibase.asc | gpg --dearmor > liquibase-keyring.gpg && cat liquibase-keyring.gpg | sudo tee /usr/share/keyrings/liquibase-keyring.gpg > /dev/null && echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/liquibase-keyring.gpg] https://repo.liquibase.com stable main' | sudo tee /etc/apt/sources.list.d/liquibase.list
```
  Adds the Liquibase repository and its GPG key to the system.
 To install Liquibase from the official repository.

---

### **16. Update Package List**
```bash
sudo apt update
```
  Updates the package list again after adding the Liquibase repository.
 To ensure the system recognizes the new repository.

---

### **17. Install Liquibase**
```bash
sudo apt install liquibase
```
  Installs Liquibase.
 To manage database migrations for the project.

---

### **18. Navigate to the Project Directory**
```bash
cd attendance-api/
```
  Change directory to attendance-api

---

### **19. Set Python Version for Poetry**
```bash
poetry env use python3.11
```
  Specifies Python 3.11 as the interpreter for the Poetry virtual environment.
 To ensure the project uses the correct Python version.

---

### **20. Edit Configuration Files**
- **`liquibase.properties`**: Updates the database connection URL to point to the correct PostgreSQL instance.
```bash
-  url=jdbc:postgresql://<priv ip>:5432/attendance_db
```
  Here jdbc is basically Java Database Connectivity.
  
- Why JDBC ?
  
  It's because we are using Liquibase which primarily a Java-based tool for managing database schema changes. It requires a JDBC connection string to connect to databases like PostgreSQL, MySQL, and Oracle. 

- **`pyproject.toml`**: Ensures the correct Python packages are included in the build.

This packages section in pyproject.toml ensures that the specified directories (client, models, router, utils) are included as Python packages when building and distributing the project. 

```bash
packages = [
                    { include = "client" },
                    { include = "models" },
                    { include = "router" },
                    { include = "utils" }
               ]
```

- Why include this packages ?
  
  Including these packages in pyproject.toml ensures that they are recognized as part of the project. Without this, essential modules may be missing from the final build, causing import errors. 


- **`config.yaml`**: Updates the host IP address for the application.
```bash
host: <change ip>
```


---

### **21. Initialize the Database**
```bash
bash scripts/db_init.sh
```
  Runs a script to initialize the database.
 To set up the database schema and initial data.

**NOTE:-** If you haven't run the db_init.sh script,

**1.** Database Not Found – The attendance_db database won't exist, causing connection failures.

**2.** Table Not Found – Queries will fail because the records table is missing.

**3.** Application Startup Failure – The app may crash or show errors due to missing schema elements.

---

### **22. Install Development Dependencies**
```bash
sudo apt install -y python3.11-dev libpq-dev gcc
```
  Installs development libraries and tools required for building Python packages.
 Some dependencies (e.g., `psycopg2` for PostgreSQL) require these libraries.

**NOTE:-** This command resloves psycopg2 error.

---

### **23. Install Project Dependencies**
```bash
poetry install
```
  Installs all Python dependencies listed in `pyproject.toml`.
 To set up the project's virtual environment with the required packages.

---

### **24. Install Make**
```bash
sudo apt install make
```
  Installs the `make` utility.
 To run Makefile commands for tasks like database migrations.

---

### **25. Run Database Migrations**
```bash
make run-migrations
```
  Executes database migrations using Liquibase.
 To apply changes to the database schema.

 If liquibase is unable to connect to the PostgreSQL database at :5432. The connection is being refused, likely due to one of the following reasons:

- Database server is down – Ensure the PostgreSQL server is running.

- Incorrect hostname or port – Verify that and 5432 are correct.

- Firewall or network issues – The server might be blocking external connections.

- PostgreSQL is not accepting remote connections – Check postgresql.conf and pg_hba.conf.

- Invalid credentials – Verify the username and password in liquibase.properties.

---

### **26. Run the Application**

```bash
poetry add gunicorn
```
Here we are using gunicorn to host python web application.

```bash
poetry run gunicorn app:app --log-config log.conf -b 0.0.0.0:8080
```
  Starts the application using Gunicorn, a WSGI server.
 To serve the application on port 8080, accessible from any IP address.

### **27. The swagger page will be accessible**
```bash
http://<localhost or Public ip>:8080/apidocs
```
# API Endpoints 

| **Endpoint**                     | **API Method** | **Description**                                                                                      |
|----------------------------------|------------|------------------------------------------------------------------------------------------------------|
| /apidocs                         | GET        | Swagger endpoint for the application API documentation                       |
| /api/v1/attendance/create        | POST       | Data creation endpoint which accepts certain JSON body to add records in database     |
| /api/v1/attendance/search        | GET        | For searching records using the params in the URL                                  |
| /api/v1/attendance/search/all    | GET        | Endpoint for searching each data across the system             |                                
| /api/v1/attendance/health        | GET        | Provides shallow health check information about application health and readiness        |
| /api/v1/attendance/health/detail | GET        | Provides detailed health check about dependencies as well like - PostgresSQL and Redis |

# Contact Information

| **Name**       | **Email Address**            |
|-----------------|------------------------------|
| Dipanshu Rawat    | <dipanshu.rawat@mygurukulam.co>   |

# References

| **Link**                                                                                                                     | **Description**                                    |
|-----------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------|
| [How to install and configure PostgreSQL on Ubuntu 20.04](https://medium.com/devops-technical-notes-and-manuals/how-to-install-and-configure-postgresql-on-ubuntu-20-04-4fd3cf072d6f) | PostgreSQL installation and configuration       |
| [How to install Liquibase Database DevOps](https://chandrapurnimabhatnagar.medium.com/how-to-install-liquibase-database-devops-34ca9a6d9705) | Liquibase installation                          |


