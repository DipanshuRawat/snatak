# Jenkins | Monitoring metrics

![image](https://github.com/user-attachments/assets/b92c6abd-472f-40ec-a774-b92346efade6)

| **Author**          | **Created on** | **Version** | **Last updated by** | **Internal Reviewer** | **Reviewer L0** | **Reviewer L1** | **Reviewer L2** |
|---------------------|---------------|-------------|---------------------|-----------------------|-----------------|-----------------|-----------------|
| Dipanshu Rawat     | 03-03-2025     | v1          | Dipanshu Rawat      | Siddharth Pawar       |                 |                 |                 |



## Table of Content
- [Introduction](#introduction)
- [Pre-requisites](#pre-requisites)
- [What is Jenkins Monitoring ?](#what-is-jenkins-monitoring)
- [Why is Monitoring Important?](#why-is-monitoring-important)
- [Types of Jenkins Metrics ](#types-of-jenkins-metrics)
- [Tools for Monitoring Jenkins](#tools-for-monitoring-jenkins)
- [Step by Step Guide](#step-by-step-guide)
    - [step1. Setup Prometheus](#step1-setup-prometheus)
    - [step2. Setup NodeExporter](#step2-setup-nodeexporter)
    - [step3. Setup Grafana](#step3-setup-grafana)
    - [step4. Install Jenkins](#step4-install-jenkins)
   - [Step5. Jenkins Monitoring with Prometheus and Grafana]()
   - [Step6. final Output](#step6-final-output)
- [Conclusion](Conclusion)
- [Contact Information](#contact-information)
- [References](#references)


## **Introduction**

This document provides a step-by-step guide to monitoring Jenkins using Prometheus and Grafana. It covers key concepts, required tools, and configurations to track system performance, build health, and resource usage effectively. By following this guide, you can ensure Jenkins runs smoothly and resolve issues proactively.

## **Pre-requisites**


| **Specification**      | **Details**         |
|-------------------------|---------------------|
| **Operating System**    | Ubuntu 22.04      |
| **CPU**                | 2 vCPU             |
| **Hard Disk**             | 20 GB              |
| **RAM**                | 4 GB               |

--- 

# Security ports

| **Port** | **Protocol** | **Source Side**    | **Destination Side** | **Use Case**                     |
|----------|--------------|--------------------|-----------------------|-----------------------------------|
| 80       | TCP          | Any                | Server               | HTTP traffic for web applications|
| 443      | TCP          | Any                | Server               | Secure HTTPS web traffic         |
| 3000     | TCP          | Any | server      | Grafana      |
| 9100     | TCP          | Any                | Server               |  NodeExpoter |
|9090 | TCP| Any|Server|Prometheus |
|8080|TCP|Any|server|jenkins|

___
## **What is Jenkins Monitoring?**

Monitoring Jenkins ensures it runs smoothly, catches problems early, and prevents downtime. It helps optimize performance by tracking resource usage such as health,disk usage,cpu,etc.

___
## **Why is Monitoring Important?**
**Prevents Downtime:** Catching issues early avoids system crashes.

**Improves Performance:** Ensures Jenkins runs efficiently.

**Saves Time:** Fixing small problems before they become big ones.

**Keeps Developers Happy:** A smooth-running Jenkins means fewer delays in their work.
___
## **Types of Jenkins Metrics**

|       Types      |          Description               |
|:-----------------:|:-------------------------------------:|
| **System Performance Metrics** | Track CPU, memory, and disk usage to ensure Jenkins has enough resources to run smoothly.
| **Build Metrics** | Monitor build duration, success rates, failure counts .
| **Agent Metrics** | Check the health, availability, and resource usage of Jenkins agents 
| **Plugin Metrics** | Monitor the status and updates of plugins to prevent compatibility issues.
| **Pipeline Metrics**   | Provide details about the performance of Jenkins pipelines and stages. 
| **User Metrics**       | Track user activity, access patterns, and role-based actions.
| **Security Metrics**   | Monitor vulnerabilities and security-related events. 

##  **Tools for Monitoring Jenkins**

| Tool                     | Description |
|--------------------------|-------------|
| **Prometheus & Grafana** | Prometheus collects Jenkins metrics, and Grafana helps visualize them. |
| **Jenkins Monitoring Plugin** | Provides real-time system metrics for Jenkins. |
| **Elastic Stack (ELK)** | Collects and analyzes Jenkins logs for in-depth insights. |
| **CloudWatch (AWS)** | Monitors Jenkins instances running on AWS, helping track resource usage. |
___
## **Step by Step Guide**

### **step1. Setup Prometheus**
 - To install Prometheus on your system, please follow the link below for the Prometheus Setup Guide. :-[ Prometheus Setup  Guide](https://github.com/snaatak-Zero-Downtime-Crew/Documentation/blob/Nikita-SCRUM-104/Common/Software/Prometheus/README.md)

### **step2. Setup NodeExporter**
 - To Setup NodeExporter on your system, please follow the link below for the NodeExporter Setup Guide. :-[ NodeExporter Setup  Guide](https://github.com/snaatak-Zero-Downtime-Crew/Documentation/blob/Nikita-SCRUM-104/Common/Software/NodeExporter/README.md)

### **step3. Setup Grafana**
 - To Setup Grafana on your system, please follow the link below for the Grafana Setup Guide. :-[ Grafana Setup  Guide](https://github.com/snaatak-Zero-Downtime-Crew/Documentation/blob/Nikita-SCRUM-104/Common/Software/Grafana/README.md)
### **step4. Install Jenkins**

- To install jenkins on your system, please follow the link below for the jenkins Setup Guide. :-[ jenkins installation  Guide](https://github.com/snaatak-Zero-Downtime-Crew/Documentation/blob/Nikita-SCRUM-104/Common/Software/Jenkins/README.md)

### **Step5. Jenkins Monitoring with Prometheus and Grafana**

####  **1. Go to Manage Jenkins → Plugins → Available Plugins Search for Prometheus and install it**

Once that is done you will Prometheus is set to /Prometheus path in system configurations

![image](https://github.com/user-attachments/assets/2fa441a3-9a15-4c5d-bae0-815b1bfb50c6)


#### **2. To create a static target, you need to add job_name with static_configs**
``` bash
/etc/prometheus/prometheus.yml
```
**Paste below code**

- job_name: 'jenkins'
   metrics_path: '/prometheus'
   static_configs:
     - targets: ['<jenkins-ip>:8080']
![image](https://github.com/user-attachments/assets/cc843c39-bb9f-4c08-af9a-18232e19899c)

#### **3. Restart Prometheus**
``` bash
sudo systemctl restart prometheus
```

#### **4. Check the targets section**
``` bash
http://<ip>:9090/targets
```


Let’s add Dashboard for a better view in Grafana

Click On Dashboard → + symbol → Import Dashboard

Use Id 9964 and click on load
![image](https://github.com/user-attachments/assets/e2c9fbaf-966a-427c-a63c-a2b9e1a2f183)
### **Step6. final Output**


![image](https://github.com/user-attachments/assets/e1b5cd26-e8dd-419c-89c3-b59b243054bf)

![image](https://github.com/user-attachments/assets/bda19821-e805-4191-97ea-d2309d5b0c35)



## **Conclusion**

Monitoring is essential for tracking system performance, identifying issues, and ensuring smooth operations. To achieve this, I set up Prometheus to collect metrics from Jenkins and integrated it with Grafana for visualization. This allows for real-time monitoring of Jenkins builds, resource usage, and overall system health, making it easier to analyze trends and optimize performance.

## **Contact Information**

| **Name** | **Email address**            |
|----------|-------------------------------|
| Dipanshu Rawat    | dipanshu.rawat@mygurukulam.co    |


## **References**

| Reference  | Description |
| ---------  | ----------- |
|[Monitoring with Prometheus](https://medium.com/@PriyamChauhan/introduction-to-monitoring-with-prometheus-fe2cfefb0952) |Prometheus's |
|[Monitoring](https://www.geeksforgeeks.org/what-is-a-monitor/)|Monitoring |