#### 1. Analyze the structure of the /etc/passwd and /etc/group file, what fields are present in it, what users exist on the system? Specify several pseudo-users, how to define them?
/etc/passwd `username: pswd: uid: gid: uid comments: directory: shell`

| column       | description                                   |
|--------------|-----------------------------------------------|
| username     | username                                      |
| pswd         | password                                      |
| uid          | user ID                                       |
| gid          | group ID                                      |
| uid comments | comment, general info about user              |
| directory    | user's home directory                         |
| shell        | program name - the user's command interpreter |

/etc/group `group_name:password:group_id:list`
<br>There are regular users, root user and pseudo users in the system. Pseudo users: daemon, bin, adm. 
To get all pseudo-users 
`awk -F: '(($3>=1)&&($3<1000))||($3==65534)' /etc/passwd`
#### 2. What are the uid ranges? What is UID? How to define it?
  * 0 - root user
  * 65534 - nobody user
  * 1-999 - system users
  * 1000 - 65533 - regular users
#### 3. What is GID? How to define it?
Unique identifier of the group within the system to which the user belongs.
#### 4. How to determine belonging of user to the specific group?
`id` for current user or `id [user_uid or name]`
#### 5. What are the commands for adding a user to the system? What are the basic parameters required to create a user?
`sudo useradd [user_name]` 
#### 6. How do I change the name (account name) of an existing user?
`sudo usermod -l new_user_name user_name`
#### 7. What is skell_dir? What is its structure?
“skeleton” directory is used to initiate home directory when a user is first created if added `-m` parameter, contains files and directories which must be copied to the new user's home directory.
#### 8. How to remove a user from the system (including his mailbox)?
`userdel -r username`
#### 9. What commands and keys should be used to lock and unlock a user account?
```angular2html
usermod -L username
usermod -U username
```
#### 10. How to remove a user's password and provide him with a password-free login for subsequent password change?


