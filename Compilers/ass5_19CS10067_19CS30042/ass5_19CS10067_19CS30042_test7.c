// Dynamic Programming solution for Rod cutting problem 
int maxx(int a, int b) 
{ 
	int ans = a > b ? a : b;
	return ans;
} 
int func(int price[100], int n) 
{ 
	int i, j; 
	int val[100]; 
	val[0] = 0; 
	int max_val = 10000;   
	for (i = 1; i<=n; i++) 
	{ 
		for (j = 0; j < i; j++) 
			max_val = maxx(max_val, price[j] + val[i-j-1]); 
		val[i] = max_val; 
	} 
	return val[n]; 
} 
int main() 
{ 
	goto L;
	char c='a',b='x';
	int arr[100], size=0; 
	int i,n=100;
	for(i=0;i<n;i++)
		arr[i]=i; 
	int ans = 0;
	L : ans = func(arr, size); 
	return 0; 
} 
