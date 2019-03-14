## How to install and config samba service on the Debian 9?

### Pre-work
1. Update the debian system.

```bash
sudo apt-get update && apt-get upgrade
```

2. Install samba service
```bash
sudo apt-get install -y samba
```

### Add samba user who can visit the share documents and folders.
1. Create the samba user group.
```bash
groupadd samba
```

2. Create the system user who can't login the server.
```bash
useradd -g samba -M -s /sbin/nologin admin
```

3. Set the user password.
```bash
passwd admin
```

4. Set the samba login password.
```bash
smbpasswd -a admin
```

### Set the share folder.
1. Create the user share folder.
```bash
mkdir /home/admin
```

2. Change the folder previlieges.
```bash
chmod 777 /home/admin
```

### Samba configuration file.
```bash
vim /etc/samba/smb.conf
```

```conf
[Blu-ray]
    comment = blue ray
    path =  /home/admin
    public = no
    valid users = admin
    write list = admin
    create mask = 0777
    directory mask = 0777
```
