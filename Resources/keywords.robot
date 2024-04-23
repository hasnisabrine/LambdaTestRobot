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
Login 
    [Arguments]    ${LoginUrl}    ${email}    ${passwrd}

    Click Element    //header/div[@id='main-navigation']/div[@id='entry_217831']/div[1]/div[3]/nav[1]/div[1]/ul[1]/li[6]/a[1]
    Click Element    //body/div[1]/div[5]/div[1]/div[1]/aside[1]/div[1]/a[1]
    Location Should Be    ${LoginUrl}
    Title Should Be    Account Login
    Input Text    //input[@id='input-email']    ${email}
    Input Password    //input[@id='input-password']    ${passwrd}
    Click Button    //body/div[1]/div[5]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/form[1]/input[1]
    Location Should Be    https://ecommerce-playground.lambdatest.io/index.php?route=account/account    
    
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

Add Product To Cart
    [Arguments]    ${prod}    ${tel}    ${fname}    ${lname}    ${cmpany}    ${addr1}    ${addr2}    ${cty}    ${postc}
    Input Text    //header/div[@id='main-header']/div[@id='entry_217820']/div[@id='entry_217822']/div[1]/form[1]/div[1]/div[1]/div[1]/div[2]/input[1]    ${prod}  
    Click Button    //button[contains(text(),'Search')] 
    Click Element    //body/div[1]/div[6]/div[1]/div[2]/div[1]/div[1]/div[5]/div[1]/div[1]/div[1]/div[1]/div[1]/a[1]/div[1]/div[1]/img[1]
    Click Button    //button[contains(text(),'Buy now')]
    # Location Should Be    https://ecommerce-playground.lambdatest.io/index.php?route=checkout/checkout
    Click Element    //body/div[1]/div[5]/div[1]/div[1]/div[1]/form[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/label[1]
    # Wait Until Page Contains    //input[@id='input-telephone'] 
    # Input Text    //input[@id='input-telephone']    ${tel}
    Input Text    //input[@id='input-payment-firstname']    ${fname}
    Input Text    //input[@id='input-payment-lastname']    ${lname}
    Input Text    //input[@id='input-payment-company']    ${cmpany}
    Input Text    //input[@id='input-payment-address-1']    ${addr1}
    Input Text    //input[@id='input-payment-address-2']    ${addr2}
    Input Text    //input[@id='input-payment-city']    ${cty}
    Input Text    //input[@id='input-payment-postcode']    ${postc}
    Select From List By Label    //select[@id='input-payment-country']    Tunisia
    Select From List By Label    //select[@id='input-payment-zone']    Tunis
    Click Element    //body/div[1]/div[5]/div[1]/div[1]/div[1]/form[1]/div[1]/div[2]/div[1]/div[5]/label[1]
    # Click Button    //body/div[1]/div[5]/div[1]/div[1]/div[1]/form[1]/div[1]/div[2]/div[1]/div[5]/label[1]
    Location Should Be    https://ecommerce-playground.lambdatest.io/index.php?route=extension/maza/checkout/confirm
    Click Button    //button[@id='button-confirm']
    Location Should Be    https://ecommerce-playground.lambdatest.io/index.php?route=checkout/success
    Element Text Should Be    //body/div[1]/div[5]/div[1]/div[1]/div[1]/h1[1]    Your order has been placed!

