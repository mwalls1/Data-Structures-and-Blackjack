package Lab13;
//� A+ Computer Science  -  www.apluscompsci.com
//Name -
//Date -
//Class - 
//Lab  -

import java.io.IOException;
import java.io.File;
import java.util.Scanner;
import static java.lang.System.*;

public class Lab13a
{
	public static void main( String args[] ) throws IOException
	{
		Scanner file = new Scanner(new File("data/lab13a.dat"));
		int size = file.nextInt();
		file.nextLine();
		for(int i = 0; i < size; i++)
		{
		   int num = file.nextInt();

			//instantiate an OddOrEven
		   OddOrEven isit = new OddOrEven(num);
		   System.out.println(isit);


		}
	}
}