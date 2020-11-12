#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

void print_details(char *pathname);

int main(int argc, char *argv[]) {
    // Loop through all command line arguments
    for (int i = 1; i < argc; i++) {
        print_details(argv[i]);
    }
    return 0;
}

void print_details(char *pathname) {
    struct stat s;

    // Ensure the file can be stat-ed
    if (stat(pathname, &s) != 0) {
        perror(pathname);
        return;
    }

    // Print (some of) the info from stat
    printf("%s:\n\
    st_ino =     %d\n\
    st_mode =    %d\n\
    st_uid =     %d\n\
    st_gid =     %d\n\
    st_size =    %d\n\
    st_blksize = %d\n\
    st_blocks =  %d\n\
    st_atime =   %d\n\
    st_mtime =   %d\n\
    st_ctime =   %d\n",
    pathname, s.st_ino, s.st_mode, s.st_uid, s.st_gid, s.st_size, s.st_blksize,
    s.st_blocks, s.st_atime, s.st_mtime, s.st_ctime);
}
