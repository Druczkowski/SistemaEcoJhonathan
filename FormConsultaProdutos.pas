unit FormConsultaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TTelaConsultaProduto = class(TForm)
    FDConnection1: TFDConnection;
    FDQueryProdutos: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDQueryProdutosID: TIntegerField;
    FDQueryProdutosDESCRICAO: TStringField;
    FDQueryProdutosPRECO_VENDA: TFMTBCDField;
    FDQueryProdutosUNIDADE: TStringField;
    Label1: TLabel;
    EditConsultaProduto: TEdit;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditConsultaProdutoChange(Sender: TObject);
  private
    { Private declarations }
  public
    PermitirEdicao: Boolean;
  end;

var
  TelaConsultaProduto: TTelaConsultaProduto;

implementation

{$R *.dfm}

procedure TTelaConsultaProduto.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TTelaConsultaProduto.EditConsultaProdutoChange(Sender: TObject);
begin
  FDQueryProdutos.Close;
  FDQueryProdutos.SQL.Text :=
    'SELECT * FROM PRODUTOS WHERE DESCRICAO LIKE :DESCRICAO';

  FDQueryProdutos.ParamByName('DESCRICAO').AsString :=
    '%' + EditConsultaProduto.Text + '%';

  FDQueryProdutos.Open;
end;

procedure TTelaConsultaProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TTelaConsultaProduto.FormShow(Sender: TObject);
begin
  FDQueryProdutos.Open;
  DBGrid1.Columns[1].Width := 150;
  DBGrid1.ReadOnly := not PermitirEdicao;
end;

end.
