# Feature of VCS (Conclusion Documentation)

| **Author** | **Created on** | **Version** | **Last updated by**|**Internal Reviewer** |**Reviewer L0** |**Reviewer L1** |**Reviewer L2** |
|------------|---------------------------|-------------|---------------------|-------------|-------------|-------------|-------------|
| Dipanshu Rawat|   18-02-2025             | v1          | Dipanshu Rawat        |  Siddharth Pawar |  |   |      |

## Table Of Content 
- [Why we need VCS](#why-we-need-vcs)
- [Introduction](#introduction)
- [Comparison](#comparison)
- [Conclusion](#conclusion)
- [References](#references)
- [Contacts](#contacts)

---
## Why we need VCS
We need a Version Control System (VCS) like Git for our project to track changes, manage multiple developers working on the code, and keep everything organized. It allows us to safely make updates without affecting the main codebase, and if something goes wrong, we can easily revert to a previous version. VCS also helps with code reviews, ensures better quality, and integrates with CI/CD tools for automated testing and deployment. Overall, it improves collaboration, makes development smoother, and helps maintain code integrity

---
## Introduction 

### [GitHub](https://github.com/avengers-p11/Documentation/blob/main/VCS%20Design%20%2B%20POC/Features%20of%20VCS/GitHub%20features/README.md)
- Best for collaborative development with a large, active community.  
- Simplifies workflows with features like GitHub Actions (CI/CD) and GitHub Copilot.  

### [Bitbucket](https://github.com/avengers-p11/Documentation/blob/main/VCS%20Design%20+%20POC/Features%20of%20VCS/BitBucket_features/README.md)
- Focused on integration with Atlassian products like Jira.  
- Popular among teams using other Atlassian tools.  

### [GitLab](https://github.com/avengers-p11/Documentation/blob/main/VCS%20Design%20+%20POC/Features%20of%20VCS/Gitlab%20Features/README.md)
- Offers CI/CD pipelines natively and extensive DevOps features.  
- Provides an open-source self-hosted option.  


## Comparison Table

| Features                            | GitHub                               | GitLab                               | BitBucket                            |
|-------------------------------------|-------------------------------------|-------------------------------------|-------------------------------------|
| **Code repository**                 | ✅                                   | ✅                                   | ✅                                   |
| **Social features**                 | ✅                                   | ❓ Not as extensive as other platforms | ❌                                   |
| **DevOps**                           | ❓ Not as extensive as other platforms | ✅                                   | ❓ Not as extensive as other platforms |
| **PM tool features**                 | ✅                                   | ✅                                   | ✅                                   |
| **Bug/issue tracking**               | ✅                                   | ✅                                   | ✅                                   |
| **AI-powered assistant**             | ❌                                   | ❌                                   | ❓ Only for Atlassian products: Jira, Confluence, etc. |
| **Integrations**                     | ✅ Extensive                        | ✅                                   | ❓ Only for Atlassian products: Jira, Confluence, etc. |
| **Advanced security**                | ✅                                   | ✅                                   | ✅                                   |
| **Open-source project support (for free)** | ✅                                   | ✅                                   | ❌                                   |
| **Automation features via CI/CD workflows** | ✅                                   | ✅                                   | ✅                                   |




---

## Cost 
GitHub offers competitive pricing with a **free tier for public and private repositories**, making it accessible to individuals and small teams. For enterprises, the pricing aligns with its robust feature set, including GitHub Enterprise with advanced security, compliance, and performance tools.

| Plan                 | GitHub              | GitLab              | Bitbucket           |
|----------------------|---------------------|---------------------|---------------------|
| **Free Tier**         | Yes (unlimited repos)| Yes (limited features)| Yes (limited repos) |
| **Pro Plans**         | Starts at $4/user/mo| Starts at $5/user/mo| Starts at $3/user/mo|
| **Enterprise**        | Advanced features   | Advanced features   | Limited enterprise options|

---

## Conclusion

GitHub stands out from Bitbucket and GitLab with its unmatched developer community, seamless third-party integrations, and user-friendly interface. Unlike **Bitbucket, which focuses on Atlassian tools**, and **GitLab, which can be overwhelming for smaller teams**, **GitHub provides a balanced, intuitive platform suitable for all project sizes**. In our microservice project, we use GitHub because it offers a lot of features and is easy to understand. GitHub helps us manage individual microservices, and collaborate efficiently, making it the suitable tool for our project.

---

## Contacts

| Name| Email Address      | 
|-----|--------------------------|
| Dipanshu Rawat | dipanshu.rawat@mygurukulam.co |  

## References
|Links | Description|
|-------|-----------|
| https://blog.mergify.com/github-vs-gitlab-vs-bitbucket/ | referred link for documentation |
| https://marker.io/blog/github-vs-gitlab-vs-bitbucket | referred link for choosing GitHub |
