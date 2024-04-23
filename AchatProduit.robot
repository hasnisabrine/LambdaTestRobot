*** Settings ***
Resource     ./Resources/keywords.robot
Resource    ./Resources/variables.robot
*** Test Cases ***
By Product
    Home Page    ${Home-Url}
    Login    ${login-Url}    ${email}    ${password}
    Add Product To Cart    ${product}  ${tel}    ${firstname}    ${lastname}    ${company}    ${address1}    ${address2}    ${city}    ${postcode}





