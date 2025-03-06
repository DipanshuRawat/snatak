
# Python CI Checks | DAST (Dynamic Application Security Testing)

![image](https://github.com/user-attachments/assets/300e1d46-8458-4570-a568-1c0c24c5500f)


| **Author** | **Created on** | **Version** | **Last updated by**|**Internal Reviewer** |**Reviewer L0** |**Reviewer L1** |**Reviewer L2** |
|------------|---------------------------|-------------|---------------------|-------------|-------------|-------------|-------------|
| Dipanshu Rawat|   25-02-2025             | v1          | Dipanshu Rawat        |  Siddharth Pawar |  |   |      |
| Dipanshu Rawat|   26-02-2025             | v1.1          | Dipanshu Rawat        |  Siddharth Pawar |  |   |      |

## Table of Contents
1. [Introduction](#introduction)
2. [What is DAST?](#what-is-dast)
3. [Why DAST?](#why-dast)
4. [Comparison of DAST Tools](#comparison-of-dast-tools)
5. [Advantages of DAST](#advantages-of-dast)
6. [Proof of Concept (POC)](#proof-of-concept-poc)
7. [Best Practices](#best-practices)
8. [Recommendation/Conclusion](#conclusion)
9. [Contact Information](#contacts)
10. [References](#references)

---

## Introduction

In this document, we will dive deep into **DAST (Dynamic Application Security Testing)**. We will cover What, Why, Different Tools, Best Practice, Conclusions.

---

## What is DAST?
Dynamic Application Security Testing (DAST) is a security testing methodology that focuses on identifying vulnerabilities in running web applications.  DAST interacts with the application in real-time to discover security weaknesses. DAST involves the use of specialized tools to test web applications for common security issues, such as SQL injection, cross-site scripting (XSS), and security misconfigurations.

---

## Why DAST?

- **Real-world Simulation** :-           DAST mimics how attackers exploit vulnerabilities during runtime.           
- **Continuous Monitoring** :-         Allows for regular security assessments as applications evolve.              
- **Identifying Runtime Vulnerabilities** :- DAST discovers vulnerabilities that may only be present during execution.    

---

## Comparison of DAST Tools

| *Tool*       | *Free/Paid* | *Ease of Use* | *Integration* | *Customizability* | *Accuracy* | *Best For*                                                                 |
|-----------------|---------------|------------------|------------------|----------------------|--------------|------------------------------------------------------------------------------|
| OWASP ZAP  | Free          | Moderate         | High             | High                 | High         | *Developers* needing a free, open-source tool for basic to advanced scans. |
| Burp Suite | Free/Paid     | Moderate         | High             | High                 | High         | *Security experts* requiring advanced features like intercepting proxies.  |
| Acunetix   | Paid          | High             | High             | Moderate             | Very High    | *Teams* wanting fast, accurate scans with minimal setup.                  |
| Netsparker | Paid          | High             | High             | Moderate             | Very High    | *Enterprises* needing high accuracy and compliance reporting.             |
| AppSpider  | Paid          | High             | High             | High                 | High         | *DevOps teams* focusing on CI/CD integration and automation.              |Active community, fewer learning resources |

---

## Advantages of DAST

| **Advantage**          | **Description**                                                                 |
|-------------------------|---------------------------------------------------------------------------------|
| **Early Detection**     | Detect vulnerabilities early in the development process.                       |
| **Automated Testing**   | Automate security testing within CI/CD pipelines.                              |
| **Broad Coverage**      | Test for a wide range of security issues.                                      |
| **Real-World Simulation** | Simulate real-world attack scenarios.                                         |

---

## Proof of Concept (POC)
For detailed insights into how to perform DAST for Python application, you can view our Proof of Concept (POC) document. Click [here](https://github.com/Snaatak-Skyops/Documentation/blob/SCRUM-77/Application%20CI%20Design/Python%20CI%20Checks/DAST/POC/README.md)


---

## Best Practices

| **Practice**            | **Description**                                                                 |
|--------------------------|---------------------------------------------------------------------------------|
| **Regular Scans**        | Perform regular DAST scans to ensure continuous security monitoring.            |
| **Integrate Early**      | Integrate DAST into your CI/CD pipeline early in the development process.       |
| **Review and Act**       | Regularly review DAST reports and take action on identified vulnerabilities.    |
| **Combine with SAST**    | Use DAST in conjunction with SAST (Static Application Security Testing) for comprehensive security coverage. |

---

## Conclusion
Among the various tools available, OWASP ZAP stands out as a comprehensive solution for dynamic application security testing in Python, offering a balance between functionality and community support. When implementing Python DAST, it’s crucial to adhere to best practices and integrate it seamlessly into the development lifecycle for maximum effectiveness.   

---

## Contacts

| Name| Email Address      |
|-----|--------------------------|
| Dipanshu Rawat | dipanshu.rawat@mygurukulam.co |  

---

## References

| Reference                    | Link                                                                            |
|------------------------------|---------------------------------------------------------------------------------|
| OWASP ZAP                    | [OWASP ZAP](https://www.zaproxy.org/)                                           |
| Burp Suite                   | [Burp Suite](https://portswigger.net/burp)                                      |
| Acunetix                      | [Acunetix](https://www.acunetix.com/)                                     |
| DAST Documentation           | [DAST Documentation](https://medium.com/@c-shantanu/python-dast-e95905730938) |
