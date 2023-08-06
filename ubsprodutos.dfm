object fbscprodutos: Tfbscprodutos
  Left = 0
  Top = 0
  Caption = 'Busca de Produtos'
  ClientHeight = 418
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
    418)
  TextHeight = 13
  object shp_fim: TShape
    Left = 8
    Top = 375
    Width = 966
    Height = 2
    Anchors = [akLeft, akRight, akBottom]
    ExplicitWidth = 832
  end
  object lbl_codigo: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lbl_desc: TLabel
    Left = 87
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lbl_fornec: TLabel
    Left = 382
    Top = 8
    Width = 204
    Height = 13
    Caption = 'Fornecedor (F5 = Busca de Fornecedores)'
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
    Anchors = [akLeft, akRight, akBottom]
    ExplicitWidth = 1055
  end
  object lbl_fornec_desc: TLabel
    Left = 443
    Top = 27
    Width = 119
    Height = 13
    Caption = 'Descri'#231#227'o do Fornecedor'
  end
  object dbg_produtos: TDBGrid
    Left = 8
    Top = 72
    Width = 966
    Height = 297
    Anchors = [akLeft, akTop, akRight]
    DataSource = src_produto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbg_produtosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PRO_COD'
        Title.Alignment = taRightJustify
        Width = 54
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
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_FORCOD'
        Title.Alignment = taRightJustify
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOR_NOME'
        Width = 266
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACAO'
        Visible = True
      end>
  end
  object rdg_atiina: TRadioGroup
    Left = 726
    Top = 8
    Width = 248
    Height = 37
    Caption = 'Situa'#231#227'o'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Ativo'
      'Inativo'
      'Ambos')
    TabOrder = 3
  end
  object dbe_fornec_cod: TEdit
    Left = 382
    Top = 24
    Width = 55
    Height = 21
    TabOrder = 2
    OnExit = dbe_fornec_codExit
  end
  object dbe_desc: TEdit
    Left = 87
    Top = 24
    Width = 289
    Height = 21
    TabOrder = 1
  end
  object dbe_codigo: TEdit
    Left = 8
    Top = 24
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object btn_produto: TButton
    Left = 344
    Top = 380
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Cadastrar Novo'
    TabOrder = 5
    TabStop = False
    OnClick = btn_produtoClick
    ExplicitLeft = 338
    ExplicitTop = 371
  end
  object btn_pesquisar: TButton
    Left = 556
    Top = 380
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Pesquisar'
    TabOrder = 7
    OnClick = btn_pesquisarClick
    ExplicitLeft = 550
    ExplicitTop = 371
  end
  object btn_editar: TButton
    Left = 450
    Top = 380
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Editar Selecionado'
    Enabled = False
    TabOrder = 6
    TabStop = False
    OnClick = btn_editarClick
    ExplicitLeft = 444
    ExplicitTop = 371
  end
  object btn_sair: TBitBtn
    Left = 874
    Top = 380
    Width = 100
    Height = 30
    Caption = '&Sair'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 10
    OnClick = btn_sairClick
  end
  object btn_limpar: TBitBtn
    Left = 768
    Top = 380
    Width = 100
    Height = 30
    Caption = '&Limpar'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 9
    OnClick = btn_limparClick
  end
  object btn_selecionar: TBitBtn
    Left = 662
    Top = 380
    Width = 100
    Height = 30
    Caption = 'Selecionar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 8
    OnClick = btn_selecionarClick
  end
  object src_produto: TDataSource
    DataSet = aq_produto
    Left = 576
    Top = 176
  end
  object aq_produto: TADOQuery
    Connection = dmconexao.ac_connec
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [PRO_COD], [PRO_DESC], [PRO_PRECO], [PRO_FORCOD], '
      'CASE [PRO_ATIINA]'
      '  WHEN '#39'A'#39' THEN '#39'Ativo'#39
      '  WHEN '#39'I'#39' THEN '#39'Inativo'#39
      'END AS SITUACAO, FOR_NOME'
      'FROM dbo.PRODUTOS'
      'LEFT JOIN dbo.FORNECEDORES ON FOR_COD = PRO_FORCOD')
    Left = 576
    Top = 232
    object aq_produtoPRO_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRO_COD'
    end
    object aq_produtoPRO_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'PRO_DESC'
      Size = 70
    end
    object aq_produtoPRO_PRECO: TBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRO_PRECO'
      DisplayFormat = '######,.00'
      EditFormat = '######,.00'
      Precision = 7
    end
    object aq_produtoPRO_FORCOD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRO_FORCOD'
    end
    object aq_produtoSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ReadOnly = True
      Size = 7
    end
    object aq_produtoFOR_NOME: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FOR_NOME'
      Size = 70
    end
  end
end
