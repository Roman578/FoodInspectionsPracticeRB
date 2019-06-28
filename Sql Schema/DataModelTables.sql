
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimFacility](
	[FacilityKey] [int] IDENTITY(1,1) NOT NULL,
	[FacilityId] [varchar](100) NOT NULL,
	[FacilityName] [varchar](200) NULL,
	[FacilityType] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[CityArea] [varchar](50) NOT NULL,
	[Zip] [varchar](5) NULL,
 CONSTRAINT [PK_DimFacility] PRIMARY KEY CLUSTERED 
(
	[FacilityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimInspectionResult](
	[InspectionResultKey] [varchar](101) NOT NULL,
	[Inspection_Type] [varchar](50) NULL,
	[Inspection_PassFlag] [char](1) NULL,
	[Inspection_Result] [varchar](50) NULL,
 CONSTRAINT [DimInspectionResult_PK] PRIMARY KEY CLUSTERED 
(
	[InspectionResultKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


GO

CREATE TABLE [dbo].[FactInspections](
	[Dataset] [varchar](50) NOT NULL,
	[FacilityId] [varchar](100) NOT NULL,
	[FacilityName] [varchar](200) NOT NULL,
	[FacilityType] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[CityArea] [varchar](50) NOT NULL,
	[Zip] [varchar](5) NULL,
	[Inspection_Date] [smalldatetime] NOT NULL,
	[Inspection_Type] [varchar](50) NULL,
	[Risk] [varchar](50) NULL,
	[Inspection_PassFlag] [char](1) NULL,
	[Inspection_Result] [varchar](50) NULL,
	[Inspection_PassCount]  AS (case when [Inspection_PassFlag]='Y' then (1) else (0) end),
	[InspectionResultKey] [varchar](101) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactInspections]  WITH CHECK ADD  CONSTRAINT [FactInspections_FK] FOREIGN KEY([FacilityId])
REFERENCES [dbo].[DimFacility] ([FacilityId])
GO

ALTER TABLE [dbo].[FactInspections] CHECK CONSTRAINT [FactInspections_FK]
GO


