unit ubuscapadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.Win.ADODB;

type
  Tfbuscapadrao = class(TForm)
    shp_fim: TShape;
    shp_result: TShape;
    lbl_result: TLabel;
    btn_cadastra: TButton;
    dbg_clientes: TDBGrid;
    btn_pesquisar: TButton;
    btn_sair: TBitBtn;
    btn_limpar: TBitBtn;
    btn_selecionar: TBitBtn;
    src: TDataSource;
    lbl_busca: TLabel;
    dbe_busca: TEdit;
    rdg_filtro: TRadioGroup;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_selecionarClick(Sender: TObject);
    procedure btn_cadastraClick(Sender: TObject);
  private
    sSQLCod, sSQLDesc, sCodRetorno, sDescRetorno, sNameFieldRetorno, sSQLSemFiltro, sTipoBusca : string;
    aq_Busca : TADOQuery;
    procedure SetQuery(const Value: TADOQuery);
    procedure SetSQLCodigo(const Value: String);
    procedure SetSQLDesc(const Value: String);
    procedure SetCodigoRetorno(const Value: String);
    procedure setDescRetorno(const Value: String);
    procedure SetNameFieldRetorno(const Value: String);
    procedure SetSQLSemFiltro(const Value : String);
    procedure SetTipoBusca(const Value : String);
  public
    property Query : TADOQuery read aq_Busca write SetQuery;
    property SQLCodigo : String read sSQLCod  write SetSQLCodigo;
    property SQLDesc : String read sSQLDesc  write SetSQLDesc;
    property SQLSemFiltro : String read sSQLSemFiltro write SetSQLSemFiltro;
    property CodigoRetorno : String read sCodRetorno write SetCodigoRetorno;
    property DescricaoRetorno : String read sDescRetorno write setDescRetorno;
    property NameFieldRetorno : String read sNameFieldRetorno write sNameFieldRetorno;
    property TipoBusca : String read sTipoBusca write SetTipoBusca;
  end;

var
  fbuscapadrao: Tfbuscapadrao;

implementation

{$R *.dfm}

uses udmconexao;

procedure Tfbuscapadrao.btn_cadastraClick(Sender: TObject);
begin
  dmconexao.RetornaCadastro(sTipoBusca);
end;

procedure Tfbuscapadrao.btn_limparClick(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
      TEdit(Components[i]).Clear;
    if Components[i] is TRadioGroup then
      TRadioGroup(Components[i]).ItemIndex := 0;
    if Components[i] is TLabel then
      TLabel(Components[i]).Caption := '';
  end;
  src.DataSet.Close;
  ModalResult := mrNone;
end;

procedure Tfbuscapadrao.btn_pesquisarClick(Sender: TObject);
begin
  aq_Busca.Close;
  if Trim(dbe_busca.Text) <> '' then
  begin
    if (rdg_filtro.ItemIndex = 0) then
    begin
      aq_Busca.SQL.Text := sSQLCod;
      aq_Busca.Parameters[0].Value    := dbe_busca.Text;
      aq_Busca.Parameters[0].DataType := ftInteger;
    end
    else
    begin
      aq_Busca.SQL.Text := sSQLDesc;
      aq_Busca.Parameters[0].Value    := '%' + dbe_busca.Text + '%';
      aq_Busca.Parameters[0].DataType := ftString;
    end;
  end
  else
    aq_Busca.SQL.Text := sSQLSemFiltro;
  aq_Busca.Open;
end;

procedure Tfbuscapadrao.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfbuscapadrao.btn_selecionarClick(Sender: TObject);
begin
  sCodRetorno := Query.FieldByName(sNameFieldRetorno).AsString;
end;

procedure Tfbuscapadrao.SetCodigoRetorno(const Value: String);
begin
  sCodRetorno := Value;
end;

procedure Tfbuscapadrao.setDescRetorno(const Value: String);
begin
  sDescRetorno := Value;
end;

procedure Tfbuscapadrao.SetNameFieldRetorno(const Value: String);
begin
  sNameFieldRetorno := Value;
end;

procedure Tfbuscapadrao.SetQuery(const Value: TADOQuery);
begin
  if aq_Busca <> Value then
    aq_Busca  := Value;
  src.DataSet := aq_Busca;
end;

procedure Tfbuscapadrao.SetSQLCodigo(const Value: String);
begin
  sSQLCod := Value;
end;

procedure Tfbuscapadrao.SetSQLDesc(const Value: String);
begin
  sSQLDesc := Value;
end;

procedure Tfbuscapadrao.SetSQLSemFiltro(const Value: String);
begin
  sSQLSemFiltro := Value;
end;

procedure Tfbuscapadrao.SetTipoBusca(const Value: String);
begin
  sTipoBusca := Value;
end;

end.
