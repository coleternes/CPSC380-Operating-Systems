#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>

#define NRECORDS 100

typedef struct // Defining structure for records
{
    int   integer;
    char  string[24];
} RECORD;


int main(void)
{
    FILE * file; // File processor
    RECORD oldRecord;
    RECORD newRecord;
    char buf[24];

    if ((file = fopen("records.dat", "r"))) // Checks if file exists
    {
        fclose(file);
    }
    else
    {
        file = fopen("records.dat", "w+"); // Creates a new file to write to
        RECORD rec; // Instantiates the record

        for (int x = 1; x <= NRECORDS; ++x)
        {
            // Resets rec.string to dump previous garbage
            memset(&rec.string[0], 0, sizeof(rec.string));

            rec.integer = x;
            sprintf(rec.string, "RECORD-%d", rec.integer);

            // Writes rec.string, with each element having the size of a char, and total size of rec.string
            fwrite(rec.string, sizeof(char), sizeof(rec.string), file);
            fwrite("\n", sizeof(char), 1, file);
        }

        fclose(file);
    }

    // Reads the arguments from the terminal
    memset(&oldRecord.string[0], 0, sizeof(oldRecord.string)); // Resets oldRecord.string to dump previous garbage
    read(STDIN_FILENO, &buf, sizeof(int)); // Read in the first value (old record)
    oldRecord.integer = atoi(buf); // Sets oldRecord.integer
    sprintf(oldRecord.string, "RECORD-%d", oldRecord.integer); // Sets oldRecord.string
    memset(&newRecord.string[0], 0, sizeof(newRecord.string)); // Resets newRecord.string to dump previous garbage
    read(STDIN_FILENO, &buf, sizeof(int)); // Read in the second value (new name)
    newRecord.integer = atoi(buf); // Sets newRecord.integer
    sprintf(newRecord.string, "RECORD-%d", newRecord.integer); // Sets newRecord.string

    file = fopen("records.dat", "r+"); // Open the file to edit it

    // Grabs the total length of the file
    fseek(file, 0L, SEEK_END);
    int fileLength = ftell(file);

    if (((oldRecord.integer - 1) * 25) < fileLength && oldRecord.integer > 0) // Prevents writing to the file if integer is larger than file or less than 0
    {
        fseek(file, ((oldRecord.integer - 1) * 25), SEEK_SET); // Places the file processor at the beginning of the record to be changed
        fwrite(newRecord.string, sizeof(char), sizeof(newRecord.string), file); // Puts in the new record
        fwrite("\n", sizeof(char), 1, file);

        int lineSize;
        fseek(file, 0L, SEEK_SET); // Sets the file processor back at the start of the file
        while ((lineSize = read(fileno(file), buf, sizeof(buf))) > 0) // Loops through every line in the file
        {
            write(STDOUT_FILENO, buf, lineSize); // Writes the file to stdout
        }
    }
    else
    {
        printf("ERROR: Invalid record index\n"); // Prints the error message to the terminal
    }

    fclose(file);

    return 0;
}
