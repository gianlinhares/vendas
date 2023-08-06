unit ucadvendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBActns,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
  Vcl.ToolWin, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons,  System.UITypes, data.Win.ADODB,
  Datasnap.DBClient;

type
  Tfcadvendas = class(Tform)
    dbn_vendas: TDBNavigator;
    btn_pesquisa: TButton;
    src_venda: TDataSource;
    lbl_numero: TLabel;
    dbt_numero: TDBText;
    lbl_datahora: TLabel;
    dbe_datahora: TDBEdit;
    lbl_fornec: TLabel;
    dbe_cli_cod: TDBEdit;
    lbl_status: TLabel;
    shp_prod: TShape;
    lbl_produto: TLabel;
    lbl_vltot: TLabel;
    dbe_vltot: TDBEdit;
    dbn_produtos: TDBNavigator;
    dbg_produtos: TDBGrid;
    src_venda_produto: TDataSource;
    dtp_datahora: TDateTimePicker;
    lbl_cli_desc: TLabel;
    cds_produto: TClientDataSet;
    cds_produtoVPR_COD: TIntegerField;
    cds_produtoVPR_NUMVENDA: TIntegerField;
    cds_produtoVPR_PROCOD: TIntegerField;
    cds_produtoVPR_QTDVENDIDA: TFloatField;
    cds_produtoVPR_VLRTOTPROD: TFloatField;
    cds_produtoPRO_DESC: TStringField;
    cds_produtoPRO_PRECO: TFloatField;
    btn_sair: TButton;
    btn_efetivar: TButton;
    dbt_status: TDBText;
    aq_venda_produto: TADOQuery;
    aq_venda_produtoVPR_COD: TIntegerField;
    aq_venda_produtoVPR_NUMVENDA: TIntegerField;
    aq_venda_produtoVPR_PROCOD: TIntegerField;
    aq_venda_produtoVPR_QTDVENDIDA: TBCDField;
    aq_venda_produtoVPR_VLRTOTPROD: TBCDField;
    aq_venda_produtoPRO_DESC: TStringField;
    aq_venda_produtoPRO_PRECO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbn_vendasBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure dbn_vendasClick(Sender: TObject; Button: TNavigateBtn);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_pesquisaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dtp_datahoraChange(Sender: TObject);
    procedure dbg_produtosEditButtonClick(Sender: TObject);
    procedure dbe_cli_codExit(Sender: TObject);
    procedure cds_produtoVPR_PROCODValidate(Sender: TField);
    procedure cds_produtoVPR_QTDVENDIDAValidate(Sender: TField);
    procedure cds_produtoBeforePost(DataSet: TDataSet);
    procedure cds_produtoNewRecord(DataSet: TDataSet);
    procedure cds_produtoAfterPost(DataSet: TDataSet);
    procedure cds_produtoBeforeDelete(DataSet: TDataSet);
    procedure dbn_produtosBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure btn_efetivarClick(Sender: TObject);
    procedure src_vendaDataChange(Sender: TObject; Field: TField);
    procedure src_vendaStateChange(Sender: TObject);
    procedure dbg_produtosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    iCodVenda : integer;
    bInsercaoEdicao : boolean;
    procedure Abre(iCodigo : integer);
    procedure RetornaDescricaoCliente;
    procedure VerificaProdutoCadastrado;
    procedure TestaExistenciaProdutos;
    procedure ControlaEdicaoBotoes(bHabilita: boolean);
  public
    property CodigoVenda : integer read iCodVenda write iCodVenda;
    property InsereOuEdita : boolean read bInsercaoEdicao write bInsercaoEdicao;
  end;

var
  fcadvendas: Tfcadvendas;

implementation

{$R *.dfm}

uses udmconexao;

{ Tfcadvendas }

