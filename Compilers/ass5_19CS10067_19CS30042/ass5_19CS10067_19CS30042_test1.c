//  arrays (multidimensional) ,  loops and nested loops
int x = 0;

int main()
{
	int i, j, n;
	n=5;
	j=100;
	i=0;
	int s=0;
	char a='a';
	int p[5]; // 1D integer array
	int dp[5][5]; // 2D integer array
	while(i<5) // while loop1
	{
		++j
		i++;
		p[i]=i*j;
	}

	do // do-while loop
	{
		s = s + p[i];
	}while(i<n);

	for(i=0;i<n;i++)
	{
		for(j=0;j<n;j++)  // nested for loop
			dp[i][j]= s + j*i; // multi dimensional array
	}
	return 0;
}
