*** Settings ***
Resource   ../../utils/common_keywords.robot
Variables  ../locators/submissions.py
Variables  ../locators/all_submissions.py
Variables    ../locators/summary_locators.py

*** Keywords ***
Verify All Side menu options are Displayed 
   [Documentation]    verify that All tabs Are Displayed 
   ${Allfields}    Get Elements    ${Loc_AllField}
   ${lenth}    Get Length   ${Allfields}
   Log To Console    the lenth is : ${lenth}
   ${summary_list}    Create List  
   FOR    ${counter}    IN    @{Allfields} 
       ${fieldname}=    Get Text    ${counter}
       Append To List    ${summary_list}     ${fieldname}
       Log To Console    The Field is : ${summary_list} 
   END
   Run Keyword And Continue On Failure    Lists Should Be Equal    ${summary_list}    ${TC_Summary_001['excepted_Field']}
Verify Header Displayed 
     [Documentation]    verify that All Header Are Displayed 
    ...
    ...    *Arguments:*
    ...       The Expected Stage ${expected_Stage}
    ...       The Expected Tab  ${Expected_Tab}
    [Arguments]   ${expected_Stage}    ${Expected_Tab}
   ${headers}    Get Elements    ${Headers_Loc}
   ${lenth}    Get Length   ${Headers_Loc}
   Log To Console    the lenth is : ${lenth}
   FOR    ${counter}    IN    @{headers} 
       ${headerName}=    Get Text    ${counter}
       Append To List    ${TC_Summary_001['acutual_Header_List']}     ${headerName}
       Log    The field is : ${TC_Summary_001['acutual_Header_List']}
       Log To Console    The Field is : ${TC_Summary_001['acutual_Header_List']}
   END
    ${Header_Text}    Get Text    ${Loc_Header_Status}
    ${Header_Text1}    Get Text    ${page_header_Loc}
    Append To List    ${TC_Summary_001['acutual_Header_List']}    ${Header_Text}   
    Append To List    ${TC_Summary_001['acutual_Header_List']}    ${Header_Text1}     
    Append To List    ${TC_Summary_001['excepted_Headers']}    ${expected_Stage}   
    Append To List    ${TC_Summary_001['excepted_Headers']}    ${Expected_Tab}     
    Lists Should Be Equal    ${TC_Summary_001['excepted_Headers']}    ${TC_Summary_001['acutual_Header_List']}       

Switch to Summary
    [Documentation]  Switch to Summary        
    Wait For Elements State    ${SummaryTab_loc}    visible    5s
    Click    ${SummaryTab_loc}

verify Summary Sub Header Displayed
     [Documentation]  check the Sub Header Displayed
     ...    *argument*
     ...    ${Expected_Header}  the Expected Sub Header "WIN-CON ENTERPRISES, INC"
     [Arguments]     ${Expected_Header}   
     ${Actual_Sum_Header}    Get Text    ${Sum_Header_loc}
    Should Be Equal    ${TC_Summary_001['expected_Sum_Header']}    ${Actual_Sum_Header}   

verify Address is Displayed 
    [Documentation]    verify the Address is Displayed 
    ...    *Argument*
    ...    ${expected_Header}    give the Expected Address
    [Arguments]    ${expected_Header}
     ${sum_Adress_element}    Get Elements    ${Sum_Address_loc}
    FOR    ${element}    IN    @{sum_Adress_element}
        ${lines}    Get Text    ${element}
        Append To List    ${TC_Summary_001['Actual_Adress']}    ${lines}
    END
    ${final_Adress}    Catenate    SEPARATOR=,    @{TC_Summary_001['Actual_Adress']}
    Log    ${final_Adress}
    Should Be Equal    ${final_Adress}     ${expected_Header}

