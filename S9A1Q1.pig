Petrol_Data = LOAD 'class9/petrol_dataset.txt' 
	USING PigStorage(',') 
	AS 	(DistId:chararray, 
		DistName:chararray, 
		BuyRate:chararray, 
		SellRate:chararray, 
		InVol:int , 
		OutVol:int, 
		Year:int) ;
Petrol_Grouped = GROUP Petrol_Data By DistName ; 
TotalVolume_per_Distributor = FOREACH Petrol_Grouped GENERATE group, 
SUM(Petrol_Data.OutVol) as Volume ; 
DUMP TotalVolume_per_Distributor ;  








