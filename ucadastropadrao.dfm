object fcadastropadrao: Tfcadastropadrao
  Left = 0
  Top = 0
  Caption = 'Cadastro de'
  ClientHeight = 356
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  DesignSize = (
    628
    356)
  TextHeight = 15
  object dbn_cad: TDBNavigator
    Left = 8
    Top = 8
    Width = 25
    Height = 136
    DataSource = src_cad
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    Kind = dbnVertical
    TabOrder = 0
    BeforeAction = dbn_cadBeforeAction
  end
  object btn_sair: TBitBtn
    Left = 514
    Top = 318
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Sair'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btn_sairClick
    ExplicitLeft = 508
    ExplicitTop = 309
  end
  object btn_pesq: TBitBtn
    Left = 408
    Top = 318
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Pesquisar'
    NumGlyphs = 2
    TabOrder = 2
    ExplicitLeft = 402
    ExplicitTop = 309
  end
  object src_cad: TDataSource
    Left = 288
    Top = 24
  end
end
