object fcadprodutos: Tfcadprodutos
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 218
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    427
    218)
  TextHeight = 13
  object lbl_codigo: TLabel
    Left = 47
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object dbt_codigo: TDBText
    Left = 47
    Top = 27
    Width = 65
    Height = 17
    DataField = 'PRO_COD'
    DataSource = src_produto
  end
  object lbl_descricao: TLabel
    Left = 47
    Top = 50
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lbl_precounitario: TLabel
    Left = 47
    Top = 93
    Width = 67
    Height = 13
    Caption = 'Pre'#231'o Unit'#225'rio'
  end
  object lbl_fornec: TLabel
    Left = 47
    Top = 136
    Width = 204
    Height = 13
    Caption = 'Fornecedor (F5 = Busca de Fornecedores)'
  end
  object lbl_fornec_desc: TLabel
    Left = 108
    Top = 155
    Width = 75
    Height = 13
    Caption = 'lbl_fornec_desc'
  end
  object dbn_produtos: TDBNavigator
    Left = 0
    Top = 8
    Width = 41
    Height = 144
    DataSource = src_produto
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    Kind = dbnVertical
    TabOrder = 0
    BeforeAction = dbn_produtosBeforeAction
    OnClick = dbn_produtosClick
  end
  object dbe_descricao: TDBEdit
    Left = 47
    Top = 66
    Width = 372
    Height = 21
    DataField = 'PRO_DESC'
    DataSource = src_produto
    TabOrder = 1
  end
  object dbc_atiina: TDBCheckBox
    Left = 360
    Top = 8
    Width = 59
    Height = 17
    TabStop = False
    Anchors = [akTop, akRight]
    Caption = 'Inativo'
    DataField = 'PRO_ATIINA'
    DataSource = src_produto
    TabOrder = 2
    ValueChecked = 'I'
    ValueUnchecked = 'A'
  end
  object dbe_precounitario: TDBEdit
    Left = 47
    Top = 109
    Width = 98
    Height = 21
    DataField = 'PRO_PRECO'
    DataSource = src_produto
    TabOrder = 3
  end
  object dbe_fornec_cod: TDBEdit
    Left = 47
    Top = 152
    Width = 55
    Height = 21
    DataField = 'PRO_FORCOD'
    DataSource = src_produto
    TabOrder = 4
    OnExit = dbe_fornec_codExit
  end
  object btn_sair: TBitBtn
    Left = 319
    Top = 180
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Sair'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btn_sairClick
  end
  object btn_pesquisa: TButton
    Left = 213
    Top = 180
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Pesquisar'
    TabOrder = 6
    OnClick = btn_pesquisaClick
  end
  object src_produto: TDataSource
    DataSet = dmconexao.aq_produto
    Left = 360
    Top = 96
  end
end