procedure Tfcadvendas.Abre(iCodigo: integer);
begin
  if dmconexao.aq_venda.Active then
    dmconexao.aq_venda.Close;
  dmconexao.aq_venda.Parameters.ParamByName('VENDA').Value := iCodigo;
  dmconexao.aq_venda.Open;

  RetornaDescricaoCliente;

  if aq_venda_produto.Active then
    aq_venda_produto.Close;
  aq_venda_produto.Parameters.ParamByName('VENDA').Value := iCodigo;
  aq_venda_produto.Open;

  if not(aq_venda_produto.IsEmpty) then
  begin
    cds_produto.Tag := 1;
    try
      aq_venda_produto.First;
      while not(aq_venda_produto.Eof) do
      begin
        cds_produto.Append;
        cds_produtoVPR_COD.AsInteger      := aq_venda_produtoVPR_COD.AsInteger;
        cds_produtoVPR_NUMVENDA.AsInteger := aq_venda_produtoVPR_NUMVENDA.AsInteger;
        cds_produtoVPR_PROCOD.AsInteger   := aq_venda_produtoVPR_PROCOD.AsInteger;
        cds_produtoVPR_QTDVENDIDA.AsFloat := aq_venda_produtoVPR_QTDVENDIDA.AsFloat;
        cds_produtoVPR_VLRTOTPROD.AsFloat := aq_venda_produtoVPR_VLRTOTPROD.AsFloat;
        cds_produto.Post;
        aq_venda_produto.Next;
      end;
    finally
      cds_produto.Tag := 0;
    end;
  end;
end;

procedure Tfcadvendas.btn_efetivarClick(Sender: TObject);
begin
  if dmconexao.aq_venda.IsEmpty then
    dmconexao.InsereExibeMsg('Selecione uma venda primeiro.');
  if (dmconexao.aq_venda.State in dsEditmodes) or (cds_produto.State in dsEditModes) then
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

procedure Tfcadvendas.btn_pesquisaClick(Sender: TObject);
var
  sCodVenda : string;
begin
  TestaExistenciaProdutos;

  sCodVenda := dmconexao.RetornaBusca('V');
  if Trim(sCodVenda) <> '' then
    Abre(StrToIntDef(sCodVenda, 0));
end;

procedure Tfcadvendas.btn_sairClick(Sender: TObject);
begin
  TestaExistenciaProdutos;
  Close;
end;

procedure Tfcadvendas.cds_produtoAfterPost(DataSet: TDataSet);
begin
  if cds_produto.Tag = 0 then
  begin
    if dmconexao.aq_venda_produto.Active then
      dmconexao.aq_venda_produto.Close;
    dmconexao.aq_venda_produto.Parameters.ParamByName('CODIGO').Value := cds_produtoVPR_COD.AsInteger;
    dmconexao.aq_venda_produto.Open;

    if dmconexao.aq_venda_produto.IsEmpty then
      dmconexao.aq_venda_produto.Append
    else
      dmconexao.aq_venda_produto.Edit;
    dmconexao.aq_venda_produtoVPR_COD.AsInteger      := cds_produtoVPR_COD.AsInteger;
    dmconexao.aq_venda_produtoVPR_NUMVENDA.AsInteger :=cds_produtoVPR_NUMVENDA.AsInteger;
    dmconexao.aq_venda_produtoVPR_PROCOD.AsInteger   := cds_produtoVPR_PROCOD.AsInteger;
    dmconexao.aq_venda_produtoVPR_QTDVENDIDA.AsFloat := cds_produtoVPR_QTDVENDIDA.AsFloat;
    dmconexao.aq_venda_produtoVPR_VLRTOTPROD.AsFloat := cds_produtoVPR_VLRTOTPROD.AsFloat;
    dmconexao.aq_venda_produto.Post;
  end;
end;

procedure Tfcadvendas.cds_produtoBeforeDelete(DataSet: TDataSet);
begin
  if dmconexao.aq_venda_produto.Active then
    dmconexao.aq_venda_produto.Close;
  dmconexao.aq_venda_produto.Parameters.ParamByName('CODIGO').Value := cds_produtoVPR_COD.AsInteger;
  dmconexao.aq_venda_produto.Open;

  dmconexao.aq_venda_produto.Delete;
end;

procedure Tfcadvendas.VerificaProdutoCadastrado;
var
  aq_proven : TADOQuery;
