USE [Cozimax]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 14/01/2021 16:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[ID_CLIENTE] [int] IDENTITY(1,1) NOT NULL,
	[DSC_CLIENTE] [varchar](150) NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY NONCLUSTERED 
(
	[ID_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ITEM_PEDIDO]    Script Date: 14/01/2021 16:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEM_PEDIDO](
	[ID_ITEM_PEDIDO] [int] IDENTITY(1,1) NOT NULL,
	[ID_PEDIDO] [int] NOT NULL,
	[ID_PRODUTO] [int] NOT NULL,
	[QTD_ITEM_PEDIDO] [int] NULL,
	[VLR_ITEM_PEDIDO_UNITARIO] [decimal](12, 2) NULL,
	[VLR_ITEM_PEDIDO_TOTAL] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ITEM_PEDIDO] PRIMARY KEY NONCLUSTERED 
(
	[ID_ITEM_PEDIDO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDO]    Script Date: 14/01/2021 16:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDO](
	[ID_PEDIDO] [int] IDENTITY(1,1) NOT NULL,
	[ID_CLIENTE] [int] NULL,
	[VLR_PEDIDO] [decimal](18, 2) NULL,
	[DAT_PEDIDO] [datetime] NULL,
 CONSTRAINT [PK_PEDIDO] PRIMARY KEY NONCLUSTERED 
(
	[ID_PEDIDO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUTO]    Script Date: 14/01/2021 16:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUTO](
	[ID_PRODUTO] [int] IDENTITY(1,1) NOT NULL,
	[DSC_PRODUTO] [varchar](150) NULL,
	[VLR_PRODUTO] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PRODUTO] PRIMARY KEY NONCLUSTERED 
(
	[ID_PRODUTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ITEM_PEDIDO] ADD  DEFAULT ((0)) FOR [QTD_ITEM_PEDIDO]
GO
ALTER TABLE [dbo].[ITEM_PEDIDO] ADD  DEFAULT ((0)) FOR [VLR_ITEM_PEDIDO_UNITARIO]
GO
ALTER TABLE [dbo].[ITEM_PEDIDO] ADD  DEFAULT ((0)) FOR [VLR_ITEM_PEDIDO_TOTAL]
GO
ALTER TABLE [dbo].[PEDIDO] ADD  DEFAULT ((0)) FOR [VLR_PEDIDO]
GO
ALTER TABLE [dbo].[PEDIDO] ADD  DEFAULT (getdate()) FOR [DAT_PEDIDO]
GO
ALTER TABLE [dbo].[PRODUTO] ADD  DEFAULT ((0)) FOR [VLR_PRODUTO]
GO
ALTER TABLE [dbo].[ITEM_PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_PEDIDO_PEDIDO] FOREIGN KEY([ID_PEDIDO])
REFERENCES [dbo].[PEDIDO] ([ID_PEDIDO])
GO
ALTER TABLE [dbo].[ITEM_PEDIDO] CHECK CONSTRAINT [FK_ITEM_PEDIDO_PEDIDO]
GO
ALTER TABLE [dbo].[ITEM_PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_PEDIDO_PRODUTO] FOREIGN KEY([ID_PRODUTO])
REFERENCES [dbo].[PRODUTO] ([ID_PRODUTO])
GO
ALTER TABLE [dbo].[ITEM_PEDIDO] CHECK CONSTRAINT [FK_ITEM_PEDIDO_PRODUTO]
GO
ALTER TABLE [dbo].[PEDIDO]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTE_ID_CLIENTE] FOREIGN KEY([ID_CLIENTE])
REFERENCES [dbo].[CLIENTE] ([ID_CLIENTE])
GO
ALTER TABLE [dbo].[PEDIDO] CHECK CONSTRAINT [FK_CLIENTE_ID_CLIENTE]
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_CLIENTE]    Script Date: 14/01/2021 16:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_CLIENTE](@ACAO         CHAR(1)='C'
                                ,@ID_CLIENTE  INT
                                ,@DSC_CLIENTE VARCHAR(150)
                                ,@ID_RETORN   INT  )
