object fcadclientes: Tfcadclientes
  Left = 0
  Top = 0
  Caption = 'Clientes'
  ClientHeight = 208
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    494
    208)
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
    DataField = 'CLI_COD'
    DataSource = src_cliente
  end
  object lbl_nome: TLabel
    Left = 47
    Top = 50
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lbl_cpf: TLabel
    Left = 47
    Top = 93
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object lbl_dtnasc: TLabel
    Left = 47
    Top = 136
    Width = 96
    Height = 13
    Caption = 'Data de Nascimento'
  end
  object dbn_produtos: TDBNavigator
    Left = 0
    Top = 8
    Width = 41
    Height = 124
    DataSource = src_cliente
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    Kind = dbnVertical
    TabOrder = 0
    BeforeAction = dbn_produtosBeforeAction
    OnClick = dbn_produtosClick
  end
  object dbe_nome: TDBEdit
    Left = 47
    Top = 66
    Width = 378
    Height = 21
    DataField = 'CLI_NOME'
    DataSource = src_cliente
    TabOrder = 2
  end
  object dbe_cpf: TDBEdit
    Left = 47
    Top = 109
    Width = 121
    Height = 21
    DataField = 'CLI_CPF'
    DataSource = src_cliente
    TabOrder = 3
  end
  object dbc_atiina: TDBCheckBox
    Left = 427
    Top = 8
    Width = 59
    Height = 17
    TabStop = False
    Anchors = [akTop, akRight]
    Caption = 'Inativo'
    DataField = 'CLI_ATIINA'
    DataSource = src_cliente
    TabOrder = 1
    ValueChecked = 'I'
    ValueUnchecked = 'A'
    ExplicitLeft = 420
  end
  object dbe_dtnasc: TDBEdit
    Left = 47
    Top = 152
    Width = 92
    Height = 21
    DataField = 'CLI_DTNASC'
    DataSource = src_cliente
    TabOrder = 4
  end
  object btn_sair: TBitBtn
    Left = 386
    Top = 170
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Sair'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 6
    OnClick = btn_sairClick
    ExplicitLeft = 379
  end
  object btn_pesquisa: TButton
    Left = 280
    Top = 170
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Pesquisar'
    TabOrder = 5
    OnClick = btn_pesquisaClick
    ExplicitLeft = 273
  end
  object src_cliente: TDataSource
    DataSet = dmconexao.aq_cliente
    Left = 152
    Top = 8
  end
end
