USE [master]
GO
/****** Object:  Database [ScheduleMonitorDb]    Script Date: 4/6/2015 8:32:25 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ScheduleMonitorDb')
BEGIN
CREATE DATABASE [ScheduleMonitorDb] ON  PRIMARY 
( NAME = N'ScheduleMonitorDb.mdf', FILENAME = N'C:\Users\RaviTeja\Desktop\Git\Network-based-scheduler-and-monitoring-system-POC\ScheduleMonitorApp\ScheduleMonitorApp\App_Data\ScheduleMonitorDb.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ScheduleMonitorDb_log.ldf', FILENAME = N'C:\Users\RaviTeja\Desktop\Git\Network-based-scheduler-and-monitoring-system-POC\ScheduleMonitorApp\ScheduleMonitorApp\App_Data\ScheduleMonitorDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ScheduleMonitorDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ScheduleMonitorDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ScheduleMonitorDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ScheduleMonitorDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ScheduleMonitorDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ScheduleMonitorDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ScheduleMonitorDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ScheduleMonitorDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ScheduleMonitorDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ScheduleMonitorDb] SET  MULTI_USER 
GO
ALTER DATABASE [ScheduleMonitorDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ScheduleMonitorDb] SET DB_CHAINING OFF 
GO
/****** Object:  Login [TEJA-PC\RaviTeja]    Script Date: 4/6/2015 8:32:26 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'TEJA-PC\RaviTeja')
CREATE LOGIN [TEJA-PC\RaviTeja] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 4/6/2015 8:32:26 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 4/6/2015 8:32:26 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'Å«Z`¢ÏoûzA_`íÂYüHMl£°°Ú', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 4/6/2015 8:32:26 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'mN¿hªÌ^ûmÃ\7AëÆÞvSódV(±QI', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER AUTHORIZATION ON DATABASE::[ScheduleMonitorDb] TO [TEJA-PC\RaviTeja]
GO
EXEC sys.sp_addsrvrolemember @loginame = N'TEJA-PC\RaviTeja', @rolename = N'sysadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'NT SERVICE\SQLWriter', @rolename = N'sysadmin'
GO
USE [ScheduleMonitorDb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/6/2015 8:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[__MigrationHistory] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/6/2015 8:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[AspNetRoles] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/6/2015 8:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[AspNetUserClaims] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/6/2015 8:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[AspNetUserLogins] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/6/2015 8:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[AspNetUserRoles] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/6/2015 8:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[AspNetUsers] TO  SCHEMA OWNER 
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201504051625307_InitialCreate', N'ScheduleMonitorApp.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F49414EECA9726488DDD16CE3A6E8DC676904D83BE05B4C45D13952855A45C1B45BFAC0FFDA4FE4287BA4B247559692F360218B6349C190ECF0C6F47F9EF9F7FA73F3E78AE718F43467C3A338F2687A681A9ED3B84AE6666C497DFBE317FFCE1EBAFA6EF1CEFC1F89CC99D08396849D9CCBCE33C38B52C66DF610FB18947ECD067FE924F6CDFB390E35BC78787DF5B474716061526E8328CE9C78872E2E1F80FF873EE531B073C42EE95EF6097A5CFE1CD22D66A5C230FB300D978668A274EE4E22B9F12EE87674130491A99C6994B1038B4C0EED23410A53E471CDC3DFD95E1050F7DBA5A04F000B99F1E030C724BE4329C76E3B410EFDAA3C363D123AB6898A9B223C67DAFA7C2A393344456BDF95A8136F3104210DF41B0F9A3E8751CC89979E9E0F8D147DF8500D40D9ECEDD5008CFCCABDCC4190BAE319F640D2789CA8B10D4FDE987BF4FCA1A0F8CCEED0E724801F2C4BF03631EB93C0AF18CE28887C83D303E44B72EB17FC18F9FFCDF319D9D1CDD2E4FDEBC7A8D9C93D7DFE19357E59E425F41AEF2001E7D08FD0087E01B5EE6FD370DABDACEAA37CC9B95DA2451012C417698C6157A788FE98ADF41DE1CBF318D0BF2809DEC490AAE5F29816482463C8CE0CFEBC875D1AD8BF3F756A34DF1B3C12AFC3ADCEAD42AE0D1081AC83418871821905061136EB4393AA929393064D1353041A183A6F116319CDA870A90632E71D6EA94104276EE22E28D9B15B9DAE79E1A97949F1C2B00570AE3024619FF84290E11C7CE07C4390E6931026D29118751181B212F3A58FA8CDC6803A6AED13D59C5F1A8194DC0FA11BBF14B764702059A63CFBE24A217A1EF89A2ABC0702CF165E147A12DBAE0378A7D42E10AF3354B4335D5C6CE9CE79E34DB9B4F4434B731A7C8963F20C660809C9F11BBDB78E62EB01D85008B05475EB0C5E48DD3898D9BBE595EB6A46F96E55D5D7DEFAF086D7735166B74B5906874B524D6D755A1ACDD5321D5E8682ED0E86721A57273AD8218777DFCAA18ABDDFFD2285C95CBA35234EE113CBE274E7DC5A66991098327FD0B70E6D9B68B70AD9BDB365F89D9C68D0F5BE8F42A3F4D0B1D45951A9CD7E36F9E33ADCF2AAB4587D6591FED2A3D337F77971A09B0BACC778964C37C17FF684A8C424A95178313B8C7ACDCEA65EFEC3D63CCB749EC9E6E5A4E7CABF6F81D758C6E85467DD690CEF7579086441C76C0E399F98D14D85633F9324577A451B57064D673F1869E6317736C9CD9C931E41C311B393212217E4EF509A42F0E852DE4CE6170A18E10CAE55C27D42601723BF5A3D6BAE33E4A7897DBA9BF39C701A6C268A7F1EAE280B6AE59B9AD5AE8DA2235B54A30EC8ECE22BDBBA04691EB6AD02405633D68CAA54261446560BF90297563CBC094C6AA8B7DF524BA2B5C762E9A8AEABE215C3EFD8A29756317B87CB2F5B274A6D20533AAF3513568D2DB80F5A0A93AC7D93636B5014D164D30081C860087F22DCFF9AD78891FB86297033EA71B1D96AE77EBF110CA1798570F718A859A72DE90825A552285B6496369F07AA86DD3D84B5976C8D6A8315D2EF650DB16CBA2A0D6949680D0E070BA5E2F0937EFCCEB40EDBC7ECEFBA88E9A54533AAF98358A259D95D400F19ED12A6DC19A83A559CCF558CE697A9422A163A4E4055C49AD52D51801EA8226CDAAA2C7BA62BC00ED0249E51B81E648E9E6B93E339DA6535945ED182CC5DC3642B4B2BD7C3E2D1554202BE102659C214B431A9A5EA1202074552211A54F8C45C2209A7FBBE8CFA9F1121D96CD14D49ADCDBDC12F743B4C2B5B7601A3CBD2021E3E788A35B244E85E68E2789292761CD0491992CCFB3F208665345262D7E4F2FCBB45C8DCADC2CAF06535517D0514F2C29E38B7D0504D4CD0DC1ED422E0A15D7A273DF8D3CAA5FE1EA5B27979BE5F6C91359C3D4AAF92FAD60A5A049CBACEA08741A9F6A5E8C334E7562CEFA43A56E3E78A800C10E8917EE319D4241252AAB3927CC0E894728022F3731742D81BE64E2F79BE58BF6CC10CEBFDCBF782B5B0B5B727A144FBB6BAADEE597B555DF74D758BBB02FABACBDDA3A1ABA8160FF3020E55C7517B3D5841BA156A68B93F1472ED9220E1B3E8D8ECDE47189005756527ADC53574A719394A5CFF7120EE91E717C3824BBF16170D0E8682ACC7548E8CED5F45A6AAC82B2B2165E855E67852A50A9F37ADEC59E006413EBE0FC5C65183CFAAD87C74147767F50D6A2BB53D8FCF855777F2D453FDD16AF55D7D3B6BD6BB7D8F24A45BB69EB2B87B053E58F55A8CFCF4B1EACED9CF6207FED6949EF577D4F2F0FBCB4B5AF8BE4B0CBB7F8B5ADFC34DD56B77F2424EDB31311D3C82A17C0E89171EC4D84C064F1873B7709C4B010B842942C31E30967C63C3E3C3AAE7D60B43F1FFB588C396E8F2F7EAA03B7058633BD47A17D8742994733E083984CE90B0F3DBC1CEB2317FDAAFC49C5A9D8D6F58F95AC4D45DED66A5C9BA03D48636D0F33289C6B8145318F6C033144D4ACD64F6A7A8EB7F48DCDA0A191BFA319A42E9F33EB632CDD515E52073FCCCCBFE286A7C6E56F5FD2B607C64D0825FED43834FEDE0636141B82E7459EEE3D0883C640F64649A91EAD982A18D3DBAC2CEB4ED93DC0330E4777D728A832777B799334DD405D189583BA1B6653C3B5FB500EEC60D2D44E58A54F8B19D59D499A50197641EAD45FC70F640C0E0298E6AC67E32CBCE7CC08DDA712B66B7CEDA28075C6D7DED4AF9ECCCE7D02584A3F1CC62C7D7210D3DDA8A931A639FE1C1D64B5B3C76C6F2AF17134370DCAFF38A758F22927CCE4CC71663AB73E8020593A269FF3A9C9763A63097AB5C6D2336EAD313505ABC9588ACC468BA94CB35935A5AC9D33DB8D32DB6C5B4D236D25D676E2D5365B568FEE2EC9B75A6A5E3F966D3365F729B06BCB232C93D4FAF0441B29A74F85473B1C17DB0EC50699B2C38351A99B9A9BC68D5061E57B3198294BFFC51ECCD78CAC0A15821D44B15D992373994BBAF4B3B9BAE65126523B78B9C21C3930819E859C2C91CDE1B58D198B3F9C4ED947EFBC5BEC5CD29B880711872E63EFD6AD1C3B8A29BFC97ECCF7ADFA3CBD09E24F8FC7E802B849A00BF886BE8D88EBE47E5F288E7A342AC45A223D841763C9C561FCEA31D774EDD38E8AD2F0E54BA04FD80B5C50C66EE802DDE3757C03FCBDC72B643F1687A43A25ED03510DFBF49CA055883C96EA28DAC39F8061C77BF8E17F48F2DD4F69520000, N'6.1.3-40302')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'923ff33f-3848-4939-b213-aba9b59f4d7a', N'admin', N'AJQGX3ftdDzJySS44ak+LHt8L5Few6xKGgx3oyMAgocKWeC5iNZ9vOZo5ZOzZ+VklA==', N'891a92ee-68e9-46b2-ba8c-ef68fec1c690', N'ApplicationUser')
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User_Id]    Script Date: 4/6/2015 8:32:26 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_User_Id')
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[AspNetUserClaims]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 4/6/2015 8:32:26 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 4/6/2015 8:32:26 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 4/6/2015 8:32:26 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [ScheduleMonitorDb] SET  READ_WRITE 
GO
