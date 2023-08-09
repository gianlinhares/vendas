unit ubscfornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ubuscapadrao, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  Tfbscfornecedores = class(Tfbuscapadrao)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fbscfornecedores: Tfbscfornecedores;

implementation

{$R *.dfm}

end.