Enter the Policy Information
    [Documentation]    This is used to enter the Policy Information 
    ...    ${policy_Info}     here We need to pass the policy Information which we need to Enter
    [Arguments]    ${policy_Info}  
 
    Click    ${permium_Btn_Loc}
    Wait For Elements State    ${premium_field_loc}    visible    5s
    Fill Text    ${premium_field_loc}    ${policy_Info['premium']}
    Wait For Elements State    ${premium_field_loc}    visible    5s
    Click    ${Attachement_point_btn_loc}
    Wait For Elements State    ${Attachement_point_field_loc}    visible    5s
    Fill Text    ${Attachement_point_field_loc}    ${policy_Info['AttachmentPoint']}
    Click    ${policy_Btn_Loc}
    Wait For Elements State    ${policy_field_Loc}    visible    5s
    Fill Text    ${policy_field_Loc}    ${policy_Info['PolicyNumber']}
    click    ${loc_ClassOf_Business}
    ${element}    Catenate    SEPARATOR=    ${loc1_Select_Type}    ${policy_Info['ClassOfBusiness']}    ']    
    click    ${element} 
     click    ${Loc_Placement_Button}
    ${place_element}    Catenate    SEPARATOR=    ${loc1_Select_Type}    ${policy_Info['PlacementType']}    ']    
    click    ${place_element}

Verify Policy Information Details from Summary Tab
    [Documentation]    the Given Policy Informaton Should be listed
    ...    ${expected_Policy_Field}    here We need to Pass the Expected policy Information Along with We need to pass the Key field in Summary tab     

    [Arguments]    ${expected_Policy_Field}    ${Expected_Forms_PolicyInormation}        
 
    ${Actual_Policy_Text}    Get Text    ${policy_btn_Loc}
    Run keyword and continue on Failure    Should Be Equal    ${Actual_Policy_Text}    ${Expected_Forms_PolicyInormation['TC_Forms_002']['DocumentationData']['PolicyNumber']}
   ${Actual_Premium_Text}    Get Text    ${permium_Btn_Loc}
     Run keyword and continue on Failure    Should Be Equal    ${Actual_Premium_Text}    ${Expected_Forms_PolicyInormation['TC_Forms_002']['DocumentationData']['PolicyPremium']}
   ${Actual_Attachment_Text}    Get Text    ${Attachement_point_btn_loc}
    Run keyword and continue on Failure    Should Be Equal    ${Actual_Attachment_Text}    ${expected_Policy_Field['AttachmentPoint']}
    ${Actual_ClassOf_Business}    Get Text    ${loc_ClassOf_Business}
      Run keyword and continue on Failure    Should Be Equal    ${Actual_ClassOf_Business}    ${expected_Policy_Field['ClassOfBusiness']}
   ${Actual_Placement_Text}    Get Text    ${Loc_Placement_Button}
    Run keyword and continue on Failure    Should Be Equal    ${Actual_Placement_Text}    ${expected_Policy_Field['PlacementType']}
     ${Actual_Policy_Field}    Create List
    ${Actual_Policy_Field_Text}    Get Text    ${policy_Field}
   ${Actual_Premium_Field}    Get Text    ${permium_Field}
   ${Actual_Business_Field}    Get Text    ${loc_ClassOf_Business_Field}
  ${Actual_Attachement_Field}    Get Text    ${Attachement_point_Field}
    ${Actual_Mailed_Field}    Get Text    ${loc_Mailed_Date_Field}
   ${Actual_Placement_Field}    Get Text    ${Loc_Placement_Field}
  Append To List    ${Actual_Policy_Field}    ${Actual_Premium_Field}
  Append To List    ${Actual_Policy_Field}    ${Actual_Attachement_Field}
  Append To List    ${Actual_Policy_Field}    ${Actual_Policy_Field_Text}
  Append To List    ${Actual_Policy_Field}    ${Actual_Business_Field}
  Append To List    ${Actual_Policy_Field}    ${Actual_Placement_Field}
  Append To List    ${Actual_Policy_Field}    ${Actual_Mailed_Field}

  Run keyword and continue on Failure    Lists Should Be Equal    ${Actual_Policy_Field}    ${expected_Policy_Field['PolicyFields']}

