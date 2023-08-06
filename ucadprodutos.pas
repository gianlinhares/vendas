unit ucadprodutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.DBActns, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,  System.UITypes,
  Data.Win.ADODB;

type
  Tfcadprodutos = class(TForm)
    dbn_produtos: TDBNavigator;
    lbl_codigo: TLabel;
    dbt_codigo: TDBText;
    lbl_descricao: TLabel;
    dbe_descricao: TDBEdit;
    dbc_atiina: TDBCheckBox;
    lbl_precounitario: TLabel;
    dbe_precounitario: TDBEdit;
    lbl_fornec: TLabel;
    dbe_fornec_cod: TDBEdit;
    btn_sair: TBitBtn;
    btn_pesquisa: TButton;
    src_produto: TDataSource;
    lbl_fornec_desc: TLabel;
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_pesquisaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbn_produtosBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure dbn_produtosClick(Sender: TObject; Button: TNavigateBtn);
    procedure dbe_fornec_codExit(Sender: TObject);
  private
    iCodProduto : integer;
    bInsercaoEdicao : boolean;
    procedure Abre(iCodigo : integer);
    procedure RetornaDescricaoFornecedor;
  public
    property CodigoProduto : integer read iCodProduto write iCodProduto;
    property InsereOuEdita : boolean read bInsercaoEdicao write bInsercaoEdicao;
  end;

var
  fcadprodutos: Tfcadprodutos;

implementation

{$R *.dfm}

uses udmconexao;

procedure Tfcadprodutos.Abre(iCodigo: integer);
begin
  if dmconexao.aq_produto.Active then
    dmconexao.aq_produto.Close;
  dmconexao.aq_produto.Parameters.ParamByName('PRODUTO').Value := iCodigo;
  dmconexao.aq_produto.Open;

  RetornaDescricaoFornecedor;
end;

procedure Tfcadprodutos.btn_pesquisaClick(Sender: TObject);
var
  sCodProd : string;
begin
  sCodProd := dmconexao.RetornaBusca('P');
  if Trim(sCodProd) <> '' then
    Abre(StrToIntDef(sCodProd, 0));
end;

procedure Tfcadprodutos.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfcadprodutos.RetornaDescricaoFornecedor;
var
  aq_for : TADOQuery;
begin
  if Trim(dmconexao.aq_produtoPRO_FORCOD.AsString) <> '' then
  begin
    aq_for := TADOQuery.Create(nil);
    try
      aq_for.Connection := dmconexao.ac_connec;
      aq_for.SQL.Add(dmconexao.GetSQLFornecedores(dmconexao.aq_produtoPRO_FORCOD.AsString, true));
      aq_for.Open;
      if not(aq_for.IsEmpty) then
        lbl_fornec_desc.Caption := aq_for.FieldByName('FOR_NOME').AsString
      else
        dmconexao.InsereExibeMsg('Fornecedor ínválido ou não cadastrado');
    finally
      aq_for.Free;
    end;
  end
  else
    lbl_fornec_desc.Caption := '';
end;

procedure Tfcadprodutos.dbe_fornec_codExit(Sender: TObject);
begin
  RetornaDescricaoFornecedor;
end;

procedure Tfcadprodutos.dbn_produtosBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then
  begin
    if not(dmconexao.aq_produto.IsEmpty) then
    begin
      if MessageDlg('Deseja deletar o registro selecionado?',
                    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      begin
        dmconexao.aq_produto.Delete;
        abort;
      end;
    end;
  end;
end;

procedure Tfcadprodutos.dbn_produtosClick(Sender: TObject; Button: TNavigateBtn);
begin
  case Button of
    nbInsert: Abre(0);
    nbCancel: Abre(dmconexao.aq_produtoPRO_COD.AsInteger);
  end;
end;

procedure Tfcadprodutos.FormCreate(Sender: TObject);
begin
  iCodProduto     := 0;
  bInsercaoEdicao := false;
end;

procedure Tfcadprodutos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sCodForn : string;
begin
  if Key = VK_F5 then
  begin
    if dbe_fornec_cod.Focused then
    begin
      sCodForn := dmconexao.RetornaBusca('F', true);
      if Trim(sCodForn) <> '' then
      begin
        if not(dmconexao.aq_produto.State in dsEditModes) then
            dmconexao.aq_produto.Edit;
          dmconexao.aq_produtoPRO_FORCOD.AsString := sCodForn;
          dbe_fornec_codExit(dbe_fornec_cod);
      end;
    end;
  end;
end;

procedure Tfcadprodutos.FormShow(Sender: TObject);
begin
  if iCodProduto <> 0 then
  begin
    Abre(iCodProduto);
    if bInsercaoEdicao then
      dmconexao.aq_produto.Edit;
  end
  else
  begin
    Abre(0);
    if bInsercaoEdicao then
      dmconexao.aq_produto.Append;
  end;
end;

end.
