# Project Writeup

## 1. Find the username
If you look at the source code of the page, you will find a comment that says `/* jaquie don't forget to finish your work if you wan't to be paid*/`. You can deduce that the username is `jaquie` and if you run nmap you will see that the port 22 is open so you can try to bruteforce the login.

## 2. Bruteforce the password
You can use hydra to bruteforce the password. The command is `hydra -l jaquie -P /usr/share/wordlists/rockyou.txt ssh://<ip>`. You will find that the password is `snickers`.

## 3. Connect to the server
Now that you have the username and password, you can connect to the server using `ssh jaquie@<ip>`. You will find the flag in the home directory. But you can't read it because you don't have the permission.

## 4. Get the flag
You can use the command `sudo -l` to see the permissions of the user. You will see that you can run the command `cat` as root. You can use this to read the flag. The command is `sudo -u root /bin/cat flag.txt`.

The flag is `epi{d0cker_1s_4w3s0m3}`.