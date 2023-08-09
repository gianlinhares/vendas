unit ucadastropadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls;

type
  Tfcadastropadrao = class(TForm)
    dbn_cad: TDBNavigator;
    btn_sair: TBitBtn;
    btn_pesq: TBitBtn;
    src_cad: TDataSource;
    procedure btn_sairClick(Sender: TObject);
    procedure dbn_cadBeforeAction(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fcadastropadrao: Tfcadastropadrao;

implementation

{$R *.dfm}

procedure Tfcadastropadrao.btn_sairClick(Sender: TObject);
begin
  src_cad.DataSet.Close;
  Close;
end;

procedure Tfcadastropadrao.dbn_cadBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then
  begin
    if not(src_cad.DataSet.IsEmpty) then
    begin
      if MessageDlg('Deseja deletar o registro selecionado?',
                    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      begin
        src_cad.DataSet.Delete;
        abort;
      end;
    end;
  end;
end;

end.
