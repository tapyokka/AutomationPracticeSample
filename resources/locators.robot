*** Variables ***

# URLs
${URL_AUTHENTICATION_PAGE}    http://automationpractice.com/index.php?controller=authentication
${URL_MYACCOUNT}    http://automationpractice.com/index.php?controller=my-account
${URL_HOMEPAGE}    http://automationpractice.com/index.php
${URL_CREATEACCOUNT}    http://automationpractice.com/index.php?controller=authentication&back=my-account#account-creation
${URL_ADDRESSES}    http://automationpractice.com/index.php?controller=addresses


# Homepage, navigation bar locators
${LOCATOR_SIGNUP}    //*[@id="header"]/div[2]/div/div/nav/div[1]/a
${LOCATOR_SIGNOUT}    //*[@id="header"]/div[2]/div/div/nav/div[2]/a
${LOCATOR_LOGIN}    //*[@id="SubmitLogin"]/span
${CURRENT_USER}    //*[@id="header"]/div[2]/div/div/nav/div[1]/a

# Sign up page locators
${SIGNUP_FORM}    //*[@id="columns"]/div[3]
${LABEL_AUTHENTICATION}    //*[@id="columns"]/div[3]
${BUTTON_CREATE_ACCOUNT}    //*[@id="SubmitCreate"]
${BUTTON_REGISTER}    //*[@id="submitAccount"]
${LOGIN_EMAIL}    //*[@id="email"]
${LOGIN_PASSWORD}    //*[@id="passwd"]
${BUTTON_LOGIN}    //*[@id="SubmitLogin"]
${TEXT_EMAIL}     //*[@id="email_create"]
${TEXT_FIRSTNAME}    //*[@id="customer_firstname"]
${TEXT_LASTNAME}    //*[@id="customer_lastname"]
${TEXT_EMAIL2}    //*[@id="email"]
${TEXT_PASSWORD}    //*[@id="passwd"]
${TEXT_DOB_DAY}    //*[@id="days"]
${TEXT_DOB_MONTH}    //*[@id="months"]
${TEXT_DOB_YEAR}    //*[@id="years"]

# MyAccount locators
${BUTTON_MYADDRESSES}    //*[@id="center_column"]/div/div[1]/ul/li[3]/a/span

# MyAccount Address locators
${LIST_MYADDRESSES}    //*[@id="center_column"]
${ADD_ADDRESS}    //*[@id="center_column"]/div[2]/a
${ADDRESS_FORM}    //*[@id="add_address"]
${SAVE_ADDRESS}    //*[@id="submitAddress"]
${TEXT_ADDRESS_FIRSTNAME}    //*[@id="firstname"]
${TEXT_ADDRESS_LASTNAME}    //*[@id="lastname"]
${TEXT_ADDRESS}    //*[@id="address1"]
${TEXT_ADDRESS_CITY}    //*[@id="city"]
${TEXT_ADDRESS_STATE}    //*[@id="id_state"]
${TEXT_ADDRESS_ZIPCODE}    //*[@id="postcode"]
${TEXT_ADDRESS_COUNTRY}    //*[@id="id_country"]
${TEXT_MOBILEPHONE}    //*[@id="phone_mobile"]
${TEXT_ADDRESS_ALIAS}    //*[@id="alias"]
