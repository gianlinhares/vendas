program BDMG;

uses
  System.StartUpCopy,
  FMX.Forms,
  umenuprincipal in 'umenuprincipal.pas', {fmenuprincipal}
  ucadclientes in 'ucadclientes.pas' {fcadclientes},
  ucadfornecedores in 'ucadfornecedores.pas' {fcadfornecedores},
  ucadprodutos in 'ucadprodutos.pas' {fcadprodutos},
  ubscclientes in 'ubscclientes.pas' {fbscclientes},
  ubscfornecedores in 'ubscfornecedores.pas' {fbscfornecedores},
  ubsprodutos in 'ubsprodutos.pas' {fbscprodutos},
  udmconexao in 'udmconexao.pas' {dmconexao: TDataModule},
  ubscvendas in 'ubscvendas.pas' {fbscvendas},
  ucadvendas in 'ucadvendas.pas' {fcadvendas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfmenuprincipal, fmenuprincipal);
  Application.CreateForm(Tfcadclientes, fcadclientes);
  Application.CreateForm(Tfcadfornecedores, fcadfornecedores);
  Application.CreateForm(Tfcadprodutos, fcadprodutos);
  Application.CreateForm(Tfbscclientes, fbscclientes);
  Application.CreateForm(Tfbscfornecedores, fbscfornecedores);
  Application.CreateForm(Tfbscprodutos, fbscprodutos);
  Application.CreateForm(Tdmconexao, dmconexao);
  Application.CreateForm(Tfbscvendas, fbscvendas);
  Application.CreateForm(Tfcadvendas, fcadvendas);

  Application.Run;
end.
