unit udmconexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, Data.Win.ADODB, Vcl.Dialogs, Vcl.StdCtrls,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, VCL.Forms, System.UITypes, FMX.Types, FMX.Dialogs,
  FMX.Printer, FMX.Graphics, VCL.ExtCtrls;

type
  Tdmconexao = class(TDataModule)
    ac_connec: TADOConnection;
    aq_cliente: TADOQuery;
    aq_clienteCLI_COD: TIntegerField;
    aq_clienteCLI_NOME: TStringField;
    aq_clienteCLI_CPF: TStringField;
    aq_clienteCLI_ATIINA: TStringField;
    aq_clienteCLI_DTNASC: TDateField;
    aq_fornecedor: TADOQuery;
    aq_fornecedorFOR_COD: TIntegerField;
    aq_fornecedorFOR_NOME: TStringField;
    aq_fornecedorFOR_RAZAO: TStringField;
    aq_fornecedorFOR_CNPJ: TStringField;
    aq_fornecedorFOR_ATIINA: TStringField;
    aq_produto: TADOQuery;
    aq_produtoPRO_COD: TIntegerField;
    aq_produtoPRO_DESC: TStringField;
    aq_produtoPRO_PRECO: TBCDField;
    aq_produtoPRO_FORCOD: TIntegerField;
    aq_produtoPRO_ATIINA: TStringField;
    aq_venda: TADOQuery;
    aq_vendaVEN_NUMERO: TIntegerField;
    aq_vendaVEN_CLICOD: TIntegerField;
    aq_vendaVEN_VLRTOTAL: TBCDField;
    aq_vendaVEN_STATUS: TStringField;
    aq_vendaVEN_DATAHORA: TDateTimeField;
    aq_produtoFOR_NOME: TStringField;
    aq_vendaCLI_NOME: TStringField;
    aq_venda_produto: TADOQuery;
    aq_venda_produtoVPR_COD: TIntegerField;
    aq_venda_produtoVPR_NUMVENDA: TIntegerField;
    aq_venda_produtoVPR_PROCOD: TIntegerField;
    aq_venda_produtoVPR_QTDVENDIDA: TBCDField;
    aq_venda_produtoVPR_VLRTOTPROD: TBCDField;
    aq_venda_produtoPRO_DESC: TStringField;
    aq_venda_produtoPRO_PRECO: TBCDField;
    procedure aq_clienteNewRecord(DataSet: TDataSet);
    procedure aq_clienteCLI_CPFValidate(Sender: TField);
    procedure aq_clienteBeforePost(DataSet: TDataSet);
    procedure aq_fornecedorNewRecord(DataSet: TDataSet);
    procedure aq_fornecedorFOR_CNPJValidate(Sender: TField);
    procedure aq_fornecedorBeforePost(DataSet: TDataSet);
    procedure aq_produtoNewRecord(DataSet: TDataSet);
    procedure aq_produtoBeforePost(DataSet: TDataSet);
    procedure aq_produtoPRO_PRECOValidate(Sender: TField);
    procedure aq_vendaBeforePost(DataSet: TDataSet);
    procedure aq_vendaNewRecord(DataSet: TDataSet);
    procedure aq_vendaVEN_STATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure aq_vendaVEN_VLRTOTALGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure aq_produtoPRO_FORCODValidate(Sender: TField);
    procedure aq_vendaVEN_CLICODValidate(Sender: TField);
    procedure aq_venda_produtoBeforePost(DataSet: TDataSet);
    procedure aq_venda_produtoVPR_QTDVENDIDAValidate(Sender: TField);
    procedure aq_venda_produtoVPR_PROCODValidate(Sender: TField);
    procedure aq_venda_produtoNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure aq_clienteCLI_ATIINAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure aq_fornecedorFOR_ATIINAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure aq_produtoPRO_ATIINAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    function CPF_JaCadastrado(sCPF : string) : string;
    function IsValidCPF(pCPF: string): Boolean;
    function IsValidCNPJ(pCNPJ: string): Boolean;
    function CNPJ_JaCadastrado(sCNPJ: string): string;
    procedure VerificaProdutoCadastrado;
    procedure Abre(sParamCadastro: string; iCodigo: integer);
    function GetDescAtinvoInaTivo(sAtiIna: String): string;
  public
    procedure InsereExibeMsg(sMsg : string; bAborta : boolean = true);
    procedure OnExitFornecedores(dbe : TEdit; lbl : TLabel; bSoAtivos : boolean);
    procedure OnExitClientes(dbe : TEdit; lbl : TLabel; bSoAtivos : boolean);
    procedure OnExitProdutos(dbe : TEdit; lbl : TLabel; bSoAtivos : boolean);
    procedure RetornaCadastro(sParamCadastro : string);
    function RetornaBusca(sParamBusca : string; bSomenteAtivos : boolean = false) : string;
    function GetLikeSQL(sClausulaWhere : string) : string;

    function GetSQLFornecedores(sCodigo : string; bSoAtivos : boolean) : string;
    function GetSQLClientes(sCodigo: string; bSoAtivos : boolean): string;
    function GetSQLProdutos(sCodigo: string; bSoAtivos : boolean): string;
    function GetSQLVendas(sCodigo: string): string;
    function RetornaSequencial(sFieldCodigo, sTabela : string) : integer;
  end;

var
  dmconexao: Tdmconexao;

type
  ITipoBusca = interface
    procedure GetCadsatro;
    procedure Pesquisa(iCodigo : integer);
    function ConsultaBusca(cSelf : TComponent; bSoAtivos : boolean): string;
  end;

  IFactoryMethod = interface
    function CriaBusca(const TipoBusca: string): ITipoBusca;
  end;
