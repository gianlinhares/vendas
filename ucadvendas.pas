unit ucadvendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucadastropadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.ComCtrls;

type
  Tfcadvendas = class(Tfcadastropadrao)
    lbl_numero: TLabel;
    dbt_numero: TDBText;
    lbl_datahora: TLabel;
    lbl_fornec: TLabel;
    lbl_status: TLabel;
    shp_prod: TShape;
    lbl_produto: TLabel;
    lbl_vltot: TLabel;
    dbt_status: TDBText;
    dbt_cli_desc: TDBText;
    dtp_datahora: TDateTimePicker;
    dbe_datahora: TDBEdit;
    dbe_cli_cod: TDBEdit;
    dbe_vltot: TDBEdit;
    dbn_produtos: TDBNavigator;
    dbg_produtos: TDBGrid;
    btn_efetivar: TButton;
    src_venda_produto: TDataSource;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbg_produtosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbg_produtosEditButtonClick(Sender: TObject);
    procedure btn_efetivarClick(Sender: TObject);
    procedure btn_pesqClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbn_cadBeforeAction(Sender: TObject; Button: TNavigateBtn);
  private
    procedure TestaExistenciaProdutos;
    procedure ControlaEdicaoBotoes(bHabilita: boolean);
  public
    { Public declarations }
  end;

var
  fcadvendas: Tfcadvendas;

implementation

{$R *.dfm}

uses udmconexao;

procedure Tfcadvendas.btn_efetivarClick(Sender: TObject);
begin
  inherited;
  if dmconexao.aq_venda.IsEmpty then
    dmconexao.InsereExibeMsg('Selecione uma venda primeiro.');
  if (dmconexao.aq_venda.State in dsEditmodes) or (dmconexao.aq_venda_produto.State in dsEditModes) then
    dmconexao.InsereExibeMsg('Grave a venda primeiro para continuar.');

  TestaExistenciaProdutos;
  if MessageDlg('Deseja efetivar a venda? Ao efetivá-la, não será mais possível alterar ou excluir a mesma. ' +
                 'Continuar?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    dmconexao.aq_venda.Edit;
    dmconexao.aq_vendaVEN_STATUS.AsString := 'E';
    dmconexao.aq_venda.Post;
  end;
end;

procedure Tfcadvendas.btn_pesqClick(Sender: TObject);
var
  sCodVenda : string;
begin
  TestaExistenciaProdutos;

  inherited;

  sCodVenda := dmconexao.RetornaBusca('V');
  src_cad.DataSet.Refresh;

  if dmconexao.aq_venda_produto.Active then
    dmconexao.aq_venda_produto.Close;
  dmconexao.aq_venda_produto.Parameters.ParamByName('VENDA').Value := sCodVenda;
  dmconexao.aq_venda_produto.Open;
end;

procedure Tfcadvendas.btn_sairClick(Sender: TObject);
begin
  TestaExistenciaProdutos;
  inherited;

end;

procedure Tfcadvendas.ControlaEdicaoBotoes(bHabilita: boolean);
var
  i : integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
      TDBEdit(Components[i]).Enabled := bHabilita;
    if Components[i] is TDBNavigator then
      TDBNavigator(Components[i]).Enabled := bHabilita;
  end;
end;

procedure Tfcadvendas.dbg_produtosEditButtonClick(Sender: TObject);
var
  sCodProd : string;
begin
  inherited;
  if dbg_produtos.SelectedField.FieldName = 'VPR_PROCOD' then
  begin
    sCodProd := dmconexao.RetornaBusca('P', true);
    if Trim(sCodProd) <> '' then
    begin
      if not(dmconexao.aq_venda_produto.State in dsEditModes) then
        dmconexao.aq_venda_produto.Edit;
      dmconexao.aq_venda_produtoVPR_PROCOD.AsString := sCodProd;
    end;
  end;
end;

procedure Tfcadvendas.dbg_produtosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
     dbg_produtosEditButtonClick(Sender);
end;

procedure Tfcadvendas.dbn_cadBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
   if Button = nbPost then
   begin
    if dmconexao.aq_venda_produto.State in dsEditModes then
      dmconexao.aq_venda_produto.Post;
    TestaExistenciaProdutos;
  end;
end;

procedure Tfcadvendas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sCodCli : string;
begin
  inherited;

  if Key = VK_F5 then
  begin
    if dbe_cli_cod.Focused then
    begin
      sCodCli := dmconexao.RetornaBusca('C', true);
      if Trim(sCodCli) <> '' then
      begin
        if not(dmconexao.aq_venda.State in dsEditModes) then
          dmconexao.aq_venda.Edit;
        dmconexao.aq_vendaVEN_CLICOD.AsString := sCodCli;
      end;
    end;
  end;

end;

procedure Tfcadvendas.TestaExistenciaProdutos;
begin
  if (not(dmconexao.aq_vendaVEN_NUMERO.IsNull)) and (dmconexao.aq_venda_produto.IsEmpty) then
    dmconexao.InsereExibeMsg('A venda deve possuir pelo menos 1 produto');
end;

end.
