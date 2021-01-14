object FCadProduto: TFCadProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produto'
  ClientHeight = 395
  ClientWidth = 527
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 395
    Align = alLeft
    AutoSize = True
    Caption = 'Panel3'
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 526
      Height = 29
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Panel1'
      ShowCaption = False
      TabOrder = 0
      object Label16: TLabel
        Left = 360
        Top = 8
        Width = 52
        Height = 13
        Caption = '0000/0000'
      end
      object Button1: TButton
        Left = 3
        Top = 2
        Width = 48
        Height = 25
        Caption = 'Novo'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 209
        Top = 2
        Width = 48
        Height = 25
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 155
        Top = 2
        Width = 48
        Height = 25
        Caption = 'Gravar'
        Enabled = False
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 53
        Top = 2
        Width = 48
        Height = 25
        Caption = 'Editar'
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 105
        Top = 2
        Width = 48
        Height = 25
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = Button5Click
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 30
      Width = 526
      Height = 107
      Align = alTop
      TabOrder = 1
      ExplicitTop = 34
      object Label1: TLabel
        Left = 30
        Top = 13
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Codigo'
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 21
        Top = 42
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descri'#231#227'o'
      end
      object Label5: TLabel
        Left = 4
        Top = 71
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pre'#231'o Unitario '
        FocusControl = DBEdit5
      end
      object DBEdit1: TDBEdit
        Left = 80
        Top = 12
        Width = 64
        Height = 21
        DataField = 'Codigo'
        DataSource = DSProduto
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit5: TDBEdit
        Left = 80
        Top = 68
        Width = 134
        Height = 21
        DataField = 'Valor'
        DataSource = DSProduto
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 80
        Top = 41
        Width = 393
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Produto'
        DataSource = DSProduto
        TabOrder = 1
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 137
      Width = 526
      Height = 257
      Align = alClient
      DataSource = DSProduto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object DSProduto: TDataSource
    AutoEdit = False
    DataSet = DM_testepratico.FvProduto
    OnDataChange = DSProdutoDataChange
    Left = 464
    Top = 152
  end
  object DataSource1: TDataSource
    Left = 312
    Top = 248
  end
end
