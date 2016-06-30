Petrol_Data = LOAD 'class9/petrol_dataset.txt' 
	USING PigStorage(',') 
	AS 	(DistId:chararray, 
		DistName:chararray, 
		BuyRate:chararray, 
		SellRate:chararray, 
		InVol:int , 
		OutVol:int, 
		Year:int) ;
Petrol_Grouped = GROUP Petrol_Data By DistId ;  
TotalVolume_per_Distributor = 	FOREACH Petrol_Grouped 
				GENERATE group,
				SUM(Petrol_Data.OutVol) as Volume ;  
Distributors_Ordered = ORDER  TotalVolume_per_Distributor BY  Volume DESC ; 
Top_Ten_Dist = LIMIT Distributors_Ordered  10 ; 
DUMP Top_Ten_Dist ;  








