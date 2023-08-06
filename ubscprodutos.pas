unit ubscprodutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.DBActns, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, Data.Win.ADODB;

type
  Tfbscprodutos = class(TForm)
    shp_fim: TShape;
    dbg_produtos: TDBGrid;
    lbl_codigo: TLabel;
    lbl_desc: TLabel;
    rdg_atiina: TRadioGroup;
    lbl_fornec: TLabel;
    lbl_result: TLabel;
    shp_result: TShape;
    lbl_fornec_desc: TLabel;
    dbe_fornec_cod: TEdit;
    dbe_desc: TEdit;
    dbe_codigo: TEdit;
    btn_produto: TButton;
    btn_pesquisar: TButton;
    btn_editar: TButton;
    btn_sair: TBitBtn;
    btn_limpar: TBitBtn;
    btn_selecionar: TBitBtn;
    src_produto: TDataSource;
    aq_produto: TADOQuery;
    aq_produtoPRO_COD: TIntegerField;
    aq_produtoPRO_DESC: TStringField;
    aq_produtoPRO_PRECO: TBCDField;
    aq_produtoPRO_FORCOD: TIntegerField;
    aq_produtoSITUACAO: TStringField;
    aq_produtoFOR_NOME: TStringField;
    procedure btn_sairClick(Sender: TObject);
    procedure dbe_fornec_codExit(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_produtoClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_selecionarClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbg_produtosDblClick(Sender: TObject);
  private
    sSQL : string;
    iCodProduto : integer;
    bSomenteAtivos : boolean;
    procedure Pesquisar;
    procedure AbreCadastroProduto(iCodigo : integer);
    procedure Selecionar;
  public
    property CodigoProduto : integer read iCodProduto write iCodProduto;
    property SomenteAtivos : boolean read bSomenteAtivos write bSomenteAtivos;
  end;

var
  fbscprodutos: Tfbscprodutos;

implementation

{$R *.dfm}

uses ucadprodutos, udmconexao, ubscfornecedores;

procedure Tfbscprodutos.AbreCadastroProduto(iCodigo: integer);
var
  fCadProdutos : Tfcadprodutos;
begin
  fCadProdutos := Tfcadprodutos.Create(Self);
  try
    fCadProdutos.Position      := poScreenCenter;
    fCadProdutos.InsereOuEdita := true;
    if iCodigo <> 0 then
      fCadProdutos.CodigoProduto := iCodigo;
    fCadProdutos.ShowModal;
  finally
    fCadProdutos.Free;
  end;
end;

procedure Tfbscprodutos.btn_editarClick(Sender: TObject);
begin
  AbreCadastroProduto(aq_produtoPRO_COD.AsInteger);
end;

procedure Tfbscprodutos.btn_limparClick(Sender: TObject);
begin
  dbe_fornec_cod.Clear;
  dbe_desc.Clear;
  dbe_fornec_cod.Clear;
  lbl_fornec_desc.Caption := '';
  if not(bSomenteAtivos) then
    rdg_atiina.ItemIndex := 2;
  aq_produto.Close;
  ModalResult := mrNone;
end;

procedure Tfbscprodutos.btn_pesquisarClick(Sender: TObject);
begin
  Pesquisar;

  btn_editar.Enabled := not(aq_produto.IsEmpty);
  if not(aq_produto.IsEmpty) then
    dbg_produtos.SetFocus;
end;

procedure Tfbscprodutos.btn_produtoClick(Sender: TObject);
begin
  AbreCadastroProduto(0);
end;

procedure Tfbscprodutos.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfbscprodutos.Selecionar;
begin
  if not(aq_produto.IsEmpty) then
    iCodProduto := aq_produtoPRO_COD.AsInteger
  else
    ModalResult := mrNone;
end;

procedure Tfbscprodutos.btn_selecionarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure Tfbscprodutos.dbe_fornec_codExit(Sender: TObject);
begin
  dmconexao.OnExitFornecedores(dbe_fornec_cod, lbl_fornec, false);
end;

procedure Tfbscprodutos.dbg_produtosDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure Tfbscprodutos.FormCreate(Sender: TObject);
begin
  sSQL           := '';
  bSomenteAtivos := false;
end;

procedure Tfbscprodutos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  fBscFornec : Tfbscfornecedores;
begin
  if Key = VK_F5 then
  begin
    fBscFornec := Tfbscfornecedores.Create(Self);
    try
      fBscFornec.Position      := poScreenCenter;
      fBscFornec.SomenteAtivos := true;
      if fBscFornec.ShowModal = mrOk then
      begin
        dbe_fornec_cod.Text := fBscFornec.CodigoFornecedor.ToString;
      end;
    finally
      fBscFornec.Free;
    end;
  end;
end;

procedure Tfbscprodutos.FormShow(Sender: TObject);
begin
  lbl_fornec_desc.Caption := '';
  if bSomenteAtivos then
  begin
    rdg_atiina.ItemIndex := 0;
    rdg_atiina.Enabled   := false;
  end;
end;

procedure Tfbscprodutos.Pesquisar;
var
  sSQL_Pesquisa : string;
begin
   if Trim(sSQL) = '' then
    sSQL := aq_produto.SQL.Text;
  sSQL_Pesquisa := sSQL + ' WHERE FOR_COD IS NOT NULL';
  if Trim(dbe_codigo.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND PRO_COD = ' + dbe_codigo.Text;
  if Trim(dbe_desc.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND PRO_DESC ' + dmconexao.GetLikeSQL(dbe_desc.Text);
  if Trim(dbe_fornec_cod.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND PRO_FORCOD = ' + dbe_fornec_cod.Text;

  case rdg_atiina.ItemIndex of
    0 : sSQL_Pesquisa := sSQL_Pesquisa + ' AND PRO_ATIINA = ''A''';
    1 : sSQL_Pesquisa := sSQL_Pesquisa + ' AND PRO_ATIINA = ''I''';
  end;

  if aq_produto.Active then
    aq_produto.Close;
  aq_produto.SQL.Clear;
  aq_produto.SQL.Add(sSQL_Pesquisa);
  aq_produto.Open;
end;

end.