type
  TFabricaBuscas = class(TInterfacedObject, IFactoryMethod)
    function CriaBusca(const TipoBusca: string): ITipoBusca;
  end;

type
  TBuscaCliente = class(TInterfacedObject, ITipoBusca)
    procedure GetCadsatro;
    procedure Pesquisa(iCodigo : integer);
    function ConsultaBusca(cSelf : TComponent; bSoAtivos : boolean): string;
  end;

type
  TBuscaFornecedor = class(TInterfacedObject, ITipoBusca)
    procedure GetCadsatro;
    procedure Pesquisa(iCodigo : integer);
    function ConsultaBusca(cSelf : TComponent; bSoAtivos : boolean): string;
  end;

type
  TBuscaProduto = class(TInterfacedObject, ITipoBusca)
    procedure GetCadsatro;
    procedure Pesquisa(iCodigo : integer);
    function ConsultaBusca(cSelf : TComponent; bSoAtivos : boolean): string;
  end;

type
  TBuscaVenda = class(TInterfacedObject, ITipoBusca)
    procedure GetCadsatro;
    procedure Pesquisa(iCodigo : integer);
    function ConsultaBusca(cSelf : TComponent; bSoAtivos : boolean): string;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses ubscclientes, ubscfornecedores, ubscvendas, ubscprodutos, ucadclientes,
  ucadfornecedores, ucadprodutos, ucadvendas;

{$R *.dfm}

function Tdmconexao.IsValidCPF(pCPF: string): Boolean;
var
  v: array [0 .. 1] of Word;
  cpf: array [0 .. 10] of Byte;
  I: Byte;
begin
  Result := False;

  { Verificando se tem 11 caracteres }
  if Length(pCPF) <> 11 then
  begin
    Exit;
  end;

  { Conferindo se todos d�gitos s�o iguais }
  if pCPF = StringOfChar('0', 11) then
    Exit;

  if pCPF = StringOfChar('1', 11) then
    Exit;

  if pCPF = StringOfChar('2', 11) then
    Exit;

  if pCPF = StringOfChar('3', 11) then
    Exit;

  if pCPF = StringOfChar('4', 11) then
    Exit;

  if pCPF = StringOfChar('5', 11) then
    Exit;

  if pCPF = StringOfChar('6', 11) then
    Exit;

  if pCPF = StringOfChar('7', 11) then
    Exit;

  if pCPF = StringOfChar('8', 11) then
    Exit;

  if pCPF = StringOfChar('9', 11) then
    Exit;

  try
    for I := 1 to 11 do
      cpf[I - 1] := StrToInt(pCPF[I]);
    // Nota: Calcula o primeiro d�gito de verifica��o.
    v[0] := 10 * cpf[0] + 9 * cpf[1] + 8 * cpf[2];
    v[0] := v[0] + 7 * cpf[3] + 6 * cpf[4] + 5 * cpf[5];
    v[0] := v[0] + 4 * cpf[6] + 3 * cpf[7] + 2 * cpf[8];
    v[0] := 11 - v[0] mod 11;

    if v[0] >= 10 then
      v[0] := 0;
    // Nota: Calcula o segundo d�gito de verifica��o.
    v[1] := 11 * cpf[0] + 10 * cpf[1] + 9 * cpf[2];
    v[1] := v[1] + 8 * cpf[3] + 7 * cpf[4] + 6 * cpf[5];
    v[1] := v[1] + 5 * cpf[6] + 4 * cpf[7] + 3 * cpf[8];
    v[1] := v[1] + 2 * v[0];
    v[1] := 11 - v[1] mod 11;
    if v[1] >= 10 then
      v[1] := 0;
    // Nota: Verdadeiro se os d�gitos de verifica��o s�o os esperados.
    Result := ((v[0] = cpf[9]) and (v[1] = cpf[10]));
  except
    on E: Exception do
      Result := False;
  end;
end;

procedure Tdmconexao.OnExitClientes(dbe: TEdit; lbl: TLabel; bSoAtivos : boolean);
var
  aq_cli : TADOQuery;
begin
  if Trim(dbe.Text) <> '' then
  begin
    aq_cli := TADOQuery.Create(nil);
    try
      aq_cli.Connection := ac_connec;
      aq_cli.SQL.Add(GetSQLClientes(dbe.Text, bSoAtivos));
      aq_cli.Open;
      if not(aq_cli.IsEmpty) then
        lbl.Caption := aq_cli.FieldByName('CLI_NOME').AsString
      else
        InsereExibeMsg('Cliente �nv�lido ou n�o cadastrado');
    finally
      aq_cli.Free;
    end;
  end;
end;

procedure Tdmconexao.OnExitFornecedores(dbe: TEdit; lbl : TLabel; bSoAtivos : boolean);
var
  aq_for : TADOQuery;
begin
  if Trim(dbe.Text) <> '' then
  begin
    aq_for := TADOQuery.Create(nil);
    try
      aq_for.Connection := ac_connec;
      aq_for.SQL.Add(GetSQLFornecedores(dbe.Text, bSoAtivos));
      aq_for.Open;
      if not(aq_for.IsEmpty) then
        lbl.Caption := aq_for.FieldByName('FOR_NOME').AsString
      else
        InsereExibeMsg('Fornecedor �nv�lido ou n�o cadastrado');
    finally
      aq_for.Free;
    end;
  end;
end;

procedure Tdmconexao.OnExitProdutos(dbe: TEdit; lbl: TLabel; bSoAtivos: boolean);
var
  aq_prod : TADOQuery;
