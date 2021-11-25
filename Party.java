import java.io.*;

public class Party {

	public static void main(String... args) throws IOException {

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int amountTestCases = Integer.parseInt(br.readLine());
		for(int i = 0; i < amountTestCases; i++)
		{
			int n; //gr��e
			int m;// Anzahl Freunde
			String sizeAndFriends = br.readLine();
			n = Integer.parseInt(sizeAndFriends.split(" ")[0]);
			m = Integer.parseInt(sizeAndFriends.split(" ")[1]);
			int[] horizontalValues=new int[m];
			int[] verticalValues=new int[m];
			for(int j = 0; j<m;j++)
			{
				String horizontalAndVertical=br.readLine();
				horizontalValues[j]=Integer.parseInt(horizontalAndVertical.split(" ")[0]);
				verticalValues[j]=Integer.parseInt(horizontalAndVertical.split(" ")[1]);	
			}
			System.out.println(getMedian(horizontalValues,n)+" "+getMedian(verticalValues,n));
		}

	}

	static int getMedian(int[] arr, int maxValue)
	{
		int[] I = new int[maxValue+1];
		for(int i = 0; i < arr.length; i++)
		{
			I[arr[i]]+=1;
		}
		int count = 0;
		for(int i = 0; i < maxValue; i++)
		{
			count += I[i];
			if(count > arr.length/2)
				return i;
		}
		return 0;
	}
}
