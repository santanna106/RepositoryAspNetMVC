USE [checklist]
GO
/****** Object:  Table [dbo].[Checklist]    Script Date: 15/02/2020 07:46:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checklist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ViagemId] [int] NULL,
	[QuestaoId] [int] NULL,
	[RespostaSaida] [varchar](2) NULL,
	[RespostaRetorno] [varchar](2) NULL,
	[Quantidade] [int] NULL,
	[Obrigatorio] [bit] NULL,
 CONSTRAINT [PK_Checklist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Checklist] UNIQUE NONCLUSTERED 
(
	[ViagemId] ASC,
	[QuestaoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questao]    Script Date: 15/02/2020 07:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sentenca] [varchar](400) NULL,
	[Obrigatorio] [bit] NULL,
	[Quantitativo] [bit] NULL,
 CONSTRAINT [PK_Questao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/02/2020 07:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Senha] [nvarchar](50) NOT NULL,
	[Nome] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Viagem]    Script Date: 15/02/2020 07:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viagem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataSaida] [datetime] NULL,
	[DataRetorno] [datetime] NULL,
 CONSTRAINT [PK_Viagem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Checklist]  WITH CHECK ADD  CONSTRAINT [FK_Checklist_Questao] FOREIGN KEY([QuestaoId])
REFERENCES [dbo].[Questao] ([Id])
GO
ALTER TABLE [dbo].[Checklist] CHECK CONSTRAINT [FK_Checklist_Questao]
GO
ALTER TABLE [dbo].[Checklist]  WITH CHECK ADD  CONSTRAINT [FK_Checklist_Viagem] FOREIGN KEY([ViagemId])
REFERENCES [dbo].[Viagem] ([Id])
GO
ALTER TABLE [dbo].[Checklist] CHECK CONSTRAINT [FK_Checklist_Viagem]
GO