begin
  if Trim(dbe.Text) <> '' then
  begin
    aq_prod := TADOQuery.Create(nil);
    try
      aq_prod.Connection := ac_connec;
      aq_prod.SQL.Add(GetSQLProdutos(dbe.Text, bSoAtivos));
      aq_prod.Open;
      if not(aq_prod.IsEmpty) then
        lbl.Caption := aq_prod.FieldByName('PRO_DESC').AsString
      else
        InsereExibeMsg('Produto �nv�lido ou n�o cadastrado');
    finally
      aq_prod.Free;
    end;
  end;
end;

function Tdmconexao.IsValidCNPJ(pCNPJ : string) : Boolean;
var
  v: array[1..2] of Word;
  cnpj: array[1..14] of Byte;
  I: Byte;
begin
  Result := False;

  { Verificando se tem 11 caracteres }
  if Length(pCNPJ) <> 14 then
  begin
    Exit;
  end;

  { Conferindo se todos d�gitos s�o iguais }
  if pCNPJ = StringOfChar('0', 14) then
    Exit;

  if pCNPJ = StringOfChar('1', 14) then
    Exit;

  if pCNPJ = StringOfChar('2', 14) then
    Exit;

  if pCNPJ = StringOfChar('3', 14) then
    Exit;

  if pCNPJ = StringOfChar('4', 14) then
    Exit;

  if pCNPJ = StringOfChar('5', 14) then
    Exit;

  if pCNPJ = StringOfChar('6', 14) then
    Exit;

  if pCNPJ = StringOfChar('7', 14) then
    Exit;

  if pCNPJ = StringOfChar('8', 14) then
    Exit;

  if pCNPJ = StringOfChar('9', 14) then
    Exit;

  try
    for I := 1 to 14 do
      cnpj[i] := StrToInt(pCNPJ[i]);

    //Nota: Calcula o primeiro d�gito de verifica��o.
    v[1] := 5*cnpj[1] + 4*cnpj[2]  + 3*cnpj[3]  + 2*cnpj[4];
    v[1] := v[1] + 9*cnpj[5] + 8*cnpj[6]  + 7*cnpj[7]  + 6*cnpj[8];
    v[1] := v[1] + 5*cnpj[9] + 4*cnpj[10] + 3*cnpj[11] + 2*cnpj[12];
    v[1] := 11 - v[1] mod 11;
    if v[1] >= 10 then
      v[1] := 0;

    //Nota: Calcula o segundo d�gito de verifica��o.
    v[2] := 6*cnpj[1] + 5*cnpj[2]  + 4*cnpj[3]  + 3*cnpj[4];
    v[2] := v[2] + 2*cnpj[5] + 9*cnpj[6]  + 8*cnpj[7]  + 7*cnpj[8];
    v[2] := v[2] + 6*cnpj[9] + 5*cnpj[10] + 4*cnpj[11] + 3*cnpj[12];
    v[2] := v[2] + 2*v[1];
    v[2] := 11 - v[2] mod 11;
    if v[2] >= 10 then
      v[2] := 0;

    //Nota: Verdadeiro se os d�gitos de verifica��o s�o os esperados.
    Result := ((v[1] = cnpj[13]) and (v[2] = cnpj[14]));
  except on E: Exception do
    Result := False;
  end;
end;

procedure Tdmconexao.aq_clienteBeforePost(DataSet: TDataSet);
var
  slErro : TStringList;
  sClienteCadastrado : string;
begin
  sClienteCadastrado := '';
  slErro             := TStringList.Create;
  try
    if Trim(aq_clienteCLI_CPF.AsString) = '' then
      slErro.Add('Cliente deve possuir um CPF')
    else
    begin
      sClienteCadastrado := CPF_JaCadastrado(aq_clienteCLI_CPF.AsString);
      if (Trim(sClienteCadastrado) <> '') and (sClienteCadastrado <> aq_clienteCLI_COD.AsString) then
        slErro.Add('CPF j� cadastrado para o cliente ' + sClienteCadastrado);
    end;
    if Trim(aq_clienteCLI_NOME.AsString) = '' then
      slErro.Add('Cliente deve possuir um nome');
    if Trim(aq_clienteCLI_DTNASC.AsString) = '' then
      slErro.Add('Cliente deve possuir uma data de nascimento');

    if slErro.Count > 0 then
      InsereExibeMsg(slErro.Text);
  finally
    slErro.Free;
  end;

  if aq_clienteCLI_COD.AsInteger = 0 then
    aq_clienteCLI_COD.AsInteger := RetornaSequencial('CLI_COD', 'CLIENTES');
end;

function Tdmconexao.GetDescAtinvoInaTivo(sAtiIna : String) : string;
begin
  if Trim(sAtiIna) = 'A' then
    Result := 'Ativo'
  else
    Result := 'Inativo';
end;

procedure Tdmconexao.aq_clienteCLI_ATIINAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := GetDescAtinvoInaTivo(Sender.AsString);
end;

procedure Tdmconexao.aq_clienteCLI_CPFValidate(Sender: TField);
var
  sClienteCadastrado : string;
begin
  if Trim(Sender.AsString) <> '' then
  begin
    if (Length(Sender.AsString) < 11) then
      InsereExibeMsg('CPF dever ter 11 digitos');

    if not(IsValidCPF(Sender.AsString)) then
      InsereExibeMsg('CPF inv�lido');

    sClienteCadastrado := CPF_JaCadastrado(aq_clienteCLI_CPF.AsString);
    if (Trim(sClienteCadastrado) <> '') and (sClienteCadastrado <> aq_clienteCLI_COD.AsString) then
      InsereExibeMsg('CPF j� cadastrado para o cliente ' + sClienteCadastrado);
  end;
