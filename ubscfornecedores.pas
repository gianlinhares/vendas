unit ubscfornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.DBActns, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, Data.Win.ADODB;

type
  Tfbscfornecedores = class(TForm)
    shp_fim: TShape;
    dbg_fornecedores: TDBGrid;
    lbl_codigo: TLabel;
    lbl_nome: TLabel;
    lbl_cnpj: TLabel;
    rdg_atiina: TRadioGroup;
    shp_result: TShape;
    lbl_result: TLabel;
    lbl_razaosocial: TLabel;
    btn_fornecedor: TButton;
    btn_pesquisar: TButton;
    btn_editar: TButton;
    btn_sair: TBitBtn;
    btn_limpar: TBitBtn;
    btn_selecionar: TBitBtn;
    dbe_cnpj: TMaskEdit;
    dbe_codigo: TEdit;
    dbe_nome: TEdit;
    dbe_razaosocial: TEdit;
    src_fornecedor: TDataSource;
    aq_fornecedor: TADOQuery;
    aq_fornecedorFOR_COD: TIntegerField;
    aq_fornecedorFOR_NOME: TStringField;
    aq_fornecedorFOR_RAZAO: TStringField;
    aq_fornecedorFOR_CNPJ: TStringField;
    aq_fornecedorSITUACAO: TStringField;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_fornecedorClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_selecionarClick(Sender: TObject);
    procedure dbg_fornecedoresDblClick(Sender: TObject);
  private
    sSQL : string;
    iCodForn : integer;
    bSomenteAtivos : boolean;
    procedure Pesquisar;
    procedure AbreCadastroFornecedor(iCodigo : integer);
    procedure Selecionar;
  public
    property CodigoFornecedor : integer read iCodForn write iCodForn;
    property SomenteAtivos : boolean read bSomenteAtivos write bSomenteAtivos;
  end;

var
  fbscfornecedores: Tfbscfornecedores;

implementation

{$R *.dfm}

uses ucadfornecedores, udmconexao;

procedure Tfbscfornecedores.AbreCadastroFornecedor(iCodigo: integer);
var
  fCadFornecedores : Tfcadfornecedores;
begin
  fCadFornecedores := Tfcadfornecedores.Create(Self);
  try
    fCadFornecedores.Position      := poScreenCenter;
    fCadFornecedores.InsereOuEdita := true;
    if iCodigo <> 0 then
      fCadFornecedores.CodigoFornecedor := iCodigo;
    fCadFornecedores.ShowModal;
  finally
    fCadFornecedores.Free;
  end;
end;

procedure Tfbscfornecedores.btn_fornecedorClick(Sender: TObject);
begin
  AbreCadastroFornecedor(0);
end;

procedure Tfbscfornecedores.btn_editarClick(Sender: TObject);
begin
  AbreCadastroFornecedor(aq_fornecedorFOR_COD.AsInteger);
end;

procedure Tfbscfornecedores.btn_limparClick(Sender: TObject);
begin
  dbe_codigo.Clear;
  dbe_nome.Clear;
  dbe_razaosocial.Clear;
  dbe_cnpj.Clear;
  if not(bSomenteAtivos) then
    rdg_atiina.ItemIndex := 2;
  aq_fornecedor.Close;
  ModalResult := mrNone;
end;

procedure Tfbscfornecedores.btn_pesquisarClick(Sender: TObject);
begin
  Pesquisar;

  btn_editar.Enabled := not(aq_fornecedor.IsEmpty);
  if not(aq_fornecedor.IsEmpty) then
    dbg_fornecedores.SetFocus;
end;

procedure Tfbscfornecedores.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfbscfornecedores.Selecionar;
begin
  if not(aq_fornecedor.IsEmpty) then
    iCodForn := aq_fornecedorFOR_COD.AsInteger
  else
    ModalResult := mrNone;
end;

procedure Tfbscfornecedores.btn_selecionarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure Tfbscfornecedores.dbg_fornecedoresDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure Tfbscfornecedores.FormCreate(Sender: TObject);
begin
  sSQL           := '';
  bSomenteAtivos := false;
end;

procedure Tfbscfornecedores.FormShow(Sender: TObject);
begin
  if bSomenteAtivos then
  begin
    rdg_atiina.ItemIndex := 0;
    rdg_atiina.Enabled   := false;
  end;
end;

procedure Tfbscfornecedores.Pesquisar;
var
  sSQL_Pesquisa : string;
begin
   if Trim(sSQL) = '' then
    sSQL := aq_fornecedor.SQL.Text;
  sSQL_Pesquisa := sSQL + ' WHERE FOR_COD IS NOT NULL';
  if Trim(dbe_codigo.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND FOR_COD = ' + dbe_codigo.Text;
  if Trim(dbe_nome.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND FOR_NOME ' + dmconexao.GetLikeSQL(dbe_nome.Text);
  if Trim(dbe_razaosocial.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND FOR_RAZAO ' + dmconexao.GetLikeSQL(dbe_razaosocial.Text);
  if Trim(dbe_cnpj.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND FOR_CNPJ ' + dmconexao.GetLikeSQL(dbe_cnpj.Text);

  case rdg_atiina.ItemIndex of
    0 : sSQL_Pesquisa := sSQL_Pesquisa + ' AND FOR_ATIINA = ''A''';
    1 : sSQL_Pesquisa := sSQL_Pesquisa + ' AND FOR_ATIINA = ''I''';
  end;

  if aq_fornecedor.Active then
    aq_fornecedor.Close;
  aq_fornecedor.SQL.Clear;
  aq_fornecedor.SQL.Add(sSQL_Pesquisa);
  aq_fornecedor.Open;
end;

end.
