#include <stdio.h>

/*Isabel Sutedjo
I pledge my honor that I have abided by the Stevens Honor System.
I used bubble sort
Do not be considered for bonus*/

void strcpy(char* src, char* dst){
    int i = 0;
    start:
    // \0 used to signify end of a string, loop with goto until src reaches the end
    if (src[i] != '\0'){
        dst[i] = src[i];
        i++;
        goto start;
   }
}

int dot_prod(char* vec_a, char* vec_b, int length, int size_elem){
    /*Do not cast the vectors directly, such as 
    int* va = (int*)vec_a;
    */
    int i = 0;
    int j = 0;
    int total;
    int temp;

    //convert char* to int*
    int* vecint_a = vec_a + (i * size_elem);
    int* vecint_b = vec_b + (i * size_elem);
    
    //compute the dot product
    start:
    if (i == length){
        return total;
    }
    else{
        temp = vecint_a[i] * vecint_b[i];
        total += temp;
        i++;
        goto start;
    }
    
}

void sort_nib(int*arr, int length){
    //convert int* to char*
    int count = 0;
    char hold[length * 8];
    char buffer[10];
    for (int n = 0; n != length; n++){
        sprintf(buffer, "%X", arr[n]);
        for (int z = 0; z <= 8; z++){
            hold[(n * 8) + z] = buffer[z];
        }
    }
    
    //bubble sort
    char placeholder = " ";
    int size = length * 8;
    for (int i = 0; i < size - 1; i++){
        for (int j = 0; j < size - i - 1; j++){
            if (hold[j] > hold[j + 1]){
                placeholder = hold[j];
                hold[j] = hold[j + 1];
                hold[j + 1] = placeholder;
            }
        }
    }

    //convert char* to int*
    int x = 0;
    int y = 0;
    while (x != length){
        while (y != 8){
            buffer[y] = hold[count];
            count++;
            y++;
        }
        sscanf(buffer, "%X", &arr[x]);
        y = 0;
        x++;
    }
}

int main(){

    char str1[] = "382 is the best!";
    char str2[100] = {0};

    strcpy(str1, str2);
    puts(str1);
    puts(str2);

    int vec_a[3] = {12,34,10};
    int vec_b[3] = {10,20,30};
    int dot = dot_prod((char*)vec_a, (char*)vec_b, 3, sizeof(int));
    printf("%d\n", dot);

    int arr[3] = {0x12BFDA09, 0x9089CDBA, 0x56788910};
    sort_nib(arr, 3);
    for (int i = 0; i < 3; i++){
        printf("0x%08X ", arr[i]);
    }
    puts("");

    return 0;

}