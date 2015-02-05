/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 1/28/2015 1:05:37 PM ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 1/28/2015 1:05:37 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'NT AUTHORITY\SYSTEM'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'NT AUTHORITY\SYSTEM'
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Answers]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[Response] [nvarchar](160) NOT NULL,
	[Question_QuestionId] [int] NOT NULL,
	[User_UserId] [int] NOT NULL,
	[AnswerType] [int] NOT NULL,
	[TimeStamp] [datetime] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[GroupRole]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupRole](
	[groupRoleID] [int] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GroupRole_1] PRIMARY KEY CLUSTERED 
(
	[groupRoleID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Groups]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[MessageLog]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageLog](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[MessageBody] [nvarchar](200) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_MessageLog] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[msg_body] [nvarchar](160) NOT NULL,
	[Status] [int] NOT NULL,
	[ScheduledTime] [datetime] NULL,
	[SentTime] [datetime] NULL,
	[RecievedTime] [datetime] NULL,
	[SentBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[MessageStatus]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MessageStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Person]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sex] [bit] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[PhoneStatus]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneStatus](
	[PhoneId] [int] NOT NULL,
	[SIM_Number] [nvarchar](50) NULL,
	[PowerMode] [int] NULL,
	[LastConnected] [datetime] NULL,
	[BatteryLevel] [int] NULL,
	[Network] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhoneStatus] PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[PossibleAnswers]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PossibleAnswers](
	[PossibleAnswerID] [int] NOT NULL,
	[Value] [nvarchar](50) NULL,
 CONSTRAINT [PK_AnswerTypes] PRIMARY KEY CLUSTERED 
(
	[PossibleAnswerID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[QAType]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QAType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QuestionTypes] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[QuestionPool]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionPool](
	[QuestionPoolID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](160) NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_QuestionPool] PRIMARY KEY CLUSTERED 
(
	[QuestionPoolID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionType] [int] NOT NULL,
	[Survey_SurveyId] [int] NOT NULL,
	[Question] [nvarchar](160) NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Resolution]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resolution](
	[ResolutionID] [int] IDENTITY(1,1) NOT NULL,
	[SurveyID] [int] NULL,
	[UserId] [int] NULL,
	[message] [nvarchar](max) NULL,
	[Resolved] [bit] NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Resolution] PRIMARY KEY CLUSTERED 
