unit FormConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait;

type
  TTelaConsultaCliente = class(TForm)
    DBGrid1: TDBGrid;
    FDQueryClientes: TFDQuery;
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaConsultaCliente: TTelaConsultaCliente;

implementation

{$R *.dfm}

procedure TTelaConsultaCliente.DBGrid1DblClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

procedure TTelaConsultaCliente.FormShow(Sender: TObject);
begin
  FDQueryClientes.Open;
end;

end.
