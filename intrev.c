#include <unistd.h>

int	intrev(int nbr)
{
	int num;
	int rev;

	rev = 0;
	num = nbr;
	while (num/1)
	{
		rev = rev*10 + num%10;
		num = num/10;
	}
	return (rev);
}
