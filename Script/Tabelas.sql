USE [COZIMAX]

GO

BEGIN
    /****** Object:  Table [dbo].[CLIENTE]    Script Date: 12/01/2021 14:40:56 ******/
    IF NOT ( EXISTS (SELECT *
                     FROM   INFORMATION_SCHEMA.TABLES
                     WHERE  TABLE_NAME = 'CLIENTE') )
      BEGIN
          --    1 - Cadastro de Cliente (Contendo os campos : Codigo e Nome do Cliente);
          CREATE TABLE [DBO].[CLIENTE]
            (
               [ID_CLIENTE]   [INT] IDENTITY(1, 1) NOT NULL
               ,[DSC_CLIENTE] [VARCHAR](150) NULL,
               CONSTRAINT [PK_CLIENTE] PRIMARY KEY NONCLUSTERED ( [ID_CLIENTE] ASC )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            )
      END

    IF NOT ( EXISTS (SELECT *
                     FROM   INFORMATION_SCHEMA.TABLES
                     WHERE  TABLE_NAME = 'PRODUTO') )
      BEGIN
          --    2 - Cadastro de Produto (Contendo os campos : Codigo , Descrição do Produto e Valor);
          CREATE TABLE [DBO].[PRODUTO]
            (
               [ID_PRODUTO]   [INT] IDENTITY(1, 1) NOT NULL
               ,[DSC_PRODUTO] [VARCHAR](150) NULL
               ,[VLR_PRODUTO] DECIMAL(18, 2) DEFAULT(0),
               CONSTRAINT [PK_PRODUTO] PRIMARY KEY NONCLUSTERED ( [ID_PRODUTO] ASC )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            )
      END

    IF NOT ( EXISTS (SELECT *
                     FROM   INFORMATION_SCHEMA.TABLES
                     WHERE  TABLE_NAME = 'PEDIDO') )
      BEGIN
          /*
          Pedido de Venda (Contendo os campos : Codigo do Pedido,Data do Pedido, Cliente , Total Pedido);
          */
          CREATE TABLE [DBO].[PEDIDO]
            (
               [ID_PEDIDO]   [INT] IDENTITY(1, 1) NOT NULL
               ,[ID_CLIENTE] [INT]
               ,[VLR_PEDIDO] DECIMAL(18, 2) DEFAULT(0)
               ,[DAT_PEDIDO] DATETIME DEFAULT(Getdate()),
               CONSTRAINT [PK_PEDIDO] PRIMARY KEY NONCLUSTERED ( [ID_PEDIDO] ASC )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            );

          ALTER TABLE [DBO].[PEDIDO]
            ADD CONSTRAINT FK_CLIENTE_ID_CLIENTE FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE)
      END

    /*
    4 - Itens do Pedido de Venda (Contendo os campos : Codigo do Pedido,Produto,Quantidade,Valor Unitário,Valor Total);
    */
    IF NOT ( EXISTS (SELECT 1
                     FROM   INFORMATION_SCHEMA.TABLES
                     WHERE  TABLE_NAME = 'ITEM_PEDIDO') )
      BEGIN
          CREATE TABLE [DBO].[ITEM_PEDIDO]
            (
               [ID_ITEM_PEDIDO]            [INT] IDENTITY(1, 1) NOT NULL
               ,[ID_PEDIDO]                [INT] NOT NULL
               ,[ID_PRODUTO]               [INT] NOT NULL
               ,[QTD_ITEM_PEDIDO]          [INT] DEFAULT(0)
               ,[VLR_ITEM_PEDIDO_UNITARIO] DECIMAL(12, 2) DEFAULT(0)
               ,[VLR_ITEM_PEDIDO_TOTAL]    DECIMAL(18, 2) DEFAULT(0),
               CONSTRAINT [PK_ITEM_PEDIDO] PRIMARY KEY NONCLUSTERED ( [ID_ITEM_PEDIDO] ASC )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            );

          ALTER TABLE [DBO].[ITEM_PEDIDO]
            ADD CONSTRAINT FK_PEDIDO_ID_PEDIDO FOREIGN KEY(ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO)

          ALTER TABLE [DBO].[ITEM_PEDIDO]
            ADD CONSTRAINT FK_ITEM_PEDIDO_ID_PRODUTO FOREIGN KEY(ID_PRODUTO) REFERENCES PRODUTO(ID_PRODUTO)
      END
END 