begin
  if Trim(cds_produtoVPR_COD.AsString) <> '' then
  begin
    aq_proven := TADOQuery.Create(nil);
    try
      aq_proven.Connection := dmconexao.ac_connec;
      aq_proven.SQL.Add('SELECT VPR_COD ' +
                        'FROM VENDAS_PRODUTOS ' +
                        'WHERE VPR_NUMVENDA = ' + cds_produtoVPR_NUMVENDA.AsString + ' ' +
                        'AND VPR_PROCOD = ' + cds_produtoVPR_PROCOD.AsString + ' ' +
                        'AND VPR_COD <> ' + cds_produtoVPR_COD.AsString);
      aq_proven.Open;
      if not(aq_proven.IsEmpty) then
        dmconexao.InsereExibeMsg('O produto já está cadastrado');
    finally
      aq_proven.Free;
    end;
  end;
end;

procedure Tfcadvendas.cds_produtoBeforePost(DataSet: TDataSet);
begin
  if cds_produto.Tag = 0 then
  begin
    if Trim(cds_produtoVPR_PROCOD.AsString) = '' then
      dmconexao.InsereExibeMsg('Informe o produto');

    VerificaProdutoCadastrado;

    if cds_produtoVPR_COD.AsInteger = 0 then
      cds_produtoVPR_COD.AsInteger := dmconexao.RetornaSequencial('VPR_COD', 'VENDAS_PRODUTOS');

    dmconexao.aq_venda.Edit;
  end;
end;

procedure Tfcadvendas.cds_produtoNewRecord(DataSet: TDataSet);
begin
  if dmconexao.aq_vendaVEN_NUMERO.IsNull then
  begin
    cds_produto.CancelUpdates;
    dmconexao.InsereExibeMsg('Grave a venda primeiro');
  end;

  cds_produtoVPR_NUMVENDA.AsInteger := dmconexao.aq_vendaVEN_NUMERO.AsInteger;
end;

procedure Tfcadvendas.cds_produtoVPR_PROCODValidate(Sender: TField);
var
  aq_pro : TADOQuery;
begin
  if Trim(Sender.AsString) <> '' then
  begin
    if cds_produto.Tag =  0then
      VerificaProdutoCadastrado;

    aq_pro := TADOQuery.Create(nil);
    try
      aq_pro.Connection := dmconexao.ac_connec;
      aq_pro.SQL.Add(dmconexao.GetSQLProdutos(Sender.AsString, true));
      aq_pro.Open;
      if not(aq_pro.IsEmpty) then
      begin
        cds_produtoPRO_DESC.AsString := aq_pro.FieldByName('PRO_DESC').AsString;
        cds_produtoPRO_PRECO.AsFloat := aq_pro.FieldByName('PRO_PRECO').AsFloat;
      end
      else
        dmconexao.InsereExibeMsg('Produto inválido ou inexistente');
    finally
      aq_pro.Free;
    end;
  end
  else
  begin
    cds_produtoPRO_DESC.Clear;
    cds_produtoPRO_PRECO.Clear;
  end;
end;

procedure Tfcadvendas.cds_produtoVPR_QTDVENDIDAValidate(Sender: TField);
begin
  if Trim(Sender.AsString) <> '' then
  begin
    if Sender.AsFloat <= 0 then
      dmconexao.InsereExibeMsg('A quantidade vendida deve ser maior que 0');
    cds_produtoVPR_VLRTOTPROD.AsFloat := cds_produtoPRO_PRECO.AsFloat * Sender.AsFloat;
  end;
end;

procedure Tfcadvendas.RetornaDescricaoCliente;
var
  aq_cli : TADOQuery;
begin
  if Trim(dmconexao.aq_vendaVEN_CLICOD.AsString) <> '' then
  begin
    aq_cli := TADOQuery.Create(nil);
    try
      aq_cli.Connection := dmconexao.ac_connec;
      aq_cli.SQL.Add(dmconexao.GetSQLClientes(dmconexao.aq_vendaVEN_CLICOD.AsString, true));
      aq_cli.Open;
      if not(aq_cli.IsEmpty) then
        lbl_cli_desc.Caption := aq_cli.FieldByName('CLI_NOME').AsString
      else
        dmconexao.InsereExibeMsg('Cliente ínválido ou não cadastrado');
    finally
      aq_cli.Free;
    end;
  end
  else
    lbl_cli_desc.Caption := '';
end;

procedure Tfcadvendas.src_vendaDataChange(Sender: TObject; Field: TField);
begin
  ControlaEdicaoBotoes((dmconexao.aq_venda.State = dsInsert) or
                       (dmconexao.aq_vendaVEN_STATUS.AsString = 'P'));
