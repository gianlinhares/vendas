object fbscclientes: Tfbscclientes
  Left = 0
  Top = 0
  Caption = 'Busca de Clientes'
  ClientHeight = 418
  ClientWidth = 844
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
    844
    418)
  TextHeight = 13
  object shp_fim: TShape
    Left = 8
    Top = 375
    Width = 822
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
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object shp_result: TShape
    Left = 8
    Top = 67
    Width = 822
    Height = 2
    Anchors = [akLeft, akTop, akRight]
    ExplicitWidth = 1055
  end
  object lbl_cpf: TLabel
    Left = 382
    Top = 8
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object lbl_pernasc: TLabel
    Left = 487
    Top = 8
    Width = 109
    Height = 13
    Caption = 'Per'#237'odo de Nascimento'
  end
  object lbl_a: TLabel
    Left = 561
    Top = 27
    Width = 6
    Height = 13
    Caption = 'a'
  end
  object lbl_result: TLabel
    Left = 8
    Top = 51
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object btn_cliente: TButton
    Left = 200
    Top = 380
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Cadastrar Novo'
    TabOrder = 7
    TabStop = False
    OnClick = btn_clienteClick
  end
  object dbg_clientes: TDBGrid
    Left = 8
    Top = 72
    Width = 822
    Height = 297
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = src_clibusca
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbg_clientesDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CLI_COD'
        Title.Alignment = taRightJustify
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_NOME'
        Width = 490
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_CPF'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_DTNASC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACAO'
        Visible = True
      end>
  end
  object rdg_atiina: TRadioGroup
    Left = 640
    Top = 8
    Width = 196
    Height = 37
    Caption = 'Situa'#231#227'o'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Ativo'
      'Inativo'
      'Ambos')
    TabOrder = 5
  end
  object btn_pesquisar: TButton
    Left = 412
    Top = 380
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Pesquisar'
    TabOrder = 9
    OnClick = btn_pesquisarClick
  end
  object dbe_dtnasc_ini: TMaskEdit
    Left = 487
    Top = 24
    Width = 68
    Height = 21
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 3
    Text = '  /  /    '
  end
  object dbe_dtnasc_fim: TMaskEdit
    Left = 573
    Top = 24
    Width = 61
    Height = 21
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
  end
  object btn_editar: TButton
    Left = 306
    Top = 380
    Width = 100
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = '&Editar Selecionado'
    Enabled = False
    TabOrder = 8
    TabStop = False
    OnClick = btn_editarClick
  end
  object dbe_codigo: TEdit
    Left = 8
    Top = 24
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object dbe_nome: TEdit
    Left = 87
    Top = 24
    Width = 289
    Height = 21
    TabOrder = 1
  end
  object dbe_cpf: TMaskEdit
    Left = 382
    Top = 24
    Width = 99
    Height = 21
    EditMask = '999 999 999\-99;0;_'
    MaxLength = 14
    TabOrder = 2
    Text = ''
  end
  object btn_sair: TBitBtn
    Left = 736
    Top = 380
    Width = 100
    Height = 30
    Caption = '&Sair'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 12
    OnClick = btn_sairClick
  end
  object btn_limpar: TBitBtn
    Left = 630
    Top = 380
    Width = 100
    Height = 30
    Caption = '&Limpar'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 11
    OnClick = btn_limparClick
  end
  object btn_selecionar: TBitBtn
    Left = 524
    Top = 380
    Width = 100
    Height = 30
    Caption = 'Selecionar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 10
    OnClick = btn_selecionarClick
  end
  object aq_cliente: TADOQuery
    Connection = dmconexao.ac_connec
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [CLI_COD],[CLI_NOME],[CLI_CPF],[CLI_DTNASC],'
      'CASE [CLI_ATIINA]'
      '  WHEN '#39'A'#39' THEN '#39'Ativo'#39
      '  WHEN '#39'I'#39' THEN '#39'Inativo'#39
      'END AS SITUACAO'
      'FROM [dbo].[CLIENTES]')
    Left = 520
    Top = 216
    object aq_clienteCLI_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLI_COD'
    end
    object aq_clienteCLI_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'CLI_NOME'
      Size = 70
    end
    object aq_clienteCLI_CPF: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'CLI_CPF'
      EditMask = '999 999 999\-99;0;_'
      Size = 11
    end
    object aq_clienteCLI_DTNASC: TDateField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'CLI_DTNASC'
      EditMask = '!99/99/9999;1;_'
    end
    object aq_clienteSITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      ReadOnly = True
      Size = 7
    end
  end
  object src_clibusca: TDataSource
    DataSet = aq_cliente
    Left = 520
    Top = 168
  end
end
