program Project1;

uses
  Vcl.Forms,
  FormPrincipal in 'FormPrincipal.pas' {TelaPrincipal},
  FormClientes in 'FormClientes.pas' {TelaCadClientes},
  FormProdutos in 'FormProdutos.pas' {TelaCadProdutos},
  FormVendas in 'FormVendas.pas' {TelaVenda},
  FormConsultaClientes in 'FormConsultaClientes.pas' {TelaConsultaCliente},
  FormConsultaProdutos in 'FormConsultaProdutos.pas' {TelaConsultaProduto},
  FormConsultaVendas in 'FormConsultaVendas.pas' {TelaConsultaVendas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  Application.CreateForm(TTelaCadClientes, TelaCadClientes);
  Application.CreateForm(TTelaCadProdutos, TelaCadProdutos);
  Application.CreateForm(TTelaVenda, TelaVenda);
  Application.CreateForm(TTelaConsultaVendas, TelaConsultaVendas);
  Application.Run;
end.
