USE [ideal_database]
GO
/****** Object:  Table [dbo].[Ideal_Account]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEL_ACCOUNT] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_Company]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_Ideal_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_CompanyDept]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_COMPANYDEPT] PRIMARY KEY CLUSTERED 
(
	[FlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_DB]    Script Date: 2023/11/14 17:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_DB](
	[DBID] [varchar](50) NOT NULL,
	[DBName] [nvarchar](50) NULL,
	[ConnectionString] [varchar](200) NULL,
	[Creator] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Ideal_DB] PRIMARY KEY CLUSTERED 
(
	[DBID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_Dept]    Script Date: 2023/11/14 17:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_Dept](
	[DeptID] [varchar](50) NOT NULL,
	[DeptName] [nvarchar](50) NULL,
	[DeptCode] [nvarchar](50) NULL,
	[DeptType] [nvarchar](50) NULL,
	[ParentDeptID] [varchar](50) NULL,
	[Sort] [numeric](6, 0) NULL,
	[Landline] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IEDAL_DEPT] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_Dict]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_DICT] PRIMARY KEY CLUSTERED 
(
	[DictKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_FlowInstance]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_FLOWINSTANCE] PRIMARY KEY CLUSTERED 
(
	[FlowInstanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_FlowStepInstance]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_FLOWSTEPINSTANCE] PRIMARY KEY CLUSTERED 
(
	[FlowStepInstanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_FlowTemplate]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_FLOWTEMPLATE] PRIMARY KEY CLUSTERED 
(
	[FlowTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_Menu]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_MENU] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_Post]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_POST] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_Role]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_ROLE] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_RoleMenu]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_ROLEMENU] PRIMARY KEY CLUSTERED 
(
	[FlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_RoleSystem]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_ROLESYSTEM] PRIMARY KEY CLUSTERED 
(
	[FlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_StepTemplate]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_STEPTEMPLATE] PRIMARY KEY CLUSTERED 
(
	[StepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_System]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_User]    Script Date: 2023/11/14 17:15:40 ******/
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
	[PoliticalStatus] [char](1) NULL,
	[Address] [nvarchar](100) NULL,
	[QQ] [varchar](50) NULL,
	[WeChat] [varchar](50) NULL,
	[Birthday] [varchar](50) NULL,
	[Education] [char](1) NULL,
	[AccumulationFund] [varchar](50) NULL,
	[SocialSecurity] [varchar](50) NULL,
	[Salary] [varchar](50) NULL,
	[CheckType] [varchar](50) NULL,
	[HeadImg] [varchar](max) NULL,
	[UserStatus] [char](1) NULL,
	[IDCardType] [char](1) NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_USER] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_UserPost]    Script Date: 2023/11/14 17:15:40 ******/
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
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_USERPOST] PRIMARY KEY CLUSTERED 
(
	[FlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_WeChatUser]    Script Date: 2023/11/14 17:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_WeChatUser](
	[OpenID] [varchar](50) NOT NULL,
	[AccountName] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_IDEAL_WECHATUSER] PRIMARY KEY CLUSTERED 
