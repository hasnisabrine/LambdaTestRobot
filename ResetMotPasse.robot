*** Settings ***
Resource     ./Resources/keywords.robot
Library    String
Resource    ./Resources/variables.robot

*** Test Cases ***
Reset Password Successfully
    Home Page    ${Home-Url}
    Forgoten Password Page    ${ForgotPassword-url}
    Forgoten Password Input    ${email}
    Location Should Be    https://ecommerce-playground.lambdatest.io/index.php?route=account/login
    Element Text Should Be    //body/div[1]/div[5]/div[1]/div[1]    An email with a confirmation link has been sent your email address.
    Title Should Be       Account Login
*** Test Cases ***
Reset Password With Unregistred Email
    ${randomEmail} =    Generate Random String  12  [LETTERS]
    Home Page    ${Home-Url}
    Forgoten Password Page    ${ForgotPassword-url}
    Forgoten Password Input    ${randomEmail}@gmail.com
    Element Text Should Be    //body/div[1]/div[5]/div[1]/div[1]    Warning: The E-Mail Address was not found in our records, please try again!
    
    