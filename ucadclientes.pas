unit ucadclientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucadastropadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  Tfcadclientes = class(Tfcadastropadrao)
    lbl_codigo: TLabel;
    dbt_codigo: TDBText;
    lbl_nome: TLabel;
    lbl_cpf: TLabel;
    lbl_dtnasc: TLabel;
    dbe_nome: TDBEdit;
    dbe_cpf: TDBEdit;
    dbe_dtnasc: TDBEdit;
    dbc_atiina: TDBCheckBox;
    procedure btn_pesqClick(Sender: TObject);
  private
  public
  end;

var
  fcadclientes: Tfcadclientes;

implementation

{$R *.dfm}

uses udmconexao;

procedure Tfcadclientes.btn_pesqClick(Sender: TObject);
var
  sCodCli : string;
begin
  inherited;
  sCodCli := dmconexao.RetornaBusca('C');
  src_cad.DataSet.Refresh;
end;

end.