end;

procedure Tdmconexao.aq_clienteNewRecord(DataSet: TDataSet);
begin
  aq_clienteCLI_ATIINA.AsString := 'A';
end;

procedure Tdmconexao.aq_fornecedorBeforePost(DataSet: TDataSet);
var
  slErro : TStringList;
  sFornecedorCadastrado : string;
begin
  sFornecedorCadastrado := '';
  slErro             := TStringList.Create;
  try
    if Trim(aq_fornecedorFOR_CNPJ.AsString) = '' then
      slErro.Add('Fornecedor deve possuir um CNPJ')
    else
    begin
      sFornecedorCadastrado := CNPJ_JaCadastrado(aq_fornecedorFOR_CNPJ.AsString);
      if (Trim(sFornecedorCadastrado) <> '') and (sFornecedorCadastrado <> aq_fornecedorFOR_COD.AsString) then
        slErro.Add('CNPJ j� cadastrado para o fornecedor ' + sFornecedorCadastrado);
    end;
    if Trim(aq_fornecedorFOR_NOME.AsString) = '' then
      slErro.Add('Fornecedor deve possuir um nome fantasia');
    if Trim(aq_fornecedorFOR_RAZAO.AsString) = '' then
      slErro.Add('Fornecedor deve possuir uma raz�o social');
    if slErro.Count > 0 then
      InsereExibeMsg(slErro.Text);
  finally
    slErro.Free;
  end;

  if aq_fornecedorFOR_COD.AsInteger = 0 then
    aq_fornecedorFOR_COD.AsInteger := RetornaSequencial('FOR_COD', 'FORNECEDORES');
end;

procedure Tdmconexao.aq_fornecedorFOR_ATIINAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := GetDescAtinvoInaTivo(Sender.AsString);
end;

procedure Tdmconexao.aq_fornecedorFOR_CNPJValidate(Sender: TField);
var
  sFornecedorCadastrado : string;
begin
  if Trim(Sender.AsString) <> '' then
  begin
    if (Length(Sender.AsString) < 14) then
      InsereExibeMsg('CNPJ dever ter 14 digitos');

    if not(IsValidCNPJ(Sender.AsString)) then
      InsereExibeMsg('CNPJ inv�lido');

    sFornecedorCadastrado := CNPJ_JaCadastrado(aq_fornecedorFOR_CNPJ.AsString);
    if (Trim(sFornecedorCadastrado) <> '') and (sFornecedorCadastrado <> aq_fornecedorFOR_COD.AsString) then
      InsereExibeMsg('CNPJ j� cadastrado para o fornecedor ' + sFornecedorCadastrado);
  end;
end;

procedure Tdmconexao.aq_fornecedorNewRecord(DataSet: TDataSet);
begin
  aq_fornecedorFOR_ATIINA.AsString := 'A';
end;

procedure Tdmconexao.aq_produtoBeforePost(DataSet: TDataSet);
var
  slErro : TStringList;
begin
  slErro := TStringList.Create;
  try
    if Trim(aq_produtoPRO_PRECO.AsString) = '' then
      slErro.Add('Informe o pre�o do produto');
    if aq_produtoPRO_PRECO.AsFloat <= 0 then
      slErro.Add('Pre�o do produto n�o pode ser menor que 0');
    if Trim(aq_produtoPRO_DESC.AsString) = '' then
      slErro.Add('Informe a descri��o do produto');
    if Trim(aq_produtoPRO_FORCOD.AsString) = '' then
      slErro.Add('Informe o fornecedor do produto');
    if slErro.Count > 0 then
      InsereExibeMsg(slErro.Text);
  finally
    slErro.Free;
  end;
  if aq_produtoPRO_COD.AsInteger = 0 then
    aq_produtoPRO_COD.AsInteger := RetornaSequencial('PRO_COD', 'PRODUTOS');
end;

procedure Tdmconexao.aq_produtoNewRecord(DataSet: TDataSet);
begin
  aq_produtoPRO_ATIINA.AsString := 'A';
end;

procedure Tdmconexao.aq_produtoPRO_ATIINAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Text := GetDescAtinvoInaTivo(Sender.AsString);
end;

procedure Tdmconexao.aq_produtoPRO_FORCODValidate(Sender: TField);
var
  aq_for : TADOQuery;
begin
  if Trim(Sender.AsString) <> '' then
  begin
    aq_for := TADOQuery.Create(nil);
    try
      aq_for.Connection := ac_connec;
      aq_for.SQL.Add(GetSQLFornecedores(Sender.AsString, true));
      aq_for.Open;
      if not(aq_for.IsEmpty) then
        aq_produtoFOR_NOME.AsString := aq_for.FieldByName('FOR_NOME').AsString
      else
        InsereExibeMsg('Fornecedor �nv�lido ou n�o cadastrado');
    finally
      aq_for.Free;
    end;
  end
  else
    aq_produtoFOR_NOME.Clear;
end;

procedure Tdmconexao.aq_produtoPRO_PRECOValidate(Sender: TField);
begin
  if Trim(Sender.AsString) <> '' then
  begin
    if Sender.AsFloat <=0 then
      InsereExibeMsg('O pre�o do produto deve ser maior que 0')
  end;
end;

procedure Tdmconexao.aq_vendaBeforePost(DataSet: TDataSet);
var
  slErro : TStringList;
  aqVenProd : TADOQuery;
