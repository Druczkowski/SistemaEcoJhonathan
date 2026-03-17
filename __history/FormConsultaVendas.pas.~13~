unit FormConsultaVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TTelaConsultaVendas = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    FDQueryVendas: TFDQuery;
    FDConnection1: TFDConnection;
    FDQueryItens: TFDQuery;
    FDConnection2: TFDConnection;
    DataSourceVendas: TDataSource;
    DataSourceItens: TDataSource;
    FDQueryVendasID: TIntegerField;
    FDQueryVendasDATA: TDateField;
    FDQueryVendasCLIENTE: TStringField;
    FDQueryVendasVALOR_TOTAL: TFMTBCDField;
    FDQueryItensID: TIntegerField;
    FDQueryItensVENDA_ID: TIntegerField;
    FDQueryItensPRODUTO: TStringField;
    FDQueryItensQUANTIDADE: TFMTBCDField;
    FDQueryItensPRECO: TFMTBCDField;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaConsultaVendas: TTelaConsultaVendas;

implementation

{$R *.dfm}

procedure TTelaConsultaVendas.DBGrid1CellClick(Column: TColumn);
begin
  FDQueryItens.Close;
  FDQueryItens.ParamByName('ID_VENDA').AsInteger :=
    FDQueryVendas.FieldByName('ID').AsInteger;
  FDQueryItens.Open;
end;

procedure TTelaConsultaVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TTelaConsultaVendas.FormShow(Sender: TObject);
begin
  DBGrid1.Columns[2].Width := 150;
  DBGrid2.Columns[2].Width := 150;
  FDQueryVendas.Open;
end;

end.
