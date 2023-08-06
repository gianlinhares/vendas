object fbscvendas: Tfbscvendas
  Left = 0
  Top = 0
  Caption = 'Busca de Vendas'
  ClientHeight = 496
  ClientWidth = 982
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
    982
    496)
  TextHeight = 13
  object shp_fim: TShape
    Left = 8
    Top = 453
    Width = 966
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    ExplicitTop = 375
    ExplicitWidth = 832
  end
  object lbl_result: TLabel
    Left = 8
    Top = 51
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object shp_result: TShape
    Left = 8
    Top = 67
    Width = 966
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object lbl_cliente: TLabel
    Left = 87
    Top = 8
    Width = 154
    Height = 13
    Caption = 'Cliente (F5 = Busca de Clientes)'
  end
  object lbl_cli_desc: TLabel
    Left = 148
    Top = 27
    Width = 97
    Height = 13
    Caption = 'Descri'#231#227'o do Cliente'
  end
  object lbl_numero: TLabel
    Left = 8
    Top = 8
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object lbl_produto: TLabel
    Left = 405
    Top = 8
    Width = 164
    Height = 13
    Caption = 'Produto (F5 = Busca de Produtos)'
  end
  object lbl_prod_desc: TLabel
    Left = 466
    Top = 27
    Width = 102
    Height = 13
    Caption = 'Descri'#231#227'o do Produto'
  end
  object lbl_prod: TLabel
    Left = 120
    Top = 311
    Width = 43
    Height = 13
    Caption = 'Produtos'
  end
  object Shape1: TShape
    Left = 120
    Top = 327
    Width = 854
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object aq_vendaprodLabel: TLabel
    Left = 8
    Top = 51
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object aq_vendaprodShape: TShape
    Left = 8
    Top = 67
    Width = 966
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object aq_vendaprodLabel2: TLabel
    Left = 8
    Top = 51
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object aq_vendaprodShape2: TShape
    Left = 8
    Top = 67
    Width = 966
    Height = 2
    Anchors = [akLeft, akTop, akRight]
  end
  object dbg_vendas: TDBGrid
    Left = 8
    Top = 72
    Width = 966
    Height = 233
    Anchors = [akLeft, akTop, akRight]
    DataSource = src_venda
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbg_vendasDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'VEN_NUMERO'
        Title.Alignment = taRightJustify
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VEN_CLICOD'
        Title.Alignment = taRightJustify
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_NOME'
        Width = 535
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VEN_DATAHORA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VEN_VLRTOTAL'
        Title.Alignment = taRightJustify
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Width = 88
        Visible = True
      end>
  end
  object btn_produto: TButton
    Left = 344
    Top = 458
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Cadastrar Novo'
    TabOrder = 1
    TabStop = False
    OnClick = btn_produtoClick
  end
  object btn_pesquisar: TButton
    Left = 556
    Top = 458
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Pesquisar'
    TabOrder = 3
    OnClick = btn_pesquisarClick
  end
  object btn_editar: TButton
    Left = 450
    Top = 458
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Editar Selecionado'
    Enabled = False
    TabOrder = 2
    TabStop = False
    OnClick = btn_editarClick
  end
  object btn_sair: TBitBtn
    Left = 874
    Top = 458
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Sair'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 6
    OnClick = btn_sairClick
  end
  object btn_limpar: TBitBtn
    Left = 768
    Top = 458
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Limpar'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btn_limparClick
  end
  object btn_selecionar: TBitBtn
    Left = 662
    Top = 458
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = 'Selecionar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btn_selecionarClick
  end
  object dbe_cli_cod: TEdit
    Left = 87
    Top = 24
    Width = 55
    Height = 21
    TabOrder = 7
    OnExit = dbe_cli_codExit
  end
  object dbe_codigo: TEdit
    Left = 8
    Top = 24
    Width = 73
    Height = 21
    TabOrder = 8
  end
  object rdg_status: TRadioGroup
    Left = 726
    Top = 8
    Width = 248
    Height = 37
    Caption = 'Situa'#231#227'o'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Pendente'
      'Efetivada'
      'Ambos')
    TabOrder = 9
  end
  object dbe_prod_cod: TEdit
    Left = 405
    Top = 24
    Width = 55
    Height = 21
    TabOrder = 10
    OnExit = dbe_prod_codExit
  end
  object dbg_prod: TDBGrid
    Left = 120
    Top = 332
    Width = 854
    Height = 115
    DataSource = src_produtos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'VPR_PROCOD'
        Title.Alignment = taRightJustify
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_DESC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_PRECO'
        Title.Alignment = taRightJustify
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VPR_QTDVENDIDA'
        Title.Alignment = taRightJustify
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VPR_VLRTOTPROD'
        Title.Alignment = taRightJustify
        Visible = True
      end>
  end
  object src_venda: TDataSource
    DataSet = aq_venda
    Left = 576
    Top = 176
  end
  object aq_venda: TADOQuery
    Connection = dmconexao.ac_connec
    CursorType = ctStatic
    AfterScroll = aq_vendaAfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT[VEN_NUMERO],  [VEN_CLICOD], [VEN_DATAHORA], [VEN_VLRTOTAL' +
        '],'
      'CASE [VEN_STATUS]'
      '  WHEN '#39'P'#39' THEN '#39'Pendente'#39
      '  WHEN '#39'E'#39' THEN '#39'Efetivada'#39
      'END AS STATUS, CLI_NOME'
      'FROM dbo.VENDAS'
      'LEFT JOIN dbo.CLIENTES ON CLI_COD = VEN_CLICOD')
    Left = 576
    Top = 232
    object aq_vendaVEN_NUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'VEN_NUMERO'
    end
    object aq_vendaVEN_CLICOD: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'VEN_CLICOD'
    end
    object aq_vendaVEN_VLRTOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VEN_VLRTOTAL'
      DisplayFormat = '######,.00'
      EditFormat = '######,.00'
      Precision = 7
    end
    object aq_vendaSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 9
    end
    object aq_vendaCLI_NOME: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'CLI_NOME'
      Size = 70
    end
    object aq_vendaVEN_DATAHORA: TDateTimeField
      DisplayLabel = 'Data/Hora da Venda'
      FieldName = 'VEN_DATAHORA'
      EditMask = '!99/99/9999 99:99:99;1;_'
    end
  end
  object aq_produtos: TADOQuery
    Connection = dmconexao.ac_connec
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT [VPR_PROCOD], [VPR_QTDVENDIDA], [VPR_VLRTOTPROD], [PRO_DE' +
        'SC], [PRO_PRECO]'
      'FROM dbo.VENDAS_PRODUTOS vp'
      'LEFT JOIN dbo.PRODUTOS ON [PRO_COD] = [VPR_PROCOD]')
    Left = 656
    Top = 232
    object aq_produtosVPR_PROCOD: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'VPR_PROCOD'
    end
    object aq_produtosVPR_QTDVENDIDA: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'VPR_QTDVENDIDA'
      Precision = 7
    end
    object aq_produtosVPR_VLRTOTPROD: TBCDField
      DisplayLabel = 'Valor Total do Produto'
      FieldName = 'VPR_VLRTOTPROD'
      DisplayFormat = '######,.00'
      EditFormat = '######,.00'
      Precision = 7
    end
    object aq_produtosPRO_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'PRO_DESC'
      Size = 70
    end
    object aq_produtosPRO_PRECO: TBCDField
      DisplayLabel = 'Pre'#231'o Unit'#225'rio'
      FieldName = 'PRO_PRECO'
      DisplayFormat = '######,.00'
      EditFormat = '######,.00'
      Precision = 7
    end
  end
  object src_produtos: TDataSource
    DataSet = aq_produtos
    Left = 656
    Top = 176
  end
end
