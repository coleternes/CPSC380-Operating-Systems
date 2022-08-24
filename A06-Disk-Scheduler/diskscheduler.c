// Pablo Labbate and Cole Ternes, CPSC 380, started on 12/1/21

// Help from:
// https://stackoverflow.com/questions/3501338/c-read-file-line-by-line
// https://man7.org/linux/man-pages/man3/getline.3.html
// https://www.geeksforgeeks.org/c-program-delete-file/
// https://www.tutorialspoint.com/cprogramming/c_return_arrays_from_function.htm

#include <stdio.h>
#include <stdlib.h>

// Combs through the readIn file and checks for the next nearest head
int findNearestHead(int direction, int prevHead, FILE *readIn, int removeHead)
{
    // Variables used to read the file
    char *line = NULL;
    size_t len = 0;
    ssize_t read;

    // Temporary file where non-removed lines are dumped from readIn
    FILE *tempFile = fopen("tp2323955.txt", "w+");

    // Store the nearest head
    int nearestHead = 0;

    // Tracking the potential nearest heads
    int tempHead = 0;

    // Prevents nearestHead from not being selected
    int smallestDiff = 5001;

    rewind(readIn); // Points the pointer back to the start of the file

    // Counter variable
    int ctr = 0;

    // while loop to iterate through each line in the file
    while ((read = getline(&line, &len, readIn)) != -1)
    {
        // Store the tempHead
        tempHead = atoi(line);

        // Store tempHead if it has a smaller difference, and remove it from the file
        // Depends on the direction the head is currently heading
        if ((abs(prevHead - tempHead) < smallestDiff && direction == 0) ||
            (abs(prevHead - tempHead) < smallestDiff && direction == 1 && tempHead >= prevHead) ||
            (abs(prevHead - tempHead) < smallestDiff && direction == -1 && tempHead <= prevHead))
        {
            // Store the new smallest difference
            smallestDiff = abs(prevHead - tempHead);

            // Prevents the initialPos from being written into the file
            if (ctr != 0)
            {
                // Convert the old nearestHead to a string and stores it back into readIn
                int length = snprintf(NULL, 0, "%d\n", nearestHead);
                char *tempLine = malloc(length + 1);
                snprintf(tempLine, length + 1, "%d\n", nearestHead);
                fputs(tempLine, tempFile); // Write the previously stored nearestHead
                free(tempLine);
            }

            // Store the new head with the smallest difference
            nearestHead = tempHead;
        }
        // Otherwise, write to the tempFile
        else
        {
            fputs(line, tempFile); // Write the line back to the file
        }

        ctr++;
    }

    // Do not remove the nearestHead from the file
    if (removeHead == 0)
    {
        // Convert nearestHead to a string and stores it back into readIn
        int length = snprintf(NULL, 0, "%d\n", nearestHead);
        char *tempLine = malloc(length + 1);
        snprintf(tempLine, length + 1, "%d\n", nearestHead);
        fputs(tempLine, tempFile); // Write the previously stored nearestHead
        free(tempLine);
    }

    // Empties the contents of readIn to be overwritten by tempFile
    readIn = freopen(NULL, "w+", readIn);

    rewind(readIn); // Points the pointer back to the start of the file
    rewind(tempFile); // Points the pointer back to the start of the file

    // while loop to transfer the lines that were kept back to readIn
    while ((read = getline(&line, &len, tempFile)) != -1)
        fputs(line, readIn);

    fclose(tempFile);
    remove("tp2323955.txt");

    free(line);
    return nearestHead;
}

// Checks the readIn file to see how close the prevHead is to the border and will switch directions if needed
int *checkDirection(int prevDirection, int currHead, FILE *readIn)
{
    // Variables used to read the file
    char *line = NULL;
    size_t len = 0;
    ssize_t read;

    // Tracks the heads that were traversed to reach the border and will be added to the total at the end
    int unaccountedPages = 0;

    // Check if the remaining requests are all bigger or all smaller than the currHead
    int allBigger = 1;
    int allSmaller = 1;

    // Temp variables
    int tempHead = 0;
    static int tempArr[2];

    rewind(readIn); // Points the pointer back to the start of the file

    // while loop to iterate through each line in the file
    while ((read = getline(&line, &len, readIn)) != -1)
    {
        // Store the tempHead
        tempHead = atoi(line);

        if (tempHead <= currHead)
        {
            allBigger = 0;
        }
        if (tempHead >= currHead)
        {
            allSmaller = 0;
        }
    }

    // Tracks the nearest head to the currHead
    int nearestHead = findNearestHead(prevDirection, currHead, readIn, 0);

    // Check if we're close to a border, and if so, switch the direction
    if (prevDirection == 1 && 4999 - currHead < abs(currHead - nearestHead))
    {
        prevDirection *= -1;
        unaccountedPages = (2 * (4999-currHead)) - 1; // - 1 Prevents double counting of the ends
    }
    else if (prevDirection == -1 && currHead < abs(currHead - nearestHead))
    {
        prevDirection *= -1;
        unaccountedPages = (2 * currHead) - 1; // - 1 Prevents double counting of the ends
    }
    else if (prevDirection == 1 && allSmaller == 1)
    {
        prevDirection *= -1;
        unaccountedPages = (2 * (4999-currHead)) - 1; // - 1 Prevents double counting of the ends
    }
    else if (prevDirection == -1 && allBigger == 1)
    {
        prevDirection *= -1;
        unaccountedPages = (2 * currHead) - 1; // - 1 Prevents double counting of the ends
    }

    tempArr[0] = prevDirection;
    tempArr[1] = unaccountedPages;

    free(line);
    return tempArr;
}

