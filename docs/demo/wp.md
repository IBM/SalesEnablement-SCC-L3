THIS SECTION NOT READY TO BE REVIEWED!!!
THIS SECTION NOT READY TO BE REVIEWED!!!
THIS SECTION NOT READY TO BE REVIEWED!!!


IBM Cloud Security and Compliance Center Workload Protection (WP) offers functionality to protect cloud native workloads, get deep cloud and container visibility, posture management (compliance, benchmarks, Cloud Infrastructure Entitlements Management (CIEM)), vulnerability scanning, forensics, and threat detection and blocking. 

This demonstration flow focuses on the integration between SCC and WP and provides a brief overview of the WP capabilities for protecting cloud native workloads.


- these kubernetes scan results are flowing into the SCC dashboard from WP. Here we see that in our SCC instance, we have integrated with an instance of WP. NEED A GOOD DESRIPTION OF THE RELATIONSHIP


WP provides multi-cloud support for IBM Cloud, AWS, Google Cloud, Microsoft Azure, and can also be used for on-premises kubernetes instances. However, in this guide, only resources in IBM Cloud are utilized.

In this scenario,

- view an existing attachment and results that utilizes WP to scan cloud native applications
- use the WP dashboard to learn more about WP's capabilities including NEED TO LIST WHAT WE ARE GOING TO DO HERE

### View an SCC attachment scan results focused on Kubernetes deployment

1. Open a web browser to the **IBM Cloud Portal**.

<a href="https://cloud.ibm.com" target="_blank">IBM Cloud Portal</a>.

When the page loads, authenticate with your IBM Cloud ID and password. The authentication process varies depending on the primary account that your ID is associated with and any multi-factor authentication or other security controls in place for the account.

2. Click the **account selection** drop-down menu and select the **{{itz.CloudAccount}}** account.

![](../env/_attachments/switchAccount.png)

Note, if the browser window is narrow, you might see an **account selection** icon like this: ![](../env/_attachments/switchAccountIcon.png) instead of the full account name.

3. Click the **Security and Compliance** icon (![](_attachments/sccIcon.png)) in the menu bar.
   
![](_attachments/dashBoard.png)

4. Click **Attachments** in the left menu.

![](_attachments/sccOverviewPageAttachments.png)

5. Click the **ellipses** (![](../env/_attachments/ellipses.png)) icon for the **{{iks.Attachment}}** attachment and then click **View scan results**.

![](_attachments/sccAttachmentsIKS.png)

This attachment performs a scan based upon the **IBM Cloud Kubernetes Service Benchmark** with these settings:

![](_attachments/sccAttachmentsIKSSettings.png)

6. Click the link for the first scan in the table.

![](_attachments/sccAttachmentsIKSResults.png)

7. Explore the scan results using what you learned earlier.

![](_attachments/sccAttachmentsIKSScanResults.png)

The results of this scan are similar to the results of the other scans you explored earlier. You can expand the results for the **helloworld** application and describe the controls and assessments performed against that resource. 

### View more details using the SCC WP dashboard

Now is a good time to transition to looking at the additional details and insights available in SCC WP.

8. Click the **Security and Compliance** link at the top of the page.

![](_attachments/sccAttachmentsIKSScanResultsBack.png)

9.  Click **Integrations** in the left menu.

![](_attachments/sccOverviewPageIntegrations.png)

10. Click the **Open dashboard** button.

![](_attachments/sccIntegrations.png)

The SCC WP dashboard will open in a new browser window or tab.

![](_attachments/wpGetStarted.png)

As you learned in the **{{level2learningplan.Name}}** seller enablement material, SCC WP is a re-branding of Sysdig (<a href="https://sysdig.com/" target="_blank">https://sysdig.com/</a>). This dashboard may look familiar to those who have use Sysdig in the past.

The setup of SCC WP is not covered in this scenario, but you can learn more about installing and configuring SCC WP <a href="https://cloud.ibm.com/docs/security-compliance?topic=security-compliance-setup-workload-protection" target="_blank">here</a>. 

11. Hover over **Scanning** in the left menu and then click on **Runtime**.

![](_attachments/wpGetStartedToScanning.png)

The **Runtime image scanning** pages shows all the kubernetes clusters that have been connected to the SCC WP instance and the images that are running in each cluster.

12. Click the expand icon (![](_attachments/expandIcon.png)) for the {{iks.ClusterName}} cluster.

![](_attachments/wpScanningExpandIKS.png)

We can narrow the view to individual clusters and individual namespaces in a cluster.

13. Click the **robot-shop** namespace of the **{{iks.ClusterName}}** cluster.

![](_attachments/wpScanningExpandIKSrobot-shop.png)

Notice there are images that have failed the image scan test.

![](_attachments/wpScanningExpandIKSrobot-shopOverview.png)

14. Click the **robotshop/rs-shipping**  image.

![](_attachments/wpScanningExpandIKSrobot-shopOverviewFirstFailed.png)

15. Click the expand icon (![](_attachments/leftExpandIcon.png)) next to **DefaultPolicy**.

![](_attachments/wpScanningExpandIKSrobot-shopFailedDefaultPolicy.png)

In this case the **Default Policy** is checking for specific vulnerabilities and dockerfile instructions.

16. Click **Operating System** under **Vulnerabilities**.

![](_attachments/wpScanningExpandIKSrobot-shopOSVulnerabilities.png)

We can view the vulnerabilities related to the **Operating System** (OS). Here we see all the vulnerabilities scanned and their Common Vulnerabilities and Exposures (CVE) ID.

17. Click the **High** and **Has fix** filters.

![](_attachments/wpScanningExpandIKSrobot-shopOSVulnerabilitiesFilters.png)

Filters can be used to narrow the view to vulnerabilities of certain severity and those that have fixes that are available.

18. Click the **CVE-2022-22822** (or any of the vulnerabilities in the view).

![](_attachments/wpScanningExpandIKSrobot-shopOSVulnerabilitiesFilteredFirst.png)

We can drill down into a specific vulnerability and view more details about the specific vulnerability like what OS package the exposure is in.

![](_attachments/wpScanningExpandIKSrobot-shopOSVulnerabilitiesDetails.png)

SCC WP will also scan for non-operating system vulnerabilities.

19. Click **Non-operating System** under **Vulnerabilities**.

![](_attachments/wpScanningExpandIKSrobot-shopNonOS.png)

These scans look at the various libraries that have been added to the base image like Python and Java. 

![](_attachments/wpScanningExpandIKSrobot-shopNonOSLog4J.png)

In this case we can see that this image still has the Log4j vulnerability. If you didn't know, the Log4j  library controls how applications log strings of code and information. The vulnerability enables an attacker to gain control over a string and trick the application into requesting and executing malicious code under the attacker's control.

20. Click **Java** under **Content**.

![](_attachments/wpScanningExpandIKSrobot-shopJavaInventory.png)

SCC WP also provides an inventory view of all the files associated with a package on the image.

21. Hover over **Scanning** and click **Image Results**.

![](_attachments/wpScanningImageResultsMenu.png)

Here we see a view of all the images scanned and our current security posture.


Watch a video of this scenario:

![type:video](./_videos/wp.mp4)