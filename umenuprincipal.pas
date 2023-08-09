unit umenuprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls;

type
  Tfmenuprincipal = class(TForm)
    pnl_menu: TPanel;
    main_menu: TMainMenu;
    mnu_cadastro: TMenuItem;
    mnu_cliente_cad: TMenuItem;
    mnu_fornec_cad: TMenuItem;
    mnu_produtos_cad: TMenuItem;
    mnu_vendas_princ: TMenuItem;
    mnu_vendas_cad: TMenuItem;
    mnu_consultas: TMenuItem;
    mnu_cliente_cons: TMenuItem;
    mnu_fornec_cons: TMenuItem;
    mnu_produtos_cons: TMenuItem;
    mnu_sair: TMenuItem;
    mnu_vendas_cons: TMenuItem;
    procedure mnu_cliente_cadClick(Sender: TObject);
    procedure mnu_fornec_cadClick(Sender: TObject);
    procedure mnu_produtos_cadClick(Sender: TObject);
    procedure mnu_vendas_cadClick(Sender: TObject);
    procedure mnu_cliente_consClick(Sender: TObject);
    procedure mnu_fornec_consClick(Sender: TObject);
    procedure mnu_produtos_consClick(Sender: TObject);
    procedure mnu_vendas_consClick(Sender: TObject);
    procedure mnu_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmenuprincipal: Tfmenuprincipal;

implementation

{$R *.dfm}

uses udmconexao;

procedure Tfmenuprincipal.mnu_cliente_cadClick(Sender: TObject);
begin
  dmconexao.RetornaCadastro('C');
end;

procedure Tfmenuprincipal.mnu_cliente_consClick(Sender: TObject);
begin
  dmconexao.RetornaBusca('C');
end;

procedure Tfmenuprincipal.mnu_fornec_cadClick(Sender: TObject);
begin
  dmconexao.RetornaCadastro('F');
end;

procedure Tfmenuprincipal.mnu_fornec_consClick(Sender: TObject);
begin
  dmconexao.RetornaBusca('F');
end;

procedure Tfmenuprincipal.mnu_produtos_cadClick(Sender: TObject);
begin
  dmconexao.RetornaCadastro('P');
end;

procedure Tfmenuprincipal.mnu_produtos_consClick(Sender: TObject);
begin
  dmconexao.RetornaBusca('P');
end;

procedure Tfmenuprincipal.mnu_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfmenuprincipal.mnu_vendas_cadClick(Sender: TObject);
begin
  dmconexao.RetornaCadastro('V');
end;

procedure Tfmenuprincipal.mnu_vendas_consClick(Sender: TObject);
begin
  dmconexao.RetornaBusca('V');
end;

end.
