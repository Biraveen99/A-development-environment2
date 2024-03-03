1. On the enviroment/server, run: 
    - sudo apt update
    - sudo apt upgrade -y 

This is to update the package list or upgrade the installed packages to the latest

2. To install "gcc", "make", and "binutils", run:
    - sudo apt install gcc make binutils -y

3. Run:
    - sudo apt intall emacs jed git -y

4. Now, create the users using:
    - sudo adduser username (Remove "username" with the actual user)
    - sudo usermod -aG sudo username

    At the same time create developer groups and add the users:

    - sudo groupadd developers
    - sudo usermod -aG developers tim
    - sudo usermod -aG developers janet
    
5. Set up a server running docker for testing:

    - sudo apt install docker.io -y
    - sudo systemctl start docker
    - sudo systemctl enable docker

6. Lastly, verify and check the groups:

    - groups username