Verify Policy PDF is Generated and Available in Documents Tab
    [Documentation]    Verifies that the Policy PDF is generated and listed in the Documents tab.
    ...    ${expectedText1}     we need to pass the policy Information use in Summary Tab in Previous Stage  
    [Arguments]     ${expectedText1}
    ${Expected_Policy_text}    Create List
    Append To List    ${Expected_Policy_text}    ${expectedText1['premium']}
    Append To List    ${Expected_Policy_text}    ${expectedText1['AttachmentPoint']}  
    Append To List    ${Expected_Policy_text}    ${expectedText1['PolicyNumber']}  
    Append To List    ${Expected_Policy_text}    ${expectedText1['ClassOfBusiness']}  
    Append To List    ${Expected_Policy_text}    ${expectedText1['PlacementType']}  
    @{actual_Policy_text}    Create List
    Switch To Documents
    ${elements}=    Get Elements    ${PolicyDataModification}
    ${last_Element}=    Set Variable    ${elements}[-1]
    Scroll To Element    ${last_Element}
    Wait For Elements State    ${last_Element}    visible    timeout=30s
    Click    ${last_Element}
    # ${Length}    Get Length    ${TC_Summary_001['Doc_Loc']}
    FOR    ${element}    IN    @{TC_Summary_001['Doc_Loc']}
     ${ele_Loc}    Catenate    SEPARATOR=    ${policy_locators1}    ${element}    ${policy_locators2}
     Sleep    1s
     Click     ${poloicy_Data_modification_page}
    Press Keys    xpath=//*[@class='ace_content']        Control+f
    Type Text    ${Search_Bar_CtrlF}    ${element}
        ${result}    Get Text    ${ele_Loc}
         IF    '"' in '''${result}'''  
         ${cleaned}=    Evaluate    ${result}.replace('"', '')    modules=builtins
            Append To List    ${actual_Policy_text}    ${cleaned}
        ELSE
             Append To List    ${actual_Policy_text}    ${result}
        END    
    END
    Log    ${actual_Policy_text}
    Run keyword and continue on Failure    Lists Should Be Equal    ${actual_Policy_text}    ${Expected_Policy_text}


Verify Child Submission Should be Displayed in Summary Tab
    [Documentation]    this method is used to verify the Child Submission detials in Summary tab
    ...    ${Expected_Product_type}     This We need to Pass the Child Submission Product Type 
    [Arguments]    ${Expected_Product_type}    
   ${Product_type}    Get Text    ${Expected_Product_Type_Loc}
    Should Be Equal    ${Product_type}    ${Expected_Product_type}
   ${Status_type}    Get Text    ${Expected_Status_Type_Loc}
    Should Be Equal    ${Status_type}   ${TC_Summary_001['Child_Sub_Stage']}
   ${EffectiveDate_type}    Get Text    ${Expected_Eff_date_loc}
    Should Be Equal    ${EffectiveDate_type}    ${TC_E2E_001['EffectiveDate']}
   ${exp_type}    Get Text    ${Expected_Exp_date_loc}  
   Should Be Equal    ${exp_type}    ${TC_E2E_001['ExpirationDate']}
 
verify Account History are editable
    [Documentation]    this Method is used to The Account History  Editable or not
    ...  ${Submission_Id}    this We need to pass the Parent Submission Id 
    ...  ${Stage_Type}    this we need to pass the Which Stage we Are Currently    
    [Arguments]    ${Submission_Id}    ${Stage_Type}
    ${Product_type}    Get Text    ${Expected_Product_Type_Loc}
    ${Status_type}    Get Text    ${Expected_Status_Type_Loc}
    Click    ${Expected_Product_Type_Loc}
    ${element}    Catenate    SEPARATOR=    ${Expected_Product_Type_Loc}    //span    
    ${Product_type1}    Get Text    ${element}
    Should Contain    ${Product_type1}    Current
    verify Header Displayed    ${Status_type}    Summary
    Wait For Elements State    ${Convr_Home_Btn}    visible    5s
    click    ${Convr_Home_Btn}
    Select Submission using submission id    ${Submission_Id}    @{TC_E2E_001['SubmissionColumnNames']}
  #  verify Header Displayed    ${Stage_Type}    Summary

