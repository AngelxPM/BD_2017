CREATE DATABASE [Clinica]
GO

USE [Clinica]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 09/13/2017 23:32:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[CodigoP] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Poblacion] [varchar](50) NULL,
	[Provincia] [varchar](50) NULL,
	[CodigoPostal] [int] NULL,
	[Telefono] [int] NULL,
	[FechaDeNacimiento] [date] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[CodigoP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 09/13/2017 23:32:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medico](
	[CodigoM] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Telefono] [int] NULL,
	[Especialidad] [varchar](50) NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
(
	[CodigoM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CtrlIngreso]    Script Date: 09/13/2017 23:32:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CtrlIngreso](
	[CodigoCI] [int] NOT NULL,
	[CodigoP] [int] NOT NULL,
	[CodigoM] [int] NOT NULL,
	[NumHabitacion] [int] NOT NULL,
	[NumCama] [int] NOT NULL,
	[FechaIngreso] [date] NULL,
 CONSTRAINT [PK_CtrlIngreso] PRIMARY KEY CLUSTERED 
(
	[CodigoCI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_CtrlIngreso_Medico]    Script Date: 09/13/2017 23:32:03 ******/
ALTER TABLE [dbo].[CtrlIngreso]  WITH CHECK ADD  CONSTRAINT [FK_CtrlIngreso_Medico] FOREIGN KEY([CodigoM])
REFERENCES [dbo].[Medico] ([CodigoM])
GO
ALTER TABLE [dbo].[CtrlIngreso] CHECK CONSTRAINT [FK_CtrlIngreso_Medico]
GO
/****** Object:  ForeignKey [FK_CtrlIngreso_Paciente]    Script Date: 09/13/2017 23:32:03 ******/
ALTER TABLE [dbo].[CtrlIngreso]  WITH CHECK ADD  CONSTRAINT [FK_CtrlIngreso_Paciente] FOREIGN KEY([CodigoP])
REFERENCES [dbo].[Paciente] ([CodigoP])
GO
ALTER TABLE [dbo].[CtrlIngreso] CHECK CONSTRAINT [FK_CtrlIngreso_Paciente]
GO
