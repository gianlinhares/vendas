unit umenuprincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Menus;

type
  Tfmenuprincipal = class(TForm)
    Panel1: TPanel;
    main_menu: TMainMenu;
    mnu_consulta: TMenuItem;
    mnu_bscclientes: TMenuItem;
    mnu_bscfornecedores: TMenuItem;
    mnu_bscprodutos: TMenuItem;
    mnu_vendas: TMenuItem;
    mnu_cadvendas: TMenuItem;
    mnu_sair: TMenuItem;
    mnu_cadastro: TMenuItem;
    mnu_cadcli: TMenuItem;
    mnu_cadforn: TMenuItem;
    mnu_cadprod: TMenuItem;
    mnu_bscvendas: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mnu_bscclientesClick(Sender: TObject);
    procedure mnu_bscfornecedoresClick(Sender: TObject);
    procedure mnu_bscprodutosClick(Sender: TObject);
    procedure mnu_sairClick(Sender: TObject);
    procedure mnu_cadvendasClick(Sender: TObject);
    procedure mnu_bscvendasClick(Sender: TObject);
    procedure mnu_cadcliClick(Sender: TObject);
    procedure mnu_cadfornClick(Sender: TObject);
    procedure mnu_cadprodClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmenuprincipal: Tfmenuprincipal;

implementation

{$R *.fmx}

uses udmconexao;

procedure Tfmenuprincipal.FormCreate(Sender: TObject);
begin
  Self.Top  := 0;
  Self.Left := 0;
end;

procedure Tfmenuprincipal.mnu_bscclientesClick(Sender: TObject);
begin
  dmconexao.RetornaBusca('C');
end;

procedure Tfmenuprincipal.mnu_bscfornecedoresClick(Sender: TObject);
begin
  dmconexao.RetornaBusca('F');
end;

procedure Tfmenuprincipal.mnu_bscprodutosClick(Sender: TObject);
begin
  dmconexao.RetornaBusca('P');
end;

procedure Tfmenuprincipal.mnu_bscvendasClick(Sender: TObject);
begin
  dmconexao.RetornaBusca('V');
end;

procedure Tfmenuprincipal.mnu_cadcliClick(Sender: TObject);
begin
  dmconexao.RetornaCadastro('C');
end;

procedure Tfmenuprincipal.mnu_cadfornClick(Sender: TObject);
begin
  dmconexao.RetornaCadastro('F');
end;

procedure Tfmenuprincipal.mnu_cadprodClick(Sender: TObject);
begin
  dmconexao.RetornaCadastro('P');
end;

procedure Tfmenuprincipal.mnu_cadvendasClick(Sender: TObject);
begin
  dmconexao.RetornaCadastro('V');
end;

procedure Tfmenuprincipal.mnu_sairClick(Sender: TObject);
begin
  Close;
end;

end.
