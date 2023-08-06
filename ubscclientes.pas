unit ubscclientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.DBActns, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, Data.Win.ADODB, Vcl.Buttons;

type
  Tfbscclientes = class(TForm)
    btn_cliente: TButton;
    shp_fim: TShape;
    dbg_clientes: TDBGrid;
    lbl_codigo: TLabel;
    lbl_nome: TLabel;
    shp_result: TShape;
    lbl_cpf: TLabel;
    lbl_pernasc: TLabel;
    lbl_a: TLabel;
    rdg_atiina: TRadioGroup;
    lbl_result: TLabel;
    btn_pesquisar: TButton;
    aq_cliente: TADOQuery;
    aq_clienteCLI_COD: TIntegerField;
    aq_clienteCLI_NOME: TStringField;
    aq_clienteCLI_CPF: TStringField;
    aq_clienteCLI_DTNASC: TDateField;
    src_clibusca: TDataSource;
    dbe_dtnasc_ini: TMaskEdit;
    dbe_dtnasc_fim: TMaskEdit;
    aq_clienteSITUACAO: TStringField;
    btn_editar: TButton;
    dbe_codigo: TEdit;
    dbe_nome: TEdit;
    dbe_cpf: TMaskEdit;
    btn_sair: TBitBtn;
    btn_limpar: TBitBtn;
    btn_selecionar: TBitBtn;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_clienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure btn_selecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_clientesDblClick(Sender: TObject);
  private
    sSQL : string;
    iCodCliente : integer;
    bSomenteAtivos : boolean;
    procedure Pesquisar;
    procedure AbreCadastroCliente(iCodigo : integer);
    procedure Selecionar;
  public
    property CodigoCliente : integer read iCodCliente write iCodCliente;
    property SomenteAtivos : boolean read bSomenteAtivos write bSomenteAtivos;
  end;

var
  fbscclientes: Tfbscclientes;

implementation

{$R *.dfm}

uses ucadclientes, udmconexao;

procedure Tfbscclientes.AbreCadastroCliente(iCodigo : integer);
var
  fCadClientes : Tfcadclientes;
begin
  fCadClientes := Tfcadclientes.Create(Self);
  try
    fCadClientes.Position      := poScreenCenter;
    fCadClientes.InsereOuEdita := true;
    if iCodigo <> 0 then
      fCadClientes.CodigoCliente := iCodigo;
    fCadClientes.ShowModal;
  finally
    fCadClientes.Free;
  end;
end;

procedure Tfbscclientes.btn_clienteClick(Sender: TObject);
begin
  AbreCadastroCliente(0);
end;

procedure Tfbscclientes.btn_editarClick(Sender: TObject);
begin
  AbreCadastroCliente(aq_clienteCLI_COD.AsInteger);
end;

procedure Tfbscclientes.btn_limparClick(Sender: TObject);
begin
  dbe_codigo.Clear;
  dbe_nome.Clear;
  dbe_cpf.Clear;
  dbe_dtnasc_ini.Clear;
  dbe_dtnasc_fim.Clear;
  if not(bSomenteAtivos) then
    rdg_atiina.ItemIndex := 2;
  aq_cliente.Close;
  ModalResult := mrNone;
end;

procedure Tfbscclientes.btn_pesquisarClick(Sender: TObject);
begin
  if ((Trim(dbe_dtnasc_ini.Text) <> '/  /') and (Trim(dbe_dtnasc_fim.Text) = '/  /'))  or
     ((Trim(dbe_dtnasc_ini.Text) = '/  /') and (Trim(dbe_dtnasc_fim.Text) <> '/  /')) then
  begin
    dbe_dtnasc_ini.SetFocus;
    dmconexao.InsereExibeMsg('Deve ser informado todo o período de nascimento');
  end;

  Pesquisar;

  btn_editar.Enabled := not(aq_cliente.IsEmpty);
  if not(aq_cliente.IsEmpty) then
    dbg_clientes.SetFocus;
end;

procedure Tfbscclientes.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfbscclientes.Selecionar;
begin
  if not(aq_cliente.IsEmpty) then
    iCodCliente := aq_clienteCLI_COD.AsInteger
  else
    ModalResult := mrNone;
end;

procedure Tfbscclientes.btn_selecionarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure Tfbscclientes.dbg_clientesDblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure Tfbscclientes.FormCreate(Sender: TObject);
begin
  sSQL           := '';
  bSomenteAtivos := false;
end;

procedure Tfbscclientes.FormShow(Sender: TObject);
begin
  if bSomenteAtivos then
  begin
    rdg_atiina.ItemIndex := 0;
    rdg_atiina.Enabled   := false;
  end;
end;

procedure Tfbscclientes.Pesquisar;
var
  sSQL_Pesquisa, sDataIni, sDataFim : string;
begin
   if Trim(sSQL) = '' then
    sSQL := aq_cliente.SQL.Text;
  sSQL_Pesquisa := sSQL + ' WHERE CLI_COD IS NOT NULL';
  if Trim(dbe_codigo.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND CLI_COD = ' + dbe_codigo.Text;
  if Trim(dbe_nome.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND CLI_NOME ' + dmconexao.GetLikeSQL(dbe_nome.Text);
  if Trim(dbe_cpf.Text) <> '' then
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND CLI_CPF ' + dmconexao.GetLikeSQL(dbe_cpf.Text);
  if (Trim(dbe_dtnasc_ini.Text) <> '/  /') and (Trim(dbe_dtnasc_fim.Text) <> '/  /') then
  begin
    sDataIni := dbe_dtnasc_ini.Text;
    sDataFim := dbe_dtnasc_fim.Text;
    sSQL_Pesquisa := sSQL_Pesquisa + ' AND CLI_DTNASC BETWEEN ' + sDataIni.QuotedString + ' AND ' +
                                                                  sDataFim.QuotedString;
  end;
  case rdg_atiina.ItemIndex of
    0 : sSQL_Pesquisa := sSQL_Pesquisa + ' AND CLI_ATIINA = ''A''';
    1 : sSQL_Pesquisa := sSQL_Pesquisa + ' AND CLI_ATIINA = ''I''';
  end;

  if aq_cliente.Active then
    aq_cliente.Close;
  aq_cliente.SQL.Clear;
  aq_cliente.SQL.Add(sSQL_Pesquisa);
  aq_cliente.Open;
end;

end.
