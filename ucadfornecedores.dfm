inherited fcadfornecedores: Tfcadfornecedores
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 218
  ClientWidth = 433
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 445
  ExplicitHeight = 256
  DesignSize = (
    433
    218)
  TextHeight = 15
  object lbl_codigo: TLabel [0]
    Left = 47
    Top = 8
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object dbt_codigo: TDBText [1]
    Left = 47
    Top = 27
    Width = 65
    Height = 17
    DataField = 'FOR_COD'
    DataSource = src_cad
  end
  object lbl_nome: TLabel [2]
    Left = 47
    Top = 50
    Width = 79
    Height = 15
    Caption = 'Nome Fantasia'
  end
  object lbl_cnpj: TLabel [3]
    Left = 47
    Top = 136
    Width = 27
    Height = 15
    Caption = 'CNPJ'
  end
  object lbl_razaosocial: TLabel [4]
    Left = 47
    Top = 93
    Width = 65
    Height = 15
    Caption = 'Raz'#227'o Social'
  end
  inherited dbn_cad: TDBNavigator
    Hints.Strings = ()
  end
  inherited btn_sair: TBitBtn
    Left = 325
    Top = 180
    ExplicitLeft = 514
    ExplicitTop = 318
  end
  inherited btn_pesq: TBitBtn
    Left = 219
    Top = 180
    OnClick = btn_pesqClick
    ExplicitLeft = 408
    ExplicitTop = 318
  end
  object dbe_nome: TDBEdit [8]
    Left = 47
    Top = 66
    Width = 378
    Height = 21
    DataField = 'FOR_NOME'
    DataSource = src_cad
    TabOrder = 3
  end
  object dbe_cnpj: TDBEdit [9]
    Left = 47
    Top = 152
    Width = 122
    Height = 21
    DataField = 'FOR_CNPJ'
    DataSource = src_cad
    TabOrder = 4
  end
  object dbc_atiina: TDBCheckBox [10]
    Left = 366
    Top = 8
    Width = 59
    Height = 17
    TabStop = False
    Anchors = [akTop, akRight]
    Caption = 'Inativo'
    DataField = 'FOR_ATIINA'
    DataSource = src_cad
    TabOrder = 5
    ValueChecked = 'I'
    ValueUnchecked = 'A'
    ExplicitLeft = 555
  end
  object dbe_razaosocial: TDBEdit [11]
    Left = 47
    Top = 109
    Width = 378
    Height = 21
    DataField = 'FOR_RAZAO'
    DataSource = src_cad
    TabOrder = 6
  end
  inherited src_cad: TDataSource
    DataSet = dmconexao.aq_fornecedor
  end
end
