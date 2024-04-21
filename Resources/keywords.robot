*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Home Page    
    [Arguments]     ${HomeUrl}
    Open Browser     ${HomeUrl}     firefox
    Title Should Be    Your Store
    Maximize Browser Window 
Register Page
     [Arguments]    ${RegisterUrl}   
     Click Element    //header/div[@id='main-navigation']/div[@id='entry_217831']/div[1]/div[3]/nav[1]/div[1]/ul[1]/li[6]/a[1]
     Click Element     //body/div[1]/div[5]/div[1]/div[1]/aside[1]/div[1]/a[2]
     Title Should Be    Register Account
     Location Should Be    ${RegisterUrl}
Forgoten Password Page
    [Arguments]    ${ForgotPasswordUrl}   
    Click Element    //header/div[@id='main-navigation']/div[@id='entry_217831']/div[1]/div[3]/nav[1]/div[1]/ul[1]/li[6]/a[1]
    Click Element    //body/div[1]/div[5]/div[1]/div[1]/aside[1]/div[1]/a[3]
    Title Should Be    Forgot Your Password?
    Location Should Be   ${ForgotPasswordUrl}  
    
Insert Register Informations
    [Arguments]    ${fname}    ${lname}    ${mail}    ${telph}    ${pword}    ${confirmpword}
    Input Text    //input[@id='input-firstname']    ${fname}
    Input Text    //input[@id='input-lastname']   ${lname} 
    Input Text    //input[@id='input-email']    ${mail}
    Input Text    //input[@id='input-telephone']    ${telph}
    Input Password    //input[@id='input-password']   ${pword}  
    Input Password    //input[@id='input-confirm']      ${confirmpword}  
    Click Element    //body/div[1]/div[5]/div[1]/div[1]/div[1]/form[1]/div[1]/div[1]/div[1]/label[1]
    # Click Button    //body/div[1]/div[5]/div[1]/div[1]/div[1]/form[1]/div[1]/div[1]/input[1]   
Forgoten Password Input
    [Arguments]    ${mail}
    Input Text    //input[@id='input-email']    ${mail}
    Click Element    //button[contains(text(),'Continue')]

    