unit ureclientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.DBActns, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, System.UITypes,
  RLReport, Data.Win.ADODB;

type
  Tfrelclientes = class(TForm)
    rl_cliente: TRLReport;
    aq_cliente: TADOQuery;
    aq_clienteCLI_COD: TIntegerField;
    aq_clienteCLI_NOME: TStringField;
    aq_clienteCLI_CPF: TStringField;
    aq_clienteCLI_DTNASC: TDateField;
    aq_clienteSITUACAO: TStringField;
    src_cliente: TDataSource;
    RLBand1: TRLBand;
    RLLabelClientes: TRLLabel;
    RLBand2: TRLBand;
    rl_codigo: TRLLabel;
    rl_dtnasc: TRLLabel;
    RLLabelStatus: TRLLabel;
    RLLabelDataHora: TRLLabel;
    rd_clicod: TRLDBText;
    RLDBTextCliente: TRLDBText;
    rd_situacao: TRLDBText;
    rd_cpf: TRLDBText;
    rd_clidesc: TRLDBText;
  private
  public
  end;

var
  frelclientes: Tfrelclientes;

implementation

{$R *.dfm}

uses udmconexao;

end.
