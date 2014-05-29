#! /bin/sh -
if [  -f "/home/git/repositories/gitolite.rc" ]; then
 	echo 'import rc file' 
 	su git -c "cp /home/git/repositories/gitolite.rc /home/git/.gitolite.rc"
else
	echo 'export rc file'
	su git -c "cp /home/git/.gitolite.rc /home/git/repositories/gitolite.rc"
fi
su git -c "/home/git/bin/gitolite setup"
/usr/sbin/sshd -D