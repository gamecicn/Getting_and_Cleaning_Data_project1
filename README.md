# Getting_and_Cleaning_Data_project1
https://class.coursera.org/getdata-015

## How run_analysis.R to process raw data to requireted tidy data
   
    1.  Read Data  
			As you can see, there are lots of read.table functions to Read data 
		from file and store them in various variables.
		
	2.	Reshape Data
			In this step raw data will be reshaped (processed) to useful clean
		and tidy data for future using. 
		
		* 2.1  Get index of mean and std
			Since we only use mean and std value, we can reduce the data size
		at first. The fist thing need to do is to find out which columns is 
		need. This inforamtion can be acquired from feature.txt by greapping 
		"mean" and "std". The useful columns' index is stored in 
		x.extract.col.index. 
		
		* 2.2	Get title of mean and std columns
			Feature.txt also provied meaningful txt about columns infomation.
		Extract them and store it in variable "x.title".
		
		* 2.3	Extract useful column 
			Now we got useful columns' indexes,  so we can extract them from 
		big data frame.
		
		* 2.4	Combind data to one data set
			Combind train and test data.
			
		* 2.5	Set title
			Set columns' names to make data framw more readable.
		
		* 2.6	Merge to one dataset
			Merge all seprated useful data to an all-in-one data frame

		* 2.7	change y to Readable factor
			xx.y data only list numeric value which mean for various active 
		state. To make this data more human readble, we need update y's value 
		from numeric to meaningful factor. "activity_labels.txt" provide 
		mapping table for thsi step. 
		
	3.	Add a new variable
		As code project's instruction, a new data frame is need base on the 
	clean and tidy data we get.
	
		*3.1	Create a new factor variable
			Create a new factor variable indicate each for each activity 
		and each subject. The new factor is multiply activity and subject by
		pasting the to item together.
		
		*3.2	Split data frame by new factor
			Split data frame by new factor to a list.
			
		*3.3	Get mean for each variable
		
		*3.4	Drop useless columns
				Some columns is useless in final data frame, remove them.
	
		*3.4	Wrtie to txt
			Wrtie to data file.
	
	
	
	
	
	




















