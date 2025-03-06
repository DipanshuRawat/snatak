# POC on Dynamic Application Security Testing (DAST) for Python Application

![image](https://github.com/user-attachments/assets/171719a3-9f78-40bd-aaf8-4b9cd9242a85)

| **Author** | **Created on** | **Version** | **Last updated by**|**Internal Reviewer** |**Reviewer L0** |**Reviewer L1** |**Reviewer L2** |
|------------|---------------------------|-------------|---------------------|-------------|-------------|-------------|-------------|
| Dipanshu Rawat|   25-02-2025             | v1          | Dipanshu Rawat        |  Siddharth Pawar |  |   |      |
| Dipanshu Rawat|   27-02-2025             | v1.1         | Dipanshu Rawat        |  Siddharth Pawar |  |   |      |


## Table of Content: 
- [Introduction](#Introduction)
- [Pre-requisites](#Pre-requisites)
- [Step-by-Step setup Guide](#Step-by-step-Setup-Guide)
- [Conclusion](#Conclusion)
- [Contact Information](#Contact-Information)
- [References](#References)

## Introduction
In this POC, We will use most popular DAST Tool - OWASP ZAP for our Python application. We will see step by step setup guide, will do automated scan, check for vulnerabilities and generate report.

---

## Pre-requisites
- [OWASP ZAP](https://www.zaproxy.org/) 
- A Running Application to Perform DAST.

![image](https://github.com/user-attachments/assets/98359f43-cbdc-4617-bbc5-2b6ed9f73405)

---

# Step-by-Step Setup Guide

### **Step 1**: Update Your Linux System

Before installing OWASP ZAP, it's essential to update your system to ensure that you have the latest packages and security patches. To update your system, open the terminal and type the following command:
```
sudo apt update
```
---

### **Step 2**: Install OWASP ZAP

Once your system is up to date, you can install OWASP ZAP. To do so, type the following command in the terminal:
```
sudo snap install zaproxy --classic
````
---

### **Step 3**: Launch OWASP ZAP

Once the installation is complete, you can launch OWASP ZAP from the application menu or the command line. To launch it from the command line, type the following command:
```
zaproxy
```
<img src="https://github.com/user-attachments/assets/afd817aa-cb77-4518-b389-415eb6279bcb" alt="OWASP ZAP UI" width="800">


You can now start using OWASP ZAP to test the security of your web applications.After a few minutes, OWASP ZAP will open up.

<img src="https://github.com/user-attachments/assets/73b5d624-9147-45c2-bf3f-9b9f437f3129" alt="OWASP ZAP Dashboard" width="500">

---

### **Step 4**: Click on the **Automated scan** option a interface will come out on which provide the URL of the application and click on **attack**. 

OWASP ZAP will start  scanning  your application for  vulnerabilities .

<img src="https://github.com/user-attachments/assets/c45a9ed7-1048-4785-a793-c8e838c00be6" alt="Automated Scan" width="500">

---


### **Step 5** : Analyze Results

 After the scan, navigate to the Alerts tab to see the list of identified vulnerabilities. Click on each **alert** to see details .

<img src="https://github.com/user-attachments/assets/513a24c5-0708-4223-b467-2f09353fe381" alt="Analyze Results" width="500">

---

### **Step 6** : Report Generation: 

You can also Generate the Report of the analysis by click on the **Report** option and generate it in desired format (HTML, PDF,JSON etc.) for future References. 

<img src="https://github.com/user-attachments/assets/e5199663-5308-4390-bb87-a58d107018b5" alt="Report Generation" width="500">

---

### **Step 7** : Report:

| *Link* | *Description* |
|---------|----------------|
| [Report](https://github.com/Snaatak-Skyops/Documentation/blob/SCRUM-77/Application%20CI%20Design/Python%20CI%20Checks/DAST/POC/Report.html) | Click here to download the generated security analysis report.

---

## Conclusion

Using OWASP ZAP for DAST is a powerful way to identify and mitigate security vulnerabilities in your web applications. By following the steps above, you can create a comprehensive POC demonstrating its capabilities and integration into your security workflow.

---

## Contacts

| Name| Email Address      |
|-----|--------------------------|
| Dipanshu Rawat | dipanshu.rawat@mygurukulam.co |  
 
---

## Reference Links

| Links | Description |
|-------|-------------|
|https://techofide.com/blogs/how-to-install-owasp-zap-on-windows-and-linux/ | A step-by-step guide to installing OWASP ZAP on both Windows and Linux platforms. Useful for beginners starting with OWASP ZAP. |
| https://www.zaproxy.org/ | The official website for OWASP ZAP, providing documentation, downloads, and community support. Ideal for exploring all features of ZAP. |