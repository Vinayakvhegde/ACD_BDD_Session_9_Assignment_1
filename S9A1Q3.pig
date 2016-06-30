Petrol_Data = LOAD 'class9/petrol_dataset.txt' 
	USING PigStorage(',') 
	AS 	(DistId:chararray, 
		DistName:chararray, 
		BuyRate:chararray, 
		SellRate:chararray, 
		InVol:int , 
		OutVol:int, 
		Year:int) ;  
Petrol_Filtered = FOREACH Petrol_Data 
		GENERATE  DistId , OutVol , Year; 
Vol_Ordered 	= ORDER Petrol_Filtered BY OutVol  DESC; 
Year_Ordered 	= FOREACH Vol_Ordered 
		GENERATE DistId, Year ; 
Top_Ten_Year = LIMIT Year_Ordered 10 ; 
DUMP Top_Ten_Year ; 