begin
  slErro := TStringList.Create;
  try
    if Trim(aq_vendaVEN_CLICOD.AsString) = '' then
      slErro.Add('Informe o cliente da venda');
    if Trim(aq_vendaVEN_DATAHORA.AsString) = '' then
      slErro.Add('Informe a data e hora da venda');
    if slErro.Count > 0 then
      dmconexao.InsereExibeMsg(slErro.Text);
  finally
    slErro.Free;
  end;
  if aq_vendaVEN_NUMERO.AsInteger = 0 then
    aq_vendaVEN_NUMERO.AsInteger := dmconexao.RetornaSequencial('VEN_NUMERO', 'VENDAS');

  aqVenProd := TADOQuery.Create(nil);
  try
    aqVenProd.Connection := dmconexao.ac_connec;
    aqVenProd.SQL.Add('SELECT SUM(VPR_VLRTOTPROD) AS TOTAL ' +
                      'FROM [dbo].[VENDAS_PRODUTOS] ' +
                      'WHERE [VPR_NUMVENDA] = ' + aq_vendaVEN_NUMERO.AsString);
    aqVenProd.Open;
    if not(aqVenProd.IsEmpty) then
      aq_vendaVEN_VLRTOTAL.AsFloat := aqVenProd.FieldByName('TOTAL').AsFloat;
  finally
    aqVenProd.Free;
  end;
end;

procedure Tdmconexao.aq_vendaNewRecord(DataSet: TDataSet);
begin
  aq_vendaVEN_STATUS.AsString     := 'P';
  aq_vendaVEN_DATAHORA.AsDateTime := Now;
end;

procedure Tdmconexao.aq_vendaVEN_CLICODValidate(Sender: TField);
var
  aq_cli : TADOQuery;
begin
  if Trim(Sender.AsString) <> '' then
  begin
    aq_cli := TADOQuery.Create(nil);
    try
      aq_cli.Connection := ac_connec;
      aq_cli.SQL.Add(GetSQLClientes(Sender.AsString, true));
      aq_cli.Open;
      if not(aq_cli.IsEmpty) then
        aq_vendaCLI_NOME.AsString := aq_cli.FieldByName('CLI_NOME').AsString
      else
        InsereExibeMsg('Cliente �nv�lido ou n�o cadastrado');
    finally
      aq_cli.Free;
    end;
  end
  else
    aq_vendaCLI_NOME.Clear;
end;

procedure Tdmconexao.aq_vendaVEN_STATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.AsString = 'E' then
    Text := 'Efetivada'
  else if Sender.AsString = 'P' then
    Text := 'Pendente';
end;

procedure Tdmconexao.aq_vendaVEN_VLRTOTALGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if Trim(Sender.AsString) = '' then
    Text := ''
  else
    Text := Sender.AsString;
end;

procedure Tdmconexao.VerificaProdutoCadastrado;
var
  aq_proven : TADOQuery;
begin
  if Trim(aq_venda_produtoVPR_COD.AsString) <> '' then
  begin
    aq_proven := TADOQuery.Create(nil);
    try
      aq_proven.Connection := dmconexao.ac_connec;
      aq_proven.SQL.Add('SELECT VPR_COD ' +
                        'FROM VENDAS_PRODUTOS ' +
                        'WHERE VPR_NUMVENDA = ' + aq_venda_produtoVPR_NUMVENDA.AsString + ' ' +
                        'AND VPR_PROCOD = ' + aq_venda_produtoVPR_PROCOD.AsString + ' ' +
                        'AND VPR_COD <> ' + aq_venda_produtoVPR_COD.AsString);
      aq_proven.Open;
      if not(aq_proven.IsEmpty) then
        dmconexao.InsereExibeMsg('O produto j� est� cadastrado');
    finally
      aq_proven.Free;
    end;
  end;
end;

procedure Tdmconexao.aq_venda_produtoBeforePost(DataSet: TDataSet);
begin
  if Trim(aq_venda_produtoVPR_PROCOD.AsString) = '' then
    dmconexao.InsereExibeMsg('Informe o produto');

  VerificaProdutoCadastrado;

  if aq_venda_produtoVPR_COD.AsInteger = 0 then
    aq_venda_produtoVPR_COD.AsInteger := dmconexao.RetornaSequencial('VPR_COD', 'VENDAS_PRODUTOS');

  aq_venda.Edit;
end;

procedure Tdmconexao.aq_venda_produtoNewRecord(DataSet: TDataSet);
begin
  if aq_vendaVEN_NUMERO.IsNull then
  begin
    aq_venda_produto.CancelUpdates;
    InsereExibeMsg('Grave a venda primeiro');
  end;

  aq_venda_produtoVPR_NUMVENDA.AsInteger := aq_vendaVEN_NUMERO.AsInteger;
end;

procedure Tdmconexao.aq_venda_produtoVPR_PROCODValidate(Sender: TField);
var
  aq_pro : TADOQuery;
begin
  if Trim(Sender.AsString) <> '' then
  begin
    VerificaProdutoCadastrado;

    aq_pro := TADOQuery.Create(nil);
    try
      aq_pro.Connection := dmconexao.ac_connec;
      aq_pro.SQL.Add(dmconexao.GetSQLProdutos(Sender.AsString, true));
      aq_pro.Open;
      if not(aq_pro.IsEmpty) then
      begin
        aq_venda_produtoPRO_DESC.AsString := aq_pro.FieldByName('PRO_DESC').AsString;
        aq_venda_produtoPRO_PRECO.AsFloat := aq_pro.FieldByName('PRO_PRECO').AsFloat;
      end
      else
        dmconexao.InsereExibeMsg('Produto inv�lido ou inexistente');
    finally
      aq_pro.Free;
    end;
  end
  else
  begin
    aq_venda_produtoPRO_DESC.Clear;
    aq_venda_produtoPRO_PRECO.Clear;
  end;
end;

