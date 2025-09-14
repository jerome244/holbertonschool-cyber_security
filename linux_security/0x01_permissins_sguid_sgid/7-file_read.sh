find . -type f -print | head
# print only when a change is made
find . -type f -exec chmod -c o=r {} +

# print every file processed
find . -type f -exec chmod -v o=r {} +
find . -type f -print -exec chmod o=r {} +
find . -type d -print -exec chmod o=rx {} +
stat -c '%A %n' ~/.bashrc
# or
ls -ld .
