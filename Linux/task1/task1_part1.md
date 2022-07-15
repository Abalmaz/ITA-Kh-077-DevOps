#### 1. Log in to the system as root.
```angular2html
sudo -i
sudo su
```
![task1_1](images/task1_1.png)
#### 2. Use the passwd command to change the password.
```angular2html
sudo passwd [user_name]
-e, --expire  Immediately expire an account's password
-d, --delete  Delete a user's password (make it empty)
-i, --inactive DAYS This option is used to disable an account after the password has been expired for a number of days
-x, --maxdays MAX_DAYS Set the maximum number of days a password remains valid
```
![task1_2](images/task1_2.png)
#### 3. Determine the users registered in the system, as well as what commands they execute
```angular2html
who
w
```
![task1_3](images/task1_3.png)
#### 4. Change personal information about yourself.
```angular2html
chfn - change real user name and information
```
![task1_4](images/task1_4.png)
#### 5. Become familiar with the Linux help system and the man and info commands.
```angular2html
man
info
whatis
```
![task1_5](images/task1_5.png)
#### 6. Explore the more and less commands using the help system. View the contents of files .bash* using commands.
```angular2html
more [options] file - file perusal filter for crt viewing
less [options] file - is similar to more, but it has many more features

less +G .bash_history
```
![task1_6](images/task1_6.png)
#### 7. Describe in plans that you are working on laboratory work 1
```angular2html
finger username
echo "Project name" > ~/.project
echo "Some plane" > ~/.plan
```
![task1_7](images/task1_7.png)
