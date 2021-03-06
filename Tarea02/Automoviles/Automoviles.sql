CREATE DATABASE [Automoviles]
GO

USE [Automoviles]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 09/13/2017 23:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[NumCliente] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Cuidad] [varchar](50) NULL,
	[Telefono] [int] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[NumCliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Automoviles]    Script Date: 09/13/2017 23:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Automoviles](
	[Matricula] [varchar](50) NOT NULL,
	[Marca] [varchar](50) NULL,
	[Modelo] [varchar](50) NULL,
	[Color] [varchar](50) NULL,
	[PrecioVenta] [float] NULL,
 CONSTRAINT [PK_Automoviles] PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 09/13/2017 23:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [int] NOT NULL,
	[Matricula] [varchar](50) NULL,
	[NumCliente] [int] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Revicion]    Script Date: 09/13/2017 23:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Revicion](
	[IdRevicion] [int] NOT NULL,
	[Matricula] [varchar](50) NULL,
	[TipoCambio] [varchar](50) NULL,
 CONSTRAINT [PK_Revicion] PRIMARY KEY CLUSTERED 
(
	[IdRevicion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Venta_Automoviles]    Script Date: 09/13/2017 23:52:10 ******/
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Automoviles] FOREIGN KEY([Matricula])
REFERENCES [dbo].[Automoviles] ([Matricula])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Automoviles]
GO
/****** Object:  ForeignKey [FK_Venta_Cliente]    Script Date: 09/13/2017 23:52:10 ******/
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([NumCliente])
REFERENCES [dbo].[Cliente] ([NumCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
/****** Object:  ForeignKey [FK_Revicion_Automoviles]    Script Date: 09/13/2017 23:52:10 ******/
ALTER TABLE [dbo].[Revicion]  WITH CHECK ADD  CONSTRAINT [FK_Revicion_Automoviles] FOREIGN KEY([Matricula])
REFERENCES [dbo].[Automoviles] ([Matricula])
GO
ALTER TABLE [dbo].[Revicion] CHECK CONSTRAINT [FK_Revicion_Automoviles]
GO