procedure Tdmconexao.aq_venda_produtoVPR_QTDVENDIDAValidate(Sender: TField);
begin
  if Trim(Sender.AsString) <> '' then
  begin
    if Sender.AsFloat <= 0 then
      InsereExibeMsg('A quantidade vendida deve ser maior que 0');
    aq_venda_produtoVPR_VLRTOTPROD.AsFloat := aq_venda_produtoPRO_PRECO.AsFloat * Sender.AsFloat;
  end;
end;

function Tdmconexao.CPF_JaCadastrado(sCPF: string): string;
var
  qry : TADOQuery;
begin
  Result         := '';
  qry            := TADOQuery.Create(nil);
  qry.Connection := ac_connec;
  try
    qry.SQL.Text := 'SELECT CLI_COD ' +
                    'FROM dbo.CLIENTES ' +
                    'WHERE CLI_CPF ' + GetLikeSQL(sCPF);
    qry.Open;
    if (not(qry.IsEmpty)) then
      Result := qry.FieldByName('CLI_COD').AsString;
  finally
    qry.Free;
  end;
end;

procedure Tdmconexao.DataModuleCreate(Sender: TObject);
begin
  ac_connec.Connected := true;
end;

function Tdmconexao.CNPJ_JaCadastrado(sCNPJ: string): string;
var
  qry : TADOQuery;
begin
  Result         := '';
  qry            := TADOQuery.Create(nil);
  qry.Connection := ac_connec;
  try
    qry.SQL.Text := 'SELECT FOR_COD ' +
                    'FROM dbo.FORNECEDORES ' +
                    'WHERE FOR_CNPJ ' + GetLikeSQL(sCNPJ);
    qry.Open;
    if (not(qry.IsEmpty)) then
      Result := qry.FieldByName('FOR_COD').AsString;
  finally
    qry.Free;
  end;
end;

function Tdmconexao.GetLikeSQL(sClausulaWhere: string): string;
begin
  Result := 'LIKE ' + '''%' + sClausulaWhere + '%''' ;
end;

function Tdmconexao.GetSQLFornecedores(sCodigo: string; bSoAtivos : boolean): string;
begin
  Result := 'SELECT FOR_COD, FOR_NOME, FOR_RAZAO, FOR_CNPJ, FOR_ATIINA ' +
            'FROM dbo.FORNECEDORES ' +
            'WHERE FOR_COD = ' + sCodigo;
  if bSoAtivos then
    Result := Result + ' AND FOR_ATIINA = ''A''';
end;

function Tdmconexao.GetSQLProdutos(sCodigo: string; bSoAtivos : boolean): string;
begin
  Result := 'SELECT P.PRO_COD, P.PRO_DESC, P.PRO_PRECO, P.PRO_FORCOD, P.PRO_ATIINA,  F.FOR_NOME' +
            'FROM dbo.PRODUTOS P' +
            'LEFT JOIN dbo.FORNECEDORES F ON F.FOR_COD = P.PRO_FORCOD ' +
            'WHERE P.PRO_COD = ' + sCodigo;
  if bSoAtivos then
    Result := Result + ' AND PRO_ATIINA = ''A''';
end;

function Tdmconexao.GetSQLVendas(sCodigo: string): string;
begin
  Result := 'SELECT V.VEN_NUMERO, V.VEN_CLICOD, V.VEN_VLRTOTAL, V.VEN_STATUS, V.VEN_DATAHORA, C.CLI_NOME ' +
            'FROM dbo.VENDAS V' +
            'LEFT JOIN dbo.CLIENTES C ON C.CLI_COD = V.VEN_CLICOD ' +
            'WHERE VEN_NUMERO = '+ sCodigo;
end;

function Tdmconexao.GetSQLClientes(sCodigo: string; bSoAtivos : boolean): string;
begin
  Result := 'SELECT CLI_COD, CLI_NOME, CLI_CPF, CLI_ATIINA, CLI_DTNASC ' +
            'FROM dbo.CLIENTES ' +
            'WHERE CLI_COD = ' + sCodigo;
  if bSoAtivos then
    Result := Result + ' AND CLI_ATIINA = ''A''';
end;

procedure Tdmconexao.InsereExibeMsg(sMsg: string; bAborta: boolean = true);
begin
  ShowMessage(sMsg);
  if bAborta then
    abort;
end;

function Tdmconexao.RetornaBusca(sParamBusca: string; bSomenteAtivos: boolean = false) : string;
var
  FabricaBusca: IFactoryMethod;
  fBusca : ITipoBusca;
begin
  // instancia a f�brica (Factory Method)
  FabricaBusca := TFabricaBuscas.Create;
  try
    // obt�m o produto, baseado no par�metro informado
    fBusca  := FabricaBusca.CriaBusca(sParamBusca);
    Result  := fBusca.ConsultaBusca(Self, false);
  finally
  end;
end;

procedure Tdmconexao.Abre(sParamCadastro: string; iCodigo : integer);
var
  FabricaBusca: IFactoryMethod;
  fBusca : ITipoBusca;
begin
  // instancia a f�brica (Factory Method)
  FabricaBusca := TFabricaBuscas.Create;
  try
    // obt�m o produto, baseado no par�metro informado
    fBusca  := FabricaBusca.CriaBusca(sParamCadastro);
    fBusca.GetCadsatro;
  finally
  end;
end;

procedure Tdmconexao.RetornaCadastro(sParamCadastro: string);
var
  FabricaBusca: IFactoryMethod;
  fBusca : ITipoBusca;
begin
  // instancia a f�brica (Factory Method)
  FabricaBusca := TFabricaBuscas.Create;
  try
    // obt�m o produto, baseado no par�metro informado
    fBusca  := FabricaBusca.CriaBusca(sParamCadastro);
    fBusca.GetCadsatro;
  finally
  end;