AS
  BEGIN
      DECLARE @PESQUISA VARCHAR(150)=''

      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
      SET @ID_RETORN = @ID_CLIENTE;

      IF @ACAO = 'I'
        BEGIN
            INSERT CLIENTE
                   (DSC_CLIENTE)
            VALUES(@DSC_CLIENTE );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE CLIENTE
            SET    DSC_CLIENTE = @DSC_CLIENTE
            WHERE  ID_CLIENTE = @ID_CLIENTE;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM CLIENTE
            WHERE  ID_CLIENTE = @ID_CLIENTE;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT ID_CLIENTE [Codigo]
                   ,CONVERT(varchar(100),  DSC_CLIENTE ) [Nome]
            FROM   CLIENTE CLIENTE (NOLOCK)
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            SET @PESQUISA = @DSC_CLIENTE
            SET @PESQUISA += '%'

            SELECT ID_CLIENTE [Codigo]
                   ,CONVERT(varchar(100),  DSC_CLIENTE ) [Nome]
            FROM   CLIENTE (NOLOCK)
            WHERE  DSC_CLIENTE LIKE @PESQUISA
        END
  END

GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_ITEM_PEDIDO]    Script Date: 14/01/2021 16:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:  <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_ITEM_PEDIDO] (@ACAO                      CHAR(1)='C'
                                             ,@ID_ITEM_PEDIDO           INT
                                             ,@ID_PEDIDO                INT
                                             ,@ID_PRODUTO               INT
                                             ,@QTD_ITEM_PEDIDO          INT
                                             ,@VLR_ITEM_PEDIDO_UNITARIO DECIMAL(12, 2)
                                             ,@VLR_ITEM_PEDIDO_TOTAL    DECIMAL(18, 2)
                                             ,@ID_RETORN                INT)
