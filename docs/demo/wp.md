IBM Cloud Security and Compliance Center Workload Protection (WP) offers functionality to protect cloud native workloads, get deep cloud and container visibility, posture management (compliance, benchmarks, CIEM), vulnerability scanning, forensics, and threat detection and blocking. 

**SCC Workload Protection (Hybrid Multicloud for CSPM, CWPP, CIEM)**
Cloud Security Posture Management (CSPM)
Workload Protection (CWPP)
- Vulnerability Management
- Threat Detection
Identity Entitlement Management (CIEM)
Automation & Integration
 - With IaC (infrastructure as a code)


CSPM tools empower companies to identify and remediate risks through security assessments and automated compliance monitoring.

CWPP - Cloud workload protection platform - is a unified cloud security solution that offers continuous threat monitoring and detection for cloud workloads across different types of modern cloud environments. A CWPP has automatic security features to protect activity across online and physical locations, including servers and virtual machines.

This demonstration flow focuses on the integration between SCC and WP and provides a brief overview of the WP dashboard.

- start in SCC
- go to the attachment for IKS
- show results and dashboard and higlight the deafult workspace issue (5.7.4)

- these kubernetes scan results are flowing into the SCC dashboard from WP. Here we see that in our SCC instance, we have integrated with an instance of WP.

-show integrations
- open WP dashboard

WP provides multi-cloud support for IBM Cloud, AWS, Google Cloud, Microsoft Azure, and can also be used for on-premises kubernetes instances.



For our purposes, in this demonstration environment WP has only been enabled to protect a single IBM Cloud Kubernetes Service (IKS) instance.

- show and talk about scanning.. talk about integration with CI/CD pipelines for image scanning



Cloud Infrastructure Entitlements Management (CIEM) is the security process of managing access rights, permissions, or privileges for the identities of a single or multi-cloud environment. This process helps to identify and avoid risks resulting from privileges being higher or broader than they should.



In WP...
Posture->Sysdig IBM Cloud Kubernetes Service (IKS Benchmark)->
Select Requirements -> 5.7.4

Watch a video of the above scenario:

![type:video](./_videos/wp.mp4)