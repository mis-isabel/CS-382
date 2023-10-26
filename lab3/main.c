#include "buggy.h"

int main() {
	
	int counter;
	int size = 20;
	int arr[20];
	
	init(arr, size, &counter);
	
	if (counter == 0) printf("Empty array created\n");
	else printf("Error in array creation\n");

	for(int i = 0; i < size; i += 2) {
		add(arr, i, counter);
		counter ++;
		print_array(arr, counter);
	}
	for(int i = 1; i < size; i += 2) {
		add(arr, i, counter);
		counter ++;
		print_array(arr, counter);
	}
	
	if (contains(arr, size, 6)) printf("Number 6 present in Array\n");
	else printf("Number 6 not in Array Contains not working properly\n");

	if (contains(arr, size, 30))
		printf("Number 30 present in Array Contains not working properly\n");
	else printf("Number 30 not in Array\n");
	
	return 0;
	
}