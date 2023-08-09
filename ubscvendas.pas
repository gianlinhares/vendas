unit ubscvendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ubuscapadrao, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  Tfbscvendas = class(Tfbuscapadrao)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fbscvendas: Tfbscvendas;

implementation

{$R *.dfm}

end.