// Checks the readIn file and will adjust the prevHead if it is too close to the upper border limit
int *checkBorder(int currHead, FILE *readIn)
{
    // Variables used to read the file
    char *line = NULL;
    size_t len = 0;
    ssize_t read;

    // Tracks the heads that were traversed to reach the border and will be added to the total at the end
    int unaccountedPages = 0;

    // Check if the remaining requests are all smaller than the currHead
    int allSmaller = 1;

    // Temp variable
    int tempHead = 0;
    int inWhile = 0;
    static int tempArr[2];

    rewind(readIn); // Points the pointer back to the start of the file

    // while loop to iterate through each line in the file
    while ((read = getline(&line, &len, readIn)) != -1)
    {
        inWhile = 1;

        // Store the tempHead
        tempHead = atoi(line);

        if (tempHead >= currHead)
        {
            allSmaller = 0;
        }
    }

    // Checks if all the other requests are smaller than the currHead
    if (allSmaller == 1 && inWhile == 1)
    {
        unaccountedPages = 4999 - currHead + 1;
        currHead = 0;
    }

    tempArr[0] = currHead;
    tempArr[1] = unaccountedPages;

    free(line);
    return tempArr;
}


// First come, first serve
int fcfs(int initialPos, FILE *cylinderFile, int lineCount)
{
    // Variables used to read the file
    char *line = NULL;
    size_t len = 0;
    ssize_t read;

    // Variables used to track page faults
    int totalPF = 0;
    int currPF = 0;
    int currHead;
    int prevHead;

    // for loop to iterate through each line in the file
    for (int i = 0; i < lineCount; ++i)
    {
        // Grab the current line from the file
        read = getline(&line, &len, cylinderFile);

        // prevHead is only initialPos if we're at the start of the file
        if (i == 0)
        {
            prevHead = initialPos;
        }

        // The currHead is the current line
        currHead = atoi(line);

        // The current page fault is abs(prevHead - currHead)
        currPF = abs(prevHead - currHead);

        // The currHead becomes the prevHead in the next iteration
        prevHead = currHead;

        // Sum up all of the current page faults from this iteration
        totalPF += currPF;
    }

    free(line);
    rewind(cylinderFile); // Points the pointer back to the start of the file
    return totalPF;
}

// Shortest seek time first
int sstf(int initialPos, FILE *cylinderFile, int lineCount)
{
    // Variables used to read the file
    char *line = NULL;
    size_t len = 0;
    ssize_t read;

    // Temporary file that acts as a duplicate of cylinderFile so that none of the data is lost
    FILE *dupeFile = fopen("dp2323955.txt", "w+");

    // Variables used to track page faults
    int totalPF = 0;
    int currPF = 0;
    int currHead;
    int prevHead;
    int direction = 0; // Direction does not matter

    // while loop to transfer cylinderFile to dupeFile
    while ((read = getline(&line, &len, cylinderFile)) != -1)
        fputs(line, dupeFile);

    // for loop to iterate through each line in the file
    for (int i = 0; i < lineCount; ++i)
    {
        // prevHead is only initialPos if we're at the start of the file
        if (i == 0)
        {
            prevHead = initialPos;
        }

        // Finds the next nearest head to prevHead
        currHead = findNearestHead(direction, prevHead, dupeFile, 1);

        // The current page fault is abs(prevHead - currHead)
        currPF = abs(prevHead - currHead);

        // The currHead becomes the prevHead in the next iteration
        prevHead = currHead;

        // Sum up all of the current page faults from this iteration
        totalPF += currPF;
    }

    fclose(dupeFile);
    remove("dp2323955.txt");

    free(line);
    rewind(cylinderFile); // Points the pointer back to the start of the file
    return totalPF;
}

