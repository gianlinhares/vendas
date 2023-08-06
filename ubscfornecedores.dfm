object fbscfornecedores: Tfbscfornecedores
  Left = 0
  Top = 0
  Caption = 'Busca de Fornecedores'
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
  OnShow = FormShow
  DesignSize = (
    982
    418)
  TextHeight = 13
  object shp_fim: TShape
    Left = 8
    Top = 375
    Width = 960
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
  object lbl_nome: TLabel
    Left = 87
    Top = 8
    Width = 71
    Height = 13
    Caption = 'Nome Fantasia'
  end
  object lbl_cnpj: TLabel
    Left = 598
    Top = 8
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object shp_result: TShape
    Left = 8
    Top = 67
    Width = 960
    Height = 2
    Anchors = [akLeft, akTop, akRight]
    ExplicitWidth = 1055
  end
  object lbl_result: TLabel
    Left = 8
    Top = 51
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object lbl_razaosocial: TLabel
    Left = 346
    Top = 8
    Width = 60
    Height = 13
    Caption = 'Raz'#227'o Social'
  end
  object dbg_fornecedores: TDBGrid
    Left = 8
    Top = 72
    Width = 960
    Height = 297
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = src_fornecedor
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbg_fornecedoresDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'FOR_COD'
        Title.Alignment = taRightJustify
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOR_NOME'
        Width = 363
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOR_RAZAO'
        Width = 362
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOR_CNPJ'
        Width = 108
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
    TabOrder = 4
  end
  object btn_fornecedor: TButton
    Left = 338
    Top = 380
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Cadastrar Novo'
    TabOrder = 6
    TabStop = False
    OnClick = btn_fornecedorClick
    ExplicitLeft = 332
    ExplicitTop = 371
  end
  object btn_pesquisar: TButton
    Left = 550
    Top = 380
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Pesquisar'
    TabOrder = 8
    OnClick = btn_pesquisarClick
    ExplicitLeft = 544
    ExplicitTop = 371
  end
  object btn_editar: TButton
    Left = 444
    Top = 380
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Editar Selecionado'
    Enabled = False
    TabOrder = 7
    TabStop = False
    OnClick = btn_editarClick
    ExplicitLeft = 438
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
    TabOrder = 11
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
    TabOrder = 10
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
    TabOrder = 9
    OnClick = btn_selecionarClick
  end
  object dbe_cnpj: TMaskEdit
    Left = 598
    Top = 24
    Width = 120
    Height = 21
    EditMask = '00\.000\.000\/0000\-00;0;'
    MaxLength = 18
    TabOrder = 3
    Text = ''
  end
  object dbe_codigo: TEdit
    Left = 8
    Top = 24
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object dbe_razaosocial: TEdit
    Left = 346
    Top = 24
    Width = 245
    Height = 21
    TabOrder = 2
  end
  object dbe_nome: TEdit
    Left = 87
    Top = 24
    Width = 253
    Height = 21
    TabOrder = 1
  end
  object src_fornecedor: TDataSource
    DataSet = aq_fornecedor
    Left = 616
    Top = 152
  end
  object aq_fornecedor: TADOQuery
    Connection = dmconexao.ac_connec
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [FOR_COD], [FOR_NOME], [FOR_RAZAO], [FOR_CNPJ],'
      'CASE [FOR_ATIINA]'
      '  WHEN '#39'A'#39' THEN '#39'Ativo'#39
      '  WHEN '#39'I'#39' THEN '#39'Inativo'#39
      'END AS SITUACAO'
      'FROM [dbo].[FORNECEDORES]')
    Left = 616
    Top = 208
    object aq_fornecedorFOR_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FOR_COD'
    end
    object aq_fornecedorFOR_NOME: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'FOR_NOME'
      Size = 70
    end
    object aq_fornecedorFOR_RAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'FOR_RAZAO'
      Size = 100
    end
    object aq_fornecedorFOR_CNPJ: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'FOR_CNPJ'
      EditMask = '00\.000\.000\/0000\-00;0;'
      Size = 14
    end
    object aq_fornecedorSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ReadOnly = True
      Size = 7
    end
  end
end
