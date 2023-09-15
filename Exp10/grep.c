#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_lines_with_word(char *filename, char *word) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    char line[1024];
    while (fgets(line, sizeof(line), file)) {
        if (strstr(line, word) != NULL) {
            printf("%s", line);
        }
    }

    fclose(file);
}

void print_lines_without_word(char *filename, char *word) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    char line[1024];
    while (fgets(line, sizeof(line), file)) {
        if (strstr(line, word) == NULL) {
            printf("%s", line);
        }
    }

    fclose(file);
}

void print_whole_file(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    char line[1024];
    while (fgets(line, sizeof(line), file)) {
        printf("%s", line);
    }

    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s test.txt contains life\n", argv[0]);
        return 1;
    }

    char *filename = argv[1];

    if (argc == 2 || (argc == 3 && strcmp(argv[2], "print") == 0)) {
        print_whole_file(filename);
    } else if (argc == 4 && strcmp(argv[2], "contains") == 0) {
        print_lines_with_word(filename, argv[3]);
    } else if (argc == 4 && strcmp(argv[2], "notcontains") == 0) {
        print_lines_without_word(filename, argv[3]);
    } else {
        printf("Invalid command or arguments.\n");
        return 1;
    }

    return 0;
}
