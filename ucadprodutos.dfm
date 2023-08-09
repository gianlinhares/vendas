inherited fcadprodutos: Tfcadprodutos
  Caption = 'Cadastro de Produtos'
  ClientHeight = 227
  ClientWidth = 433
  OnKeyDown = FormKeyDown
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 445
  ExplicitHeight = 265
  DesignSize = (
    433
    227)
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
    DataField = 'PRO_COD'
    DataSource = src_cad
  end
  object lbl_descricao: TLabel [2]
    Left = 47
    Top = 50
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
  end
  object lbl_precounitario: TLabel [3]
    Left = 47
    Top = 93
    Width = 75
    Height = 15
    Caption = 'Pre'#231'o Unit'#225'rio'
  end
  object lbl_fornec: TLabel [4]
    Left = 47
    Top = 136
    Width = 218
    Height = 15
    Caption = 'Fornecedor (F5 = Busca de Fornecedores)'
  end
  object lbl_fornec_desc: TDBText [5]
    Left = 105
    Top = 155
    Width = 320
    Height = 17
    DataField = 'FOR_NOME'
    DataSource = src_cad
  end
  inherited dbn_cad: TDBNavigator
    Hints.Strings = ()
  end
  inherited btn_sair: TBitBtn
    Left = 325
    Top = 189
    ExplicitLeft = 325
    ExplicitTop = 189
  end
  inherited btn_pesq: TBitBtn
    Left = 219
    Top = 189
    OnClick = btn_pesqClick
    ExplicitLeft = 219
    ExplicitTop = 189
  end
  object dbe_descricao: TDBEdit [9]
    Left = 47
    Top = 66
    Width = 378
    Height = 21
    DataField = 'PRO_DESC'
    DataSource = src_cad
    TabOrder = 3
  end
  object dbc_atiina: TDBCheckBox [10]
    Left = 366
    Top = 8
    Width = 59
    Height = 17
    TabStop = False
    Anchors = [akTop, akRight]
    Caption = 'Inativo'
    DataField = 'PRO_ATIINA'
    DataSource = src_cad
    TabOrder = 4
    ValueChecked = 'I'
    ValueUnchecked = 'A'
  end
  object dbe_precounitario: TDBEdit [11]
    Left = 47
    Top = 109
    Width = 98
    Height = 21
    DataField = 'PRO_PRECO'
    DataSource = src_cad
    TabOrder = 5
  end
  object dbe_fornec_cod: TDBEdit [12]
    Left = 47
    Top = 152
    Width = 55
    Height = 21
    DataField = 'PRO_FORCOD'
    DataSource = src_cad
    TabOrder = 6
  end
  inherited src_cad: TDataSource
    DataSet = dmconexao.aq_produto
  end
end
