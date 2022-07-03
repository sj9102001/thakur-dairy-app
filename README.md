


# Dairy App

Made an user management app that is used to manage user data, providing Add user(to add new user), Edit user(to edit existing users) and View user details(to search and display user by their name), made on flutter SDK and Based on AWS Serverless backend.

## STACK

 - **Front-end** - Flutter-SDK is used for front-end.
  
 - **Back-end** - All data is modeled and stored in Amazon DynamoDB, and is based on AWS. python being the core language for all services.

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

![screenshots](https://user-images.githubusercontent.com/80746702/177049542-c31e4e6a-78ef-4cf2-9bed-233b011b710d.png)
