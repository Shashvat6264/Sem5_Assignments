// function calling and conditional statements (ternery and if-else)
int maxX(int x, int y) 
{
   int ans;
   if(x>y)  // if-else
   	ans=x;
   else
   	ans=y;
   if(ans<0)
    ans = -ans;
   return ans;
}
int minn(int x, int y) 
{
   int ans;
   ans = x > y ? y : x; // ternery
   max(x,y);
   return ans;
}
int a;
int cal(int a, int b){
	int i, j, d;
	i = minn(a, b);
	j = maxx(a, b);
	d = j - i;
	return d;
}
int main(){
	int a, b, d;
	a = 10, b = 5;
	d = cal(a,b);
	return 0;
}