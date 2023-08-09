object fbuscapadrao: Tfbuscapadrao
  Left = 0
  Top = 0
  Caption = 'Busca de'
  ClientHeight = 442
  ClientWidth = 998
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  DesignSize = (
    998
    442)
  TextHeight = 15
  object shp_fim: TShape
    Left = 8
    Top = 399
    Width = 976
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    ExplicitWidth = 982
  end
  object shp_result: TShape
    Left = 8
    Top = 69
    Width = 976
    Height = 2
    Anchors = [akLeft, akTop, akRight]
    ExplicitWidth = 982
  end
  object lbl_result: TLabel
    Left = 8
    Top = 51
    Width = 52
    Height = 15
    Caption = 'Resultado'
  end
  object lbl_busca: TLabel
    Left = 199
    Top = 8
    Width = 118
    Height = 15
    Caption = 'Texto a ser Pesquisado'
  end
  object btn_cadastra: TButton
    Left = 439
    Top = 404
    Width = 121
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Acessar Cadastro'
    TabOrder = 2
    TabStop = False
    OnClick = btn_cadastraClick
    ExplicitLeft = 433
    ExplicitTop = 395
  end
  object dbg_clientes: TDBGrid
    Left = 8
    Top = 74
    Width = 976
    Height = 319
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = src
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btn_pesquisar: TButton
    Left = 566
    Top = 404
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Pesquisar'
    TabOrder = 3
    OnClick = btn_pesquisarClick
    ExplicitLeft = 560
    ExplicitTop = 395
  end
  object btn_sair: TBitBtn
    Left = 884
    Top = 404
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Sair'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 6
    OnClick = btn_sairClick
    ExplicitLeft = 878
    ExplicitTop = 395
  end
  object btn_limpar: TBitBtn
    Left = 778
    Top = 404
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Limpar'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btn_limparClick
    ExplicitLeft = 772
    ExplicitTop = 395
  end
  object btn_selecionar: TBitBtn
    Left = 672
    Top = 404
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Selecionar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btn_selecionarClick
    ExplicitLeft = 666
    ExplicitTop = 395
  end
  object dbe_busca: TEdit
    Left = 199
    Top = 24
    Width = 579
    Height = 23
    TabOrder = 0
  end
  object rdg_filtro: TRadioGroup
    Left = 8
    Top = 8
    Width = 185
    Height = 37
    Caption = 'Filtro'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    TabOrder = 7
  end
  object src: TDataSource
    Left = 40
    Top = 304
  end
end
