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
		GENERATE  DistName , OutVol ,(float)(SUBSTRING(SellRate,1,(int)SIZE(SellRate))) AS AmountSold;
Petrol_Calculated = FOREACH Petrol_Filtered GENERATE DistName, (long)(OutVol * AmountSold) AS TotalAmount ;
Vol_Ordered 	= ORDER Petrol_Calculated BY OutVol ; 
Dist_LeastVol 	=  LIMIT Vol_Ordered 1 ; 
DUMP Dist_LeastVol ;   








