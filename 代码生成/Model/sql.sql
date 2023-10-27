USE [master]
GO
/****** Object:  Database [ideal_database]    Script Date: 2023/10/27 17:24:25 ******/
CREATE DATABASE [ideal_database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ideal_database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ideal_database.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ideal_database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ideal_database_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ideal_database] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ideal_database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ideal_database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ideal_database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ideal_database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ideal_database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ideal_database] SET ARITHABORT OFF 
GO
ALTER DATABASE [ideal_database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ideal_database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ideal_database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ideal_database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ideal_database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ideal_database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ideal_database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ideal_database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ideal_database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ideal_database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ideal_database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ideal_database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ideal_database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ideal_database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ideal_database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ideal_database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ideal_database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ideal_database] SET RECOVERY FULL 
GO
ALTER DATABASE [ideal_database] SET  MULTI_USER 
GO
ALTER DATABASE [ideal_database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ideal_database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ideal_database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ideal_database] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ideal_database] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ideal_database', N'ON'
GO
USE [ideal_database]
GO
/****** Object:  Table [dbo].[Ideal_Account]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_Account](
	[AccountName] [varchar](50) NOT NULL,
	[RoleID] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[UserID] [varchar](50) NULL,
	[AccountStatus] [numeric](4, 0) NULL,
	[AccountLevel] [numeric](4, 0) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEL_ACCOUNT] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_Company]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_Company](
	[CompanyID] [varchar](50) NOT NULL,
	[CompanyCode] [varchar](50) NULL,
	[CompanyName] [nvarchar](100) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_CompanyDept]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_CompanyDept](
	[FlowID] [varchar](50) NOT NULL,
	[CompanyID] [varchar](50) NULL,
	[DeptID] [varchar](50) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_COMPANYDEPT] PRIMARY KEY CLUSTERED 
(
	[FlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_Dict]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_Dict](
	[DictKey] [nvarchar](50) NOT NULL,
	[DictValue] [nvarchar](100) NULL,
	[DictType] [nvarchar](50) NULL,
	[ParentDictKey] [nvarchar](50) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_DICT] PRIMARY KEY CLUSTERED 
(
	[DictKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_FlowInstance]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_FlowInstance](
	[FlowInstanceID] [varchar](50) NOT NULL,
	[FlowTemplateID] [varchar](50) NULL,
	[FlowStatus] [numeric](6, 0) NULL,
	[FlowApplicant] [varchar](50) NULL,
	[FlowApplicantCompanyID] [varchar](50) NULL,
	[FlowApplicantDeptID] [varchar](50) NULL,
	[FlowType] [numeric](6, 0) NULL,
	[FlowStarTime] [datetime] NULL,
	[FlowEndTime] [datetime] NULL,
	[SystemID] [varchar](50) NOT NULL,
	[FlowNote] [nvarchar](500) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_FLOWINSTANCE] PRIMARY KEY CLUSTERED 
(
	[FlowInstanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_FlowStepInstance]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_FlowStepInstance](
	[FlowStepInstanceID] [varchar](50) NOT NULL,
	[FlowInstanceID] [varchar](50) NULL,
	[StepID] [varchar](50) NULL,
	[StepType] [numeric](6, 0) NULL,
	[StepNo] [numeric](6, 0) NULL,
	[StepStatus] [numeric](6, 0) NULL,
	[PostID] [varchar](50) NULL,
	[DeptID] [varchar](50) NULL,
	[AuditorID] [varchar](50) NULL,
	[AuditNote] [nvarchar](100) NULL,
	[AuditTime] [datetime] NULL,
	[StepName] [nvarchar](100) NULL,
	[StepStartPersonID] [varchar](50) NULL,
	[StepStartTime] [datetime] NULL,
	[IsSkip] [char](1) NULL,
	[Attachment] [nvarchar](1000) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_FLOWSTEPINSTANCE] PRIMARY KEY CLUSTERED 
(
	[FlowStepInstanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_FlowTemplate]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_FlowTemplate](
	[FlowTemplateID] [varchar](50) NOT NULL,
	[FlowTemplateName] [nvarchar](50) NULL,
	[FlowTemplateType] [int] NULL,
	[System] [nvarchar](50) NULL,
	[IsHistory] [char](1) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_FLOWTEMPLATE] PRIMARY KEY CLUSTERED 
(
	[FlowTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_Menu]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_Menu](
	[MenuID] [varchar](50) NOT NULL,
	[SystemID] [varchar](50) NULL,
	[MenuName] [nvarchar](50) NULL,
	[MenuURL] [nvarchar](300) NULL,
	[ParentMenuID] [varchar](50) NULL,
	[Icon] [nvarchar](50) NULL,
	[MenuSort] [numeric](6, 0) NULL,
	[Name] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Component] [varchar](50) NULL,
	[IsDisplay] [char](1) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_MENU] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_Post]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_Post](
	[PostID] [varchar](50) NOT NULL,
	[ParentPostID] [varchar](50) NULL,
	[PostCode] [varchar](50) NULL,
	[DeptID] [varchar](50) NULL,
	[PostName] [nvarchar](50) NULL,
	[PostDesc] [nvarchar](200) NULL,
	[PostSalary] [numeric](10, 2) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_POST] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_Role]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_Role](
	[RoleID] [varchar](50) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Note] [varchar](50) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_ROLE] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_RoleMenu]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_RoleMenu](
	[FlowID] [varchar](50) NOT NULL,
	[RoleID] [varchar](50) NULL,
	[MenuID] [varchar](50) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_ROLEMENU] PRIMARY KEY CLUSTERED 
(
	[FlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_RoleSystem]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_RoleSystem](
	[FlowID] [varchar](50) NOT NULL,
	[RoleID] [varchar](50) NULL,
	[SystemID] [varchar](50) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_ROLESYSTEM] PRIMARY KEY CLUSTERED 
(
	[FlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_StepTemplate]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_StepTemplate](
	[StepID] [varchar](50) NOT NULL,
	[StepName] [nvarchar](50) NULL,
	[FlowTemplateID] [varchar](50) NULL,
	[StepType] [numeric](6, 0) NULL,
	[DeptID] [varchar](50) NULL,
	[DeptVerifyPersonID] [varchar](50) NULL,
	[PostID] [varchar](50) NULL,
	[StepNo] [numeric](6, 0) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_STEPTEMPLATE] PRIMARY KEY CLUSTERED 
(
	[StepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_System]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_System](
	[SystemID] [varchar](50) NOT NULL,
	[SystemName] [nvarchar](50) NULL,
	[SystemCode] [varchar](50) NULL,
	[CallbackUrl] [varchar](500) NULL,
	[CompanyID] [varchar](1000) NULL,
	[Sort] [int] NULL,
	[Note] [nvarchar](50) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_User]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_User](
	[UserID] [varchar](50) NOT NULL,
	[UserCode] [varchar](50) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[DeptID] [varchar](50) NULL,
	[UserIDCard] [nvarchar](20) NULL,
	[Sex] [char](1) NULL,
	[Email] [nvarchar](200) NULL,
	[Phone] [varchar](50) NULL,
	[PoliticalStatus] [numeric](4, 0) NULL,
	[Address] [nvarchar](100) NULL,
	[QQ] [varchar](50) NULL,
	[WeChat] [varchar](50) NULL,
	[Birthday] [varchar](50) NULL,
	[Education] [numeric](4, 0) NULL,
	[AccumulationFundID] [varchar](50) NULL,
	[SocialSecurity] [varchar](50) NULL,
	[SalaryID] [varchar](50) NULL,
	[CheckType] [varchar](50) NULL,
	[HeadImg] [varchar](max) NULL,
	[UserStatus] [numeric](4, 0) NULL,
	[IDCardType] [numeric](4, 0) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_USER] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_UserPost]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_UserPost](
	[FlowID] [varchar](50) NOT NULL,
	[UserID] [varchar](50) NULL,
	[PostID] [varchar](50) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_USERPOST] PRIMARY KEY CLUSTERED 
(
	[FlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_WeChatUser]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_WeChatUser](
	[OpenID] [varchar](50) NOT NULL,
	[AccountName] [varchar](50) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_WECHATUSER] PRIMARY KEY CLUSTERED 
(
	[OpenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Iedal_Dept]    Script Date: 2023/10/27 17:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Iedal_Dept](
	[DeptID] [varchar](50) NOT NULL,
	[DeptName] [nvarchar](50) NULL,
	[DeptCode] [nvarchar](50) NULL,
	[DeptType] [nvarchar](50) NULL,
	[ParentDeptID] [varchar](50) NULL,
	[Sort] [numeric](6, 0) NULL,
	[Landline] [varchar](50) NULL,
	[CreateTime] [date] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IEDAL_DEPT] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Ideal_Account] ([AccountName], [RoleID], [Password], [UserID], [AccountStatus], [AccountLevel], [CreateTime], [Creator]) VALUES (N'admin', N'admin', N'831514BA37BDB6F5', N'admin', CAST(0 AS Numeric(4, 0)), CAST(0 AS Numeric(4, 0)), NULL, NULL)
INSERT [dbo].[Ideal_Company] ([CompanyID], [CompanyCode], [CompanyName], [CreateTime], [Creator]) VALUES (N'1234567890', N'GSGL', N'管理公司', NULL, NULL)
INSERT [dbo].[Ideal_Company] ([CompanyID], [CompanyCode], [CompanyName], [CreateTime], [Creator]) VALUES (N'4238371162126852096', N'asdas111', N'sadaeqwe11', CAST(N'2023-10-27' AS Date), N'')
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00001', N'1234567890', N'首页', N'/home', N'', N'el-icon-eleme-filled', CAST(0 AS Numeric(6, 0)), N'home', N'menu', N'', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00002', N'1234567890', N'控制台', N'/dashboard', N'00001', N'el-icon-menu', CAST(0 AS Numeric(6, 0)), N'dashboard', N'menu', N'home', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00003', N'1234567890', N'配置', N'/setting', N'', N'el-icon-setting', CAST(0 AS Numeric(6, 0)), N'setting', N'menu', NULL, N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00004', N'1234567890', N'系统管理', N'/setting/system', N'00003', N'el-icon-tools', CAST(0 AS Numeric(6, 0)), N'system', N'menu', N'setting/system', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00005', N'1234567890', N'菜单管理', N'/setting/menu', N'00003', N'el-icon-fold', CAST(0 AS Numeric(6, 0)), N'menu', N'menu', N'setting/menu', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00006', N'1234567890', N'公司管理', N'/setting/company', N'00003', N'el-icon-briefcase', CAST(0 AS Numeric(6, 0)), N'company', N'menu', N'setting/company', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Role] ([RoleID], [RoleName], [Note], [CreateTime], [Creator]) VALUES (N'admin', N'管理员', N'管理员', NULL, NULL)
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'123435434213', N'admin', N'00005', NULL, NULL)
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'1234567897', N'admin', N'00001', NULL, NULL)
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'1234567u333', N'admin', N'00006', NULL, NULL)
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'67435241', N'admin', N'00002', NULL, NULL)
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'8756433467867', N'admin', N'00003', NULL, NULL)
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'897675643242', N'admin', N'00004', NULL, NULL)
INSERT [dbo].[Ideal_RoleSystem] ([FlowID], [RoleID], [SystemID], [CreateTime], [Creator]) VALUES (N'34567890123', N'admin', N'1234567890', NULL, NULL)
INSERT [dbo].[Ideal_System] ([SystemID], [SystemName], [SystemCode], [CallbackUrl], [CompanyID], [Sort], [Note], [CreateTime], [Creator]) VALUES (N'1234567890', N'系统管理平台', N'Ideal_System', N'http://www.baidu.com', N'1234567890', 0, NULL, NULL, NULL)
INSERT [dbo].[Ideal_System] ([SystemID], [SystemName], [SystemCode], [CallbackUrl], [CompanyID], [Sort], [Note], [CreateTime], [Creator]) VALUES (N'1234536435324', N'记录卡就是迪卢克', N'34234', N'http://www.taobao.com', N'1234567890', 1, N'阿是发顺丰', NULL, NULL)
INSERT [dbo].[Ideal_System] ([SystemID], [SystemName], [SystemCode], [CallbackUrl], [CompanyID], [Sort], [Note], [CreateTime], [Creator]) VALUES (N'4238361983798517760', N'徕卡记录', N'cmmml', N'ADASD', N'4238371162126852096', 0, N'', CAST(N'2023-10-27' AS Date), N'')
INSERT [dbo].[Ideal_System] ([SystemID], [SystemName], [SystemCode], [CallbackUrl], [CompanyID], [Sort], [Note], [CreateTime], [Creator]) VALUES (N'4238362451538911232', N'Jlnsla', N'123', N'adasdasd', N'4238371162126852096', 0, N'', CAST(N'2023-10-27' AS Date), N'')
INSERT [dbo].[Ideal_User] ([UserID], [UserCode], [UserName], [DeptID], [UserIDCard], [Sex], [Email], [Phone], [PoliticalStatus], [Address], [QQ], [WeChat], [Birthday], [Education], [AccumulationFundID], [SocialSecurity], [SalaryID], [CheckType], [HeadImg], [UserStatus], [IDCardType], [CreateTime], [Creator]) VALUES (N'admin', N'admin', N'管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
USE [master]
GO
ALTER DATABASE [ideal_database] SET  READ_WRITE 
GO