Verify the workflow panel
    [Documentation]    This method is used verify the Workflow_Lists
    [Arguments]     ${Expected_Workflow_Lists} 
    ${Actual_Workflow_Lists}    Create List   
    Click Answers Tab
    ${WorkFlow_Side_Panel}    Get Elements     ${Workflow_Lists}
    FOR    ${element}    IN    @{WorkFlow_Side_Panel}
    ${WorkFlow_text}    Get Text    ${element}
    Append To List    ${Actual_Workflow_Lists}    ${WorkFlow_text}    
    END  
    Lists Should Be Equal    ${Actual_Workflow_Lists}    ${Expected_Workflow_Lists}

verify the WorkFlow in Summary Tab 
    [Documentation]    This method is used verify the Workflow_Lists is present in Summary Tab
    [Arguments]    ${Expected_Workflow_Lists}
    ${Actual_Workflow_Lists}    Create List
    Switch to Summary
    Click    ${Loc_Header_Status}
    ${WorkFlow_SummaryTab}    Get Elements     ${Summary_Workflow_Lists}
    FOR    ${element1}    IN    @{WorkFlow_SummaryTab}
        ${WorkFlow_text1}    Get Text    ${element1}
        Append To List    ${Actual_Workflow_Lists}    ${WorkFlow_text1}
    END
    Lists Should Be Equal    ${Actual_Workflow_Lists}    ${Expected_Workflow_Lists}

Verify the Workflow Reflected in Summary tab
    [Documentation]    This method is used verify the Workflow_Lists
    ...    ${Stage_Type} Here we need to Pass the Advance Stage (eg:if Draft Stage means we need to pass cleared Stage )   

    [Arguments]    ${Stage_Type} 
     ${Actual_Workflow_Lists}    Create List   
    ${Expected_Workflow_Lists}    Create List
    ${text}    Catenate    Advance to    ${Stage_Type}    
     Append To List    ${Actual_Workflow_Lists}    ${text}    
    Click Answers Tab
    ${WorkFlow_Side_Panel}    Get Elements     ${Workflow_Lists}
    FOR    ${element}    IN    @{WorkFlow_Side_Panel}
    ${WorkFlow_text_Panel}    Get Text    ${element}
    ${WorkFlow_text_Panel1}    Strip String    ${WorkFlow_text_Panel}
    Append To List    ${Actual_Workflow_Lists}    ${WorkFlow_text_Panel1}           
    END  
    Switch to Summary
    Click    ${Loc_Header_Status}
    ${WorkFlow_SummaryTab}    Get Elements     ${Summary_Workflow_Lists}
    FOR    ${element1}    IN    @{WorkFlow_SummaryTab}
        ${WorkFlow_text2}    Get Text    ${element1}
        ${WorkFlow_text1}    Strip String    ${WorkFlow_text2}
        Append To List    ${Expected_Workflow_Lists}    ${WorkFlow_text1}
        
    END
    FOR    ${value}    IN    @{Expected_Workflow_Lists}
        Run Keyword And Continue On Failure     Should Contain    ${Actual_Workflow_Lists}    ${value}
    END
    Press Keys    ${Loc_Header_Status}    Escape

verify the entered Policy Information
    [Documentation]    verify that given Text Are enter Correctly on premium And Attachment point And policy  field
    ...    *argument*
    ...    ${expected_Policy_Field}
    [Arguments]    ${expected_Policy_Field}      
     ${Actual_Policy_Text}    Get Text    ${policy_btn_Loc}
    Should Be Equal    ${Actual_Policy_Text}    ${expected_Policy_Field['PolicyNumber']}
   ${Actual_Premium_Text}    Get Text    ${permium_Btn_Loc}
     Should Be Equal    ${Actual_Premium_Text}    ${expected_Policy_Field['premium']}
   ${Actual_Attachment_Text}    Get Text    ${Attachement_point_btn_loc}
    Should Be Equal    ${Actual_Attachment_Text}    ${expected_Policy_Field['AttachmentPoint']}
    ${Actual_ClassOf_Business}    Get Text    ${loc_ClassOf_Business}
      Should Be Equal    ${Actual_ClassOf_Business}    ${expected_Policy_Field['ClassOfBusiness']}
   ${Actual_Placement_Text}    Get Text    ${Loc_Placement_Button}
    Should Be Equal    ${Actual_Placement_Text}    ${expected_Policy_Field['PlacementType']}



