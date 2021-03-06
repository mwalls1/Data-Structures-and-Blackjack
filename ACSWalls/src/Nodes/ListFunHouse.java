package Nodes;

//� A+ Computer Science  -  www.apluscompsci.com
//Name -
//Date -  
//Class - 
//Lab  -

import static java.lang.System.*;

public class ListFunHouse {
	// this method will print the entire list on the screen
	public static void print(ListNode list) {
		String x = "";
		while (list != null) {
			x += list.getValue() + " ";
			list = list.getNext();
		}
		System.out.println(x);
	}

	// this method will return the number of nodes present in list
	public static int nodeCount(ListNode list) {
		int count = 0;
		while (list != null) {
			count++;
			list = list.getNext();
		}
		return count;
	}

	// this method will create a new node with the same value as the first node
	// and add this
	// new node to the list. Once finished, the first node will occur twice.
	public static void doubleFirst(ListNode list) {
		list.setNext(new ListNode(list.getValue(), list.getNext()));
	}

	// this method will create a new node with the same value as the last node
	// and add this
	// new node at the end. Once finished, the last node will occur twice.
	public static void doubleLast(ListNode list) {
		ListNode prev = new ListNode();
		while (list != null) {
			prev = list;
			list = list.getNext();

		}
		prev.setNext(new ListNode(prev.getValue(), prev.getNext()));
	}

	// method skipEveryOther will remove every other node
	public static void skipEveryOther(ListNode list) {
		int count = 1;
		while (list != null) {
			if (count % 2 == 0) {
				removeXthNode(list, count);
			}
			list = list.getNext();
			count++;
		}
	}

	// this method will set the value of every xth node in the list
	public static void setXthNode(ListNode list, int x, Comparable value) {
		int count = 1;
		ListNode prev = list;
		while (list != null) {
			if (x == count) {
				list.setValue(value);
				count = 1;
			} else{
				count++;
			}
			prev = list;
			list = list.getNext();
		}
		
	}

	// this method will remove every xth node in the list
	public static void removeXthNode(ListNode list, int x) {
		int count = 1;
		ListNode prev = list;
		while (list != null) {
			if (x == count) {
				prev.setNext(list.getNext());
				count = 1;
			} else {
				count++;
			}
			prev = list;
			list = list.getNext();
		}
		
	}
}