// Elevator algorithm
int scan(int initialPos, FILE *cylinderFile, int lineCount)
{
    // Variables used to read the file
    char *line = NULL;
    size_t len = 0;
    ssize_t read;

    // Temporary file that acts as a duplicate of cylinderFile so that none of the data is lost
    FILE *dupeFile = fopen("dp2323955.txt", "w+");

    // Store returned variables
    int *funcArr;

    // Variables used to track page faults
    int totalPF = 0;
    int currPF = 0;
    int currHead;
    int prevHead;
    int direction = 1; // 1 = Right, -1 = Left

    // while loop to transfer cylinderFile to dupeFile
    while ((read = getline(&line, &len, cylinderFile)) != -1)
        fputs(line, dupeFile);

    // for loop to iterate through each line in the file
    for (int i = 0; i < lineCount; ++i)
    {
        // prevHead is only initialPos if we're at the start of the file
        if (i == 0)
        {
            prevHead = initialPos;
        }

        // Finds the next nearest head to prevHead
        currHead = findNearestHead(direction, prevHead, dupeFile, 1);

        // Adjusts the direction if it is closer to a border than the next nearest head
        funcArr = checkDirection(direction, currHead, dupeFile);

        // Adjust the direction if it changes
        direction = *(funcArr + 0);

        // The current page fault is abs(prevHead - currHead)
        currPF = abs(prevHead - currHead);

        // The currHead becomes the prevHead in the next iteration
        prevHead = currHead;

        // Sum up all of the current page faults from this iteration
        totalPF += currPF;

        // Add any unaccounted pages to the total number of page faults
        totalPF += *(funcArr + 1);
    }

    fclose(dupeFile);
    remove("dp2323955.txt");

    free(line);
    rewind(cylinderFile); // Points the pointer back to the start of the file
    return totalPF;
}

// Circling the disk algorithm
int cscan(int initialPos, FILE *cylinderFile, int lineCount)
{
    // Variables used to read the file
    char *line = NULL;
    size_t len = 0;
    ssize_t read;

    // Temporary file that acts as a duplicate of cylinderFile so that none of the data is lost
    FILE *dupeFile = fopen("dp2323955.txt", "w+");

    // Store returned variables
    int *funcArr;

    // Variables used to track page faults
    int totalPF = 0;
    int currPF = 0;
    int currHead;
    int prevHead;
    int direction = 1; // 1 = Right

    // while loop to transfer cylinderFile to dupeFile
    while ((read = getline(&line, &len, cylinderFile)) != -1)
        fputs(line, dupeFile);

    // for loop to iterate through each line in the file
    for (int i = 0; i < lineCount; ++i)
    {
        // prevHead is only initialPos if we're at the start of the file
        if (i == 0)
        {
            prevHead = initialPos;
        }

        // Finds the next nearest head to prevHead
        currHead = findNearestHead(direction, prevHead, dupeFile, 1);

        // Call checkBorder
        funcArr = checkBorder(currHead, dupeFile);

        // The current page fault is abs(prevHead - currHead)
        currPF = abs(prevHead - currHead);

        // Update the currHead if we wrapped back to 0
        if (*(funcArr + 0) == 0)
        {
            currHead = findNearestHead(direction, 0, dupeFile, 1);
        }

        // prevHead is calculated to be either the currHead or 0 based on how close currHead is to 4999
        prevHead = currHead;

        // Sum up all of the current page faults from this iteration
        totalPF += currPF;

        // Add any unaccounted pages to the total number of page faults
        totalPF += *(funcArr + 1);
    }

    fclose(dupeFile);
    remove("dp2323955.txt");

    free(line);
    rewind(cylinderFile); // Points the pointer back to the start of the file
    return totalPF;
}

int main(int argc, char *argv[])
{
    // Verify there are only 3 arguments in the command line
    if (argc != 3) // Makes sure that there is 3 arguments
    {
        //        (0)           (1)           (2)
        // ./diskscheduler <initial_pos> <cylinder_file>
        printf("ERROR: Usage = ./diskscheduler <initial_pos> <cylinder_file>\n");
        return -1;
    }

    int initial_pos = atoi(argv[1]); // The initial position of the head

    // Verify that initial_pos is legal
    if (initial_pos < 0 || initial_pos >= 5000)
    {
        printf("ERROR: <initial_pos> must be between 0-4999\n");
        return -1;
    }

    FILE *cylinder_file = fopen(argv[2], "r");

    // Verify that the file can be opened
    if (cylinder_file == NULL)
    {
        printf("ERROR: The file could not be opened\n");
        return -1;
    }

    int count = 0;  // Line counter
    char c;  // To store a character read from file

    // Extract characters from file and store in character c
    for (c = getc(cylinder_file); c != EOF; c = getc(cylinder_file))
        if (c == '\n') // Increment count if this character is newline
            count = count + 1;
    rewind(cylinder_file); // Points the pointer back to the start of the file

    // Run each algorithm and store the total number of page faults
    int fcfsPF = fcfs(initial_pos, cylinder_file, count);
    int sstfPF = sstf(initial_pos, cylinder_file, count);
    int scanPF = scan(initial_pos, cylinder_file, count);
    int cscanPF = cscan(initial_pos, cylinder_file, count);

    // Print the results
    printf("FCFS Page Faults = %d\n", fcfsPF);
    printf("SSTF Page Faults = %d\n", sstfPF);
    printf("SCAN Page Faults = %d\n", scanPF);
    printf("C-SCAN Page Faults = %d\n", cscanPF);

    fclose(cylinder_file);
}