(
	[ResolutionID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[ServiceCodes]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCodes](
	[ServiceCodeID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) NULL,
	[Service] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[Response] [nvarchar](500) NOT NULL,
	[AutoReply] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ServiceCodes] PRIMARY KEY CLUSTERED 
(
	[ServiceCodeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[ServiceRequests]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequests](
	[ServiceRequestID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceCodeID] [int] NULL,
	[RequestFromNumber] [nvarchar](50) NULL,
	[RequestTime] [datetime] NOT NULL,
	[RequestFromName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ServiceRequests] PRIMARY KEY CLUSTERED 
(
	[ServiceRequestID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Surveys]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surveys](
	[SurveyId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Status] [int] NULL,
	[SurveyName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Surveys] PRIMARY KEY CLUSTERED 
(
	[SurveyId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[SurveyStatus]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyStatus](
	[SurveyStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SurveyStatus] PRIMARY KEY CLUSTERED 
(
	[SurveyStatusID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[SurveyUsers]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyUsers](
	[Survey_SurveyId] [int] NOT NULL,
	[Users_UserId] [int] NOT NULL
)

GO
/****** Object:  Table [dbo].[UserGroups]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroups](
	[UserGroupID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_UserGroups] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CurrentSurvey] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[UsersStatus]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersStatus](
	[UsersStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UsersStatus] PRIMARY KEY CLUSTERED 
(
	[UsersStatusId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  View [dbo].[SurveyView]    Script Date: 1/28/2015 1:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SurveyView]
AS
SELECT        dbo.Answers.Response, dbo.Users.Name, dbo.Users.PhoneNumber, dbo.Questions.Question, dbo.Surveys.SurveyName, dbo.Surveys.SurveyId
FROM            dbo.Answers INNER JOIN
                         dbo.Questions ON dbo.Answers.Question_QuestionId = dbo.Questions.QuestionId INNER JOIN
                         dbo.Surveys ON dbo.Questions.Survey_SurveyId = dbo.Surveys.SurveyId INNER JOIN
                         dbo.Users ON dbo.Answers.User_UserId = dbo.Users.UserId




GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201501151134549_InitialCreate', N'ChurchSMS_offline.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F4941488653B2F69B09BC059DBADD1D80E2227AF062D71D744254A15B9EEFADBFAD04FEA2F94D45DE245D4652FCE8BB12B0D67863387C3DB59FFF7CFBFB38F9B30B09E60425084E7F6C9D1B16D41EC453EC2ABB9BDA6CB37EFEC8F1F7EFE6976E1871BEB7B21F796CBB19698CCED474AE3F78E43BC4718027214222F8948B4A4475E143AC08F9CD3E3E35F9D931307321536D36559B3AF6B4C5108D32FECEB22C21E8CE91A04D7910F03923F676FDC54AB7503424862E0C1B9BD785C27DEA37BEDDE47CB6580303CCADAD8D6598000F3C785C1D2B600C611059479FBFE1B812E4D22BC7263F6000477CF3164724B101098F7E27D256EDAA1E353DE21A76A38282076D955D6D90B1614FACCDD4B3B3CB7AF7C983EFA1A05B02EC964FF80CF8D07ECD197248A61C2A4E1B26C6F5B4EB39DD36E5836ABB5E12EB040D284A1C0B6AEC1E633C42BFAC8F071FACEB62ED106FAC5933C8ADF3062A0618D68B2665F6FD641001E0258BE77B436F95F8D55F671BCD5995385571BF4B3380E9097A6942127B1AD4F80C0DC3706ADA32229D94BC728815C76110014EE3E8B5798BE3D95C4A636405C1A25F03788610228F4BF004A61822BE7BBB297768C1B9B20850696BE8360BD055337E009ADD278B48C6679FE0A83F4257944B10408A967F799E86512857CC44AD29F4ADCBB112B61BC0B9156EC0E242B4807A2B881D21FB874F0FE4D543EF486BE0042FE8E12FF77401EB76ECC85DE3A61D9732908E31D623D451F9916ED058C3BD05E0C0A53573F472B84BB5D4DC5B4AE56125A576B627D5DE5CABA3DE5525A474B01AD9F9594CCCD41F523EDFA9022C21B8B85442A9ADA608F9F90DF9E56152D0A61E649FF525578B6EB72D5EAE6AECD3762B675E3E3A6D45E235737A54A06F8E821317445DE634470134366E17D41BBF0777FB04A9362546633494D994DFFE8405549C930351AFC3D26834E2F7B23FF8C90C843A97BAAD9E05EB2AEBCC0BE653648E59BA96C9AB1AED701457C0BC61ECFED5F84C0769A296747D59EAD69E1C46E8FC55B7C0E0348A175E66527020B403CE08B4864F1F39B4FD8F08509B70582054B2E4D00C2541CEB087B280681513F5AAD0D57EBDCBBD24EFBCD398C21E6468DF265E280B2AE39A5AD56E8BA2235736A3034476735BC4D502319EB72D06405631834C552213122337058C814BAB163600AB932B12F9F44F7854BE3A229A9EE5BC2E5CBAF984237F681CB175B2F6B5B7913CCC84EB1E4A0C98E3B074253767CB06B6C2A039A2D9A5812284B014CC463E3F307FE126EA81052DED085B4792E502DC2A4738210B0A612216C3A8DB5C4F450DBA5B197B2E2DC46AB315F0AF650DB15CBAA58B694D692AC71385F8BD784F53BD636088DD7C6651FE55113EA85F16A58A158D0D9803D13EF19ADDAF64A1F2CC542ADC7524DD1A31C09869112176735B552555304C8044D8A15438F35C37401DA0792EA87CCFA48A9E6B03EB398A2534545350C9664DE9A205AC53EBD9C72AAFB7127BB202F2ED21DC54DFAEC1AC431C2ABDACD7AFEC472F36BF5376EFF0BEC30D3E17844728F5D7A5B5AA2510256B0F59699669E5EA284D07340C103E0273E0B3F14C4FA4CB085C9FA3C2B66B0982A0A69FE39BF0751900C9A53B3B8D0CB355DB27E867CB598DEAC4A10206F6E71BE03084022B9575B44C13AC4EAC5ABBA75763B566F9F3D1135CC9C96FFC2E2548899B0826A26C0283DCD6131499ADA77F8C333256F3E3A530CBF3E4A97E4E975B684755057738E8897A01061C0BCDC46E63AE27C45F8E7DBE5ABCE71C17D7F7D78E196B6E6B6C4C1513D35D7D4BC1BAE6B6BBE31D7D8BA00AEAB6CBDDA39188C3070781010465C7307B3D3E13641A1CC172693274EC252EA9D3D858EED8CE21AFBA8AEA4F6B8A7AE9C5F2428CB9F1F241AF2EDE1E46890DCFCF746834287AE2AB711A13A2D536B69DDB3D79575300DD43A1B97E78D22AF66221C083EB6B00296DF82F74647BF95F034E0282E05EA5A541705DB4F5F73DBD751F1F3FDF090A29E37ED5DB8F95657A8D8BA2DAF1841A3B29FAA909F89D73C18EC9CF2707EF09CA4F6ABBD9717F32E6CE9DB2225EACAAD7D6B0B3FCBB7D3068CF9F6FE3A13B1ADA26EB135E533A1303CE20247EE5FC122402C8695C035C0680909BD8BFE84786E9F1E9F9CB6E8F603A8EF0E217E70C8FC77FC04D8D00289486219416F2F94BE0AC1E6F55494F5FD927D278B53B5F5EA88D550BEEE2885524EEE288DAD7DC6A8680EC2CA9E7E9280786DE9FCD1414FF008BF4218951AF19706A3D49573DBEE73FCC39377272B3F526EEE64DA25D4DB5DC2E0C51056270B78938F3A71AC27A548EE8778A3B9391E4BD11CCDE9D90BE9F1651177CC898ED96DFC3E3887EA1BE59184B65100539C5A6C9D24F62313160FA984ED1B5FFB2860C6F83A98FAD59378784800CB1974E3888F2F0E62AA9B2139C61427799383AC758C566CDF044A89E2C85C76D0D445C8CC8ECFE6B6FF103110644BC73312DF402AE78BA98C65E8551ACB8F6B95C6E42C229DB11C995A8BB98CDEAC9C15D54DFB34637DEA6DCB99909DDC50236AA8DEB23CBBFBE48F2AD965FD88A27AD6E94B2088D6332C12ADFA501DB5ACC99742051D8F8B5D87628B64CFF1C168D44DC5A5D956D89CE2150F9B296BFF3A89CDD704AD2A159CE482A1D798234B992BBC8C8AB9BAE55121D23A41B98614F86C023D4B285A028FB2D71E2424FD5D6F4EA2B9081FA07F856FD7345E53D665183E048D133D3EE5EBECA794D5A6CFB3DB38FD65EC145D606E22D605788B3FAD51E0977E5F4A8E7A142AF85A223FA7E6B9A4FCBC7AF55C6ABA89B0A1A23C7CE512E80E8671C094915BEC8227A8F6AD3B86CD88CDCE1158252024B98EAA3DFBCAE0E7879B0FFF033F127C43FC4B0000, N'6.0.0-20911')
SET IDENTITY_INSERT [dbo].[Answers] ON 

INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (19, N'Yes', 4, 1, 1, CAST(0x0000A407014BAB08 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (20, N'Yes', 5, 1, 1, CAST(0x0000A407014BAB08 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (21, N'2', 6, 1, 3, CAST(0x0000A407014BAB08 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (22, N'Yes', 4, 2, 1, CAST(0x0000A407014BAB08 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (23, N'No', 5, 2, 2, CAST(0x0000A407014BAB08 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (24, N'3', 6, 2, 3, CAST(0x0000A407014BAB08 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (25, N'Yes', 4, 3, 1, CAST(0x0000A407014BAB08 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (26, N'No', 5, 3, 2, CAST(0x0000A407014BAB08 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (27, N'3', 6, 3, 3, CAST(0x0000A407014BAB08 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (28, N'Yes', 7, 1, 1, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (29, N'14', 8, 1, 3, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (30, N'Yes', 7, 2, 1, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (31, N'23', 8, 2, 3, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (32, N'Yes', 9, 2, 1, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (33, N'23', 10, 2, 3, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (34, N'Yes', 9, 1, 1, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (35, N'13', 10, 1, 3, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (36, N'13', 11, 1, 3, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (37, N'Yes', 12, 1, 1, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (38, N'No', 13, 1, 2, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (39, N'23', 11, 2, 3, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (40, N'No', 12, 2, 2, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (41, N'No', 13, 2, 2, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (42, N'Yes', 25, 1004, 1, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (43, N'No', 26, 1004, 2, CAST(0x0000A42500C5D744 AS DateTime))
INSERT [dbo].[Answers] ([AnswerId], [Response], [Question_QuestionId], [User_UserId], [AnswerType], [TimeStamp]) VALUES (44, N'45', 27, 1004, 3, CAST(0x0000A42500C5D744 AS DateTime))
SET IDENTITY_INSERT [dbo].[Answers] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'viewers')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9a9686b4-32d1-46c2-b54b-472d284273e2', N'1')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'0f1d7886-1737-4b57-a28e-0c02ae3232f5', N'Haloo', N'AMZO2x/yukEU5E1RJhXxTSviwmp/Rcd0zxGQyzh9QDoJXxH8T4UbKDyBTgIYBBCA0A==', N'6e353619-dd5c-490a-8c3b-ce8277288563', N'ApplicationUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'3c5702b3-2677-4b7b-ad1e-06fb67f84dde', N'Sibe', N'AEIxI9Tc/aOTnlqTXkEHkt+u481uwptsK0M99CkuxElw3S+ozlXTY1zyfUem6XrnTA==', N'9198c38f-6a4a-4c23-80fb-09b4412f6cdc', N'ApplicationUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'48a0aa0a-fa12-4616-9186-285811f07a80', N'robi', N'AH0gZVG82E3YzuEXw/l5sbM5fgPUoXdMxQ2qo5McQBUqkhY0HnaulSaycMv4E+dttQ==', N'd008c950-6bf9-4f17-9342-56ef29a3cede', N'ApplicationUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'63dc412d-61cc-4753-bb1a-08c147070da0', N'jerriye', N'ACwOt0V9XtheuVxMxvzw1th3eO9psZSaM1oaIDwsdvLhV1I5M73q1okd/6Cp/bZ5Og==', N'a7fd491b-bad9-4659-970d-eeced756a51c', N'ApplicationUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'9a9686b4-32d1-46c2-b54b-472d284273e2', N'admin', N'ABA6qXk/Hu+FjKB/79JdfI1TfXx+K19jGeN4sueG8sNsa98drm8Acob4uE+HdUeAwQ==', N'15c75527-f75b-45d0-bbe7-5370ca016046', N'ApplicationUser')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'bb03ee05-1b2e-4d53-9d99-f7c032d26e25', N'Halo', N'AKIpcpdMmjDfq3mNW/BvMtuH8zyhQyjE6Fbgic3psB2oSX9xA163TpPiVslhXc8iXw==', N'62341661-5b6e-4cff-8aaa-292c592468ee', N'ApplicationUser')
INSERT [dbo].[GroupRole] ([groupRoleID], [Role]) VALUES (1, N'Leader')
INSERT [dbo].[GroupRole] ([groupRoleID], [Role]) VALUES (2, N'Member')
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([GroupID], [GroupName], [Status], [Description]) VALUES (7009, N'Prayer Group', 1, NULL)
INSERT [dbo].[Groups] ([GroupID], [GroupName], [Status], [Description]) VALUES (7010, N'Choir Group', 1, NULL)
INSERT [dbo].[Groups] ([GroupID], [GroupName], [Status], [Description]) VALUES (7011, N'Bible Study Group', 1, NULL)
INSERT [dbo].[Groups] ([GroupID], [GroupName], [Status], [Description]) VALUES (8011, N'Leadership', 1, NULL)
INSERT [dbo].[Groups] ([GroupID], [GroupName], [Status], [Description]) VALUES (8012, N'Youth Leaders', 1, NULL)
INSERT [dbo].[Groups] ([GroupID], [GroupName], [Status], [Description]) VALUES (8015, N'Setoch', 1, NULL)
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[MessageStatus] ON 

INSERT [dbo].[MessageStatus] ([StatusID], [Description]) VALUES (2, N'Delivered')
INSERT [dbo].[MessageStatus] ([StatusID], [Description]) VALUES (3, N'Failed')
INSERT [dbo].[MessageStatus] ([StatusID], [Description]) VALUES (4, N'Needs Resolution')
INSERT [dbo].[MessageStatus] ([StatusID], [Description]) VALUES (5, N'Scheduled')
INSERT [dbo].[MessageStatus] ([StatusID], [Description]) VALUES (6, N'Recieved')
INSERT [dbo].[MessageStatus] ([StatusID], [Description]) VALUES (7, N'Sending')
SET IDENTITY_INSERT [dbo].[MessageStatus] OFF
INSERT [dbo].[PhoneStatus] ([PhoneId], [SIM_Number], [PowerMode], [LastConnected], [BatteryLevel], [Network]) VALUES (1, N'+251935932263', 2, CAST(0x0000A42C015A85D3 AS DateTime), 100, N'WIFI')
INSERT [dbo].[PossibleAnswers] ([PossibleAnswerID], [Value]) VALUES (1, N'Yes')
INSERT [dbo].[PossibleAnswers] ([PossibleAnswerID], [Value]) VALUES (2, N'No')
INSERT [dbo].[PossibleAnswers] ([PossibleAnswerID], [Value]) VALUES (3, N'Quantitative')
SET IDENTITY_INSERT [dbo].[QAType] ON 

INSERT [dbo].[QAType] ([TypeId], [Description]) VALUES (1, N'Yes or No')
INSERT [dbo].[QAType] ([TypeId], [Description]) VALUES (2, N'Quantitative')
SET IDENTITY_INSERT [dbo].[QAType] OFF
SET IDENTITY_INSERT [dbo].[QuestionPool] ON 

INSERT [dbo].[QuestionPool] ([QuestionPoolID], [Question], [Type]) VALUES (1, N'Are you born again?', 1)
INSERT [dbo].[QuestionPool] ([QuestionPoolID], [Question], [Type]) VALUES (3, N'Have you been babtized? ', 1)
INSERT [dbo].[QuestionPool] ([QuestionPoolID], [Question], [Type]) VALUES (4, N'How many years in Christianity?', 2)
SET IDENTITY_INSERT [dbo].[QuestionPool] OFF
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (4, 1, 7019, N'Are you born again?')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (5, 1, 7019, N'Have you been babtized? ')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (6, 2, 7019, N'How many years in Christianity?')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (7, 1, 7020, N'Are you born again?')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (8, 2, 7020, N'How many years in Christianity?')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (9, 1, 7021, N'Have you been babtized? ')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (10, 2, 7021, N'How many years in Christianity?')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (11, 2, 7022, N'How many years in Christianity?')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (12, 1, 7022, N'Have you been babtized? ')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (13, 1, 7022, N'Are you born again?')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (25, 1, 7023, N'Are you born again?')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (26, 1, 7023, N'Have you been babtized? ')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (27, 2, 7023, N'How many years in Christianity?')
INSERT [dbo].[Questions] ([QuestionId], [QuestionType], [Survey_SurveyId], [Question]) VALUES (28, 1, 7024, N'Are you born again?')
SET IDENTITY_INSERT [dbo].[Questions] OFF
SET IDENTITY_INSERT [dbo].[ServiceCodes] ON 

INSERT [dbo].[ServiceCodes] ([ServiceCodeID], [Code], [Service], [Type], [Response], [AutoReply], [Active]) VALUES (1, N'JOIN', N'Registration', 1, N'Welcome to 6K Assembly of God church! You have just subscribed to our SMS ministry. God bless you!', 1, 1)
INSERT [dbo].[ServiceCodes] ([ServiceCodeID], [Code], [Service], [Type], [Response], [AutoReply], [Active]) VALUES (2, N'P', N'Prayer Request', 1, N'Your prayer request is received. God answers prayers!! Thank you!', 0, 1)
INSERT [dbo].[ServiceCodes] ([ServiceCodeID], [Code], [Service], [Type], [Response], [AutoReply], [Active]) VALUES (3, N'C', N'Comment', 1, N'Comment Received. Thank you for your time!', 0, 1)
INSERT [dbo].[ServiceCodes] ([ServiceCodeID], [Code], [Service], [Type], [Response], [AutoReply], [Active]) VALUES (7, N'E', N'Events', 2, N'Monday 1:00 - 2:00 PM Sta1:00 - 2:00 PM', 1, 1)
INSERT [dbo].[ServiceCodes] ([ServiceCodeID], [Code], [Service], [Type], [Response], [AutoReply], [Active]) VALUES (8, N'CU', N'Conseling', 2, N'Thank you for your interest. We are so happy to help you. Please contact Pastor Taye @ this number 0912547489 or Pastor Joy on this number. 14245121214', 1, 1)
SET IDENTITY_INSERT [dbo].[ServiceCodes] OFF
SET IDENTITY_INSERT [dbo].[ServiceRequests] ON 

INSERT [dbo].[ServiceRequests] ([ServiceRequestID], [ServiceCodeID], [RequestFromNumber], [RequestTime], [RequestFromName]) VALUES (34, 2, N'+251935932263', CAST(0x0000A4270171EF22 AS DateTime), N'Robel Tessema')
INSERT [dbo].[ServiceRequests] ([ServiceRequestID], [ServiceCodeID], [RequestFromNumber], [RequestTime], [RequestFromName]) VALUES (35, 3, N'+251935932263', CAST(0x0000A42701723D7D AS DateTime), N'Robel Tessema')
INSERT [dbo].[ServiceRequests] ([ServiceRequestID], [ServiceCodeID], [RequestFromNumber], [RequestTime], [RequestFromName]) VALUES (36, 1, N'+251912496016', CAST(0x0000A4270172A002 AS DateTime), N'')
INSERT [dbo].[ServiceRequests] ([ServiceRequestID], [ServiceCodeID], [RequestFromNumber], [RequestTime], [RequestFromName]) VALUES (37, 1, N'+251912496016', CAST(0x0000A4270172EA76 AS DateTime), N'SIBHAT ')
INSERT [dbo].[ServiceRequests] ([ServiceRequestID], [ServiceCodeID], [RequestFromNumber], [RequestTime], [RequestFromName]) VALUES (38, 1, N'+251912496016', CAST(0x0000A42701732151 AS DateTime), N'')
INSERT [dbo].[ServiceRequests] ([ServiceRequestID], [ServiceCodeID], [RequestFromNumber], [RequestTime], [RequestFromName]) VALUES (39, 2, N'+251912496016', CAST(0x0000A42701744C7A AS DateTime), N'SIBHAT L. SOLOMON')
INSERT [dbo].[ServiceRequests] ([ServiceRequestID], [ServiceCodeID], [RequestFromNumber], [RequestTime], [RequestFromName]) VALUES (40, 8, N'+251912496016', CAST(0x0000A4270175EC51 AS DateTime), N'SIBHAT L. SOLOMON')
INSERT [dbo].[ServiceRequests] ([ServiceRequestID], [ServiceCodeID], [RequestFromNumber], [RequestTime], [RequestFromName]) VALUES (41, 7, N'+251912496016', CAST(0x0000A427017653C3 AS DateTime), N'SIBHAT L. SOLOMON')
SET IDENTITY_INSERT [dbo].[ServiceRequests] OFF
SET IDENTITY_INSERT [dbo].[Surveys] ON 

INSERT [dbo].[Surveys] ([SurveyId], [StartDate], [EndDate], [Status], [SurveyName], [Description]) VALUES (7019, CAST(0x0000A42300000000 AS DateTime), CAST(0x0000A42400000000 AS DateTime), 2, N'Survey', NULL)
INSERT [dbo].[Surveys] ([SurveyId], [StartDate], [EndDate], [Status], [SurveyName], [Description]) VALUES (7020, CAST(0x0000A42700000000 AS DateTime), CAST(0x0000A42900000000 AS DateTime), 2, N'Test', NULL)
INSERT [dbo].[Surveys] ([SurveyId], [StartDate], [EndDate], [Status], [SurveyName], [Description]) VALUES (7021, CAST(0x0000A42700000000 AS DateTime), CAST(0x0000A42A00000000 AS DateTime), 2, N'TEST 2', NULL)
INSERT [dbo].[Surveys] ([SurveyId], [StartDate], [EndDate], [Status], [SurveyName], [Description]) VALUES (7022, CAST(0x0000A42700000000 AS DateTime), CAST(0x0000A42800000000 AS DateTime), 2, N'TEST 3', N'Hello')
INSERT [dbo].[Surveys] ([SurveyId], [StartDate], [EndDate], [Status], [SurveyName], [Description]) VALUES (7023, CAST(0x0000A42700000000 AS DateTime), CAST(0x0000A42800000000 AS DateTime), 4, N'Hello Survey', NULL)
INSERT [dbo].[Surveys] ([SurveyId], [StartDate], [EndDate], [Status], [SurveyName], [Description]) VALUES (7024, CAST(0x0000A42700000000 AS DateTime), CAST(0x0000A42900000000 AS DateTime), 1, N'Neqefeta', N'NErerewrew rwerjwerw erwerwe rwer wer ewrw e')
SET IDENTITY_INSERT [dbo].[Surveys] OFF
SET IDENTITY_INSERT [dbo].[SurveyStatus] ON 

INSERT [dbo].[SurveyStatus] ([SurveyStatusID], [Description]) VALUES (1, N'Active')
INSERT [dbo].[SurveyStatus] ([SurveyStatusID], [Description]) VALUES (2, N'Completed')
INSERT [dbo].[SurveyStatus] ([SurveyStatusID], [Description]) VALUES (3, N'Draft')
INSERT [dbo].[SurveyStatus] ([SurveyStatusID], [Description]) VALUES (4, N'Paused')
SET IDENTITY_INSERT [dbo].[SurveyStatus] OFF
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7019, 1)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7019, 2)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7019, 3)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7020, 1)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7020, 2)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7021, 1)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7021, 2)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7022, 1)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7022, 2)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7023, 1)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7023, 1004)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7024, 2)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7024, 1003)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7024, 1004)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7024, 1005)
INSERT [dbo].[SurveyUsers] ([Survey_SurveyId], [Users_UserId]) VALUES (7024, 1008)
SET IDENTITY_INSERT [dbo].[UserGroups] ON 

INSERT [dbo].[UserGroups] ([UserGroupID], [UserID], [GroupID], [RoleID]) VALUES (2028, 2, 7009, 2)
INSERT [dbo].[UserGroups] ([UserGroupID], [UserID], [GroupID], [RoleID]) VALUES (2029, 2, 8015, 1)
INSERT [dbo].[UserGroups] ([UserGroupID], [UserID], [GroupID], [RoleID]) VALUES (2032, 1005, 8015, 2)
INSERT [dbo].[UserGroups] ([UserGroupID], [UserID], [GroupID], [RoleID]) VALUES (2033, 1008, 8015, 2)
INSERT [dbo].[UserGroups] ([UserGroupID], [UserID], [GroupID], [RoleID]) VALUES (2034, 1010, 7009, 2)
INSERT [dbo].[UserGroups] ([UserGroupID], [UserID], [GroupID], [RoleID]) VALUES (2035, 1010, 7011, 2)
INSERT [dbo].[UserGroups] ([UserGroupID], [UserID], [GroupID], [RoleID]) VALUES (2036, 1004, 7009, 2)
INSERT [dbo].[UserGroups] ([UserGroupID], [UserID], [GroupID], [RoleID]) VALUES (2037, 3, 7009, 2)
INSERT [dbo].[UserGroups] ([UserGroupID], [UserID], [GroupID], [RoleID]) VALUES (2038, 1003, 7009, 2)
SET IDENTITY_INSERT [dbo].[UserGroups] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Status], [Description], [CurrentSurvey]) VALUES (1, N'Robel Tessema', N'+251935932263', 1, NULL, 7023)
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Status], [Description], [CurrentSurvey]) VALUES (2, N'Jeriye', N'+251912655585', 1, NULL, 7024)
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Status], [Description], [CurrentSurvey]) VALUES (3, N'Abisiye', N'+251934235534', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Status], [Description], [CurrentSurvey]) VALUES (1003, N'Ejegayehu Debela', N'+251912545457', 1, NULL, 7024)
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Status], [Description], [CurrentSurvey]) VALUES (1004, N'Mesgana Amenu', N'+251914521114', 1, NULL, 7024)
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Status], [Description], [CurrentSurvey]) VALUES (1005, N'Tarik Desta', N'+251914552789', 1, NULL, 7024)
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Status], [Description], [CurrentSurvey]) VALUES (1006, N'Ashenafi Tesfaye', N'+251954588754', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Status], [Description], [CurrentSurvey]) VALUES (1008, N'Miheret Fikru', N'+251912578445', 1, NULL, 7024)
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Status], [Description], [CurrentSurvey]) VALUES (1010, N'SIBHAT L. SOLOMON', N'+251912496016', 1, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Status], [Description], [CurrentSurvey]) VALUES (1011, N'Sebsibe', N'+251910812708', 1, N'GC ', NULL)
INSERT [dbo].[Users] ([UserId], [Name], [PhoneNumber], [Status], [Description], [CurrentSurvey]) VALUES (1012, N'Sintayehu', N'+251911087856', 2, N'GC', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UsersStatus] ON 

INSERT [dbo].[UsersStatus] ([UsersStatusId], [Description]) VALUES (1, N'Approved')
INSERT [dbo].[UsersStatus] ([UsersStatusId], [Description]) VALUES (2, N'Disabled')
INSERT [dbo].[UsersStatus] ([UsersStatusId], [Description]) VALUES (3, N'Requested')
SET IDENTITY_INSERT [dbo].[UsersStatus] OFF
/****** Object:  Index [PK_SurveyUsers]    Script Date: 1/28/2015 1:05:38 PM ******/
ALTER TABLE [dbo].[SurveyUsers] ADD  CONSTRAINT [PK_SurveyUsers] PRIMARY KEY NONCLUSTERED 
(
	[Survey_SurveyId] ASC,
	[Users_UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF)
GO
ALTER TABLE [dbo].[Resolution] ADD  CONSTRAINT [DF_Resolution_Resolved]  DEFAULT ((0)) FOR [Resolved]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_PossibleAnswers] FOREIGN KEY([AnswerType])
REFERENCES [dbo].[PossibleAnswers] ([PossibleAnswerID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_PossibleAnswers]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_QuestionAnswer] FOREIGN KEY([Question_QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_QuestionAnswer]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_UsersAnswer] FOREIGN KEY([User_UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_UsersAnswer]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_MessageStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[MessageStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_MessageStatus]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users]
GO
ALTER TABLE [dbo].[QuestionPool]  WITH CHECK ADD  CONSTRAINT [FK_QuestionPool_QAType] FOREIGN KEY([Type])
REFERENCES [dbo].[QAType] ([TypeId])
GO
ALTER TABLE [dbo].[QuestionPool] CHECK CONSTRAINT [FK_QuestionPool_QAType]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_QAType] FOREIGN KEY([QuestionType])
REFERENCES [dbo].[QAType] ([TypeId])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_QAType]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_SurveyQuestion] FOREIGN KEY([Survey_SurveyId])
REFERENCES [dbo].[Surveys] ([SurveyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_SurveyQuestion]
GO
ALTER TABLE [dbo].[Resolution]  WITH CHECK ADD  CONSTRAINT [FK_Resolution_Surveys] FOREIGN KEY([SurveyID])
REFERENCES [dbo].[Surveys] ([SurveyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Resolution] CHECK CONSTRAINT [FK_Resolution_Surveys]
GO
ALTER TABLE [dbo].[Resolution]  WITH CHECK ADD  CONSTRAINT [FK_Resolution_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Resolution] CHECK CONSTRAINT [FK_Resolution_Users]
GO
ALTER TABLE [dbo].[ServiceRequests]  WITH CHECK ADD  CONSTRAINT [FK_ServiceRequests_ServiceCodes] FOREIGN KEY([ServiceCodeID])
REFERENCES [dbo].[ServiceCodes] ([ServiceCodeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceRequests] CHECK CONSTRAINT [FK_ServiceRequests_ServiceCodes]
GO
ALTER TABLE [dbo].[Surveys]  WITH CHECK ADD  CONSTRAINT [FK_Surveys_SurveyStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[SurveyStatus] ([SurveyStatusID])
GO
ALTER TABLE [dbo].[Surveys] CHECK CONSTRAINT [FK_Surveys_SurveyStatus]
GO
ALTER TABLE [dbo].[SurveyUsers]  WITH CHECK ADD  CONSTRAINT [FK_SurveyUsers_Survey] FOREIGN KEY([Survey_SurveyId])
REFERENCES [dbo].[Surveys] ([SurveyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SurveyUsers] CHECK CONSTRAINT [FK_SurveyUsers_Survey]
GO
ALTER TABLE [dbo].[SurveyUsers]  WITH CHECK ADD  CONSTRAINT [FK_SurveyUsers_Users] FOREIGN KEY([Users_UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SurveyUsers] CHECK CONSTRAINT [FK_SurveyUsers_Users]
GO
ALTER TABLE [dbo].[UserGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserGroups_GroupRole1] FOREIGN KEY([RoleID])
REFERENCES [dbo].[GroupRole] ([groupRoleID])
GO
ALTER TABLE [dbo].[UserGroups] CHECK CONSTRAINT [FK_UserGroups_GroupRole1]
GO
ALTER TABLE [dbo].[UserGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserGroups_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserGroups] CHECK CONSTRAINT [FK_UserGroups_Groups]
GO
ALTER TABLE [dbo].[UserGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserGroups_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserGroups] CHECK CONSTRAINT [FK_UserGroups_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Surveys] FOREIGN KEY([CurrentSurvey])
REFERENCES [dbo].[Surveys] ([SurveyId])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Surveys]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UsersStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[UsersStatus] ([UsersStatusId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UsersStatus]
GO
