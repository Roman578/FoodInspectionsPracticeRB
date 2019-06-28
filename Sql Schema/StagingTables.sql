
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stg_Food_Inspections](
	[Inspection_ID] [int] NOT NULL,
	[DBA_Name] [nvarchar](100) NOT NULL,
	[AKA_Name] [nvarchar](100) NULL,
	[License] [int] NULL,
	[Facility_Type] [nvarchar](50) NULL,
	[Risk] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [int] NULL,
	[Inspection_Date] [date] NOT NULL,
	[Inspection_Type] [nvarchar](50) NULL,
	[Results] [nvarchar](50) NOT NULL,
	[Violations] [nvarchar](max) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Location] [nvarchar](1) NULL,
	[Historical_Wards_2003_2015] [nvarchar](1) NULL,
	[Zip_Codes] [nvarchar](1) NULL,
	[Community_Areas] [nvarchar](1) NULL,
	[Census_Tracts] [nvarchar](1) NULL,
	[Wards] [nvarchar](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


GO

CREATE TABLE [dbo].[stg_New_York_City_Restaurant_Inspection_Results](
	[CAMIS] [int] NOT NULL,
	[DBA] [nvarchar](100) NULL,
	[BORO] [nvarchar](100) NOT NULL,
	[BUILDING] [nvarchar](300) NULL,
	[STREET] [nvarchar](500) NOT NULL,
	[ZIPCODE] [nvarchar](100) NULL,
	[PHONE] [nvarchar](100) NULL,
	[CUISINE_DESCRIPTION] [nvarchar](2500) NULL,
	[INSPECTION_DATE] [date] NOT NULL,
	[ACTION] [nvarchar](250) NULL,
	[VIOLATION_CODE] [nvarchar](50) NULL,
	[VIOLATION_DESCRIPTION] [nvarchar](500) NULL,
	[CRITICAL_FLAG] [nvarchar](100) NOT NULL,
	[SCORE] [tinyint] NULL,
	[GRADE] [nvarchar](100) NULL,
	[GRADE_DATE] [date] NULL,
	[RECORD_DATE] [date] NOT NULL,
	[INSPECTION_TYPE] [nvarchar](100) NULL
) ON [PRIMARY]
GO


GO

CREATE TABLE [dbo].[stg_Restaurant_Inspections_lasvegas](
	[Serial_Number] [nvarchar](100) NOT NULL,
	[Permit_Number] [nvarchar](100) NOT NULL,
	[Restaurant_Name] [nvarchar](100) NULL,
	[Location_Name] [nvarchar](100) NULL,
	[Category_Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Current_Demerits] [tinyint] NOT NULL,
	[Current_Grade] [nvarchar](50) NULL,
	[Date_Current] [datetime2](7) NOT NULL,
	[Inspection_Date] [datetime2](7) NOT NULL,
	[Inspection_Time] [datetime2](7) NULL,
	[Employee_ID] [nvarchar](50) NOT NULL,
	[Inspection_Type] [nvarchar](50) NOT NULL,
	[Inspection_Demerits] [tinyint] NOT NULL,
	[Inspection_Grade] [nvarchar](50) NULL,
	[Permit_Status] [nvarchar](50) NULL,
	[Inspection_Result] [nvarchar](50) NOT NULL,
	[Violations] [float] NULL,
	[Record_Updated] [datetime2](7) NOT NULL,
	[Location_1] [nvarchar](100) NOT NULL,
	[Zip_Codes] [smallint] NULL
) ON [PRIMARY]
GO


