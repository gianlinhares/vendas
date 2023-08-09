unit ucadprodutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucadastropadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  Tfcadprodutos = class(Tfcadastropadrao)
    lbl_codigo: TLabel;
    dbt_codigo: TDBText;
    lbl_descricao: TLabel;
    lbl_precounitario: TLabel;
    lbl_fornec: TLabel;
    dbe_descricao: TDBEdit;
    dbc_atiina: TDBCheckBox;
    dbe_precounitario: TDBEdit;
    dbe_fornec_cod: TDBEdit;
    lbl_fornec_desc: TDBText;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_pesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fcadprodutos: Tfcadprodutos;

implementation

{$R *.dfm}

uses udmconexao;

procedure Tfcadprodutos.btn_pesqClick(Sender: TObject);
var
  sCodProd : string;
begin
  inherited;
  sCodProd := dmconexao.RetornaBusca('P');
  src_cad.DataSet.Refresh;
end;

procedure Tfcadprodutos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sCodForn : string;
begin
  inherited;

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
      end;
    end;
  end;
end;

end.
