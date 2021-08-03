


# Dairy App

Made an user management web application that provides Add user, Edit user and View user details. Based on AWS Serverless.

## STACK

 - **Front-end** - Flutter-SDK is used for front-end.
  
 - **Data** - All data is modeled and stored in DynamoDB. python being the core language for all services.

## FRONT-END
 
 - **Services**
 
| SERVICES | FUNCTION | DESCRIPTION |
|--|--|--|
| ADD/EDIT USER | Add or Edit user details | Uses HTTP Post method to Add new user or Edit existing user |
|SEARCH USER | Search by name| Uses HTTP Get method to search for existing user by name|


 - **Screens**
 

|SCREENS|FUNCTION | DESCRIPTION|
|--|--|--|
| ADD USER| Enter a new user  |Form which takes user details .	 |
|VIEW USER| User search by name| Text field which takes name input and searches user using SEARCH USER Service
|EDIT USER| Edit user details | Form with pre-filled data, where changes can be made and data is edited using EDIT USER Service

