inherited fcadclientes: Tfcadclientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 220
  ClientWidth = 428
  ExplicitWidth = 440
  ExplicitHeight = 258
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
    DataField = 'CLI_COD'
    DataSource = src_cad
  end
  object lbl_nome: TLabel [2]
    Left = 47
    Top = 50
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object lbl_cpf: TLabel [3]
    Left = 47
    Top = 93
    Width = 21
    Height = 15
    Caption = 'CPF'
  end
  object lbl_dtnasc: TLabel [4]
    Left = 47
    Top = 136
    Width = 107
    Height = 15
    Caption = 'Data de Nascimento'
  end
  inherited dbn_cad: TDBNavigator
    Hints.Strings = ()
  end
  inherited btn_sair: TBitBtn
    Left = 320
    Top = 182
    ExplicitLeft = 320
    ExplicitTop = 182
  end
  inherited btn_pesq: TBitBtn
    Left = 214
    Top = 182
    OnClick = btn_pesqClick
    ExplicitLeft = 214
    ExplicitTop = 182
  end
  object dbe_nome: TDBEdit [8]
    Left = 47
    Top = 66
    Width = 373
    Height = 23
    DataField = 'CLI_NOME'
    DataSource = src_cad
    TabOrder = 3
  end
  object dbe_cpf: TDBEdit [9]
    Left = 47
    Top = 109
    Width = 121
    Height = 23
    DataField = 'CLI_CPF'
    DataSource = src_cad
    TabOrder = 4
  end
  object dbe_dtnasc: TDBEdit [10]
    Left = 47
    Top = 152
    Width = 107
    Height = 23
    DataField = 'CLI_DTNASC'
    DataSource = src_cad
    TabOrder = 5
  end
  object dbc_atiina: TDBCheckBox [11]
    Left = 343
    Top = 8
    Width = 59
    Height = 17
    TabStop = False
    Anchors = [akTop, akRight]
    Caption = 'Inativo'
    DataField = 'CLI_ATIINA'
    DataSource = src_cad
    TabOrder = 6
    ValueChecked = 'I'
    ValueUnchecked = 'A'
    ExplicitLeft = 337
  end
  inherited src_cad: TDataSource
    DataSet = dmconexao.aq_cliente
    Left = 240
    Top = 16
  end
end