end;

function Tdmconexao.RetornaSequencial(sFieldCodigo, sTabela: string): integer;
var
  qry : TADOQuery;
begin
  qry            := TADOQuery.Create(nil);
  qry.Connection := ac_connec;
  try
    qry.SQL.Text := 'SELECT MAX(' + sFieldCodigo + ') AS CODIGO ' +
                    'FROM dbo.' + sTabela;
    qry.Open;

    Result := qry.FieldByName('CODIGO').AsInteger + 1;
  finally
    qry.Free;
  end;
end;

{ TBuscaVenda }

function TBuscaVenda.ConsultaBusca(cSelf : TComponent; bSoAtivos : boolean): string;
var
  fBscVendas : Tfbscvendas;
begin
  fBscVendas := Tfbscvendas.Create(cSelf);
  try
    fBscVendas.Position         := poScreenCenter;
    fBscVendas.Query            := dmconexao.aq_venda;
    fBscVendas.TipoBusca        := 'V';
    fBscVendas.SQLSemFiltro     := 'SELECT V.VEN_NUMERO, V.VEN_CLICOD, V.VEN_VLRTOTAL, V.VEN_STATUS, ' +
                                    'V.VEN_DATAHORA, C.CLI_NOME ' +
                                    'FROM dbo.VENDAS V ' +
                                    'LEFT JOIN dbo.CLIENTES C ON C.CLI_COD = V.VEN_CLICOD';
    fBscVendas.NameFieldRetorno := 'VEN_NUMERO';
    fBscVendas.SQLCodigo        := fBscVendas.SQLSemFiltro + ' WHERE VEN_NUMERO = :CODIGO';
    TRadioGroup(fBscVendas.rdg_filtro).Controls[1].Enabled := false;
    if fBscVendas.ShowModal = mrOk then
      Result := fBscVendas.CodigoRetorno;
  finally
    fBscVendas.Free;
  end;
end;


procedure TBuscaVenda.GetCadsatro;
var
  fCadVendas : Tfcadvendas;
begin
  fCadVendas := Tfcadvendas.Create(nil);
  try
    fCadVendas.Position := poScreenCenter;
    fCadVendas.ShowModal;
  finally
    fBscVendas.Free;
  end;
end;

procedure TBuscaVenda.Pesquisa(iCodigo: integer);
begin
  if dmconexao.aq_venda.Active then
    dmconexao.aq_venda.Close;
  dmconexao.aq_venda.SQL.Add(dmconexao.GetSQLVendas(iCodigo.ToString));
  dmconexao.aq_venda.Open;
end;

{ TBuscaProduto }

function TBuscaProduto.ConsultaBusca(cSelf : TComponent; bSoAtivos : boolean): string;
var
  fBscProduto : Tfbscprodutos;
begin
  fBscProduto := Tfbscprodutos.Create(cSelf);
  try
    fBscProduto.Position         := poScreenCenter;
    fBscProduto.Query            := dmconexao.aq_produto;
    fBscProduto.TipoBusca        := 'P';
    fBscProduto.SQLSemFiltro     := 'SELECT P.PRO_COD, P.PRO_DESC, P.PRO_PRECO, P.PRO_FORCOD, P.PRO_ATIINA,  F.FOR_NOME ' +
                                    'FROM dbo.PRODUTOS P ' +
                                    'LEFT JOIN dbo.FORNECEDORES F ON F.FOR_COD = P.PRO_FORCOD';
    fBscProduto.NameFieldRetorno := 'PRO_COD';
    fBscProduto.SQLCodigo        := fBscProduto.SQLSemFiltro + ' WHERE PRO_COD = :CODIGO';
    fBscProduto.SQLDesc          := fBscProduto.SQLSemFiltro + ' WHERE UPPER(PRO_DESC) LIKE UPPER (:NOME)';
    if bSoAtivos then
    begin
      fBscProduto.SQLSemFiltro := fBscProduto.SQLSemFiltro + ' WHERE FOR_ATIINA = ''A''';
      fBscProduto.SQLCodigo    := fBscProduto.SQLCodigo + ' AND FOR_ATIINA = ''A''';
      fBscProduto.SQLDesc      := fBscProduto.SQLDesc + ' AND FOR_ATIINA = ''A''';
    end;
    if fBscProduto.ShowModal = mrOk then
      Result := fBscProduto.CodigoRetorno;
  finally
    fBscProduto.Free;
  end;
end;

procedure TBuscaProduto.GetCadsatro;
var
  fCadProduto : Tfcadprodutos;
begin
  fCadProduto := Tfcadprodutos.Create(nil);
  try
    fCadProduto.Position      := poScreenCenter;
//    fCadProduto.CodigoProduto := 0;
    fCadProduto.ShowModal;
  finally
    fCadProduto.Free;
  end;
end;

procedure TBuscaProduto.Pesquisa(iCodigo: integer);
begin
  if dmconexao.aq_produto.Active then
    dmconexao.aq_produto.Close;
  dmconexao.aq_produto.SQL.Add(dmconexao.GetSQLProdutos(iCodigo.ToString, false));
  dmconexao.aq_produto.Open;
end;

{ TBuscaFornecedor }

function TBuscaFornecedor.ConsultaBusca(cSelf : TComponent; bSoAtivos : boolean): string;
var
  fBscFornecedor : Tfbscfornecedores;