end;

procedure Tfcadvendas.src_vendaStateChange(Sender: TObject);
begin
  ControlaEdicaoBotoes((dmconexao.aq_venda.State = dsInsert) or
                       (dmconexao.aq_vendaVEN_STATUS.AsString = 'P'));
end;

procedure Tfcadvendas.ControlaEdicaoBotoes(bHabilita : boolean);
begin
  dbn_vendas.Enabled := bHabilita;
  dbe_datahora.Enabled := bHabilita;
  dtp_datahora.Enabled := bHabilita;
  dbe_cli_cod.Enabled  := bHabilita;
  dbe_vltot.Enabled    := bHabilita;
  dbn_produtos.Enabled := bHabilita;
  if bHabilita then
    dbg_produtos.Options := dbg_produtos.Options - [dgRowSelect] + [dgEditing]
  else
    dbg_produtos.Options := dbg_produtos.Options + [dgRowSelect];
end;

procedure Tfcadvendas.dbe_cli_codExit(Sender: TObject);
begin
  RetornaDescricaoCliente;
end;

procedure Tfcadvendas.dbg_produtosEditButtonClick(Sender: TObject);
var
  sCodProd : string;
begin
  if dbg_produtos.SelectedField.FieldName = 'VPR_PROCOD' then
  begin
    sCodProd := dmconexao.RetornaBusca('P', true);
    if Trim(sCodProd) <> '' then
    begin
      if not(cds_produto.State in dsEditModes) then
        cds_produto.Edit;
      cds_produtoVPR_PROCOD.AsString := sCodProd;
    end;
  end;
end;

procedure Tfcadvendas.dbg_produtosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
     dbg_produtosEditButtonClick(Sender);
end;

procedure Tfcadvendas.dbn_produtosBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if button = nbDelete then
  begin
    if not(cds_produto.IsEmpty) then
    begin
      if MessageDlg('Deseja deletar o registro selecionado?',
                    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      begin
        cds_produto.Delete;
        abort;
      end;
    end;
  end;
end;

procedure Tfcadvendas.dbn_vendasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  case Button of
    nbDelete:
    begin
      if not(dmconexao.aq_venda.IsEmpty) then
      begin
        if MessageDlg('Deseja deletar o registro selecionado?',
                      mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
          if not(cds_produto.IsEmpty) then
          begin
            cds_produto.First;
            while not(cds_produto.Eof) do
              cds_produto.Delete;
          end;
          dmconexao.aq_venda.Delete;
          abort;
        end;
      end;
    end;
    nbPost:
    begin
      if cds_produto.State in dsEditModes then
        cds_produto.Post;
      TestaExistenciaProdutos;
    end;
  end;
end;

procedure Tfcadvendas.TestaExistenciaProdutos;
begin
  if (not(dmconexao.aq_vendaVEN_NUMERO.IsNull)) and (cds_produto.IsEmpty) then
    dmconexao.InsereExibeMsg('A venda deve possuir pelo menos 1 produto');
end;

procedure Tfcadvendas.dbn_vendasClick(Sender: TObject; Button: TNavigateBtn);
begin
  case Button of
    nbCancel: Abre(dmconexao.aq_produtoPRO_COD.AsInteger);
    nbInsert: Abre(0);
  end;
end;

procedure Tfcadvendas.dtp_datahoraChange(Sender: TObject);
begin
  if not(dmconexao.aq_venda.State in dsEditModes) then
    dmconexao.aq_venda.Edit;
  dmconexao.aq_vendaVEN_DATAHORA.AsDateTime := dtp_datahora.DateTime;
end;

procedure Tfcadvendas.FormCreate(Sender: TObject);
begin
  iCodVenda       := 0;
  bInsercaoEdicao := false;
end;

procedure Tfcadvendas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sCodCli : string;
begin
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
        dbe_cli_codExit(dbe_cli_cod);
      end;
    end;
  end;
end;

procedure Tfcadvendas.FormShow(Sender: TObject);
begin
  if iCodVenda <> 0 then
  begin
    Abre(iCodVenda);
    if bInsercaoEdicao then
      dmconexao.aq_venda.Edit;
  end
  else
  begin
    Abre(0);
    if bInsercaoEdicao then
      dmconexao.aq_venda.Append;
  end;
end;

end.
