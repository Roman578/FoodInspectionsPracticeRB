
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[v_stg_Inspection_Results_Chicago] as
select 
 'Chicago' as [Dataset] 
,[DBA_Name] as FacilityName
,[Facility_Type] as FacilityType
,cast ( 'CH_' + cast ( [License] as varchar )  as varchar(50) ) + '_' + left (  [DBA_Name], 25 ) + '_' + left ( cast ( Zip as varchar), 5 )  + '_ '  + left ( isnull([Facility_Type], '' ),10 ) as FacilityId
,City
,left ( cast ( Zip as varchar), 5 ) as Zip
,[Address]
,[State]
,case when [Results] like  'Pass%'  then 'Y' else 'N' end as Inspection_PassFlag
,[Results] as Inspection_Result
,[Inspection_Date]
,[Inspection_Type]
,[Risk]

from
	[stg_Food_Inspections]
GO

GO


CREATE view [dbo].[v_stg_Inspection_Results_LasVegas] as

select 
'lasvegas' as [Dataset] 
      ,cast ( 'LV_'+ [Permit_Number] as varchar(50)  ) + '_' + cast ( checksum ([Restaurant_Name] ) as varchar)  + '_' + Isnull( left ( Category_Name, 10 ),'' )   as FacilityId
      ,[Restaurant_Name] as FacilityName
     -- ,[Location_Name] 
      ,[Category_Name] as FacilityType
 --     ,[Address]
      ,[City]
      ,[State]
      ,cast ( left ( [Zip], 5 ) as varchar(5) ) as [Zip]
   --   ,[Current_Demerits] 
    --  ,[Current_Grade] 
    --  ,[Date_Current]
      ,[Inspection_Date]
   --   ,[Inspection_Time]
     -- ,[Employee_ID]
      ,[Inspection_Type]
    --  ,[Inspection_Demerits]
      ,[Inspection_Grade] as Inspection_Result
	  , case when [Inspection_Grade] in ('A', 'B', 'C' ) then 'Y' else 'N' end as Inspection_PassFlag
	  ,[Risk] = 'N/A'
  --    ,[Inspection_Result]
   from
stg_Restaurant_Inspections_lasvegas
GO




CREATE view [dbo].[v_stg_Inspection_Results_NewYork] as
select 
'New_York_City' as [Dataset] 

,cast ( 'NY_' + cast ( CAMIS as varchar )  as varchar(50) ) as FacilityId

,DBA as FacilityName
,BORO as CityArea
--BUILDING
--STREET
, ZIPCODE as Zip
--,PHONE
,CUISINE_DESCRIPTION as FacilityType
,INSPECTION_DATE as [Inspection_Date]
,INSPECTION_TYPE as [Inspection_Type]
--,[ACTION]
----VIOLATION_CODE
----VIOLATION_DESCRIPTION
,CRITICAL_FLAG as [Risk]
--,SCORE
--,GRADE as Inspection_Grade
, case when Grade in ('A', 'B', 'C' ) then 'Y' else 'N'  end as Inspection_PassFlag
, Grade as Inspection_Result

--GRADE_DATE
--RECORD_DATE

from stg_New_York_City_Restaurant_Inspection_Results
GO