AS
  BEGIN
      SET NOCOUNT ON;

      DECLARE @PESQUISA VARCHAR(150)=''

      IF @ACAO = 'I'
        BEGIN
            INSERT ITEM_PEDIDO
                   (ID_PEDIDO
                    ,ID_PRODUTO
                    ,QTD_ITEM_PEDIDO
                    ,VLR_ITEM_PEDIDO_UNITARIO
                    ,VLR_ITEM_PEDIDO_TOTAL)
            VALUES ( @ID_PEDIDO
                     ,@ID_PRODUTO
                     ,@QTD_ITEM_PEDIDO
                     ,@VLR_ITEM_PEDIDO_UNITARIO
                     ,( @VLR_ITEM_PEDIDO_UNITARIO * @QTD_ITEM_PEDIDO ) );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE ITEM_PEDIDO
            SET    ID_PRODUTO = @ID_PRODUTO
                   ,QTD_ITEM_PEDIDO = @QTD_ITEM_PEDIDO
                   ,VLR_ITEM_PEDIDO_UNITARIO = @VLR_ITEM_PEDIDO_UNITARIO
                   ,VLR_ITEM_PEDIDO_TOTAL = ( @VLR_ITEM_PEDIDO_UNITARIO * @QTD_ITEM_PEDIDO )
            WHERE  ID_ITEM_PEDIDO = @ID_ITEM_PEDIDO
              AND  ID_PEDIDO = @ID_PEDIDO
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM ITEM_PEDIDO
            WHERE  ID_ITEM_PEDIDO = @ID_ITEM_PEDIDO
              AND  ID_PEDIDO = @ID_PEDIDO
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT IPE.ID_ITEM_PEDIDO            [CODIGO]
                   ,IPE.ID_PEDIDO                [PEDIDO]
                   ,IPE.ID_PRODUTO               [ID_PRODUTO]
                   ,PRO.DSC_PRODUTO              [Descrição]
                   ,IPE.QTD_ITEM_PEDIDO          [Qtd]
                   ,IPE.VLR_ITEM_PEDIDO_UNITARIO [Unitario]
                   ,IPE.VLR_ITEM_PEDIDO_TOTAL    [Total]
            FROM   ITEM_PEDIDO IPE
                   INNER JOIN PRODUTO PRO
                           ON PRO.ID_PRODUTO = IPE.ID_PRODUTO
            WHERE  IPE.ID_PEDIDO = @ID_PEDIDO
            ORDER  BY 1;
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            IF EXISTS(SELECT 1
                      FROM   ITEM_PEDIDO IPE
                      WHERE  IPE.ID_PEDIDO = @ID_PEDIDO
                             AND IPE.ID_PRODUTO = @ID_PRODUTO)
              BEGIN
                  -- - Criar verificação para não deixar adicionar produto duplicado no pedido;
                  SELECT IPE.ID_ITEM_PEDIDO            [CODIGO]
                         ,IPE.ID_PRODUTO               [ID_PRODUTO]
                         ,PRO.DSC_PRODUTO              [Descrição]
                         ,IPE.QTD_ITEM_PEDIDO          [Qtd]
                         ,IPE.VLR_ITEM_PEDIDO_UNITARIO [Unitario]
                         ,IPE.VLR_ITEM_PEDIDO_TOTAL    [Total]
                  FROM   ITEM_PEDIDO IPE
                         INNER JOIN PRODUTO PRO
                                 ON PRO.ID_PRODUTO = IPE.ID_PRODUTO
                  WHERE  IPE.ID_PEDIDO = @ID_PEDIDO
                         AND IPE.ID_PRODUTO = @ID_PRODUTO;
              END
        END
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_PEDIDO]    Script Date: 14/01/2021 16:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_PEDIDO] @ACAO        CHAR(1) ='C'
                                       ,@RET        SMALLINT = -1
                                       ,@BUSCA      VARCHAR(150)=''
                                       ,@ID_PEDIDO  INT
                                       ,@ID_CLIENTE INT
                                       ,@VLR_PEDIDO DECIMAL(18, 2)
                                       ,@DAT_PEDIDO DATETIME
                                       ,@ID_RETORN  INT OUTPUT
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @PESQUISA VARCHAR(150)=''

      IF @ACAO = 'I'
        BEGIN
            INSERT PEDIDO
                   (ID_CLIENTE
                    ,VLR_PEDIDO)
            VALUES(@ID_CLIENTE
                   ,@VLR_PEDIDO );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE PEDIDO
            SET    ID_CLIENTE = @ID_CLIENTE
            WHERE  ID_PEDIDO = @ID_PEDIDO;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            -- pedido
            DELETE FROM PEDIDO
            WHERE  ID_PEDIDO = @ID_PEDIDO;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            IF @RET = 0
              BEGIN
                  SELECT PED.ID_PEDIDO                          [PEDIDO]
                         ,PED.ID_CLIENTE                        [ID_CLIENTE]
                         ,CONVERT(VARCHAR(100), CLI.DSC_CLIENTE) [NOME CLIENTE]
                         ,PED.VLR_PEDIDO                        [VALOR PEDIDO]
                         ,PED.DAT_PEDIDO                        [DATA PEDIDO]
                  FROM   PEDIDO PED
                         INNER JOIN CLIENTE CLI
                                 ON CLI.ID_CLIENTE = PED.ID_CLIENTE
                  ORDER  BY 1 DESC
              END
            ELSE IF @RET = 1
              BEGIN
                  SET @PESQUISA = @BUSCA

                  SELECT PED.ID_PEDIDO                          [PEDIDO]
                         ,PED.ID_CLIENTE                        [ID_CLIENTE]
                         ,CONVERT(VARCHAR(100), CLI.DSC_CLIENTE) [NOME CLIENTE]
                         ,PED.VLR_PEDIDO                        [VALOR PEDIDO]
                         ,PED.DAT_PEDIDO                        [DATA PEDIDO]
                  FROM   PEDIDO PED
                         INNER JOIN CLIENTE CLI
                                 ON CLI.ID_CLIENTE = PED.ID_CLIENTE
                  WHERE  PED.ID_PEDIDO = CONVERT(INT, @PESQUISA)
              END
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            -- - Fazer tratamento de erros necessários no sistema para melhor interação com o Usuário;
            -- Opção de Pesquisa de pedidos por Data , Cliente ou Código do PEDIDO
            IF @RET = 0
              BEGIN
                  SELECT PED.ID_PEDIDO                                               AS Pedido
                         ,CONVERT(VARCHAR(10), FORMAT(PED.DAT_PEDIDO, 'dd/MM/yyyy')) AS [Data Pedido]
                         ,PED.VLR_PEDIDO                                             AS [Valor Pedido]
                         ,CONVERT(VARCHAR(70), CLI.DSC_CLIENTE)                  AS Cliente
                  FROM   PEDIDO PED
                         INNER JOIN CLIENTE CLI
                                 ON PED.ID_CLIENTE = CLI.ID_CLIENTE
                  ORDER  BY PED.DAT_PEDIDO DESC
                            ,1
              END
            ELSE IF @RET = 1
              BEGIN
                  SET @PESQUISA = @BUSCA

                  SELECT PED.ID_PEDIDO                                               AS Pedido
                         ,CONVERT(VARCHAR(10), FORMAT(PED.DAT_PEDIDO, 'dd/MM/yyyy')) AS [Data Pedido]
                         ,PED.VLR_PEDIDO                                             AS [Valor Pedido]
                         ,CONVERT(VARCHAR(70), CLI.DSC_CLIENTE)                  AS Cliente
                  FROM   PEDIDO PED
                         INNER JOIN CLIENTE CLI
                                 ON PED.ID_CLIENTE = CLI.ID_CLIENTE
                  WHERE  PED.ID_PEDIDO = CONVERT(INT, @PESQUISA)
              END
            ELSE IF @RET = 2
              BEGIN
                  SET @PESQUISA = '%'
                  SET @PESQUISA += @BUSCA
                  SET @PESQUISA += '%'

                  SELECT PED.ID_PEDIDO                                               AS Pedido
                         ,CONVERT(VARCHAR(10), FORMAT(PED.DAT_PEDIDO, 'dd/MM/yyyy')) AS [Data Pedido]
                         ,PED.VLR_PEDIDO                                             AS [Valor Pedido]
                         ,CONVERT(VARCHAR(70), CLI.DSC_CLIENTE)                  AS Cliente
                  FROM   PEDIDO PED
                         INNER JOIN CLIENTE CLI
                                 ON PED.ID_CLIENTE = CLI.ID_CLIENTE
                  WHERE  CLI.DSC_CLIENTE LIKE @PESQUISA
                  ORDER  BY 2 DESC
                            ,4
              END
            ELSE IF @RET = 3
              BEGIN
                  SET @PESQUISA =''
                  SET @PESQUISA += @BUSCA
                  SET @PESQUISA +=''

                  SELECT PED.ID_PEDIDO                                               AS Pedido
                         ,CONVERT(VARCHAR(10), FORMAT(PED.DAT_PEDIDO, 'dd/MM/yyyy')) AS [Data Pedido]
                         ,PED.VLR_PEDIDO                                             AS [Valor Pedido]
                         ,CONVERT(VARCHAR(70), CLI.DSC_CLIENTE)                  AS Cliente
                  FROM   PEDIDO PED
                         INNER JOIN CLIENTE CLI
                                 ON PED.ID_CLIENTE = CLI.ID_CLIENTE
                  WHERE  CONVERT(DATE, PED.DAT_PEDIDO) = CONVERT(DATE, @PESQUISA)
                  ORDER  BY PED.DAT_PEDIDO DESC
                            ,1
              END
        END
  END 
