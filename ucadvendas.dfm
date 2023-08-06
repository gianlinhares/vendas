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
  object lbl_cli_desc: TLabel
    Left = 108
    Top = 118
    Width = 59
    Height = 15
    Caption = 'lbl_cli_desc'
  end
  object dbt_status: TDBText
    Left = 381
    Top = 27
    Width = 65
    Height = 17
    DataField = 'VEN_STATUS'
    DataSource = src_venda
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
    OnExit = dbe_cli_codExit
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
        ReadOnly = True
        Width = 366
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_PRECO'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VPR_QTDVENDIDA'
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VPR_VLRTOTPROD'
        ReadOnly = True
        Title.Alignment = taRightJustify
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
    DataSet = cds_produto
    Left = 312
    Top = 120
  end
  object cds_produto: TClientDataSet
    PersistDataPacket.Data = {
      AF0000009619E0BD010000001800000007000000000003000000AF0007565052
      5F434F4404000100000000000C5650525F4E554D56454E444104000100000000
      000A5650525F50524F434F4404000100000000000E5650525F51544456454E44
      49444108000400000000000E5650525F564C52544F5450524F44080004000000
      00000850524F5F44455343010049000000010005574944544802000200460009
      50524F5F505245434F08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VPR_COD'
        DataType = ftInteger
      end
      item
        Name = 'VPR_NUMVENDA'
        DataType = ftInteger
      end
      item
        Name = 'VPR_PROCOD'
        DataType = ftInteger
      end
      item
        Name = 'VPR_QTDVENDIDA'
        DataType = ftFloat
      end
      item
        Name = 'VPR_VLRTOTPROD'
        DataType = ftFloat
      end
      item
        Name = 'PRO_DESC'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'PRO_PRECO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforePost = cds_produtoBeforePost
    AfterPost = cds_produtoAfterPost
    BeforeDelete = cds_produtoBeforeDelete
    OnNewRecord = cds_produtoNewRecord
    Left = 408
    Top = 120
    object cds_produtoVPR_COD: TIntegerField
      FieldName = 'VPR_COD'
    end
    object cds_produtoVPR_NUMVENDA: TIntegerField
      FieldName = 'VPR_NUMVENDA'
    end
    object cds_produtoVPR_PROCOD: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'VPR_PROCOD'
      OnValidate = cds_produtoVPR_PROCODValidate
    end
    object cds_produtoVPR_QTDVENDIDA: TFloatField
      DisplayLabel = 'Quantidade Vendida'
      FieldName = 'VPR_QTDVENDIDA'
      OnValidate = cds_produtoVPR_QTDVENDIDAValidate
    end
    object cds_produtoVPR_VLRTOTPROD: TFloatField
      DisplayLabel = 'Valor Total do Produto'
      FieldName = 'VPR_VLRTOTPROD'
    end
    object cds_produtoPRO_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'PRO_DESC'
      Size = 70
    end
    object cds_produtoPRO_PRECO: TFloatField
      DisplayLabel = 'Pre'#231'o Unit'#225'rio'
      FieldName = 'PRO_PRECO'
    end
  end
  object aq_venda_produto: TADOQuery
    Connection = dmconexao.ac_connec
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'VENDA'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM VENDAS_PRODUTOS'
      'WHERE VPR_NUMVENDA = :VENDA')
    Left = 408
    Top = 62
    object aq_venda_produtoVPR_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'VPR_COD'
    end
    object aq_venda_produtoVPR_NUMVENDA: TIntegerField
      DisplayLabel = 'N'#250'mero da Venda'
      FieldName = 'VPR_NUMVENDA'
    end
    object aq_venda_produtoVPR_PROCOD: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'VPR_PROCOD'
    end
    object aq_venda_produtoVPR_QTDVENDIDA: TBCDField
      DisplayLabel = 'Quantidade Vendida'
      FieldName = 'VPR_QTDVENDIDA'
      Precision = 7
    end
    object aq_venda_produtoVPR_VLRTOTPROD: TBCDField
      DisplayLabel = 'Valor Total do Produto'
      FieldName = 'VPR_VLRTOTPROD'
      DisplayFormat = '######,.00'
      EditFormat = '######,.00'
      Precision = 7
    end
    object aq_venda_produtoPRO_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldKind = fkCalculated
      FieldName = 'PRO_DESC'
      ProviderFlags = []
      Size = 70
      Calculated = True
    end
    object aq_venda_produtoPRO_PRECO: TFloatField
      DisplayLabel = 'Pre'#231'o Unit'#225'rio'
      FieldKind = fkCalculated
      FieldName = 'PRO_PRECO'
      ProviderFlags = []
      DisplayFormat = '######,.00'
      EditFormat = '######,.00'
      Calculated = True
    end
  end
end
