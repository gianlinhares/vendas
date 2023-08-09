object dmconexao: Tdmconexao
  OnCreate = DataModuleCreate
  Height = 475
  Width = 451
  PixelsPerInch = 120
  object ac_connec: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=123456;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=MONTREAL;Data Source=LINHARES;Initia' +
      'l File Name="";Server SPN="";Authentication="";Access Token=""'
    ConnectOptions = coAsyncConnect
    Mode = cmReadWrite
    Provider = 'MSOLEDBSQL.1'
    Left = 56
    Top = 24
  end
  object aq_cliente: TADOQuery
    Connection = ac_connec
    CursorType = ctStatic
    BeforePost = aq_clienteBeforePost
    OnNewRecord = aq_clienteNewRecord
    Parameters = <
      item
        Name = 'CLIENTE'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CLI_COD, CLI_NOME, CLI_CPF, CLI_ATIINA, CLI_DTNASC'
      'FROM dbo.CLIENTES'
      'WHERE CLI_COD = :CLIENTE')
    Left = 56
    Top = 96
    object aq_clienteCLI_COD: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLI_COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object aq_clienteCLI_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'CLI_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object aq_clienteCLI_CPF: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'CLI_CPF'
      ProviderFlags = [pfInUpdate]
      OnValidate = aq_clienteCLI_CPFValidate
      EditMask = '999 999 999\-99;0;_'
      Size = 11
    end
    object aq_clienteCLI_ATIINA: TStringField
      DisplayLabel = 'Inativo'
      FieldName = 'CLI_ATIINA'
      ProviderFlags = [pfInUpdate]
      OnGetText = aq_clienteCLI_ATIINAGetText
      FixedChar = True
      Size = 1
    end
    object aq_clienteCLI_DTNASC: TDateField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'CLI_DTNASC'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/9999;1;_'
    end
  end
  object aq_fornecedor: TADOQuery
    Connection = ac_connec
    CursorType = ctStatic
    BeforePost = aq_fornecedorBeforePost
    OnNewRecord = aq_fornecedorNewRecord
    Parameters = <
      item
        Name = 'FORNECEDOR'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT FOR_COD, FOR_NOME, FOR_RAZAO, FOR_CNPJ, FOR_ATIINA'
      'FROM dbo.FORNECEDORES'
      'WHERE FOR_COD = :FORNECEDOR')
    Left = 56
    Top = 168
    object aq_fornecedorFOR_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FOR_COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object aq_fornecedorFOR_NOME: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'FOR_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object aq_fornecedorFOR_RAZAO: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'FOR_RAZAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object aq_fornecedorFOR_CNPJ: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'FOR_CNPJ'
      ProviderFlags = [pfInUpdate]
      OnValidate = aq_fornecedorFOR_CNPJValidate
      EditMask = '00\.000\.000\/0000\-00;0;'
      Size = 14
    end
    object aq_fornecedorFOR_ATIINA: TStringField
      DisplayLabel = 'Inativo'
      FieldName = 'FOR_ATIINA'
      ProviderFlags = [pfInUpdate]
      OnGetText = aq_fornecedorFOR_ATIINAGetText
      FixedChar = True
      Size = 1
    end
  end
  object aq_produto: TADOQuery
    Connection = ac_connec
    CursorType = ctStatic
    BeforePost = aq_produtoBeforePost
    OnNewRecord = aq_produtoNewRecord
    Parameters = <
      item
        Name = 'PRODUTO'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT P.PRO_COD, P.PRO_DESC, P.PRO_PRECO, P.PRO_FORCOD, P.PRO_A' +
        'TIINA,  F.FOR_NOME'
      'FROM dbo.PRODUTOS P'
      'LEFT JOIN dbo.FORNECEDORES F ON F.FOR_COD = P.PRO_FORCOD'
      'WHERE P.PRO_COD = :PRODUTO')
    Left = 56
    Top = 240
    object aq_produtoPRO_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRO_COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object aq_produtoPRO_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'PRO_DESC'
      ProviderFlags = [pfInUpdate]
      Size = 70
    end
    object aq_produtoPRO_PRECO: TBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRO_PRECO'
      ProviderFlags = [pfInUpdate]
      OnValidate = aq_produtoPRO_PRECOValidate
      DisplayFormat = '######,.00'
      EditFormat = '######,.00'
      Precision = 7
    end
    object aq_produtoPRO_FORCOD: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'PRO_FORCOD'
      ProviderFlags = [pfInUpdate]
      OnValidate = aq_produtoPRO_FORCODValidate
    end
    object aq_produtoPRO_ATIINA: TStringField
      DisplayLabel = 'Inativo'
      FieldName = 'PRO_ATIINA'
      ProviderFlags = [pfInUpdate]
      OnGetText = aq_produtoPRO_ATIINAGetText
      FixedChar = True
      Size = 1
    end
    object aq_produtoFOR_NOME: TStringField
      FieldName = 'FOR_NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
  end
  object aq_venda: TADOQuery
    Connection = ac_connec
    CursorType = ctStatic
    BeforePost = aq_vendaBeforePost
    OnNewRecord = aq_vendaNewRecord
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
      'SELECT V.*, C.CLI_NOME'
      'FROM dbo.VENDAS V'
      'LEFT JOIN dbo.CLIENTES C ON C.CLI_COD = V.VEN_CLICOD'
      'WHERE VEN_NUMERO = :VENDA')
    Left = 48
    Top = 312
    object aq_vendaVEN_NUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'VEN_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object aq_vendaVEN_CLICOD: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'VEN_CLICOD'
      ProviderFlags = [pfInUpdate]
      OnValidate = aq_vendaVEN_CLICODValidate
    end
    object aq_vendaVEN_VLRTOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VEN_VLRTOTAL'
      ProviderFlags = [pfInUpdate]
      OnGetText = aq_vendaVEN_VLRTOTALGetText
      DisplayFormat = '######,.00'
      EditFormat = '######,.00'
      Precision = 7
    end
    object aq_vendaVEN_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'VEN_STATUS'
      ProviderFlags = [pfInUpdate]
      OnGetText = aq_vendaVEN_STATUSGetText
      FixedChar = True
      Size = 10
    end
    object aq_vendaVEN_DATAHORA: TDateTimeField
      DisplayLabel = 'Data/Hora da Venda'
      FieldName = 'VEN_DATAHORA'
      EditMask = '!99/99/9999 99:99:99;1;_'
    end
    object aq_vendaCLI_NOME: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 'CLI_NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
  end
  object aq_venda_produto: TADOQuery
    Connection = ac_connec
    CursorType = ctStatic
    BeforePost = aq_venda_produtoBeforePost
    OnNewRecord = aq_venda_produtoNewRecord
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
      
        'SELECT VP.VPR_COD, VP.VPR_NUMVENDA, VP.VPR_PROCOD, VP.VPR_QTDVEN' +
        'DIDA, VP.VPR_VLRTOTPROD, P.PRO_DESC, P.PRO_PRECO'
      'FROM VENDAS_PRODUTOS VP'
      'LEFT JOIN PRODUTOS P ON P.PRO_COD = VP.VPR_PROCOD'
      'WHERE VPR_NUMVENDA = :VENDA')
    Left = 48
    Top = 382
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
      OnValidate = aq_venda_produtoVPR_PROCODValidate
    end
    object aq_venda_produtoVPR_QTDVENDIDA: TBCDField
      DisplayLabel = 'Quantidade Vendida'
      FieldName = 'VPR_QTDVENDIDA'
      OnValidate = aq_venda_produtoVPR_QTDVENDIDAValidate
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
      FieldName = 'PRO_DESC'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
    object aq_venda_produtoPRO_PRECO: TBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'PRO_PRECO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 7
    end
  end
end
