object fcadvendas: Tfcadvendas
  Left = 0
  Top = 0
  Caption = 'Vendas'
  ClientHeight = 402
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    889
    402)
  TextHeight = 15
  object lbl_numero: TLabel
    Left = 47
    Top = 8
    Width = 44
    Height = 15
    Caption = 'N'#250'mero'
  end
  object dbt_numero: TDBText
    Left = 47
    Top = 27
    Width = 65
    Height = 17
    DataField = 'VEN_NUMERO'
    DataSource = src_venda
  end
  object lbl_datahora: TLabel
    Left = 47
    Top = 50
    Width = 106
    Height = 15
    Caption = 'Data/Hora da Venda'
  end
  object lbl_fornec: TLabel
    Left = 47
    Top = 97
    Width = 166
    Height = 15
    Caption = 'Cliente (F5 = Busca de Clientes)'
  end
  object lbl_status: TLabel
    Left = 381
    Top = 8
    Width = 32
    Height = 15
    Caption = 'Status'
  end
  object shp_prod: TShape
    Left = 47
    Top = 207
    Width = 834
    Height = 2
    Anchors = [akLeft, akTop, akRight]
    ExplicitWidth = 584
  end
  object lbl_produto: TLabel
    Left = 47
    Top = 189
    Width = 327
    Height = 15
    Caption = 'Produto(s) (F5 no c'#243'digo do produto = Consulta de Produtos)'
  end
  object lbl_vltot: TLabel
    Left = 47
    Top = 142
    Width = 54
    Height = 15
    Caption = 'Valor Total'
  end
  object dbt_status: TDBText
    Left = 381
    Top = 27
    Width = 65
    Height = 17
    DataField = 'VEN_STATUS'
    DataSource = src_venda
  end
  object dbt_cli_desc: TDBText
    Left = 108
    Top = 118
    Width = 389
    Height = 17
  end
  object dtp_datahora: TDateTimePicker
    Left = 47
    Top = 68
    Width = 164
    Height = 23
    Date = 45143.000000000000000000
    Time = 0.757150995370466300
    TabOrder = 7
    TabStop = False
    OnChange = dtp_datahoraChange
  end
  object dbn_vendas: TDBNavigator
    Left = 0
    Top = 8
    Width = 41
    Height = 144
    DataSource = src_venda
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    Kind = dbnVertical
    TabOrder = 0
    BeforeAction = dbn_vendasBeforeAction
    OnClick = dbn_vendasClick
  end
  object btn_pesquisa: TButton
    Left = 675
    Top = 364
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Pesquisar'
    TabOrder = 6
    OnClick = btn_pesquisaClick
  end
  object dbe_datahora: TDBEdit
    Left = 47
    Top = 68
    Width = 130
    Height = 23
    DataField = 'VEN_DATAHORA'
    DataSource = src_venda
    MaxLength = 19
    TabOrder = 1
  end
  object dbe_cli_cod: TDBEdit
    Left = 47
    Top = 115
    Width = 55
    Height = 23
    DataField = 'VEN_CLICOD'
    DataSource = src_venda
    TabOrder = 2
  end
  object dbe_vltot: TDBEdit
    Left = 47
    Top = 160
    Width = 121
    Height = 23
    DataField = 'VEN_VLRTOTAL'
    DataSource = src_venda
    ReadOnly = True
    TabOrder = 3
  end
  object dbn_produtos: TDBNavigator
    Left = 47
    Top = 212
    Width = 41
    Height = 144
    DataSource = src_venda_produto
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    Kind = dbnVertical
    TabOrder = 4
    BeforeAction = dbn_produtosBeforeAction
  end
  object dbg_produtos: TDBGrid
    Left = 91
    Top = 212
    Width = 790
    Height = 144
    Anchors = [akLeft, akTop, akRight]
    DataSource = src_venda_produto
    TabOrder = 5
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
  object btn_sair: TButton
    Left = 781
    Top = 362
    Width = 100
    Height = 30
    Caption = 'Sair'
    TabOrder = 8
    OnClick = btn_sairClick
  end
  object btn_efetivar: TButton
    Left = 569
    Top = 364
    Width = 100
    Height = 30
    Caption = 'Efetivar Venda'
    TabOrder = 9
    OnClick = btn_efetivarClick
  end
  object src_venda: TDataSource
    DataSet = dmconexao.aq_venda
    OnStateChange = src_vendaStateChange
    OnDataChange = src_vendaDataChange
    Left = 315
    Top = 69
  end
  object src_venda_produto: TDataSource
    DataSet = dmconexao.aq_venda_produto
    Left = 320
    Top = 128
  end
end
