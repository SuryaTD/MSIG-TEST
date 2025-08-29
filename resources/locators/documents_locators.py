"""
This file contains the locators for the 'Documents' page of the application.
Locators are used by the Robot Framework tests to interact with elements on the web page.
"""
BrowseFileInDocuments= "xpath=//input[@type='file']"
UploadButton= "xpath=//button[normalize-space()='Upload']"
Claims = "xpath=//a[normalize-space()='Claims']"
DownloadDropdown = "xpath=//button[normalize-space()='Download']"
DownloadData = "xpath=//a[normalize-space()='Download Data']"
Policies = "xpath=//a[normalize-space()='Policies']"
Analysis = "xpath=//a[normalize-space()='Analysis']"
CardDatas1 = "xpath=//dt[text()='"
CardDatas2 = "']//following-sibling::dd"
AnalysisTableData = "xpath=//td//span"
DownloadSchema = "xpath=//ng-transclude[normalize-space()='Download Schema']"
ArchiveButton1 = "xpath=//div[text()='"
ArchiveButton2 = "']/..//button"

#Rajesh
Forcing_HITL_popup="//div[text()='Forcing HITL']"
Asset_Stop_Popup="//div[text()='Asset stopped!']"
reprocess_msg="//div[text()='The asset must be reprocessed after reclassifying.']"
Bug_Reprocess_Button_Doc_Tab="//button[normalize-space(text())='Reprocess']"
Bug_Reprocess_Msg_Doc_Tab="//div[normalize-space(text())='1 reclassified or merged Asset awaiting reprocessing']"
