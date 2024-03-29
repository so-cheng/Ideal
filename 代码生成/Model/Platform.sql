
/*==============================================================*/
/* Table: Company_Dept                                          */
/*==============================================================*/
create table Ideal_CompanyDept 
(
   FlowID               varchar(50)                    not null,
   CompanyID            varchar(50)                    null,
   DeptID               varchar(50)                    null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_COMPANYDEPT primary key clustered (FlowID)
);


/*==============================================================*/
/* Table: Ideal_Company                                         */
/*==============================================================*/
create table Ideal_Company 
(
   CompanyID            varchar(50)                    not null,
   CompanyCode          varchar(50)                    null,
   CompanyName          nvarchar(100)                  null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null
);

/*==============================================================*/
/* Table: Ideal_Dict                                            */
/*==============================================================*/
create table Ideal_Dict 
(
   DictKey              nvarchar(50)                   not null,
   DictValue            nvarchar(100)                  null,
   DictType             nvarchar(50)                   null,
   ParentDictKey        nvarchar(50)                   null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_DICT primary key clustered (DictKey)
);

/*==============================================================*/
/* Table: Ideal_FlowInstance                                    */
/*==============================================================*/
create table Ideal_FlowInstance 
(
   FlowInstanceID       varchar(50)                    not null,
   FlowTemplateID       varchar(50)                    null,
   FlowStatus           numeric(6,0)                   null,
   FlowApplicant        varchar(50)                    null,
   FlowApplicantCompanyID varchar(50)                    null,
   FlowApplicantDeptID  varchar(50)                    null,
   FlowType             numeric(6,0)                   null,
   FlowStarTime         datetime                       null,
   FlowEndTime          datetime                       null,
   SystemID             varchar(50)                    not null,
   FlowNote             nvarchar(500)                  null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_FLOWINSTANCE primary key clustered (FlowInstanceID)
);

/*==============================================================*/
/* Table: Ideal_FlowStepInstance                                */
/*==============================================================*/
create table Ideal_FlowStepInstance 
(
   FlowStepInstanceID   varchar(50)                    not null,
   FlowInstanceID       varchar(50)                    null,
   StepID               varchar(50)                    null,
   StepType             numeric(6,0)                   null,
   StepNo               numeric(6,0)                   null,
   StepStatus           numeric(6,0)                   null,
   PostID               varchar(50)                    null,
   DeptID               varchar(50)                    null,
   AuditorID            varchar(50)                    null,
   AuditNote            nvarchar(100)                  null,
   AuditTime            datetime                       null,
   StepName             nvarchar(100)                  null,
   StepStartPersonID    varchar(50)                    null,
   StepStartTime        datetime                       null,
   IsSkip               char(1)                        null,
   Attachment           nvarchar(1000)                 null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_FLOWSTEPINSTANCE primary key clustered (FlowStepInstanceID)
);

/*==============================================================*/
/* Table: Ideal_FlowTemplate                                    */
/*==============================================================*/
create table Ideal_FlowTemplate 
(
   FlowTemplateID       varchar(50)                    not null,
   FlowTemplateName     nvarchar(50)                   null,
   FlowTemplateType     int                            null,
   System               nvarchar(50)                   null,
   IsHistory            char(1)                        null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_FLOWTEMPLATE primary key clustered (FlowTemplateID)
);

/*==============================================================*/
/* Table: Ideal_Menu                                            */
/*==============================================================*/
create table Ideal_Menu 
(
   MenuID               varchar(50)                    not null,
   SystemID             varchar(50)                    null,
   MenuName             nvarchar(50)                   null,
   MenuURL              nvarchar(300)                  null,
   ParentMenuID         varchar(50)                    null,
   Icon                 nvarchar(50)                   null,
   MenuSort             numeric(6,0)                   null,
   IsDisplay            char(1)                        null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_MENU primary key (MenuID)
);

/*==============================================================*/
/* Table: Ideal_Post                                            */
/*==============================================================*/
create table Ideal_Post 
(
   PostID               varchar(50)                    not null,
   ParentPostID         varchar(50)                    null,
   PostCode             varchar(50)                    null,
   DeptID               varchar(50)                    null,
   PostName             nvarchar(50)                   null,
   PostDesc             nvarchar(200)                  null,
   PostSalary           numeric(10,2)                  null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_POST primary key clustered (PostID)
);

/*==============================================================*/
/* Table: Ideal_Role                                            */
/*==============================================================*/
create table Ideal_Role 
(
   RoleID               varchar(50)                    not null,
   RoleName             nvarchar(50)                   null,
   Note                 varchar(50)                    null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_ROLE primary key (RoleID)
);

/*==============================================================*/
/* Table: Ideal_RoleMenu                                        */
/*==============================================================*/
create table Ideal_RoleMenu 
(
   FlowID               varchar(50)                    not null,
   RoleID               varchar(50)                    null,
   MenuID               varchar(50)                    null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_ROLEMENU primary key (FlowID)
);

/*==============================================================*/
/* Table: Ideal_RoleSystem                                      */
/*==============================================================*/
create table Ideal_RoleSystem 
(
   FlowID               varchar(50)                    not null,
   RoleID               varchar(50)                    null,
   SystemID             varchar(50)                    null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_ROLESYSTEM primary key (FlowID)
);

