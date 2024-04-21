*** Settings ***
Resource     ./Resources/keywords.robot
Library    String
Resource    ./Resources/variables.robot
*** Test Cases ***
registrer with valid informations
    Home Page    ${Home-Url}
    Register Page    ${Register-Url}
    Sleep    5s
    Insert Register Informations    ${firstname}     ${lastname}    ${email}   ${tel}    ${password}    ${password}  
*** Test Cases ***      
register with invalid firstname
    [Tags]    invalidFirstName
    ${randomemail} =    Generate Random String  12  [LETTERS]
    Home Page    ${Home-Url}
    Register Page    ${Register-Url}
    Sleep    5s
    Insert Register Informations    ${invalidFirstName}     ${lastname}    ${randomemail}@gmail.com   ${tel}    ${password}    ${password}
    # Click Button    //body/div[1]/div[5]/div[1]/div[1]/div[1]/form[1]/div[1]/div[1]/input[1]   
    Element Text Should Not Be    //body/div[1]/div[5]/div[1]/div[1]/div[1]/h1[1]    Your Account Has Been Created!
