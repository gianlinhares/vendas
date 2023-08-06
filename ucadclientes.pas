unit ucadclientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.DBActns, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, System.UITypes;

type
  Tfcadclientes = class(TForm)
    dbn_produtos: TDBNavigator;
    lbl_codigo: TLabel;
    dbt_codigo: TDBText;
    lbl_nome: TLabel;
    dbe_nome: TDBEdit;
    lbl_cpf: TLabel;
    dbe_cpf: TDBEdit;
    dbc_atiina: TDBCheckBox;
    lbl_dtnasc: TLabel;
    dbe_dtnasc: TDBEdit;
    src_cliente: TDataSource;
    btn_sair: TBitBtn;
    btn_pesquisa: TButton;
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbn_produtosClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure dbn_produtosBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure btn_pesquisaClick(Sender: TObject);
  private
    iCodCLiente : integer;
    bInsercaoEdicao : boolean;
    procedure Abre(iCodigo : integer);
  public
    property CodigoCliente : integer read iCodCliente write iCodCliente;
    property InsereOuEdita : boolean read bInsercaoEdicao write bInsercaoEdicao;
  end;

var
  fcadclientes: Tfcadclientes;

implementation

{$R *.dfm}

uses udmconexao;

procedure Tfcadclientes.Abre(iCodigo: integer);
begin
  if dmconexao.aq_cliente.Active then
    dmconexao.aq_cliente.Close;
  dmconexao.aq_cliente.Parameters.ParamByName('CLIENTE').Value := iCodigo;
  dmconexao.aq_cliente.Open;
end;

procedure Tfcadclientes.btn_pesquisaClick(Sender: TObject);
var
  sCodCli : string;
begin
  sCodCli := dmconexao.RetornaBusca('C');
  if Trim(sCodCli) <> '' then
    Abre(StrToIntDef(sCodCli, 0));
end;

procedure Tfcadclientes.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfcadclientes.dbn_produtosBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then
  begin
    if not(dmconexao.aq_cliente.IsEmpty) then
    begin
      if MessageDlg('Deseja deletar o registro selecionado?',
                    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      begin
        dmconexao.aq_cliente.Delete;
        abort;
      end;
    end;
  end;
end;

procedure Tfcadclientes.dbn_produtosClick(Sender: TObject;  Button: TNavigateBtn);
begin
  case Button of
    nbCancel: Abre(dmconexao.aq_clienteCLI_COD.AsInteger);
  end;
end;

procedure Tfcadclientes.FormCreate(Sender: TObject);
begin
  iCodCliente     := 0;
  bInsercaoEdicao := false;
end;

procedure Tfcadclientes.FormShow(Sender: TObject);
begin
  if iCodCLiente <> 0 then
  begin
    Abre(iCodCliente);
    if bInsercaoEdicao then
      dmconexao.aq_cliente.Edit;
  end
  else
  begin
    Abre(0);
    if bInsercaoEdicao then
      dmconexao.aq_cliente.Append;
  end;
end;

end.
