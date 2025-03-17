# Salary API Service

| **Author**            | **Created on** | **Version** | **Last updated by**       | **Last edited on** | **Reviewer**      |
|-----------------------|----------------|-------------|----------------------------|---------------------|-------------------|
| Aman Raj      | 10-02-2025       | Version 1 | Aman Raj         | 12-02-2025       | Siddharth Pawar    |


## Pre-Requisites

For running the Salary-API application we need to install below:

- [ScyllaDB](https://github.com/Snaatak-Skyops/Documentation/blob/e80d2d7eb3f5e541491ea88bd692d8cf0bfaa313/Common/Database/Scylla%20DB/POC/POC-README.md)
- [Redis](https://github.com/Snaatak-Skyops/Documentation/blob/604a1e3234013de9c2cdf088c99bd4a6dbcf1cd0/Common/Software/Redis/POC-README.md)

---
## System Requirements

| **Requirement**        | **Details**                  |
|------------------------|------------------------------|
| **OS**                 | Ubuntu or other Linux-based OS |
| **RAM**                | 4 GB minimum                 |
| **Disk Space**         | 15 GB               |
| **Processor**          | Dual-core recommended        | 
| **Instance_Type**    | t2.medium | 

---

# Installation and setup of application

## Step 1:- Update configuration file of scylla
``` bash
sudo vi /etc/scylla/scylla.yaml
```
## Step 2:- Added the below lines in the config file:
``` bash
authenticator: PasswordAuthenticator

authorizer: CassandraAuthorizer
```

#### authenticator: PasswordAuthenticator
- Enables password-based authentication for ScyllaDB.
- By default, ScyllaDB does not require authentication. This setting enforces login credentials for database access.
#### authorizer: CassandraAuthorizer
- Enables role-based access control (RBAC), similar to Apache Cassandra.
- Manages permissions on database objects, allowing administrators to define who can access specific tables, keyspaces, or data.

## Step 3:- Updated the rpc_address in config file with server's private IP:
#### rpc_address: <private_IP>
- rpc_address defines the IP address that ScyllaDB will use to accept remote procedure calls (RPCs) for client connections.
- By default, it may be set to localhost (127.0.0.1), meaning it only accepts connections from the same machine.
- Updating it to the private IP allows other servers in the same network (such as application servers) to connect to ScyllaDB.

## Step 4:- Command to get into scylladb
``` bash
cqlsh <private_IP> 9042 -u <Username> -p <your-password>
```
- The command connects to a Cassandra or ScyllaDB instance at <private_IP> on port 9042 using the cqlsh tool, with the username and password set to cassandra.
- Connects to the ScyllaDB server using CQLSH, allowing you to execute queries, manage keyspaces, and interact with the database.

#### Created user ‘scylladb’ with password as <your-password>
    ``` bash
    CREATE USER <username> WITH PASSWORD '<your-password>' SUPERUSER;
    ```
    - Creates a new superuser in ScyllaDB who has full control over all keyspaces, tables, and permissions.
    This is useful when you want to move away from the default cassandra user and use a dedicated admin user for security.

#### Created keyspace employee_db
    ``` bash
    CREATE KEYSPACE employee_db WITH REPLICATION = { 'class': 'SimpleStrategy', 'replication_factor': 1 };
    ```
    - Creates a new keyspace named employee_db. A keyspace in ScyllaDB (and Cassandra) is like a database in other relational systems, used to organize tables and data.

#### Check for employee_db
    ``` bash
    DESCRIBE KEYSPACES;
    ```
    - It lists all the keyspaces in the ScyllaDB instance or cluster.

## Step 5:- Configure user permissions and authentication settings in redis
``` bash
ACL SETUSER scylla on ><your-password> ~* +@all
```
- Creates a user named scylla with the password password.
- The user is given access to all keys (~*) and all Redis commands (+@all), making this a full-privileged user in Redis.

#### List the acl
``` bash
ACL LIST
```
- This command lists all the users and their associated ACLs in Redis.

### Update the redis config file
    ``` bash
    sudo vi /etc/redis/redis.conf
    ```
#### Bind with private IP "bind 127.0.0.1 <private_IP>"
- Redis will accept connections from the local machine (localhost) and from any machine within the private network (via the specified private IP).
This change is useful when you need Redis to be accessible to other machines in the same network but not exposed to the internet.
``` bash
sudo systemctl restart redis

redis-cli -h <private_IP> -p 6379 ping
```
- Restarts the Redis service to apply the changes made to the redis.conf configuration file.
- Connects to the Redis server on the specified private IP and checks if the Redis server is running correctly.The expected response is PONG, indicating that Redis is accepting connections on the private IP and the server is functioning.

## Step 6:- Install Maven & Java depndancy
``` bash
sudo apt install openjdk-17-jre

sudo apt install maven -y
```
- Installs the Java Runtime Environment (JRE) for OpenJDK 17. The JRE is required to run Java applications but does not include development tools like compilers.
- Installs Apache Maven, a build automation tool primarily used for Java projects. It handles dependencies, compiles code, and packages the application.

## Step 7:- Installation of jq(cli tool for processing json data)
``` bash
sudo apt  install jq -y
```
- jq is a tool that helps you work with JSON data in the terminal (like reading or changing data).

## Step 8:- Swagger Installation
``` bash
sudo curl -o /usr/local/bin/swagger -L'#' "$(curl -s https://api.github.com/repos/go-swagger/go-swagger/releases/latest | jq -r '.assets[] | select(.name | contains("'"$(uname | tr '[:upper:]' '[:lower:]')"'_amd64")) | .browser_download_url')"
```
- It downloads the latest Swagger release for your architecture.
- Saves the Swagger executable to /usr/local/bin/ so that it can be run from anywhere in the terminal with the swagger command.

``` bash
sudo chmod +x /usr/local/bin/swagger
```
- It allows you to run the swagger command from anywhere in the terminal.

## Step 9:- Clone the salary-api repo in your instance
``` bash
git clone https://github.com/OT-MICROSERVICES/salary-api.git
```

## Step 10:- Enter into salary-api directory
``` bash
cd salary-api/
```

## Step 11:- Update the Contact-Points & Host in application.yaml to your private ip address from below paths
``` bash
sudo vi src/main/resources/application.yml

sudo vi src/test/resources/application.yml
```

## Install migration tool

## Step 12:- Download the zip file of the migration tool(migrate)
``` bash
curl -L https://github.com/golang-migrate/migrate/releases/download/v4.15.2/migrate.linux-amd64.tar.gz | tar xvz
```

## Step 13:- Move the file to below location
``` bash
sudo mv migrate /usr/local/bin/migrate
```
- The command moves the migrate binary to /usr/local/bin/, making it accessible system-wide for execution. This requires superuser privileges.
  
## Step 14:- Check the version of migrate
``` bash
migrate --version
```

## Step 15:- Update below config files with public IP:
``` bash
cd /salary-api

sudo vi src/main/java/com/opstree/microservice/salary/config/OpenAPIConfig.java 
```
- devServer.setUrl("http://<public-ip>:8080");
``` bash
sudo vi src/test/java/com/opstree/microservice/salary/config/OpenAPIConfigTests.java 
```
- assertEquals("http://<public-ip>:8080", server.getUrl());

## Step 16:- Update the migration.json with private IP
``` bash
sudo vi migration.json
```

## Step 17:- run the clean package inside the salary-api directory
``` bash
mvn clean package
```
- clean: Cleans up any previously generated build files.
- package: After cleaning, it compiles your source code, runs any tests, and then packages the code into an artifact (like a .jar file for Java applications).

## Step 18:- Install make command
``` bash
sudo apt install make
```
- Installs the make tool on your system. make uses Makefiles to define tasks, such as compiling code, running tests, or automating workflows.

## Step 19:- Run the migration command
``` bash
make run-migrations
```
- It runs the migration process for your project, typically involving tasks like updating the database schema, applying new migrations, or setting up initial data.

## Step 20:- Run the java runtime command
``` bash
java -jar target/salary-0.1.0-RELEASE.jar
```
- Runs the compiled Java application located in target/salary-0.1.0-RELEASE.jar.
- The application will start based on the code inside the JAR file. 

## Endpoints Information

| Endpoint|	Method	|Description|
|----|----|----|
|/api/v1/salary/create/record	|POST	|Data creation endpoint which accepts certain JSON body to add salary information in database|
|/api/v1/salary/search	|GET|	Endpoint for searching data information using the params in the URL|
|/api/v1/salary/search/all	|GET	|Endpoint for searching all information across the system|
|/actuator/prometheus	|GET	|Application healthcheck and performance metrics are available on this endpoint|
|/actuator/health|	GET	|Endpoint for providing shallow healthcheck information about application health and readiness|

---

# Contact Information

| **Name** | **Email address**            |
|----------|-------------------------------|
| Aman Raj    |  aman.raj@mygurukulam.co   | 

---
# References

| **Link** | **Description**            |
|----------|-------------------------------|
| [What is Redis and How Does it Work? - Medium](https://medium.com/@ayushsaxena823/what-is-redis-and-how-does-it-work-cfe2853eb9a9)   |  Overview of Redis' structure and functions.          |
| [ScyllaDB Installation Guide](https://opensource.docs.scylladb.com/stable/getting-started/install-scylla/install-on-linux.html)   | Comprehensive guide for installing ScyllaDB on Linux. |
|[Repository Link](https://github.com/OT-MICROSERVICES/salary-api.git) | Repository Used for building this service. |
---
