// Pablo Labbate and Cole Ternes, CPSC 380, started on 9/27/21

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <sys/wait.h>

#define MAX_LINE 80 // 80 chars per line, per command

int main(void)
{
    char *args[MAX_LINE / 2 + 1]; // max of 40 args
    int should_run = 1;

    char input[MAX_LINE];
    // resets input to dump previous garbage
    memset(&input[0], 0, sizeof(input));

    pid_t pid;
    char *file; // name of command being run
    file = malloc(sizeof(char) * 80);

    do // loop to iterate through
    {
        printf("osh> ");
        fflush(stdout);

        fgets(input, sizeof(input), stdin); // read input
        input[strcspn(input, "\n")] = 0; // removes \n from input
        //source: https://stackoverflow.com/questions/41252808/string-compare-in-c-with-fgets?noredirect=1&lq=1

        if (strlen(input) > 0) // checks for empty strings
        {
            if (!strcmp(input, "quit") || !strcmp(input, "exit")) // is 0 when equal
            {
                should_run = 0; // exits loop
            }
            else // anything but 0 is not equal
            {
                pid = fork(); // forks child process to handle input
                switch(pid)
                {
                    case -1:
                        perror("ERROR: Fork Failed");
                        exit(EXIT_FAILURE);
                        break;

                    case 0: ; // child process
                        int ctr = 0;
                        char *token = strtok(input, " "); // trying to split string

                        while( token != NULL ) // loop through the string to extract all other tokens
                        {
                            if (ctr == 0) // the first token is always the file
                            {
                                file = token;
                            }
                            else
                            {
                                if (!strcmp(token, "&")) // removes the token if there is &
                                {
                                    ctr--;
                                }
                                else // all other tokens are the arguments
                                {
                                    args[ctr-1] = token;
                                }
                            }
                            token = strtok(NULL, " ");
                            ctr += 1;
                        }

                        printf("\n");
                        execvp(file, args);

                        fflush(stdout);
                        should_run = 0; // exits loop for child
                        break;

                    default: ; //parent process
                        // source: https://stackoverflow.com/questions/10651999/how-can-i-check-if-a-single-char-exists-in-a-c-string
                        char* ampersand = strchr(input, '&');
                        if (ampersand) // input contains an ampersand, so parent will wait for child
                        {
                            wait(NULL);
                        }
                        break;
                }
            }
        }
    } while (should_run);

    return 0;
}