GO
/****** Object:  StoredProcedure [dbo].[SP_IAEC_PRODUTO]    Script Date: 14/01/2021 16:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IAEC_PRODUTO] (@ACAO         CHAR(1)='C'
                                  ,@ID_PRODUTO  INT
                                  ,@DSC_PRODUTO VARCHAR(150)
                                  ,@VLR_PRODUTO DECIMAL(18, 2)
                                  ,@ID_RETORN   INT)
AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;

      DECLARE @PESQUISA VARCHAR(150)=''

      IF @ACAO = 'I'
        BEGIN
            INSERT PRODUTO
                   (DSC_PRODUTO
                    ,VLR_PRODUTO)
            VALUES(@DSC_PRODUTO
                   ,@VLR_PRODUTO );

            SET @ID_RETORN = @@IDENTITY;
        END
      ELSE IF @ACAO = 'A'
        BEGIN
            UPDATE PRODUTO
            SET    DSC_PRODUTO = @DSC_PRODUTO
                   ,VLR_PRODUTO = @VLR_PRODUTO
            WHERE  ID_PRODUTO = @ID_PRODUTO;
        END
      ELSE IF @ACAO = 'E'
        BEGIN
            DELETE FROM PRODUTO
            WHERE  ID_PRODUTO = @ID_PRODUTO;
        END
      ELSE IF @ACAO = 'C'
        BEGIN
            SELECT ID_PRODUTO   [Codigo]
                   ,CONVERT(VARCHAR(30), DSC_PRODUTO ) [Produto]
                   ,VLR_PRODUTO [Valor]
            FROM   PRODUTO (NOLOCK)
			ORDER BY  2
        END
      ELSE IF @ACAO = 'P'
        BEGIN
            SET @PESQUISA = @DSC_PRODUTO
            SET @PESQUISA += '%'

            SELECT ID_PRODUTO   [Codigo]
                   ,CONVERT(VARCHAR(50), DSC_PRODUTO ) [Produto]
            FROM   PRODUTO (NOLOCK)
            WHERE  DSC_PRODUTO LIKE @PESQUISA
			ORDER BY  2
        END
  END

GO
