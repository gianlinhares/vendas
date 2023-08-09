inherited fcadvendas: Tfcadvendas
  Caption = 'Cadastro de Vendas'
  ClientHeight = 411
  ClientWidth = 895
  OnKeyDown = FormKeyDown
  ExplicitWidth = 907
  ExplicitHeight = 449
  DesignSize = (
    895
    411)
  TextHeight = 15
  object lbl_numero: TLabel [0]
    Left = 47
    Top = 8
    Width = 44
    Height = 15
    Caption = 'N'#250'mero'
  end
  object dbt_numero: TDBText [1]
    Left = 47
    Top = 27
    Width = 65
    Height = 17
    DataField = 'VEN_NUMERO'
    DataSource = src_cad
  end
  object lbl_datahora: TLabel [2]
    Left = 47
    Top = 50
    Width = 106
    Height = 15
    Caption = 'Data/Hora da Venda'
  end
  object lbl_fornec: TLabel [3]
    Left = 47
    Top = 97
    Width = 166
    Height = 15
    Caption = 'Cliente (F5 = Busca de Clientes)'
  end
  object lbl_status: TLabel [4]
    Left = 381
    Top = 8
    Width = 32
    Height = 15
    Caption = 'Status'
  end
  object shp_prod: TShape [5]
    Left = 47
    Top = 207
    Width = 834
    Height = 2
    Anchors = [akLeft, akTop, akRight]
    ExplicitWidth = 840
  end
  object lbl_produto: TLabel [6]
    Left = 47
    Top = 189
    Width = 327
    Height = 15
    Caption = 'Produto(s) (F5 no c'#243'digo do produto = Consulta de Produtos)'
  end
  object lbl_vltot: TLabel [7]
    Left = 47
    Top = 142
    Width = 54
    Height = 15
    Caption = 'Valor Total'
  end
  object dbt_status: TDBText [8]
    Left = 381
    Top = 27
    Width = 65
    Height = 17
    DataField = 'VEN_STATUS'
    DataSource = src_cad
  end
  object dbt_cli_desc: TDBText [9]
    Left = 108
    Top = 118
    Width = 389
    Height = 17
    DataField = 'CLI_NOME'
    DataSource = src_cad
  end
  inherited dbn_cad: TDBNavigator
    Hints.Strings = ()
  end
  inherited btn_sair: TBitBtn
    Left = 781
    Top = 373
    ExplicitLeft = 775
    ExplicitTop = 364
  end
  inherited btn_pesq: TBitBtn
    Left = 675
    Top = 373
    OnClick = btn_pesqClick
    ExplicitLeft = 669
    ExplicitTop = 364
  end
  object dtp_datahora: TDateTimePicker [13]
    Left = 47
    Top = 68
    Width = 164
    Height = 23
    Date = 45143.000000000000000000
    Time = 0.757150995370466300
    TabOrder = 3
    TabStop = False
  end
  object dbe_datahora: TDBEdit [14]
    Left = 47
    Top = 68
    Width = 130
    Height = 23
    DataField = 'VEN_DATAHORA'
    DataSource = src_cad
    MaxLength = 19
    TabOrder = 4
  end
  object dbe_cli_cod: TDBEdit [15]
    Left = 47
    Top = 115
    Width = 55
    Height = 23
    DataField = 'VEN_CLICOD'
    DataSource = src_cad
    TabOrder = 5
  end
  object dbe_vltot: TDBEdit [16]
    Left = 47
    Top = 160
    Width = 121
    Height = 23
    DataField = 'VEN_VLRTOTAL'
    DataSource = src_cad
    ReadOnly = True
    TabOrder = 6
  end
  object dbn_produtos: TDBNavigator [17]
    Left = 47
    Top = 212
    Width = 41
    Height = 144
    DataSource = src_venda_produto
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    Kind = dbnVertical
    TabOrder = 7
  end
  object dbg_produtos: TDBGrid [18]
    Left = 91
    Top = 212
    Width = 790
    Height = 155
    Anchors = [akLeft, akTop, akRight]
    DataSource = src_venda_produto
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnEditButtonClick = dbg_produtosEditButtonClick
    OnKeyDown = dbg_produtosKeyDown
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'VPR_PROCOD'
        Title.Alignment = taRightJustify
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_DESC'
        Width = 366
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_PRECO'
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VPR_QTDVENDIDA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Qtd Vendida'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VPR_VLRTOTPROD'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 145
        Visible = True
      end>
  end
  object btn_efetivar: TButton [19]
    Left = 569
    Top = 373
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Efetivar Venda'
    TabOrder = 9
    OnClick = btn_efetivarClick
  end
  inherited src_cad: TDataSource
    DataSet = dmconexao.aq_venda
  end
  object src_venda_produto: TDataSource
    DataSet = dmconexao.aq_venda_produto
    Left = 552
    Top = 120
  end
end
