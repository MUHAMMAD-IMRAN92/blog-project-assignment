# All code is in master branch

Steps to follow:
1. clone the project
2. checkout into master branch
3. update .env file (you can use the sql file attached with the project)
4. use composer install
5. php artisan serve

#Attached a sql file for databaase

User Authentication:

Users can register, login, and logout.
Only authenticated users can create, update, or delete posts.
Guest users can view posts and comments but cannot interact with them.
Posts:

Authenticated users can create, edit, and delete posts.
Each post includes a title, content, and timestamp.
The posts listing page uses pagination (5 posts per page).
Comments:

Each post can have comments.
Users (guests or authenticated) can view comments.
Authenticated users can add comments or reply to existing comments.
Supports nested comments, meaning users can reply to replies, creating a threaded discussion.
Replies to Comments:

Users can reply to any comment.
Nested replies are supported to any depth.
Unique collapse behavior for each reply form to avoid multiple forms opening at once.

For API.
we created login and register with sanctum token.
created a basecontroller with success and error function


# you can use registeration method for creating user. But if you use my DB there is one user in Database
emial : admin@gmail.com
password : 12345678
