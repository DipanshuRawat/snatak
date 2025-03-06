# Feature Document of Jenkins

![image](https://github.com/user-attachments/assets/2c25eb7a-e64c-4949-a83a-67b2508fe521)

| **Author** | **Created on** | **Version** | **Last updated by**|**Internal Reviewer** |**Reviewer L0** |**Reviewer L1** |**Reviewer L2** |
|------------|---------------------------|-------------|---------------------|-------------|-------------|-------------|-------------|
| Dipanshu Rawat|   26-02-2025             | v1          | Dipanshu Rawat        |  Siddharth Pawar |  |   |      |
| Dipanshu Rawat|   26-02-2025             | v1.1          | Dipanshu Rawat        |  Siddharth Pawar |  |   |      |


## Table of Contents
- [Introduction](#introduction)
- [Pre-requisites](#pre-requisites)
- [System Requirements](#system-requirements)
- [Dependencies and Important Ports](#dependencies-and-important-ports)
- [Challenges Before and After Jenkins](#before-jenkins-vs-after-jenkins)
- [Workflow](#workflow)
- [Features of Jenkins](#features-of-jenkins)
- [Core Components](#core-components)
- [Conclusion](#conclusion)
- [Contacts](#contacts)
- [References](#references)

## Introduction
This documentation provides an overview of Jenkins, a powerful CI/CD orchestration tool. It covers the prerequisites and system requirements for setting up Jenkins, including necessary hardware, software, and dependencies like Java 17. The document highlights why Jenkins is essential for automating software development workflows and concludes with references and contact information for further assistance.

---
## Pre-requisites
Before setting up Jenkins, ensure your hardware, software, and security requirements are met.

## System Requirements
| Hardware Specifications | Minimum Recommendation |
|-------------------------|------------------------|
| Processor               | Dual-core              |
| RAM                     | 4GB                    |
| Disk                    | 20GB                   |
| OS                      | Ubuntu 22.04           |

## Dependencies and Important Ports
| Dependency/Port | Version | Description           |
|-----------------|---------|-----------------------|
| Java            | 17     | Needed to run Jenkins |
| Port 8080       | N/A     | Jenkins web interface |

---
# What is Jenkins?
Jenkins is an open source CI/CD automation server written in Java. There are over 1,800 plugins available in the Jenkins which allows continuous integration. It provides reliability to build, test and deploy the software. It also allows continuously delivery and deployment of your projects by integrating with a large number of testing and deployment technologies.

# Why use Jenkins?
- **Open Source**: Free and open-source, allowing customization without licensing costs.  
- **Extensive Plugin Ecosystem**: Supports integration with various CI/CD tools via plugins.  
- **Active Community**: Large user base providing resources, tutorials, and support.  
- **Platform Independence**: Runs on multiple operating systems and platforms.  
- **Pipeline Support**: Offers a domain-specific language for scripting workflows and pipelines.  

# Before Jenkins vs After Jenkins

| 🚀 **Before Jenkins**                          | ✅ **After Jenkins**                           |
|-----------------------------------------------|----------------------------------------------|
| ❌ Developers committed code all at once.     | ✔️ Developers commit code continuously.     |
| 🔹 Long build times and delays.               | 🔹 Jenkins builds and tests code rapidly.   |
| ❌ Development cycle was slow.                | ✔️ Faster development cycle.                |
| 🔹 Manual testing and deployment took days.   | 🔹 Plugins and automation speed up processes. |
| ❌ Difficult to detect and fix errors.        | ✔️ Error detection is easier.               |
| 🔹 Multiple commits made debugging complex.   | 🔹 Jenkins highlights exact points of failure. |
| ❌ Code was built in bulk.                    | ✔️ Code is built immediately.               |
| 🔹 Developers had to wait before testing.     | 🔹 No delays in testing and deployment.     |
| ❌ Higher chances of failure.                 | ✔️ Automated processes save time.           |
| 🔹 Entire workflow was manual.                | 🔹 Continuous integration reduces errors.   |
---
## WorkFlow

![image](https://github.com/user-attachments/assets/0dea6b5f-3b24-47eb-b0be-d64902221f88)

1️⃣ **Development**  
&nbsp;&nbsp;&nbsp;&nbsp;🔹 Developers write and modify code on their local machines.  

2️⃣ **Code Commit**  
&nbsp;&nbsp;&nbsp;&nbsp;🔹 Code is committed to a Git repository (GitHub, GitLab, Bitbucket, etc.).  

3️⃣ **Jenkins Trigger**  
&nbsp;&nbsp;&nbsp;&nbsp;🔹 Jenkins detects the code commit and starts the CI/CD pipeline.  

4️⃣ **Build**  
&nbsp;&nbsp;&nbsp;&nbsp;🔹 Jenkins compiles the code and builds the project.  

5️⃣ **Test**  
&nbsp;&nbsp;&nbsp;&nbsp;🔹 Automated tests (unit, integration, functional) are executed to validate the code.  

6️⃣ **Stage**  
&nbsp;&nbsp;&nbsp;&nbsp;🔹 Code is prepared for deployment in a staging environment for further testing.  

7️⃣ **Deploy (Dev/QA/...)**  
&nbsp;&nbsp;&nbsp;&nbsp;🔹 The application is deployed to different environments (e.g., Dev, QA) for review.  

8️⃣ **Production Deployment**  
&nbsp;&nbsp;&nbsp;&nbsp;🔹 If all tests and reviews pass, Jenkins deploys the application to production.  

---

## Features of Jenkins

| **Feature**                | **Description**                                                                                           |
|----------------------------|-----------------------------------------------------------------------------------------------------------|
| **Continuous Integration (CI)** | Automates code building, testing, and integration to ensure the software is always deployable. |
| **Pipeline as Code**        | Defines CI/CD pipelines using code, versioned in source control for consistency. |
| **Plugins**                 | Offers over 1,500 plugins to integrate with tools like Docker, Git, and AWS. |
| **Distributed Builds**      | Runs builds on multiple machines for faster and scalable processes. |
| **Automated Testing**       | Executes tests automatically to ensure code changes don’t break functionality. |
| **Freestyle Projects**      | Simple jobs for straightforward CI/CD tasks without complex scripting. |
| **Declarative Pipelines**   | Structured, easy-to-read pipelines for users with minimal scripting knowledge. |
| **Version Control Integration** | Integrates with systems like Git and SVN, triggering jobs on code changes. |
| **Monitoring and Reporting** | Provides real-time feedback, logs, and build history via a web interface. |
| **Security**                | Supports role-based access and integrates with LDAP/Active Directory for authentication. |
| **Integration with Other Tools** | Works with Docker, Kubernetes, AWS, and more for scalable deployments. |
| **Pipeline Visualization**  | Displays graphical views of pipelines for tracking and troubleshooting. |
| **Build Triggers**          | Automates builds on events like commits, pull requests, or schedules. |
| **Build and Artifact Management** | Manages built artifacts and integrates with repositories like Nexus or Artifactory. |

---

## Core Components

| **Component**           | **Description**                                                                                 |
|--------------------------|-------------------------------------------------------------------------------------------------|
| **Jenkins Master**       | Central server managing jobs, scheduling tasks, and running the web interface for CI/CD.       |
| **Jenkins Agent**        | Machines performing build tasks assigned by the master, scalable based on workload.            |
| **Jobs and Builds**      | - **Job**: Defined task like building or testing. <br> - **Build**: A job's execution instance. |
| **Pipelines**            | - **Declarative**: Simple, structured pipeline syntax. <br> - **Scripted**: Flexible, Groovy-based syntax. <br> - **Jenkinsfile**: Pipeline definition stored in source control. |
| **Credentials**          | Secure storage for passwords, tokens, and sensitive data used in jobs.                        |
| **Views & Dashboards**   | Custom views to organize jobs and dashboards to monitor job statuses and metrics.              |
| **SCM Integration**      | Integrates with Git, SVN, etc., to trigger jobs on code changes.                               |
| **Notifications & Reporting** | Send alerts via email/Slack and generate reports on test results or code coverage.        |

---
# Pros and Cons of Jenkins

|  **Pros**                                    |  **Cons**                                  |
|-----------------------------------------------|---------------------------------------------|
| **Open Source & Free**  🚀                     | **Outdated UI**  📉                          |
| 🔹 Free to use and platform-independent.       | 🔹 The interface is outdated and not user-friendly. |
| **Extensive Plugin Support** 🔌               | **Limited Built-in Features** ⚠️             |
| 🔹 Wide range of plugins for integrations.     | 🔹 Requires additional plugins for Git and other tools. |
| **Strong Community & Debugging** 👨‍💻         | **Difficult Management** 🔄                   |
| 🔹 10M+ users, extensive support & easy debugging. | 🔹 Managing Jenkins dashboards becomes complex with many jobs. |
---

## Conclusion
In conclusion, while Jenkins offers powerful capabilities and flexibility, it requires a dedicated effort to set up, maintain, and optimize. When considering Jenkins, it’s essential to evaluate your team’s specific needs, available expertise, and willingness to manage the overhead associated with it. Newer CI/CD tools may offer smoother experiences or cloud-native features out of the box, but Jenkins remains a robust and highly customizable choice.

---

## Contacts

| Name| Email Address      |
|-----|--------------------------|
| Dipanshu Rawat | dipanshu.rawat@mygurukulam.co |

---
## References
| Reference Source          | Description                                      | URL                                          |
|---------------------------|--------------------------------------------------|----------------------------------------------|
| Jenkins Official Website  | Comprehensive information about Jenkins.         | [Jenkins.io](https://jenkins.io)             |
| Jenkins Documentation     | Detailed guides and tutorials for using Jenkins. | [Jenkins Documentation](https://medium.com/@tanviiiii/jenkins-before-jenkins-vs-after-jenkins-jenkins-industry-use-cases-b9c7081a93b2) |
| Jenkins Documentation     | What, Why Jenkins, Conclusion. | [Jenkins Documentation](https://medium.com/devops-technical-notes-and-manuals/why-use-jenkins-over-the-other-tools-jenkins-pros-and-cons-d2d4811ae81c) |