begin
  fBscFornecedor := Tfbscfornecedores.Create(cSelf);
  try
    fBscFornecedor.Position         := poScreenCenter;
    fBscFornecedor.Query            := dmconexao.aq_fornecedor;
    fBscFornecedor.TipoBusca        := 'F';
    fBscFornecedor.SQLSemFiltro     := 'SELECT FOR_COD, FOR_NOME, FOR_RAZAO, FOR_CNPJ, FOR_ATIINA ' +
                                       'FROM dbo.FORNECEDORES';
    fBscFornecedor.NameFieldRetorno := 'FOR_COD';
    fBscFornecedor.SQLCodigo        := fBscFornecedor.SQLSemFiltro + ' WHERE FOR_COD = :CODIGO';
    fBscFornecedor.SQLDesc          := fBscFornecedor.SQLSemFiltro + ' WHERE UPPER(FOR_NOME) LIKE UPPER (:NOME)';
    if bSoAtivos then
    begin
      fBscFornecedor.SQLSemFiltro := fBscFornecedor.SQLSemFiltro + ' WHERE FOR_ATIINA = ''A''';
      fBscFornecedor.SQLCodigo    := fBscFornecedor.SQLCodigo + ' AND FOR_ATIINA = ''A''';
      fBscFornecedor.SQLDesc      := fBscFornecedor.SQLDesc + ' AND FOR_ATIINA = ''A''';
    end;
    if fBscFornecedor.ShowModal = mrOk then
      Result := fBscFornecedor.CodigoRetorno;
  finally
    fBscFornecedor.Free;
  end;
end;

procedure TBuscaFornecedor.GetCadsatro;
var
  fCadFornecedor : Tfcadfornecedores;
begin
  fCadFornecedor := Tfcadfornecedores.Create(nil);
  try
    fCadFornecedor.Position := poScreenCenter;
    fCadFornecedor.ShowModal;
  finally
    fCadFornecedor.Free;
  end;
end;

procedure TBuscaFornecedor.Pesquisa(iCodigo: integer);
begin
  if dmconexao.aq_fornecedor.Active then
    dmconexao.aq_fornecedor.Close;
  dmconexao.aq_fornecedor.SQL.Add(dmconexao.GetSQLFornecedores(iCodigo.ToString, false));
  dmconexao.aq_fornecedor.Open;
end;

{ TBuscaCliente }

function TBuscaCliente.ConsultaBusca(cSelf : TComponent; bSoAtivos : boolean): string;
var
  fBscCliente : Tfbscclientes;
begin
  fBscCliente := Tfbscclientes.Create(cSelf);
  try
    fBscCliente.Position         := poScreenCenter;
    fBscCliente.Query            := dmconexao.aq_cliente;
    fBscCliente.TipoBusca        := 'C';
    fBscCliente.SQLSemFiltro     := 'SELECT CLI_COD, CLI_NOME, CLI_CPF, CLI_ATIINA, CLI_DTNASC ' +
                                    'FROM dbo.CLIENTES';
    fBscCliente.NameFieldRetorno := 'CLI_COD';
    fBscCliente.SQLCodigo        := fBscCliente.SQLSemFiltro + ' WHERE CLI_COD = :CODIGO';
    fBscCliente.SQLDesc          := fBscCliente.SQLSemFiltro + ' WHERE UPPER(CLI_NOME) LIKE UPPER(:NOME)';
    if bSoAtivos then
    begin
      fBscCliente.SQLSemFiltro := fBscCliente.SQLSemFiltro + ' WHERE CLI_ATIINA = ''A''';
      fBscCliente.SQLCodigo    := fBscCliente.SQLCodigo + ' AND CLI_ATIINA = ''A''';
      fBscCliente.SQLDesc      := fBscCliente.SQLDesc + ' AND CLI_ATIINA = ''A''';
    end;
    if fBscCliente.ShowModal = mrOk then
    begin
      Result := fBscCliente.CodigoRetorno;
      Pesquisa(StrToIntDef(fBscCliente.CodigoRetorno, 0));
    end;
  finally
    fBscCliente.Free;
  end;
end;

procedure TBuscaCliente.GetCadsatro;
var
  fCadCliente : Tfcadclientes;
begin
  fCadCliente := Tfcadclientes.Create(nil);
  try
    fCadCliente.Position := poScreenCenter;
    fCadCliente.ShowModal;
  finally
    fCadCliente.Free;
  end;
end;

procedure TBuscaCliente.Pesquisa(iCodigo: integer);
begin
  if dmconexao.aq_cliente.Active then
    dmconexao.aq_cliente.Close;
  dmconexao.aq_cliente.SQL.Add(dmconexao.GetSQLClientes(iCodigo.ToString, false));
  dmconexao.aq_cliente.Open;
end;

{ TFabricaBuscas }

function TFabricaBuscas.CriaBusca(const TipoBusca: string): ITipoBusca;
var
  fBuscaCLiente : TBuscaCliente;
  fBuscaFornec  : TBuscaFornecedor;
  fBuscaProduto : TBuscaProduto;
  fBuscaVenda   : TBuscaVenda;
begin
  if Trim(TipoBusca) = 'C' then // Cliente
  begin
    fBuscaCLiente := TBuscaCliente.Create;
    Result        := fBuscaCLiente;
  end
  else if Trim(TipoBusca) = 'F' then // Fornecedor
  begin
    fBuscaFornec := TBuscaFornecedor.Create;
    Result       := fBuscaFornec;
  end
  else if Trim(TipoBusca) = 'P' then // Produto
  begin
    fBuscaProduto := TBuscaProduto.Create;
    Result        := fBuscaProduto;
  end
  else if Trim(TipoBusca) = 'V' then // Venda
  begin
    fBuscaVenda := TBuscaVenda.Create;
    Result      := fBuscaVenda;
  end;
end;

end.
