object fListarArquivos: TfListarArquivos
  Left = 0
  Top = 0
  Caption = 'fListarArquivos'
  ClientHeight = 472
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 638
    Height = 372
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
    ExplicitLeft = 16
    ExplicitTop = 48
    ExplicitWidth = 185
    ExplicitHeight = 353
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 428
    Width = 638
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = 360
    ExplicitTop = 376
    ExplicitWidth = 185
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Action = ActionListar
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 638
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 2
    ExplicitLeft = 296
    ExplicitTop = 184
    ExplicitWidth = 185
    object Label1: TLabel
      Left = 8
      Top = 14
      Width = 68
      Height = 13
      Caption = 'Diret'#243'rio alvo:'
    end
    object Edit1: TEdit
      Left = 82
      Top = 11
      Width = 415
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button2: TButton
      Left = 503
      Top = 9
      Width = 26
      Height = 25
      Caption = '...'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object ActionList1: TActionList
    Left = 128
    Top = 136
    object ActionListar: TAction
      Caption = 'Gerar Lista'
      OnExecute = ActionListarExecute
    end
  end
  object FileOpenDialog2: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Title = 'Selecionar diret'#243'rio'
    Left = 128
    Top = 72
  end
end
