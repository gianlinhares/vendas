object frelclientes: Tfrelclientes
  Left = 0
  Top = 0
  Caption = 'Clientes'
  ClientHeight = 566
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object rl_cliente: TRLReport
    Left = 12
    Top = 8
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btHeader
      object RLLabelClientes: TRLLabel
        Left = 322
        Top = 26
        Width = 74
        Height = 22
        Align = faCenter
        Alignment = taCenter
        Caption = 'Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 80
      object rl_codigo: TRLLabel
        Left = 16
        Top = 16
        Width = 60
        Height = 19
        Caption = 'Cliente:'
      end
      object rl_dtnasc: TRLLabel
        Left = 16
        Top = 48
        Width = 134
        Height = 19
        Caption = 'Data Nascimento:'
      end
      object RLLabelStatus: TRLLabel
        Left = 440
        Top = 48
        Width = 74
        Height = 19
        Caption = 'Situa'#231#227'o:'
      end
      object RLLabelDataHora: TRLLabel
        Left = 440
        Top = 16
        Width = 34
        Height = 16
        Caption = 'CPF:'
      end
      object rd_clicod: TRLDBText
        Left = 87
        Top = 16
        Width = 57
        Height = 19
        DataField = 'CLI_COD'
        DataSource = src_cliente
        Text = ''
      end
      object RLDBTextCliente: TRLDBText
        Left = 159
        Top = 48
        Width = 152
        Height = 19
        DataField = 'CLI_DTNASC'
        DataSource = src_cliente
        Text = ''
      end
      object rd_situacao: TRLDBText
        Left = 520
        Top = 48
        Width = 69
        Height = 19
        DataField = 'SITUACAO'
        DataSource = src_cliente
        Text = ''
      end
      object rd_cpf: TRLDBText
        Left = 480
        Top = 16
        Width = 38
        Height = 19
        DataField = 'CLI_CPF'
        DataSource = src_cliente
        Text = ''
      end
      object rd_clidesc: TRLDBText
        Left = 159
        Top = 16
        Width = 47
        Height = 19
        DataField = 'CLI_NOME'
        DataSource = src_cliente
        Text = ''
      end
    end
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
  object src_cliente: TDataSource
    DataSet = aq_cliente
    Left = 520
    Top = 272
  end
end
