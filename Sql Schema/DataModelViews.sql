
GO


CREATE view [dbo].[vDimFacility]
as
select
FacilityId
,FacilityName_Initial = left ( FacilityName, 1 )
,FacilityName_Initial3 = left ( FacilityName, 3 )

,FacilityName
,FacilityType
,City
,CityArea
,Zip
from
DimFacility
GO


GO

create view [dbo].[vDimInspectionDate] as
select distinct 
	Inspection_Date,
	MONTH( Inspection_Date ) as [Month],
	Year ( Inspection_Date ) as [Year]
from
	FactInspections
GO

GO

create view [dbo].[vDimInspectionResult]
as
select
InspectionResultKey
,Inspection_Type
,Inspection_PassFlag
,Inspection_Result

from
	DimInspectionResult
GO



CREATE view [dbo].[vFactInspections]
as
select

--Dataset
F.FacilityId
--FacilityName
--FacilityType
--City
--CityArea
--Zip
,Inspection_Date
--Inspection_Type
--Risk
--Inspection_PassFlag
--Inspection_Result

,F.InspectionResultKey
,F.Inspection_PassCount
,D.FacilityKey

from
FactInspections F
join
DimFacility D
	on F.FacilityId  = D.FacilityId
GO


