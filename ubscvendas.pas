unit ubscvendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.DBActns, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, Data.Win.ADODB;

type
  Tfbscvendas = class(TForm)
    shp_fim: TShape;
    dbg_vendas: TDBGrid;
    lbl_result: TLabel;
    shp_result: TShape;
    btn_produto: TButton;
    btn_pesquisar: TButton;
    btn_editar: TButton;
    btn_sair: TBitBtn;
    btn_limpar: TBitBtn;
    btn_selecionar: TBitBtn;
    src_venda: TDataSource;
    aq_venda: TADOQuery;
    aq_vendaVEN_NUMERO: TIntegerField;
    aq_vendaVEN_CLICOD: TIntegerField;
    aq_vendaVEN_VLRTOTAL: TBCDField;
    aq_vendaSTATUS: TStringField;
    aq_vendaCLI_NOME: TStringField;
    lbl_cliente: TLabel;
    lbl_cli_desc: TLabel;
    dbe_cli_cod: TEdit;
    lbl_numero: TLabel;
    dbe_codigo: TEdit;
    lbl_produto: TLabel;
    lbl_prod_desc: TLabel;
    rdg_status: TRadioGroup;
    dbe_prod_cod: TEdit;
    aq_produtos: TADOQuery;
    dbg_prod: TDBGrid;
    lbl_prod: TLabel;
    Shape1: TShape;
    aq_vendaprodLabel: TLabel;
    aq_vendaprodShape: TShape;
    aq_vendaprodLabel2: TLabel;
    aq_vendaprodShape2: TShape;
    aq_produtosVPR_PROCOD: TIntegerField;
    aq_produtosVPR_QTDVENDIDA: TBCDField;
    aq_produtosVPR_VLRTOTPROD: TBCDField;
    aq_produtosPRO_DESC: TStringField;
    aq_produtosPRO_PRECO: TBCDField;
    src_produtos: TDataSource;
    aq_vendaVEN_DATAHORA: TDateTimeField;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_produtoClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_selecionarClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbg_vendasDblClick(Sender: TObject);
    procedure dbe_cli_codExit(Sender: TObject);
    procedure dbe_prod_codExit(Sender: TObject);
    procedure aq_vendaAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    sSQL, sSQLProdutos : string;
    iCodVenda : integer;
    bSomenteAtivos : boolean;
    procedure Pesquisar;
    procedure AbreCadastroVendas(iCodigo : integer);
    procedure Selecionar;
    procedure AbreProdutosVenda(iNumVenda : integer);
  public
    property CodigoVenda : integer read iCodVenda write iCodVenda;
    property SomenteAtivos : boolean read bSomenteAtivos write bSomenteAtivos;
  end;

var
  fbscvendas: Tfbscvendas;

implementation

{$R *.dfm}

uses udmconexao, ucadvendas, ubscclientes, ubsprodutos;

procedure Tfbscvendas.AbreCadastroVendas(iCodigo: integer);
var
  fCadVendas : TfCadVendas;
begin
  fCadVendas := TfCadVendas.Create(Self);
  try
    fCadVendas.Position      := poScreenCenter;
    fCadVendas.InsereOuEdita := true;
    if iCodigo <> 0 then
      fCadVendas.CodigoVenda := iCodigo;
    fCadVendas.ShowModal;
  finally
    fCadVendas.Free;
  end;
end;

procedure Tfbscvendas.AbreProdutosVenda(iNumVenda: integer);
var
  sSQL_Pesquisa : string;
begin
  if Trim(sSQLProdutos) = '' then
    sSQLProdutos := aq_produtos.SQL.Text;
  sSQL_Pesquisa := sSQLProdutos + ' WHERE VPR_NUMVENDA = ' + iNumVenda.ToString;

  if aq_produtos.Active then
    aq_produtos.Close;
  aq_produtos.SQL.Clear;
  aq_produtos.SQL.Add(sSQL_Pesquisa);
  aq_produtos.Open;
end;

procedure Tfbscvendas.aq_vendaAfterScroll(DataSet: TDataSet);
begin
  if not(aq_venda.IsEmpty) then
    AbreProdutosVenda(aq_vendaVEN_NUMERO.AsInteger);
end;

procedure Tfbscvendas.btn_editarClick(Sender: TObject);
begin
  AbreCadastroVendas(aq_vendaVEN_NUMERO.AsInteger);
end;

