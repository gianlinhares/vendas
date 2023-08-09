unit ucadfornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucadastropadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  Tfcadfornecedores = class(Tfcadastropadrao)
    lbl_codigo: TLabel;
    dbt_codigo: TDBText;
    lbl_nome: TLabel;
    lbl_cnpj: TLabel;
    lbl_razaosocial: TLabel;
    dbe_nome: TDBEdit;
    dbe_cnpj: TDBEdit;
    dbc_atiina: TDBCheckBox;
    dbe_razaosocial: TDBEdit;
    procedure btn_pesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fcadfornecedores: Tfcadfornecedores;

implementation

{$R *.dfm}

uses udmconexao;

procedure Tfcadfornecedores.btn_pesqClick(Sender: TObject);
var
  sCodForn : string;
begin
  inherited;
  sCodForn := dmconexao.RetornaBusca('F');
  src_cad.DataSet.Refresh;
end;

end.
