   # Conclusion Document CI Orchestration Tools
   ## Jenkins vs GitLab vs BuildPiper

   | **Author**          | **Created on** | **Version** | **Last updated by** | **Internal Reviewer** | **Reviewer L0** | **Reviewer L1** | **Reviewer L2** |
   |---------------------|---------------|-------------|---------------------|-----------------------|-----------------|-----------------|-----------------|
   | Dipanshu Rawat     | 28-02-2025     | v1          | Dipanshu Rawat      | Siddharth Pawar       |                 |                 |                 |

   ---

   ## Table of Contents

   1. [Introduction](#introduction)
      - [Continuous Integration](#continuous-integration)
   2. [CI Tools](#ci-tools)
      - [Jenkins](#jenkins)
      - [GitLab](#gitlab)
      - [BuildPiper](#buildpiper)
   3. [Comparison b/w CI tools](#comparison-bw-ci-tools)
   4. [Conclusion](#conclusion)
      - [Why Jenkins](#why-jenkins)
   5. [References](#references)

   ---

   ## Introduction 

   This documentation provides a brief introduction of CI Orchestration tools (**Jenkins, GitLab, and BuildPiper**) and a comparison between them.

   ### Continuous Integration
   Continuous Integration is a software development practice where code changes are automatically integrated and tested frequently. Developers submit their code changes to a shared repository, triggering an automated build and test process. This ensures that the codebase is always in a functional state. Continuous Integration addresses challenges in software development by automating the integration of code changes from multiple contributors. It aims to detect and fix integration issues early in the development process, promoting collaboration and delivering more reliable software.

   👉 **For detailed information on Jenkins, refer to this [link](https://github.com/Snaatak-Skyops/Documentation/blob/SCRUM-55/Application%20CI%20Design/Understanding/CI%20as%20a%20concept/README.md).**

   ---

   ## CI Tools

   ### Jenkins
   1. Jenkins is an open-source automation server with a vast plugin ecosystem, enabling flexible CI/CD pipelines.
   2. It requires manual setup and maintenance but provides high customizability and broad tool integration.

   👉 **For detailed information on Jenkins, refer to this [link](https://github.com/Snaatak-Skyops/Documentation/blob/SCRUM-85/Application%20CI%20Design/CI%20Orchestration%20Tools/Feature%20document%20of%20Jenkins/README.md).**

   ### GitLab
   1. GitLab CI/CD is an integrated solution within GitLab, offering seamless automation of build, test, and deployment processes.
   2. It includes built-in security, issue tracking, and a web-based interface, making it user-friendly.

   👉 **For detailed information on GitLab, refer to this [link](https://about.gitlab.com/stages-devops-lifecycle/continuous-integration/).**

   ### BuildPiper
   1. BuildPiper is a Kubernetes and Microservices-focused CI/CD platform offering end-to-end automation.
   2. It provides a secure, zero-touch deployment process and pre-integrated cloud tools.

   👉 **For detailed information on BuildPiper, refer to this [link](https://github.com/Snaatak-Skyops/Documentation/blob/SCRUM-87/Application%20CI%20Design/CI%20Orchestration%20Tools/Feature%20document%20of%20Buildpiper/README.md).**

   ---

   ## Jenkins vs GitLab CI/CD vs BuildPiper - Comparison

   | **Feature**       | **Jenkins** | **GitLab CI/CD** | **BuildPiper** |
   |-------------------|------------|------------------|---------------|
   | **Functionality** | Highly customizable with plugins. | Integrated CI/CD with GitLab. | End-to-end DevSecOps platform. |
   | **Ease of Use**   | Steep learning curve; manual setup. | User-friendly with built-in CI/CD. | Simplified GUI-based setup. |
   | **Performance**   | Can be resource-intensive. | Optimized for GitLab projects. | Cloud-optimized with auto-scaling. |
   | **Integration**   | Supports many tools via plugins. | Native GitLab & cloud integration. | Pre-integrated with cloud & security tools. |
   | **Cost**         | Free but requires setup/maintenance. | Free tier, paid for advanced features. | Paid, usage-based pricing. |
   | **Support**      | Community + CloudBees (paid). | Community + official support (paid). | Enterprise-grade support. |

   ---

   ## Conclusion

   Through deep and understandable analysis, we are using **Jenkins** for our project at **GuruKulam**. The main reason for this choice is its **high customizability and extensive plugin ecosystem**, which makes it ideal for handling **microservices-based architectures**. 

   ### Why Jenkins
   Jenkins allows us to define complex CI/CD pipelines tailored to our needs, integrate seamlessly with Kubernetes, Docker, and various cloud services, and efficiently manage multiple microservices in a **flexible and scalable manner**. While GitLab CI/CD and BuildPiper offer great built-in features, Jenkins provides **greater control, extensive community support, and cost-effectiveness**, making it the best fit for our microservices project.

   ---

   ## References

   | **Description**                | **References** |
   |--------------------------------|-------------------------------------------------------------------|
   | Jenkins vs GitLab CI           | [Jenkins vs GitLab](https://www.browserstack.com/guide/jenkins-vs-gitlab) |
   | BuildPiper                     | [BuildPiper Docs](https://www.buildpiper.io/documentation/docs/getting/introducing) |
   | CI                              | [CI Overview](https://www.guru99.com/jenkin-continuous-integration.html) |
   | GitLab CI/CD vs BuildPiper      | [GitLab Blog](https://about.gitlab.com/blog/) |
