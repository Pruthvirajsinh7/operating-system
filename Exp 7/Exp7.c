#include <stdio.h>
#include <unistd.h>

int main() {
    pid_t pid;
    pid = fork();
    if (pid == 0) {
        printf("This is the child process.\n");
    } else if (pid > 0) {
        printf("This is the parent process.\n");
    } else {
        printf("Fork failed.\n");
    }
    return 0;
}