Advance Stage Popup Verification
    [Documentation]    This method will verifies, while clicking the Advance stage in dropdown, it will Appears the popup message.it must show the next Stage.
    [Arguments]    ${data}
    Switch to Summary
    Wait For Elements State    ${Summary_Stage_Dropdown}
    ${ActualStage}    Get Text    ${Summary_Stage_Dropdown}
    Should Be Equal    ${data['stage']}    ${ActualStage}
    Click    ${Summary_Stage_Dropdown}

    Wait For Elements State    ${Summary_Adv_Stage}
    Click    ${Summary_Adv_Stage}

    Wait For Elements State    ${Adv_Stage_popup}
    ${ActualPopup}    Get Text    ${Adv_Stage_popup}
    Log    ${ActualPopup}
    Should Be Equal    ${data['Excepted_Advance_Popup']}    ${ActualPopup}


Summary Premium Field Verification
    [Documentation]    This method verifies the Alphanumeric/Special characters should not accept in premium field
    [Arguments]    ${data}

    Switch to Summary
    Click    ${permium_Btn_Loc}
    Wait For Elements State    ${premium_field_loc}    visible    5s
    Fill Text    ${premium_field_loc}    ${data['premium'][0]}
    Click Answers Tab
    Switch to Summary
    #Wait For Elements State    ${premium_field_loc}    visible    5s
    ${ActualValue}    Get Text    ${permium_Btn_Loc}
    Should Be Equal    ${ActualValue}    0

    Click    ${permium_Btn_Loc}
    Wait For Elements State    ${premium_field_loc}    visible    5s
    Fill Text    ${premium_field_loc}    ${data['premium'][1]}
    Click Answers Tab
    Switch to Summary
    #Wait For Elements State    ${premium_field_loc}    visible    5s
    ${ActualValue1}    Get Text    ${permium_Btn_Loc}
    Should Be Equal    ${ActualValue1}    ${data['premium'][1]}

Verify that Referral is not displayed in the Summary tab
    [Documentation]    this method verifies that refferal is not there in summary page
    [Arguments]    ${data}
     ${Expected_Workflow_Lists}    Create List
     Switch to Summary
    Click    ${Loc_Header_Status}
    ${WorkFlow_SummaryTab}    Get Elements     ${Summary_Workflow_Lists}
    FOR    ${element1}    IN    @{WorkFlow_SummaryTab}
        ${WorkFlow_text2}    Get Text    ${element1}
        ${WorkFlow_text1}    Strip String    ${WorkFlow_text2}
        Append To List    ${Expected_Workflow_Lists}    ${WorkFlow_text1}
        
    END
    FOR    ${value}    IN    @{Expected_Workflow_Lists}
        Should Not Match    ${data['Ref_Header']}    ${value}
    END
     Press Keys    ${Loc_Header_Status}    Escape

Verify that the Referral button is not displayed in the Draft stage

    [Documentation]    This method verifies that the Referral button is not displayed in the Draft stage.
    [Arguments]    ${data}
    Click Answers Tab
    ${Actual_Workflow_Lists}    Create List

    ${WorkFlow_Side_Panel}    Get Elements     ${Workflow_Lists}
    FOR    ${element}    IN    @{WorkFlow_Side_Panel}
    ${WorkFlow_text_Panel}    Get Text    ${element}
    ${WorkFlow_text_Panel1}    Strip String    ${WorkFlow_text_Panel}
    Append To List    ${Actual_Workflow_Lists}    ${WorkFlow_text_Panel1}           
    END  

    FOR    ${element}    IN    @{Actual_Workflow_Lists}
    Should Not Match    ${data['Ref_Header']}    ${element}
        Log    ${element} 
    END


    