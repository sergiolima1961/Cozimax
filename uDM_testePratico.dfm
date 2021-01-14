object DM_testepratico: TDM_testepratico
  OldCreateOrder = False
  Height = 355
  Width = 516
  object FD_SQLlocal: TFDConnection
    Params.Strings = (
      'Database=Cozimax'
      'User_Name=LAPTOPSLIMA\slima'
      'Server=LAPTOPSLIMA'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 48
  end
  object FvCliente: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO char(1)=:ACAO'
      ' , @ID_CLIENTE int =:COD'
      ' , @DSC_CLIENTE varchar(150) = :DSC'
      ' , @ID_RETORN int = :RET'
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.'
      ''
      'EXECUTE  [dbo].[SP_IAEC_CLIENTE] '
      '   @ACAO'
      '  ,@ID_CLIENTE'
      '  ,@DSC_CLIENTE'
      '  ,@ID_RETORN  '
      ' ')
    Left = 200
    Top = 112
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'DSC'
        DataType = ftString
        ParamType = ptInput
        Value = ' '
      end
      item
        Name = 'RET'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object FvClienteCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ReadOnly = True
    end
    object FvClienteNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 50
    end
  end
  object FvProduto: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO char(1)=:ACAO'
      ',@ID_PRODUTO int = :COD'
      ',@DSC_PRODUTO varchar(150) =:DSC'
      ',@VLR_PRODUTO decimal(18,2) = :VLR'
      ', @ID_RETORN int = :RET'
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.'
      ''
      'EXECUTE   [dbo].[SP_IAEC_PRODUTO] '
      '   @ACAO'
      '  ,@ID_PRODUTO'
      '  ,@DSC_PRODUTO'
      '  ,@VLR_PRODUTO'
      '  ,@ID_RETORN '
      ' ')
    Left = 112
    Top = 112
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'DSC'
        DataType = ftString
        ParamType = ptInput
        Value = ' '
      end
      item
        Name = 'VLR'
        DataType = ftCurrency
        ParamType = ptInput
        Value = 0c
      end
      item
        Name = 'RET'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object FvProdutoCodigo: TFDAutoIncField
      DisplayWidth = 6
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ReadOnly = True
      Required = True
      DisplayFormat = '#0000'
    end
    object FvProdutoProduto: TStringField
      DisplayWidth = 30
      FieldName = 'Produto'
      Origin = 'Produto'
      Required = True
      Size = 50
    end
    object FvProdutoValor: TFMTBCDField
      FieldName = 'Valor'
      Origin = 'Valor'
      Required = True
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
  end
  object FtCliente: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO char(1)=:ACAO'
      ' , @ID_CLIENTE int =:COD'
      ' , @DSC_CLIENTE varchar(150) = :DSC'
      ' , @ID_RETORN int = :RET'
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.'
      ''
      'EXECUTE  [dbo].[SP_IAEC_CLIENTE] '
      '   @ACAO'
      '  ,@ID_CLIENTE'
      '  ,@DSC_CLIENTE'
      '  ,@ID_RETORN  '
      ' ')
    Left = 192
    Top = 48
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'i'
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'DSC'
        DataType = ftString
        ParamType = ptInput
        Value = ' maria lucia'
      end
      item
        Name = 'RET'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ReadOnly = True
    end
    object StringField22: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Size = 150
    end
  end
  object FtProduto: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO char(1)=:ACAO'
      ',@ID_PRODUTO int = :COD'
      ',@DSC_PRODUTO varchar(150) =:DSC'
      ',@VLR_PRODUTO decimal(18,2) = :VLR'
      ', @ID_RETORN int = :RET'
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.'
      ''
      'EXECUTE   [dbo].[SP_IAEC_PRODUTO] '
      '   @ACAO'
      '  ,@ID_PRODUTO'
      '  ,@DSC_PRODUTO'
      '  ,@VLR_PRODUTO'
      '  ,@ID_RETORN '
      ' ')
    Left = 120
    Top = 56
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'DSC'
        DataType = ftString
        ParamType = ptInput
        Value = ' '
      end
      item
        Name = 'VLR'
        DataType = ftCurrency
        ParamType = ptInput
        Value = 0c
      end
      item
        Name = 'RET'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object FDAutoIncField2: TFDAutoIncField
      DisplayWidth = 6
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ReadOnly = True
      Required = True
    end
    object StringField23: TStringField
      FieldName = 'Produto'
      Origin = 'Produto'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'Valor'
      Origin = 'Valor'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object FvPedido: TFDQuery
    AfterScroll = FvPedidoAfterScroll
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO       CHAR(1) = :ACAO, '
      '        @RET        SMALLINT = :RET, '
      '        @BUSCA      VARCHAR(150) = :BUS, '
      '        @ID_PEDIDO  INT = :PED, '
      '        @ID_CLIENTE INT = :CLI, '
      '        @VLR_PEDIDO DECIMAL(18, 2) = :VLR, '
      '        @DAT_PEDIDO DATETIME = :DAT, '
      '        @ID_RETORN  INT = :IDR '
      ''
      '-- TODO: Defina valores de par'#226'metros aqui. '
      'EXECUTE [DBO].[SP_IAEC_PEDIDO] '
      '  @ACAO, '
      '  @RET, '
      '  @BUSCA, '
      '  @ID_PEDIDO, '
      '  @ID_CLIENTE, '
      '  @VLR_PEDIDO, '
      '  @DAT_PEDIDO, '
      '  @ID_RETORN '
      ' ')
    Left = 280
    Top = 104
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'RET'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'BUS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PED'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'CLI'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VLR'
        DataType = ftCurrency
        ParamType = ptInput
        Value = 0c
      end
      item
        Name = 'DAT'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FvPedidoPEDIDO: TFDAutoIncField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      ReadOnly = True
      Required = True
      DisplayFormat = '0####'
    end
    object FvPedidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Required = True
      Visible = False
    end
    object FvPedidoNOMECLIENTE: TStringField
      DisplayWidth = 30
      FieldName = 'NOME CLIENTE'
      Origin = '[NOME CLIENTE]'
      Required = True
      Size = 70
    end
    object FvPedidoVALORPEDIDO: TFMTBCDField
      DisplayWidth = 12
      FieldName = 'VALOR PEDIDO'
      Origin = '[VALOR PEDIDO]'
      Required = True
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
    object FvPedidoDATAPEDIDO: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'DATA PEDIDO'
      Origin = '[DATA PEDIDO]'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
  end
  object FtPedido: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO       CHAR(1) = :ACAO, '
      '        @RET        SMALLINT = :RET, '
      '        @BUSCA      VARCHAR(150) = :BUS, '
      '        @ID_PEDIDO  INT = :PED, '
      '        @ID_CLIENTE INT = :CLI, '
      '        @VLR_PEDIDO DECIMAL(18, 2) = :VLR, '
      '        @DAT_PEDIDO DATETIME = :DAT, '
      '        @ID_RETORN  INT = :IDR '
      ''
      '-- TODO: Defina valores de par'#226'metros aqui. '
      'EXECUTE [DBO].[SP_IAEC_PEDIDO] '
      '  @ACAO, '
      '  @RET, '
      '  @BUSCA, '
      '  @ID_PEDIDO, '
      '  @ID_CLIENTE, '
      '  @VLR_PEDIDO, '
      '  @DAT_PEDIDO, '
      '  @ID_RETORN '
      ' ')
    Left = 288
    Top = 48
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'RET'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'BUS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PED'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'CLI'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VLR'
        DataType = ftCurrency
        ParamType = ptInput
        Value = 0c
      end
      item
        Name = 'DAT'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField3: TFDAutoIncField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      ReadOnly = True
      Required = True
      DisplayFormat = '0####'
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NOME CLIENTE'
      Origin = '[NOME CLIENTE]'
      Required = True
      Size = 70
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'VALOR PEDIDO'
      Origin = '[VALOR PEDIDO]'
      Required = True
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
    object SQLTimeStampField2: TSQLTimeStampField
      FieldName = 'DATA PEDIDO'
      Origin = '[DATA PEDIDO]'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
  end
  object FvItemPedido: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO                     CHAR(1) = :ACAO, '
      '        @ID_ITEM_PEDIDO           INT = :IDIT, '
      '        @ID_PEDIDO                INT = :IDPE, '
      '        @ID_PRODUTO               INT = :IDPR, '
      '        @QTD_ITEM_PEDIDO          INT = :QTD, '
      '        @VLR_ITEM_PEDIDO_UNITARIO DECIMAL(12, 2) = :UNT, '
      '        @VLR_ITEM_PEDIDO_TOTAL    DECIMAL(18, 2) = :TOT, '
      '        @ID_RETORN                INT = :RET '
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.  '
      'EXECUTE [DBO].[SP_IAEC_ITEM_PEDIDO] '
      '  @ACAO, '
      '  @ID_ITEM_PEDIDO, '
      '  @ID_PEDIDO, '
      '  @ID_PRODUTO, '
      '  @QTD_ITEM_PEDIDO, '
      '  @VLR_ITEM_PEDIDO_UNITARIO, '
      '  @VLR_ITEM_PEDIDO_TOTAL, '
      '  @ID_RETORN ')
    Left = 360
    Top = 104
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'IDIT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDPE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'IDPR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'QTD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UNT'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TOT'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RET'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object FvItemPedidoCODIGO: TFDAutoIncField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ReadOnly = True
    end
    object FvItemPedidoPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      Required = True
    end
    object FvItemPedidoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object FvItemPedidoDescrição: TStringField
      FieldName = 'Descri'#231#227'o'
      Origin = '[Descri'#231#227'o]'
      Size = 150
    end
    object FvItemPedidoQtd: TIntegerField
      FieldName = 'Qtd'
      Origin = 'Qtd'
    end
    object FvItemPedidoUnitario: TBCDField
      FieldName = 'Unitario'
      Origin = 'Unitario'
      DisplayFormat = '#,0.00'
      Precision = 12
      Size = 2
    end
    object FvItemPedidoTotal: TFMTBCDField
      FieldName = 'Total'
      Origin = 'Total'
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
  end
  object FtItemPedido: TFDQuery
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO                     CHAR(1) = :ACAO, '
      '        @ID_ITEM_PEDIDO           INT = :IDIT, '
      '        @ID_PEDIDO                INT = :IDPE, '
      '        @ID_PRODUTO               INT = :IDPR, '
      '        @QTD_ITEM_PEDIDO          INT = :QTD, '
      '        @VLR_ITEM_PEDIDO_UNITARIO DECIMAL(12, 2) = :UNT, '
      '        @VLR_ITEM_PEDIDO_TOTAL    DECIMAL(18, 2) = :TOT, '
      '        @ID_RETORN                INT = :RET '
      ''
      '-- TODO: Defina valores de par'#226'metros aqui.  '
      'EXECUTE [DBO].[SP_IAEC_ITEM_PEDIDO] '
      '  @ACAO, '
      '  @ID_ITEM_PEDIDO, '
      '  @ID_PEDIDO, '
      '  @ID_PRODUTO, '
      '  @QTD_ITEM_PEDIDO, '
      '  @VLR_ITEM_PEDIDO_UNITARIO, '
      '  @VLR_ITEM_PEDIDO_TOTAL, '
      '  @ID_RETORN ')
    Left = 352
    Top = 40
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'C'
      end
      item
        Name = 'IDIT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDPE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'IDPR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'QTD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UNT'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TOT'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'RET'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object FDAutoIncField4: TFDAutoIncField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ReadOnly = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object StringField2: TStringField
      FieldName = 'Descri'#231#227'o'
      Origin = '[Descri'#231#227'o]'
      Size = 150
    end
    object IntegerField5: TIntegerField
      FieldName = 'Qtd'
      Origin = 'Qtd'
    end
    object BCDField1: TBCDField
      FieldName = 'Unitario'
      Origin = 'Unitario'
      DisplayFormat = '#,0.00'
      Precision = 12
      Size = 2
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'Total'
      Origin = 'Total'
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
  end
  object FfPedido: TFDQuery
    AfterScroll = FvPedidoAfterScroll
    Connection = FD_SQLlocal
    SQL.Strings = (
      'DECLARE @ACAO       CHAR(1) = :ACAO, '
      '        @RET        SMALLINT = :RET, '
      '        @BUSCA      VARCHAR(150) = :BUS, '
      '        @ID_PEDIDO  INT = :PED, '
      '        @ID_CLIENTE INT = :CLI, '
      '        @VLR_PEDIDO DECIMAL(18, 2) = :VLR, '
      '        @DAT_PEDIDO DATETIME = :DAT, '
      '        @ID_RETORN  INT = :IDR '
      ''
      '-- TODO: Defina valores de par'#226'metros aqui. '
      'EXECUTE [DBO].[SP_IAEC_PEDIDO] '
      '  @ACAO, '
      '  @RET, '
      '  @BUSCA, '
      '  @ID_PEDIDO, '
      '  @ID_CLIENTE, '
      '  @VLR_PEDIDO, '
      '  @DAT_PEDIDO, '
      '  @ID_RETORN '
      ' ')
    Left = 280
    Top = 168
    ParamData = <
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Value = 'p'
      end
      item
        Name = 'RET'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'BUS'
        DataType = ftString
        ParamType = ptInput
        Value = 'maria'
      end
      item
        Name = 'PED'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'CLI'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VLR'
        DataType = ftCurrency
        ParamType = ptInput
        Value = 0c
      end
      item
        Name = 'DAT'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FfPedidoPedido: TFDAutoIncField
      FieldName = 'Pedido'
      Origin = 'Pedido'
      ReadOnly = True
    end
    object FfPedidoDataPedido: TStringField
      FieldName = 'Data Pedido'
      Origin = '[Data Pedido]'
      ReadOnly = True
      Size = 10
    end
    object FfPedidoValorPedido: TFMTBCDField
      FieldName = 'Valor Pedido'
      Origin = '[Valor Pedido]'
      DisplayFormat = '#,0.00'
      Precision = 18
      Size = 2
    end
    object FfPedidoCliente: TStringField
      FieldName = 'Cliente'
      Origin = 'Cliente'
      Size = 150
    end
  end
end
