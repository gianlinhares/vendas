unit ucadfornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.DBActns, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,  System.UITypes;

type
  Tfcadfornecedores = class(TForm)
    dbn_fornecedores: TDBNavigator;
    lbl_codigo: TLabel;
    dbt_codigo: TDBText;
    lbl_nome: TLabel;
    dbe_nome: TDBEdit;
    lbl_cnpj: TLabel;
    dbe_cnpj: TDBEdit;
    dbc_atiina: TDBCheckBox;
    lbl_razaosocial: TLabel;
    dbe_razaosocial: TDBEdit;
    btn_sair: TBitBtn;
    src_fornecedor: TDataSource;
    btn_pesquisa: TButton;
    procedure btn_sairClick(Sender: TObject);
    procedure dbn_fornecedoresBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure btn_pesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbn_fornecedoresClick(Sender: TObject; Button: TNavigateBtn);
  private
    iCodFornecedor : integer;
    bInsercaoEdicao : boolean;
    procedure Abre(iCodigo : integer);
  public
    property CodigoFornecedor : integer read iCodFornecedor write iCodFornecedor;
    property InsereOuEdita : boolean read bInsercaoEdicao write bInsercaoEdicao;
  end;

var
  fcadfornecedores: Tfcadfornecedores;

implementation

{$R *.dfm}

uses udmconexao;

procedure Tfcadfornecedores.Abre(iCodigo: integer);
begin
  if dmconexao.aq_fornecedor.Active then
    dmconexao.aq_fornecedor.Close;
  dmconexao.aq_fornecedor.Parameters.ParamByName('FORNECEDOR').Value := iCodigo;
  dmconexao.aq_fornecedor.Open;
end;

procedure Tfcadfornecedores.btn_pesquisaClick(Sender: TObject);
var
  sCodForn : string;
begin
  sCodForn := dmconexao.RetornaBusca('F');
  if Trim(sCodForn) <> '' then
    Abre(StrToIntDef(sCodForn, 0));
end;

procedure Tfcadfornecedores.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfcadfornecedores.dbn_fornecedoresBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then
  begin
    if not(dmconexao.aq_fornecedor.IsEmpty) then
    begin
      if MessageDlg('Deseja deletar o registro selecionado?',
                    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      begin
        dmconexao.aq_fornecedor.Delete;
        abort;
      end;
    end;
  end;
end;

procedure Tfcadfornecedores.dbn_fornecedoresClick(Sender: TObject; Button: TNavigateBtn);
begin
  case Button of
    nbCancel: Abre(dmconexao.aq_fornecedorFOR_COD.AsInteger);
  end;
end;

procedure Tfcadfornecedores.FormCreate(Sender: TObject);
begin
  iCodFornecedor  := 0;
  bInsercaoEdicao := false;
end;

procedure Tfcadfornecedores.FormShow(Sender: TObject);
begin
  if iCodFornecedor <> 0 then
  begin
    Abre(iCodFornecedor);
    if bInsercaoEdicao then
      dmconexao.aq_fornecedor.Edit;
  end
  else
  begin
    Abre(0);
    if bInsercaoEdicao then
      dmconexao.aq_fornecedor.Append;
  end;
end;

end.
