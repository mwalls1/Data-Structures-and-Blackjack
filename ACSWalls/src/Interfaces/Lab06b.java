package Interfaces;

//� A+ Computer Science  -  www.apluscompsci.com
//Name -
//Date -
//Class -
//Lab  -

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.Collections;
import static java.lang.System.*;

public class Lab06b
{
	public static void main( String args[] ) throws IOException
	{
		//add test cases
		ArrayList<VowelWord> myList=new ArrayList<VowelWord>();
		Scanner scan=new Scanner(new File("data/lab06b.dat"));
		while(scan.hasNext())
			myList.add(new VowelWord(scan.next()));
		Collections.sort(myList);
		for(VowelWord words: myList)
		{
			System.out.println(words);
		}
	}
}