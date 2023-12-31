USE [ideal_database]
GO
/****** Object:  Table [dbo].[Ideal_Account]    Script Date: 2023/12/5 17:10:38 ******/
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
/****** Object:  Table [dbo].[Ideal_DB]    Script Date: 2023/12/5 17:10:38 ******/
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
/****** Object:  Table [dbo].[Ideal_Dept]    Script Date: 2023/12/5 17:10:38 ******/
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
/****** Object:  Table [dbo].[Ideal_Dict]    Script Date: 2023/12/5 17:10:38 ******/
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
/****** Object:  Table [dbo].[Ideal_FlowInstance]    Script Date: 2023/12/5 17:10:38 ******/
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
/****** Object:  Table [dbo].[Ideal_FlowStepInstance]    Script Date: 2023/12/5 17:10:38 ******/
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
/****** Object:  Table [dbo].[Ideal_FlowTemplate]    Script Date: 2023/12/5 17:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_FlowTemplate](
	[FlowTemplateID] [varchar](50) NOT NULL,
	[FlowTemplateName] [nvarchar](50) NULL,
	[FlowTemplateType] [char](1) NULL,
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
/****** Object:  Table [dbo].[Ideal_Log]    Script Date: 2023/12/5 17:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_Log](
	[LogID] [varchar](50) NOT NULL,
	[Type] [char](1) NULL,
	[IP] [varchar](50) NULL,
	[LogName] [nvarchar](50) NULL,
	[PostInterface] [varchar](500) NULL,
	[PostType] [varchar](10) NULL,
	[StatusCode] [varchar](10) NULL,
	[Detail] [nvarchar](500) NULL,
	[Creator] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Ideal_Log] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_Menu]    Script Date: 2023/12/5 17:10:38 ******/
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
/****** Object:  Table [dbo].[Ideal_Role]    Script Date: 2023/12/5 17:10:38 ******/
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
/****** Object:  Table [dbo].[Ideal_RoleMenu]    Script Date: 2023/12/5 17:10:38 ******/
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
/****** Object:  Table [dbo].[Ideal_StepCondition]    Script Date: 2023/12/5 17:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_StepCondition](
	[StepConditionID] [varchar](50) NOT NULL,
	[StepID] [varchar](50) NULL,
	[Label] [nvarchar](50) NULL,
	[Field] [varchar](50) NULL,
	[Operator] [varchar](20) NULL,
	[Value] [nvarchar](100) NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_StepCondition] PRIMARY KEY CLUSTERED 
(
	[StepConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_StepDept]    Script Date: 2023/12/5 17:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_StepDept](
	[StepDeptFolwID] [varchar](50) NOT NULL,
	[StepID] [varchar](50) NULL,
	[DeptID] [varchar](50) NULL,
	[Sort] [int] NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_Ideal_StepDept] PRIMARY KEY CLUSTERED 
(
	[StepDeptFolwID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_StepTemplate]    Script Date: 2023/12/5 17:10:38 ******/
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
	[SetType] [char](1) NULL,
	[Type] [char](1) NULL,
	[ParentStepID] [varchar](50) NULL,
	[StepNo] [numeric](6, 0) NULL,
	[ConditionMode] [char](1) NULL,
	[ExamineMode] [char](1) NULL,
	[PriorityLevel] [char](1) NULL,
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
/****** Object:  Table [dbo].[Ideal_StepUser]    Script Date: 2023/12/5 17:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ideal_StepUser](
	[StepUserFolwID] [varchar](50) NOT NULL,
	[StepID] [varchar](50) NULL,
	[UserID] [varchar](50) NULL,
	[Sort] [int] NULL,
	[CreateTime] [datetime] NULL,
	[Creator] [varchar](50) NULL,
 CONSTRAINT [PK_Ideal_StepUser] PRIMARY KEY CLUSTERED 
(
	[StepUserFolwID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ideal_System]    Script Date: 2023/12/5 17:10:38 ******/
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
/****** Object:  Table [dbo].[Ideal_User]    Script Date: 2023/12/5 17:10:38 ******/
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
/****** Object:  Table [dbo].[Ideal_WeChatUser]    Script Date: 2023/12/5 17:10:38 ******/
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
INSERT [dbo].[Ideal_Account] ([AccountName], [RoleID], [Password], [UserID], [AccountStatus], [AccountLevel], [CreateTime], [Creator]) VALUES (N'zhangsan', N'admin', N'831514BA37BDB6F5', N'4249155292758319104', CAST(0 AS Numeric(4, 0)), CAST(0 AS Numeric(4, 0)), CAST(N'2023-11-26 10:26:08.000' AS DateTime), N'')
INSERT [dbo].[Ideal_DB] ([DBID], [DBName], [ConnectionString], [Creator], [CreateTime]) VALUES (N'4244510235153440768', N'管理系统', N'Data Source=.;Initial Catalog=ideal_database;Persist Security Info=True;User ID=sa;Password=111111', N'admin', CAST(N'2023-11-13 14:48:20.000' AS DateTime))
INSERT [dbo].[Ideal_Dept] ([DeptID], [DeptName], [DeptCode], [DeptType], [ParentDeptID], [Sort], [Landline], [CreateTime], [Creator]) VALUES (N'4249151131543183360', N'研发中心', N'YF001', N'成本', N'', CAST(0 AS Numeric(6, 0)), N'123456', CAST(N'2023-11-26 10:09:36.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Dept] ([DeptID], [DeptName], [DeptCode], [DeptType], [ParentDeptID], [Sort], [Landline], [CreateTime], [Creator]) VALUES (N'4249151258303438848', N'开发部', N'KF001', N'成本', N'4249151131543183360', CAST(1 AS Numeric(6, 0)), N'46547589', CAST(N'2023-11-26 10:10:06.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Dept] ([DeptID], [DeptName], [DeptCode], [DeptType], [ParentDeptID], [Sort], [Landline], [CreateTime], [Creator]) VALUES (N'4249151353442836480', N'行政人事', N'XZ001', N'管理', N'', CAST(3 AS Numeric(6, 0)), N'1235465', CAST(N'2023-11-26 10:10:29.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Dept] ([DeptID], [DeptName], [DeptCode], [DeptType], [ParentDeptID], [Sort], [Landline], [CreateTime], [Creator]) VALUES (N'4249151467288829952', N'招聘', N'ZP001', N'管理', N'4249151353442836480', CAST(4 AS Numeric(6, 0)), N'675675', CAST(N'2023-11-26 10:10:56.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Log] ([LogID], [Type], [IP], [LogName], [PostInterface], [PostType], [StatusCode], [Detail], [Creator], [CreateTime]) VALUES (N'12313354353', N'1', N'192.168.1.1', N'登录日志', N'/Login/Login', N'post', N'200', N'登录成功', N'4249155292758319104', CAST(N'2023-08-08 00:00:00.000' AS DateTime))
INSERT [dbo].[Ideal_Log] ([LogID], [Type], [IP], [LogName], [PostInterface], [PostType], [StatusCode], [Detail], [Creator], [CreateTime]) VALUES (N'4252496115059171328', N'1', N'192.168.30.87', N'系统登录', N'/Login/login', N'POST', N'500', N'登录成功！', N'', CAST(N'2023-12-05 15:41:22.000' AS DateTime))
INSERT [dbo].[Ideal_Log] ([LogID], [Type], [IP], [LogName], [PostInterface], [PostType], [StatusCode], [Detail], [Creator], [CreateTime]) VALUES (N'4252496975470305280', N'1', N'192.168.30.87', N'系统登录', N'/Login/login', N'POST', N'500', N'登录成功！', N'admin', CAST(N'2023-12-05 15:44:47.000' AS DateTime))
INSERT [dbo].[Ideal_Log] ([LogID], [Type], [IP], [LogName], [PostInterface], [PostType], [StatusCode], [Detail], [Creator], [CreateTime]) VALUES (N'4252497212364595200', N'1', N'192.168.30.87', N'系统登录', N'/Login/login', N'POST', N'500', N'用户名或密码错误！', N'', CAST(N'2023-12-05 15:45:44.000' AS DateTime))
INSERT [dbo].[Ideal_Log] ([LogID], [Type], [IP], [LogName], [PostInterface], [PostType], [StatusCode], [Detail], [Creator], [CreateTime]) VALUES (N'4252497227581530112', N'1', N'192.168.30.87', N'系统登录', N'/Login/login', N'POST', N'500', N'登录成功！', N'admin', CAST(N'2023-12-05 15:45:47.000' AS DateTime))
INSERT [dbo].[Ideal_Log] ([LogID], [Type], [IP], [LogName], [PostInterface], [PostType], [StatusCode], [Detail], [Creator], [CreateTime]) VALUES (N'4252498060666773504', N'1', N'192.168.30.87', N'系统登录', N'/Login/login', N'POST', N'20', N'登录成功！', N'admin', CAST(N'2023-12-05 15:49:06.000' AS DateTime))
INSERT [dbo].[Ideal_Log] ([LogID], [Type], [IP], [LogName], [PostInterface], [PostType], [StatusCode], [Detail], [Creator], [CreateTime]) VALUES (N'4252501520896270336', N'1', N'192.168.30.87', N'系统错误', N'/Login/login', N'POST', N'500', N'Object reference not set to an instance of an object.', N'', CAST(N'2023-12-05 16:02:51.000' AS DateTime))
INSERT [dbo].[Ideal_Log] ([LogID], [Type], [IP], [LogName], [PostInterface], [PostType], [StatusCode], [Detail], [Creator], [CreateTime]) VALUES (N'4252501559278346240', N'1', N'192.168.30.87', N'系统登录', N'/Login/login', N'POST', N'20', N'登录成功！', N'admin', CAST(N'2023-12-05 16:03:00.000' AS DateTime))
INSERT [dbo].[Ideal_Log] ([LogID], [Type], [IP], [LogName], [PostInterface], [PostType], [StatusCode], [Detail], [Creator], [CreateTime]) VALUES (N'4252501753420095488', N'5', N'192.168.30.87', N'系统错误', N'/Login/login', N'POST', N'500', N'Object reference not set to an instance of an object.', N'', CAST(N'2023-12-05 16:03:43.000' AS DateTime))
INSERT [dbo].[Ideal_Log] ([LogID], [Type], [IP], [LogName], [PostInterface], [PostType], [StatusCode], [Detail], [Creator], [CreateTime]) VALUES (N'4252501788715163648', N'1', N'192.168.30.87', N'系统登录', N'/Login/login', N'POST', N'20', N'登录成功！', N'admin', CAST(N'2023-12-05 16:03:55.000' AS DateTime))
INSERT [dbo].[Ideal_Log] ([LogID], [Type], [IP], [LogName], [PostInterface], [PostType], [StatusCode], [Detail], [Creator], [CreateTime]) VALUES (N'4252502258049392640', N'5', N'192.168.30.87', N'系统错误', N'/Login/login', N'POST', N'500', N'Object reference not set to an instance of an object.', N'', CAST(N'2023-12-05 16:04:27.000' AS DateTime))
INSERT [dbo].[Ideal_Log] ([LogID], [Type], [IP], [LogName], [PostInterface], [PostType], [StatusCode], [Detail], [Creator], [CreateTime]) VALUES (N'4252502317935665152', N'1', N'192.168.30.87', N'系统登录', N'/Login/login', N'POST', N'20', N'登录成功！', N'admin', CAST(N'2023-12-05 16:06:01.000' AS DateTime))
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00001', N'1234567890', N'首页', N'/home', N'', N'el-icon-eleme-filled', CAST(0 AS Numeric(6, 0)), N'home', N'menu', N'', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00002', N'1234567890', N'控制台', N'/dashboard', N'00001', N'el-icon-menu', CAST(0 AS Numeric(6, 0)), N'dashboard', N'menu', N'home', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00003', N'1234567890', N'配置', N'/setting', N'', N'el-icon-setting', CAST(0 AS Numeric(6, 0)), N'setting', N'menu', NULL, N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'00005', N'1234567890', N'菜单管理', N'/setting/menu', N'00003', N'el-icon-fold', CAST(0 AS Numeric(6, 0)), N'menu', N'menu', N'setting/menu', N'y', NULL, NULL)
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4240828902011084800', N'1234567890', N'部门管理', N'/setting/dept', N'00003', N'sc-icon-organization', CAST(4 AS Numeric(6, 0)), N'dept', N'', N'setting/dept', N'y', CAST(N'2023-11-03 00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4241607874584027136', NULL, N'角色管理', N'/setting/role', N'00003', N'el-icon-collection', CAST(2 AS Numeric(6, 0)), N'role', N'', N'setting/role', N'y', CAST(N'2023-11-05 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4241608120760311808', NULL, N'用户管理', N'/setting/user', N'00003', N'el-icon-user-filled', CAST(5 AS Numeric(6, 0)), N'user', N'', N'setting/user', N'y', CAST(N'2023-11-05 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4244517143868383232', NULL, N'数据库', N'/dbManage', N'', N'el-icon-upload-filled', CAST(3 AS Numeric(6, 0)), N'dbManage', N'', N'', N'n', CAST(N'2023-11-13 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4244517805469507584', NULL, N'数据库管理', N'/setting/db', N'4244517143868383232', N'el-icon-promotion', CAST(6 AS Numeric(6, 0)), N'dbManage', N'', N'setting/db', N'y', CAST(N'2023-11-13 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4244520631671234560', NULL, N'表管理', N'/setting/dbtable', N'4244517143868383232', N'el-icon-document-copy', CAST(7 AS Numeric(6, 0)), N'dbtable', N'', N'setting/dbtable', N'y', CAST(N'2023-11-13 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Menu] ([MenuID], [SystemID], [MenuName], [MenuURL], [ParentMenuID], [Icon], [MenuSort], [Name], [Type], [Component], [IsDisplay], [CreateTime], [Creator]) VALUES (N'4252466570092388352', NULL, N'日志管理', N'/setting/log', N'00003', N'el-icon-notebook', CAST(7 AS Numeric(6, 0)), N'log', N'menu', N'setting/log', N'y', CAST(N'2023-12-05 13:43:58.000' AS DateTime), N'admin')
INSERT [dbo].[Ideal_Role] ([RoleID], [RoleName], [Note], [CreateTime], [Creator]) VALUES (N'admin', N'管理员', N'管理员', NULL, NULL)
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4252466600933105664', N'admin', N'00001', CAST(N'2023-12-05 13:44:05.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4252466600933105665', N'admin', N'00002', CAST(N'2023-12-05 13:44:05.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4252466600933105666', N'admin', N'00003', CAST(N'2023-12-05 13:44:05.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4252466600933105667', N'admin', N'00005', CAST(N'2023-12-05 13:44:05.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4252466600933105668', N'admin', N'4240828902011084800', CAST(N'2023-12-05 13:44:05.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4252466600933105669', N'admin', N'4241607874584027136', CAST(N'2023-12-05 13:44:05.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4252466600937299968', N'admin', N'4241608120760311808', CAST(N'2023-12-05 13:44:05.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4252466600937299969', N'admin', N'4252466570092388352', CAST(N'2023-12-05 13:44:05.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4252466600937299970', N'admin', N'4244517143868383232', CAST(N'2023-12-05 13:44:05.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4252466600937299971', N'admin', N'4244517805469507584', CAST(N'2023-12-05 13:44:05.000' AS DateTime), N'')
INSERT [dbo].[Ideal_RoleMenu] ([FlowID], [RoleID], [MenuID], [CreateTime], [Creator]) VALUES (N'4252466600937299972', N'admin', N'4244520631671234560', CAST(N'2023-12-05 13:44:05.000' AS DateTime), N'')
INSERT [dbo].[Ideal_System] ([SystemID], [SystemName], [SystemCode], [CallbackUrl], [CompanyID], [Sort], [Note], [CreateTime], [Creator]) VALUES (N'1234567890', N'系统管理平台', N'Ideal_System', N'http://www.baidu.com', N'1234567890', 0, NULL, NULL, NULL)
INSERT [dbo].[Ideal_System] ([SystemID], [SystemName], [SystemCode], [CallbackUrl], [CompanyID], [Sort], [Note], [CreateTime], [Creator]) VALUES (N'1234536435324', N'记录卡就是迪卢克', N'34234', N'http://www.taobao.com', N'1234567890', 1, N'阿是发顺丰', NULL, NULL)
INSERT [dbo].[Ideal_System] ([SystemID], [SystemName], [SystemCode], [CallbackUrl], [CompanyID], [Sort], [Note], [CreateTime], [Creator]) VALUES (N'4238361983798517760', N'徕卡记录', N'cmmml', N'ADASD', N'4238371162126852096', 0, N'', CAST(N'2023-10-27 00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Ideal_System] ([SystemID], [SystemName], [SystemCode], [CallbackUrl], [CompanyID], [Sort], [Note], [CreateTime], [Creator]) VALUES (N'4238362451538911232', N'Jlnsla', N'123', N'adasdasd', N'4238371162126852096', 0, N'', CAST(N'2023-10-27 00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Ideal_User] ([UserID], [UserCode], [UserName], [DeptID], [UserIDCard], [Sex], [Email], [Phone], [PoliticalStatus], [Address], [QQ], [WeChat], [Birthday], [Education], [AccumulationFund], [SocialSecurity], [Salary], [CheckType], [HeadImg], [UserStatus], [IDCardType], [CreateTime], [Creator]) VALUES (N'4249155292758319104', N'YG001', N'张三', N'4249151258303438848', N'12435456467i68o79809', N' ', N'', N'', N' ', N'', N'', N'', N'', N' ', N'', N'', N'', N'', N'http://192.168.0.101:5098/HeadImg/屏幕截图(1)_4249155170397888512.png', N'0', N'1', CAST(N'2023-11-26 10:26:08.000' AS DateTime), N'admin')
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dept', @level2type=N'COLUMN',@level2name=N'DeptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dept', @level2type=N'COLUMN',@level2name=N'DeptName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dept', @level2type=N'COLUMN',@level2name=N'DeptCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dept', @level2type=N'COLUMN',@level2name=N'DeptType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门父级ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dept', @level2type=N'COLUMN',@level2name=N'ParentDeptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dept', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'座机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dept', @level2type=N'COLUMN',@level2name=N'Landline'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dept', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dept', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dict', @level2type=N'COLUMN',@level2name=N'DictKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dict', @level2type=N'COLUMN',@level2name=N'DictValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dict', @level2type=N'COLUMN',@level2name=N'DictType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典父级Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dict', @level2type=N'COLUMN',@level2name=N'ParentDictKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dict', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dict', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Dict'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流实例表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_FlowInstance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流步骤实例表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_FlowStepInstance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程模板ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_FlowTemplate', @level2type=N'COLUMN',@level2name=N'FlowTemplateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程模板名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_FlowTemplate', @level2type=N'COLUMN',@level2name=N'FlowTemplateName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程模板类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_FlowTemplate', @level2type=N'COLUMN',@level2name=N'FlowTemplateType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_FlowTemplate', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_FlowTemplate', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流模板表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_FlowTemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Log', @level2type=N'COLUMN',@level2name=N'LogID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Log', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求Ip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Log', @level2type=N'COLUMN',@level2name=N'IP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Log', @level2type=N'COLUMN',@level2name=N'LogName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求接口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Log', @level2type=N'COLUMN',@level2name=N'PostInterface'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Log', @level2type=N'COLUMN',@level2name=N'PostType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Log', @level2type=N'COLUMN',@level2name=N'StatusCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详情' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Log', @level2type=N'COLUMN',@level2name=N'Detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Log', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Log', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Log'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Menu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_Role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色菜单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_RoleMenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤条件ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepCondition', @level2type=N'COLUMN',@level2name=N'StepConditionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepCondition', @level2type=N'COLUMN',@level2name=N'StepID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepCondition', @level2type=N'COLUMN',@level2name=N'Label'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条件字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepCondition', @level2type=N'COLUMN',@level2name=N'Field'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'运算符' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepCondition', @level2type=N'COLUMN',@level2name=N'Operator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepCondition', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepCondition', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤审核部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepDept', @level2type=N'COLUMN',@level2name=N'StepDeptFolwID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepDept', @level2type=N'COLUMN',@level2name=N'StepID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepDept', @level2type=N'COLUMN',@level2name=N'DeptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepDept', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepDept', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepDept', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤审核部门' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepDept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程步骤ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate', @level2type=N'COLUMN',@level2name=N'StepID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate', @level2type=N'COLUMN',@level2name=N'StepName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate', @level2type=N'COLUMN',@level2name=N'FlowTemplateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate', @level2type=N'COLUMN',@level2name=N'SetType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级步骤ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate', @level2type=N'COLUMN',@level2name=N'ParentStepID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate', @level2type=N'COLUMN',@level2name=N'StepNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条件关系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate', @level2type=N'COLUMN',@level2name=N'ConditionMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多人审核方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate', @level2type=N'COLUMN',@level2name=N'ExamineMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条件级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate', @level2type=N'COLUMN',@level2name=N'PriorityLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流步骤模板表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepTemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤审核人员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepUser', @level2type=N'COLUMN',@level2name=N'StepUserFolwID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepUser', @level2type=N'COLUMN',@level2name=N'StepID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepUser', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepUser', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepUser', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepUser', @level2type=N'COLUMN',@level2name=N'Creator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤审核人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_StepUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_System'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员微信绑定表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ideal_WeChatUser'
GO
