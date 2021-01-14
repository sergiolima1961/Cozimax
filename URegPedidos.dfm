object FRegPedidos: TFRegPedidos
  Left = 0
  Top = 0
  Caption = 'Registro de Vendas'
  ClientHeight = 529
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 529
    Align = alLeft
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 498
      Height = 101
      Align = alTop
      BevelInner = bvSpace
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 0
      object Label1: TLabel
        Left = 20
        Top = 51
        Width = 47
        Height = 13
        Caption = 'N'#186' Pedido'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 196
        Top = 51
        Width = 33
        Height = 13
        Caption = 'Cliente'
      end
      object DBText3: TDBText
        Left = 306
        Top = 49
        Width = 41
        Height = 13
        AutoSize = True
        DataField = 'NOME CLIENTE'
        DataSource = DSPEDIDOS
      end
      object DBText5: TDBText
        Left = 269
        Top = 78
        Width = 98
        Height = 17
        Alignment = taRightJustify
        DataField = 'VALOR PEDIDO'
        DataSource = DSPEDIDOS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 20
        Top = 78
        Width = 73
        Height = 13
        Caption = 'Data do Pedido'
      end
      object Label4: TLabel
        Left = 201
        Top = 78
        Width = 59
        Height = 13
        Caption = 'Valor Pedido'
      end
      object DBText2: TDBText
        Left = 110
        Top = 77
        Width = 48
        Height = 13
        AutoSize = True
        DataField = 'DATA PEDIDO'
        DataSource = DSPEDIDOS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 107
        Top = 44
        Width = 44
        Height = 21
        DataField = 'PEDIDO'
        DataSource = DSPEDIDOS
        ReadOnly = True
        TabOrder = 0
      end
      object dblCliente: TDBLookupComboBox
        Left = 235
        Top = 46
        Width = 65
        Height = 21
        DataField = 'ID_CLIENTE'
        DataSource = DSPEDIDOS
        DropDownWidth = 500
        KeyField = 'Codigo'
        ListField = 'Nome;Codigo'
        ListFieldIndex = 1
        ListSource = dsCliente
        TabOrder = 1
        OnExit = dblClienteExit
      end
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 494
        Height = 33
        Align = alTop
        AutoSize = True
        BevelInner = bvLowered
        Caption = 'Panel1'
        ShowCaption = False
        TabOrder = 2
        object Label16: TLabel
          Left = 653
          Top = 2
          Width = 52
          Height = 13
          Caption = '0000/0000'
        end
        object Button1: TButton
          Left = -3
          Top = 6
          Width = 51
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 214
          Top = 6
          Width = 51
          Height = 25
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 157
          Top = 6
          Width = 51
          Height = 25
          Caption = 'Gravar'
          Enabled = False
          TabOrder = 2
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 53
          Top = 6
          Width = 51
          Height = 25
          Caption = 'Editar'
          TabOrder = 3
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 105
          Top = 5
          Width = 51
          Height = 25
          Caption = 'Excluir'
          TabOrder = 4
          OnClick = Button5Click
        end
        object BtFechar: TButton
          Left = 277
          Top = 6
          Width = 77
          Height = 25
          Caption = 'Pesquisa..'
          TabOrder = 5
          OnClick = BtFecharClick
        end
      end
    end
    object pnlCustoItem: TPanel
      Left = 1
      Top = 199
      Width = 498
      Height = 81
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      ExplicitTop = 193
      object Label9: TLabel
        Left = 166
        Top = 36
        Width = 70
        Height = 13
        Caption = 'Pre'#231'o Unitario '
        FocusControl = DBEdit2
      end
      object Label10: TLabel
        Left = 281
        Top = 36
        Width = 56
        Height = 13
        Caption = 'Quantidade'
        FocusControl = DBEdit3
      end
      object Label12: TLabel
        Left = 15
        Top = 36
        Width = 38
        Height = 13
        Caption = 'Produto'
      end
      object DBText1: TDBText
        Left = 343
        Top = 54
        Width = 106
        Height = 17
        Alignment = taRightJustify
        DataField = 'Total'
        DataSource = dsItemPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pnl_item: TPanel
        Left = 2
        Top = 2
        Width = 494
        Height = 29
        Align = alTop
        AutoSize = True
        BevelInner = bvLowered
        BevelOuter = bvSpace
        ShowCaption = False
        TabOrder = 3
        object Label3: TLabel
          Left = 651
          Top = 3
          Width = 52
          Height = 13
          Caption = '0000/0000'
        end
        object Button6: TButton
          Left = 4
          Top = 2
          Width = 51
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 166
          Top = 2
          Width = 51
          Height = 25
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 1
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 110
          Top = 2
          Width = 51
          Height = 25
          Caption = 'Gravar'
          Enabled = False
          TabOrder = 2
          OnClick = Button8Click
        end
        object Button10: TButton
          Left = 57
          Top = 2
          Width = 51
          Height = 25
          Caption = 'Excluir'
          TabOrder = 3
          OnClick = Button10Click
        end
      end
      object DBEdit2: TDBEdit
        Left = 166
        Top = 54
        Width = 97
        Height = 21
        DataField = 'Unitario'
        DataSource = dsItemPedido
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 281
        Top = 55
        Width = 56
        Height = 21
        DataField = 'Qtd'
        DataSource = dsItemPedido
        TabOrder = 2
      end
      object DBLCBProduto: TDBLookupComboBox
        Left = 15
        Top = 55
        Width = 145
        Height = 21
        DataField = 'ID_PRODUTO'
        DataSource = dsItemPedido
        DropDownRows = 14
        DropDownWidth = 540
        KeyField = 'Codigo'
        ListField = 'Produto;codigo'
        ListSource = DSProdutos
        TabOrder = 0
        OnExit = DBLCBProdutoExit
      end
    end
    object DBGrid3: TDBGrid
      Left = 1
      Top = 102
      Width = 498
      Height = 97
      Align = alTop
      DataSource = DSPEDIDOS
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 280
      Width = 498
      Height = 248
      Align = alClient
      DataSource = dsItemPedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Descri'#231#227'o'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Unitario'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qtd'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ID_PRODUTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Total'
          Title.Alignment = taRightJustify
          Width = 64
          Visible = True
        end>
    end
  end
  object DSPEDIDOS: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FvPedido
    OnDataChange = DSPEDIDOSDataChange
    Left = 408
    Top = 48
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FvCliente
    Left = 416
    Top = 56
  end
  object DSProdutos: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FvProduto
    Left = 416
    Top = 120
  end
  object dsItemPedido: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FvItemPedido
    Left = 248
    Top = 136
  end
end