procedure Tfbscvendas.btn_limparClick(Sender: TObject);
begin
  dbe_cli_cod.Clear;
  dbe_codigo.Clear;
  dbe_prod_cod.Clear;
  lbl_cli_desc.Caption  := '';
  lbl_prod_desc.Caption := '';
  rdg_status.ItemIndex  := 2;
  aq_venda.Close;
  ModalResult := mrNone;
end;

procedure Tfbscvendas.btn_pesquisarClick(Sender: TObject);
begin
  Pesquisar;

  btn_editar.Enabled := not(aq_venda.IsEmpty);
  if not(aq_venda.IsEmpty) then
  begin
    dbg_vendas.SetFocus;
    AbreProdutosVenda(aq_vendaVEN_NUMERO.AsInteger);
  end;
end;

procedure Tfbscvendas.btn_produtoClick(Sender: TObject);
begin
  AbreCadastroVendas(0);
end;

procedure Tfbscvendas.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfbscvendas.Selecionar;
begin
  if not(aq_venda.IsEmpty) then
    iCodVenda := aq_vendaVEN_NUMERO.AsInteger
  else
    ModalResult := mrNone;
end;

procedure Tfbscvendas.btn_selecionarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure Tfbscvendas.dbe_cli_codExit(Sender: TObject);
begin
  dmconexao.OnExitClientes(dbe_cli_cod, lbl_cli_desc, false);
end;

procedure Tfbscvendas.dbe_prod_codExit(Sender: TObject);
begin
  dmconexao.OnExitProdutos(dbe_prod_cod, lbl_prod_desc, false);
end;

procedure Tfbscvendas.dbg_vendasDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure Tfbscvendas.FormCreate(Sender: TObject);
begin
  sSQL           := '';
  sSQLProdutos   := '';
  bSomenteAtivos := false;
end;

procedure Tfbscvendas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  fBscCli : Tfbscclientes;
  fBscProd : Tfbscprodutos;
begin
  if Key = VK_F5 then
  begin
    if dbe_cli_cod.Focused then
    begin
      fBscCli := Tfbscclientes.Create(Self);
      try
        fBscCli.Position      := poScreenCenter;
        if fBscCli.ShowModal = mrOk then
        begin
          dbe_cli_cod.Text := fBscCli.CodigoCliente.ToString;
          dbe_cli_codExit(dbe_cli_cod)
        end;
      finally
        fBscCli.Free;
      end;
    end
    else if dbe_prod_cod.Focused then
      begin
        fBscProd := Tfbscprodutos.Create(Self);
        try
          fBscProd.Position      := poScreenCenter;
          if fBscProd.ShowModal = mrOk then
          begin
            dbe_prod_cod.Text := fBscProd.CodigoProduto.ToString;
            dbe_prod_codExit(dbe_prod_cod);
          end;
        finally
          fBscProd.Free;
        end;
      end;
  end;
end;

procedure Tfbscvendas.FormShow(Sender: TObject);
begin
  lbl_prod_desc.Caption := '';
  lbl_cli_desc.Caption  := '';
end;

procedure Tfbscvendas.Pesquisar;
var
  sSQL_Pesquisa : string;
begin
   if Trim(sSQL) = '' then
    sSQL := aq_venda.SQL.Text;
  sSQL_Pesquisa := sSQL + ' WHERE VEN_NUMERO IS NOT NULL';
  if Trim(dbe_codigo.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND VEN_NUMERO = ' + dbe_codigo.Text;
  if Trim(dbe_cli_cod.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND VEN_CLICOD = ' + dbe_cli_cod.Text;
  if Trim(dbe_prod_cod.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND EXISTS(SELECT VPR_PROCOD ' +
                                                  'FROM VENDAS_PRODUTOS ' +
                                                  'WHERE VPR_NUMVENDA = VEN_NUMERO ' +
                                                  'AND VPR_PROCOD = ' + dbe_prod_cod.Text + ')';

  case rdg_status.ItemIndex of
    0 : sSQL_Pesquisa := sSQL_Pesquisa + ' AND VEN_STATUS = ''P''';
    1 : sSQL_Pesquisa := sSQL_Pesquisa + ' AND VEN_STATUS = ''E''';
  end;

  if aq_venda.Active then
    aq_venda.Close;
  aq_venda.SQL.Clear;
  aq_venda.SQL.Add(sSQL_Pesquisa);
  aq_venda.Open;
end;

end.