(
	[OpenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Ideal_Account] ([AccountName], [RoleID], [Password], [UserID], [AccountStatus], [AccountLevel], [CreateTime], [Creator]) VALUES (N'admin', N'admin', N'831514BA37BDB6F5', N'admin', CAST(0 AS Numeric(4, 0)), CAST(0 AS Numeric(4, 0)), NULL, NULL)
INSERT [dbo].[Ideal_Company] ([CompanyID], [CompanyCode], [CompanyName], [CreateTime], [Creator]) VALUES (N'1234567890', N'GSGL', N'管理公司', NULL, NULL)
INSERT [dbo].[Ideal_Company] ([CompanyID], [CompanyCode], [CompanyName], [CreateTime], [Creator]) VALUES (N'4238371162126852096', N'asdas111', N'sadaeqwe11', CAST(N'2023-10-27 00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Ideal_CompanyDept] ([FlowID], [CompanyID], [DeptID], [CreateTime], [Creator]) VALUES (N'123123132', N'1234567890', N'1231231', NULL, NULL)
INSERT [dbo].[Ideal_CompanyDept] ([FlowID], [CompanyID], [DeptID], [CreateTime], [Creator]) VALUES (N'123453', N'1234567890', N'123453', NULL, NULL)
INSERT [dbo].[Ideal_CompanyDept] ([FlowID], [CompanyID], [DeptID], [CreateTime], [Creator]) VALUES (N'3123122321', N'1234567890', N'645234', NULL, NULL)
INSERT [dbo].[Ideal_CompanyDept] ([FlowID], [CompanyID], [DeptID], [CreateTime], [Creator]) VALUES (N'52341212', N'1234567890', N'123131', NULL, NULL)
INSERT [dbo].[Ideal_DB] ([DBID], [DBName], [ConnectionString], [Creator], [CreateTime]) VALUES (N'4244510235153440768', N'管理系统', N'Data Source=.;Initial Catalog=ideal_database;Persist Security Info=True;User ID=sa;Password=111111', N'admin', CAST(N'2023-11-13 14:48:20.000' AS DateTime))
INSERT [dbo].[Ideal_Dept] ([DeptID], [DeptName], [DeptCode], [DeptType], [ParentDeptID], [Sort], [Landline], [CreateTime], [Creator]) VALUES (N'1231231', N'发开部', N'YF002', N'核算', N'123131', CAST(4 AS Numeric(6, 0)), N'123132131', NULL, NULL)
INSERT [dbo].[Ideal_Dept] ([DeptID], [DeptName], [DeptCode], [DeptType], [ParentDeptID], [Sort], [Landline], [CreateTime], [Creator]) VALUES (N'123131', N'研发中心', N'YF001', N'核算', N'', CAST(3 AS Numeric(6, 0)), N'123132131', CAST(N'2023-11-03 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Ideal_Dept] ([DeptID], [DeptName], [DeptCode], [DeptType], [ParentDeptID], [Sort], [Landline], [CreateTime], [Creator]) VALUES (N'123453', N'行政人事', N'HR001', N'核算', N'', CAST(1 AS Numeric(6, 0)), N'123132131', CAST(N'2023-11-03 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Ideal_Dept] ([DeptID], [DeptName], [DeptCode], [DeptType], [ParentDeptID], [Sort], [Landline], [CreateTime], [Creator]) VALUES (N'645234', N'招聘专员', N'ZP001', N'核算', N'123453', CAST(2 AS Numeric(6, 0)), N'123132131', CAST(N'2023-11-03 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00001', N'1234567890', N'首页', N'/home', N'', N'el-icon-eleme-filled', CAST(0 AS Numeric(6, 0)), N'home', N'menu', N'', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00002', N'1234567890', N'控制台', N'/dashboard', N'00001', N'el-icon-menu', CAST(0 AS Numeric(6, 0)), N'dashboard', N'menu', N'home', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00003', N'1234567890', N'配置', N'/setting', N'', N'el-icon-setting', CAST(0 AS Numeric(6, 0)), N'setting', N'menu', NULL, N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00004', N'1234567890', N'系统管理', N'/setting/system', N'00003', N'el-icon-tools', CAST(0 AS Numeric(6, 0)), N'system', N'menu', N'setting/system', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00005', N'1234567890', N'菜单管理', N'/setting/menu', N'00003', N'el-icon-fold', CAST(0 AS Numeric(6, 0)), N'menu', N'menu', N'setting/menu', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00006', N'1234567890', N'公司管理', N'/setting/company', N'00003', N'el-icon-briefcase', CAST(0 AS Numeric(6, 0)), N'company', N'menu', N'setting/company', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4240828902011084800', N'1234567890', N'部门管理', N'/setting/dept', N'00003', N'sc-icon-organization', CAST(4 AS Numeric(6, 0)), N'dept', N'', N'setting/dept', N'y', CAST(N'2023-11-03 00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4241607874584027136', NULL, N'角色管理', N'/setting/role', N'00003', N'el-icon-collection', CAST(2 AS Numeric(6, 0)), N'role', N'', N'setting/role', N'y', CAST(N'2023-11-05 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4241608120760311808', NULL, N'用户管理', N'/setting/user', N'00003', N'el-icon-user-filled', CAST(5 AS Numeric(6, 0)), N'user', N'', N'setting/user', N'y', CAST(N'2023-11-05 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4244517143868383232', NULL, N'数据库', N'/dbManage', N'', N'el-icon-upload-filled', CAST(3 AS Numeric(6, 0)), N'dbManage', N'', N'', N'n', CAST(N'2023-11-13 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4244517805469507584', NULL, N'数据库管理', N'/setting/db', N'4244517143868383232', N'el-icon-promotion', CAST(6 AS Numeric(6, 0)), N'dbManage', N'', N'setting/db', N'y', CAST(N'2023-11-13 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4244520631671234560', NULL, N'表管理', N'/setting/dbtable', N'4244517143868383232', N'el-icon-document-copy', CAST(7 AS Numeric(6, 0)), N'dbtable', N'', N'setting/dbtable', N'y', CAST(N'2023-11-13 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Role] ([RoleID], [RoleName], [Note], [CreateTime], [Creator]) VALUES (N'4243364808173592576', N'部门经理1', N'部门经理1', CAST(N'2023-11-10 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Role] ([RoleID], [RoleName], [Note], [CreateTime], [Creator]) VALUES (N'admin', N'管理员', N'管理员', NULL, NULL)
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4244901770072203264', N'admin', N'00001', CAST(N'2023-11-14 16:44:09.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4244901770072203265', N'admin', N'00002', CAST(N'2023-11-14 16:44:09.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4244901770072203266', N'admin', N'00003', CAST(N'2023-11-14 16:44:09.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4244901770072203267', N'admin', N'00005', CAST(N'2023-11-14 16:44:09.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4244901770072203268', N'admin', N'00006', CAST(N'2023-11-14 16:44:09.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4244901770072203269', N'admin', N'4240828902011084800', CAST(N'2023-11-14 16:44:09.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4244901770072203270', N'admin', N'4241607874584027136', CAST(N'2023-11-14 16:44:09.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4244901770072203271', N'admin', N'4241608120760311808', CAST(N'2023-11-14 16:44:09.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4244901770076397568', N'admin', N'4244517143868383232', CAST(N'2023-11-14 16:44:09.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4244901770076397569', N'admin', N'4244517805469507584', CAST(N'2023-11-14 16:44:09.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4244901770076397570', N'admin', N'4244520631671234560', CAST(N'2023-11-14 16:44:09.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleSystem] ([FlowID], [RoleID], [SystemID], [CreateTime], [Creator]) VALUES (N'34567890123', N'admin', N'1234567890', NULL, NULL)
INSERT [dbo].[Ideal_System] ([SystemID], [SystemName], [SystemCode], [CallbackUrl], [CompanyID], [Sort], [Note], [CreateTime], [Creator]) VALUES (N'1234567890', N'系统管理平台', N'Ideal_System', N'http://www.baidu.com', N'1234567890', 0, NULL, NULL, NULL)
INSERT [dbo].[Ideal_System] ([SystemID], [SystemName], [SystemCode], [CallbackUrl], [CompanyID], [Sort], [Note], [CreateTime], [Creator]) VALUES (N'1234536435324', N'记录卡就是迪卢克', N'34234', N'http://www.taobao.com', N'1234567890', 1, N'阿是发顺丰', NULL, NULL)
INSERT [dbo].[Ideal_System] ([SystemID], [SystemName], [SystemCode], [CallbackUrl], [CompanyID], [Sort], [Note], [CreateTime], [Creator]) VALUES (N'4238361983798517760', N'徕卡记录', N'cmmml', N'ADASD', N'4238371162126852096', 0, N'', CAST(N'2023-10-27 00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Ideal_System] ([SystemID], [SystemName], [SystemCode], [CallbackUrl], [CompanyID], [Sort], [Note], [CreateTime], [Creator]) VALUES (N'4238362451538911232', N'Jlnsla', N'123', N'adasdasd', N'4238371162126852096', 0, N'', CAST(N'2023-10-27 00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Ideal_User] ([UserID], [UserCode], [UserName], [DeptID], [UserIDCard], [Sex], [Email], [Phone], [PoliticalStatus], [Address], [QQ], [WeChat], [Birthday], [Education], [AccumulationFund], [SocialSecurity], [Salary], [CheckType], [HeadImg], [UserStatus], [IDCardType], [CreateTime], [Creator]) VALUES (N'admin', N'admin', N'管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Account', @level2type=N'COLUMN',@level2name=N'AccountName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Account', @level2type=N'COLUMN',@level2name=N'RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Account', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Account', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Account', @level2type=N'COLUMN',@level2name=N'AccountStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Account', @level2type=N'COLUMN',@level2name=N'AccountLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Account', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Account', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Account'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Company', @level2type=N'COLUMN',@level2name=N'CompanyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Company', @level2type=N'COLUMN',@level2name=N'CompanyCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Company', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Company', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Company', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司部门关联表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_CompanyDept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_DB', @level2type=N'COLUMN',@level2name=N'DBID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_DB', @level2type=N'COLUMN',@level2name=N'DBName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_DB', @level2type=N'COLUMN',@level2name=N'ConnectionString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_DB', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_DB', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库管理表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_DB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dict'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流实例表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_FlowInstance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流步骤实例表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_FlowStepInstance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流模板表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_FlowTemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Post'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色菜单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_RoleMenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色系统表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_RoleSystem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流步骤模板表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_System'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员岗位表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_UserPost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员微信绑定表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_WeChatUser'
GO
