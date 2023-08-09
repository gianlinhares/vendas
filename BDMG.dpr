program BDMG;

uses
  Vcl.Forms,
  umenuprincipal in 'umenuprincipal.pas' {fmenuprincipal},
  ucadastropadrao in 'ucadastropadrao.pas' {fcadastropadrao},
  ucadclientes in 'ucadclientes.pas' {fcadclientes},
  udmconexao in 'udmconexao.pas' {dmconexao: TDataModule},
  ubuscapadrao in 'ubuscapadrao.pas' {fbuscapadrao},
  ucadfornecedores in 'ucadfornecedores.pas' {fcadfornecedores},
  ucadprodutos in 'ucadprodutos.pas' {fcadprodutos},
  ucadvendas in 'ucadvendas.pas' {fcadvendas},
  ubscclientes in 'ubscclientes.pas' {fbscclientes},
  ubscfornecedores in 'ubscfornecedores.pas' {fbscfornecedores},
  ubscvendas in 'ubscvendas.pas' {fbscvendas},
  ubscprodutos in 'ubscprodutos.pas' {fbscprodutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfmenuprincipal, fmenuprincipal);
  Application.CreateForm(Tfcadastropadrao, fcadastropadrao);
  Application.CreateForm(Tfcadclientes, fcadclientes);
  Application.CreateForm(Tdmconexao, dmconexao);
  Application.CreateForm(Tfbuscapadrao, fbuscapadrao);
  Application.CreateForm(Tfcadfornecedores, fcadfornecedores);
  Application.CreateForm(Tfcadprodutos, fcadprodutos);
  Application.CreateForm(Tfcadvendas, fcadvendas);
  Application.CreateForm(Tfbscclientes, fbscclientes);
  Application.CreateForm(Tfbscfornecedores, fbscfornecedores);
  Application.CreateForm(Tfbscvendas, fbscvendas);
  Application.CreateForm(Tfbscprodutos, fbscprodutos);
  Application.Run;
end.
