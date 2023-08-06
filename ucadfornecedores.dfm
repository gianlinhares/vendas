object fcadfornecedores: Tfcadfornecedores
  Left = 0
  Top = 0
  Caption = 'Fornecedores'
  ClientHeight = 208
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    427
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
    DataField = 'FOR_COD'
    DataSource = src_fornecedor
  end
  object lbl_nome: TLabel
    Left = 47
    Top = 50
    Width = 71
    Height = 13
    Caption = 'Nome Fantasia'
  end
  object lbl_cnpj: TLabel
    Left = 47
    Top = 136
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object lbl_razaosocial: TLabel
    Left = 47
    Top = 93
    Width = 60
    Height = 13
    Caption = 'Raz'#227'o Social'
  end
  object dbn_fornecedores: TDBNavigator
    Left = 0
    Top = 8
    Width = 41
    Height = 144
    DataSource = src_fornecedor
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    Kind = dbnVertical
    TabOrder = 0
    BeforeAction = dbn_fornecedoresBeforeAction
    OnClick = dbn_fornecedoresClick
  end
  object dbe_nome: TDBEdit
    Left = 47
    Top = 66
    Width = 378
    Height = 21
    DataField = 'FOR_NOME'
    DataSource = src_fornecedor
    TabOrder = 2
  end
  object dbe_cnpj: TDBEdit
    Left = 47
    Top = 152
    Width = 122
    Height = 21
    DataField = 'FOR_CNPJ'
    DataSource = src_fornecedor
    TabOrder = 4
  end
  object dbc_atiina: TDBCheckBox
    Left = 354
    Top = 8
    Width = 59
    Height = 17
    TabStop = False
    Anchors = [akTop, akRight]
    Caption = 'Inativo'
    DataField = 'FOR_ATIINA'
    DataSource = src_fornecedor
    TabOrder = 1
    ValueChecked = 'I'
    ValueUnchecked = 'A'
  end
  object dbe_razaosocial: TDBEdit
    Left = 47
    Top = 109
    Width = 378
    Height = 21
    DataField = 'FOR_RAZAO'
    DataSource = src_fornecedor
    TabOrder = 3
  end
  object btn_sair: TBitBtn
    Left = 313
    Top = 170
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Sair'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 6
    OnClick = btn_sairClick
  end
  object btn_pesquisa: TButton
    Left = 207
    Top = 170
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Pesquisar'
    TabOrder = 5
    TabStop = False
    OnClick = btn_pesquisaClick
  end
  object src_fornecedor: TDataSource
    DataSet = dmconexao.aq_fornecedor
    Left = 200
    Top = 8
  end
end