/*==============================================================*/
/* Table: Ideal_StepTemplate                                    */
/*==============================================================*/
create table Ideal_StepTemplate 
(
   StepID               varchar(50)                    not null,
   StepName             nvarchar(50)                   null,
   FlowTemplateID       varchar(50)                    null,
   StepType             numeric(6,0)                   null,
   DeptID               varchar(50)                    null,
   DeptVerifyPersonID   varchar(50)                    null,
   PostID               varchar(50)                    null,
   StepNo               numeric(6,0)                   null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_STEPTEMPLATE primary key clustered (StepID)
);

/*==============================================================*/
/* Table: Ideal_System                                          */
/*==============================================================*/
create table Ideal_System 
(
   SystemID             varchar(50)                    not null,
   SystemName           nvarchar(50)                   null,
   CallbackUrl          varchar(500)                   null,
   CompanyID            varchar(1000)                  null,
   Sort                 int                            null,
   Note                 nvarchar(50)                   null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null
);

/*==============================================================*/
/* Table: Ideal_User                                            */
/*==============================================================*/
create table Ideal_User 
(
   UserID               varchar(50)                    not null,
   UserCode             varchar(50)                    not null,
   UserName             nvarchar(50)                   null,
   DeptID               varchar(50)                    null,
   UserIDCard           nvarchar(20)                   null,
   Sex                  char(1)                        null,
   Email                nvarchar(200)                  null,
   Phone                varchar(50)                    null,
   PoliticalStatus      numeric(4,0)                   null,
   Address              nvarchar(100)                  null,
   QQ                   varchar(50)                    null,
   WeChat               varchar(50)                    null,
   Birthday             varchar(50)                    null,
   Education            numeric(4,0)                   null,
   AccumulationFundID   varchar(50)                    null,
   SocialSecurity       varchar(50)                    null,
   SalaryID             varchar(50)                    null,
   CheckType            varchar(50)                    null,
   HeadImg              varchar(max)                   null,
   UserStatus           numeric(4, 0)                  null,
   IDCardType           numeric(4, 0)                  null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_USER primary key clustered (UserID)
);

/*==============================================================*/
/* Table: Ideal_UserPost                                        */
/*==============================================================*/
create table Ideal_UserPost 
(
   FlowID               varchar(50)                    not null,
   UserID               varchar(50)                    null,
   PostID               varchar(50)                    null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEAL_USERPOST primary key clustered (FlowID)
);

/*==============================================================*/
/* Table: Ideal_Account                                          */
/*==============================================================*/
create table Ideal_Account 
(
   AccountName          varchar(50)                    not null,
   RoleID               varchar(50)                    null,
   Password             varchar(50)                    null,
   UserID               varchar(50)                    null,
   AccountStatus        numeric(4,0)                   null,
   AccountLevel         numeric(4,0)                   null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IDEL_ACCOUNT primary key (AccountName)
);


/*==============================================================*/
/* Table: Iedal_Dept                                            */
/*==============================================================*/
create table Iedal_Dept 
(
   DeptID               varchar(50)                    not null,
   DeptName             nvarchar(50)                   null,
   DeptCode             nvarchar(50)                   null,
   DeptType             nvarchar(50)                   null,
   ParentDeptID         varchar(50)                    null,
   Sort                 numeric(6, 0)                  null,
   Landline             varchar(50)                    null,
   CreateTime           date                           null,
   Creator           varchar(50)                    null,
   constraint PK_IEDAL_DEPT primary key clustered (DeptID)
);

create table Ideal_WeChatUser 
(
   OpenID               varchar(50)                    not null,
   AccountName          varchar(50)                    null,
   CreateTime           date                           null,
   Creator              varchar(50)                    null,
   constraint PK_IDEAL_WECHATUSER primary key clustered (OpenID)
);

create table Shop_Order 
(
   OrderID              varchar(50)                    not null,
   Name                 char(10)                       null,
   Phone                char(11)                       null,
   Address              char(100)                      null,
   TrackingNum          varchar(50)                    null,
   ShippingStatus       char(1)                        null,
   SignStatus           char(1)                        null,
   ProductName          char(100)                      null,
   ProductPrice         numeric(10,2)                  null,
   Freight              numeric(5,2)                   null,
   ShippingTime         datetime                       null,
   IsReturn             char(1)                        null,
   Creator              varchar(50)                    null,
   CreateTime           date                           null,
   constraint PK_SHOP_ORDER primary key clustered (OrderID)
);

create table Shop_Client 
(
   ClientID             varchar(50)                    not null,
   Name                 char(10)                       null,
   Phone                char(11)                       null,
   Creator              varchar(50)                    null,
   CreateTime           date                           null,
   constraint PK_SHOP_CLIENT primary key clustered (ClientID)
);

create table Ideal_SystemConfig 
(
   SystemConfigID       varchar(50)                    not null,
   SystemName           varchar(50)                    null,
   Title                nvarchar(100)                  null,
   Intro                nvarchar(200)                  null,
   VersionNumber        varchar(50)                    null,
   SystemImage          varchar(max)                   null,
   CreateTime           date                           null,
   Creator              varchar(50)                    null
);