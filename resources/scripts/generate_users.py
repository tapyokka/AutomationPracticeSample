import os
import random
from faker import Faker

fake = Faker(['en-US'])

new_users_file = "resources/files/new_users.csv"
new_address_file = "resources/files/new_address.csv"


def generate_user(count=3):
    register_details = []
    login_newaddress_details = []

    while count > 0:
        new_user = generate_personal_info()
        email = new_user[0]
        first_name = new_user[2]
        last_name = new_user[3]
        password = new_user[4]

        address_1 = generate_address(first_name, last_name)
        address_2 = generate_address(first_name, last_name)
        address_2 = [email, password, first_name, last_name] + address_2
        # print(address_2)

        register_details.append(";".join(new_user + address_1))
        login_newaddress_details.append(";".join(address_2))

        count -= 1

    return register_details, login_newaddress_details


def create_csv():
    new_user_header = "${email};${gender};${first_name};${last_name};${password};${dateofbirth};${" \
                      "address_firstname};${address_lastname};${address};${city};${state};${zipcode};${country};${" \
                      "mobile_phone};${address_alias}\n"
    login_newaddress_header = "${email};${password};${first_name};${last_name};${address_firstname};${" \
                              "address_lastname};${address};${city};${state};${zipcode};${country};${mobile_phone};${" \
                              "address_alias}\n"

    register_details, login_newaddress_details = generate_user()

    new_users = new_user_header + "\n".join(register_details)
    new_address = login_newaddress_header + "\n".join(login_newaddress_details)

    with open(new_users_file, "w") as file:
        file.write(new_users)

    with open(new_address_file, "w") as file:
        file.write(new_address)


def generate_personal_info():
    email_ext = "@mail.com"
    password_ext = "x12345"
    name = fake.name().split()

    gender = random.choice(["Male", 'Female'])
    first_name = name[0]
    last_name = name[1]
    email = f"{first_name}{last_name}{random.randrange(500)}{email_ext}"
    password = f"{name[0]}{password_ext}"
    dateofbirth = fake.date_of_birth().strftime("%Y-%m-%d")

    personal_info = [email, gender, first_name, last_name, password, dateofbirth]
    return personal_info


def generate_address(first_name, last_name):
    first_name = first_name
    last_name = last_name
    address = fake.street_address()
    city = fake.city()
    state = fake.state()
    zipcode = fake.zipcode()
    country = "United States"
    mobile_phone = fake.msisdn()
    alias = address[:10]

    address_details = [first_name, last_name, address, city, state, zipcode, country, mobile_phone, alias]
    return address_details


create_csv()
