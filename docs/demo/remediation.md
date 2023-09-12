The remediation flow builds upon the setup performed earlier in the **Configure remediation scenario** chapter of the **Demonstration Environment** section of the demonstration guide. This flow tells the story of remediating a compliance failure and viewing the results in SCC.

This demonstration flow provides an high-level overview of IBM Cloud Security and Compliance Center (SCC). It introduces the key concepts of controls, profiles, and attachments and illustrates how to use the SCC Dashboard and review SCC scan results. 

??? Warning "Before proceeding to this step, make sure at least one (1) full hour has passed since you initially created your custom attachment."

    It is important to understand that SCC cache's scan results for one hour. This means if you run the same scan within an hour of the last time the scan was run, a new scan is NOT performed and the old results are returned. This is important to remember when performing a client demonstration or if you are recording your Stand and Deliver.


1. Open a web browser to the **IBM Cloud Portal**.

<a href="https://cloud.ibm.com" target="_blank">IBM Cloud Portal</a>.

When the page loads, authenticate with your IBM Cloud ID and password. The authentication process varies depending on the primary account that your ID is associated with and any multi-factor authentication or other security controls in place for the account.

2. Click the **account selection** drop-down menu and select the **{{itz.CloudAccount}}** account.

![](../env/_attachments/switchAccount.png)

Note, if the browser window is narrow, you might see an **account selection** icon like this: ![](../env/_attachments/switchAccountIcon.png) instead of the full account name.

3. Click the **Security and Compliance** icon (![](_attachments/sccIcon.png)) in the menu bar.
   
![](_attachments/dashBoard.png)

4. Click **Attachments** in left-hand menu.

![](_attachments/sccOverviewPage3-attachments.png)

5. Click the ellipses icon (![](../env/_attachments/ellipses.png)) of the **Attachment** you created earlier and then click **View scan results**. In this example, **andrew-14294-ipspoofing-compliance**.

![](_attachments/scc-attachmentsPage.png)

6. Click the link for the last scan run.

![](_attachments/scc-attachmentsRemediationAttachment.png)

Describe to the audience the simplified attachment that you created earlier that has a single control that is being evaluated and that the control has failed. 

7. Click the **Controls** tab.

![](_attachments/scc-attachmentsRemediationResultsControls.png)

Describe how this custom profile was created using a single control from one of the pre-defined profiles. In this case, the control is the check to see if IP spoofing is enabled for any VSIs in VPCs.

8. Click the **Resources** tab and then the down arrow icon (![](_attachments/downArrow.png)) next to the VSI you created earlier.

![](_attachments/scc-attachmentsRemediationResultsResources.png)

Describe how the table shows the VSIs that are not in compliance and now it is time to remediate the issue, for at least one of the VSIs.

Note: your view of resources that have failed will vary based upon others using the environment.

9. Click the hamburger menu icon (![](_attachments/hamburgerIcon.png)) and then click the VPC icon.

![](_attachments/vpcMenu.png)

10. Click **Virtual server instances** under the **Compute** heading in left-hand menu.

![](_attachments/vpcMenu2.png)

11. Click the name of the VSI you created earlier. In this example, **andrew-14294-scc-vsi**.

![](_attachments/vpcVSItable.png)

12. Scroll down to the **Network interfaces** section.

![](_attachments/vpcVSInetworkInterfaces.png)

Note: your view of VSI resources will vary based upon others using the environment.

Show the audience that the current networking setting for this VSI has IP spoofing enabled and that to fix the compliance issue, it needs to be disabled.

13. Click the pencil icon (![](../env/_attachments/pencilIcon.png)) to edit the network interface settings.

![](_attachments/vpcVSInetworkInterfacesPencil.png)

14. Click the **Allow IP spoofing** toggle to change the setting from Enabled to **Disabled** and click **Save**.

![](_attachments/vpcVSInetworkInterfacesEdit.png)

The issue has now been remediate, so it is time to re-run the scan.

15. Click the hamburger menu icon (![](_attachments/hamburgerIcon.png)) and then click the Security and Compliance option.

![](_attachments/sccMenu.png)

16. Click **Attachments** in left-hand menu.

![](_attachments/sccOverviewPage3-attachments.png)

17. Click the ellipses icon (![](../env/_attachments/ellipses.png)) of the **Attachment** you created earlier and then click **Run scan**. In this example, **andrew-14294-ipspoofing-compliance**.

![](_attachments/sccRerunScan.png)

18. Click **Run scan** in the **Scan now** popup window.

![](_attachments/sccRerunScanPopup)

The **Scan in progress** message will appear for the attachment. After a minute or two, click the browser refresh button.

![](_attachments/sccRerunScanRunning)

While waiting for the scan to complete, fill the time to answer any questions, or if you enabled Event Notifications, describe that integration.

If you enabled Event Notifications with your mobile device number, you should receive an SMS message stating something similar to: "Scan complete - at least 1% of controls were non-compliant. 

Once the scan is complete, proceed.

19.  Click the ellipses icon (![](../env/_attachments/ellipses.png)) of the **Attachment** you created earlier and then click **View scan results**. In this example, **andrew-14294-ipspoofing-compliance**.

![](_attachments/sccViewRerunScanResults.png)

20. Click the top scan in the table.

![](_attachments/sccViewRerunScanResultsTable.png)

21. Discuss the new scan results.

![](_attachments/sccViewRerunScanResultsOverview.png)

Notice the difference in the **Success rate** graphic. The value should have increased from when this page was previously viewed. In this case, it went from 0% to 33% which represents the remediation performed on one of the three VSIs that were noncompliant in the IP spoofing control.

Notice, the **drift** did not changes as the drift chart is based upon the compliance of the control across all resources.

Watch a video of the above scenario:

![type:video](./_videos/remediation.mp4)