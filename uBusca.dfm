object FBusca: TFBusca
  Left = 0
  Top = 0
  Caption = 'FBusca'
  ClientHeight = 297
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 289
    Align = alTop
    Caption = 'Busca '
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 634
      Height = 43
      Align = alTop
      Caption = 'Pesquisa'
      TabOrder = 0
      object cb_Busca: TComboBox
        Left = 3
        Top = 19
        Width = 66
        Height = 21
        ItemIndex = 0
        TabOrder = 0
        Text = 'Todos'
        OnExit = cb_BuscaExit
        Items.Strings = (
          'Todos'
          'Pedido'
          'Nome'
          'Data ')
      end
      object EdBusca: TEdit
        Left = 90
        Top = 17
        Width = 303
        Height = 21
        TabOrder = 1
      end
      object BtFechar: TButton
        Left = 403
        Top = 15
        Width = 100
        Height = 25
        Caption = 'Busca'
        TabOrder = 2
        OnClick = BtFecharClick
      end
      object Button1: TButton
        Left = 508
        Top = 14
        Width = 100
        Height = 25
        Caption = 'Selecionar'
        TabOrder = 3
        OnClick = Button1Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 44
      Width = 634
      Height = 244
      Align = alClient
      DataSource = dsBusca
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
    end
  end
  object dsBusca: TDataSource
    DataSet = DM_testepratico.FfPedido
    Left = 504
    Top = 184
  end
end
