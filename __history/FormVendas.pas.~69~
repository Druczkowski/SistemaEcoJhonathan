unit FormVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait;

type
  TTelaVenda = class(TForm)
    GridItens: TStringGrid;
    ButtonAdicionarItem: TButton;
    ButtonSalvarVenda: TButton;
    ButtonFecharVenda: TButton;
    EditCliente: TEdit;
    EditProduto: TEdit;
    EditQtdade: TEdit;
    EditTotalVenda: TEdit;
    EditPreco: TEdit;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    Label1: TLabel;
    Label2: TLabel;
    ButtonRemoverItem: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditClienteID: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ButtonAdicionarItemClick(Sender: TObject);
    procedure ButtonSalvarVendaClick(Sender: TObject);
    procedure EditClienteExit(Sender: TObject);
    procedure EditProdutoExit(Sender: TObject);
    procedure EditClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonFecharVendaClick(Sender: TObject);
    procedure ButtonRemoverItemClick(Sender: TObject);
    procedure EditClienteIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure CalcularTotal;
    procedure ConsultarCliente;
    procedure LimparTela;
  public
    { Public declarations }
  end;

var
  TelaVenda: TTelaVenda;

implementation

{$R *.dfm}


uses FormConsultaClientes, FormConsultaProdutos, FormConsultaVendas;

procedure TTelaVenda.CalcularTotal;
var
  i : Integer;
  Total : Double;
begin

  Total := 0;

  for i := 1 to GridItens.RowCount - 1 do
  begin
    Total := Total + StrToFloat(GridItens.Cells[4,i]);
  end;

  EditTotalVenda.Text := FormatFloat('0.00', Total);

end;

procedure TTelaVenda.ConsultarCliente;

begin

  EditCliente.Clear;
  EditClienteID.Clear;

  TelaConsultaCliente  := TTelaConsultaCliente.Create(nil);
  TelaConsultaCliente.PermitirEdicao := False;

  try
    if TelaConsultaCliente.ShowModal = mrOk then
    begin
      EditCliente.Text :=
      TelaConsultaCliente.FDQueryClientes.FieldByName('NOME').AsString;

      EditClienteID.Text :=
      TelaConsultaCliente.FDQueryClientes.FieldByName('ID').AsString;
    end;
  finally
    TelaConsultaCliente.Free;

  end;

end;

procedure TTelaVenda.LimparTela;
var
  i: Integer;

begin
  EditClienteID.Clear;
  EditCliente.Clear;
  EditTotalVenda.Clear;
  EditProduto.Clear;
  EditQtdade.Clear;
  EditPreco.Clear;

  for i := 1 to GridItens.RowCount - 1 do
    GridItens.Rows[i].Clear;

  GridItens.RowCount := 1;

  FDQuery1.Close;
end;


procedure TTelaVenda.ButtonAdicionarItemClick(Sender: TObject);
var
  Linha : Integer;
  Preco : Double;
  Qtd   : Double;
  Total : Double;
begin
  if EditQtdade.Text = '' then
  begin
    ShowMessage('Informe a quantidade');
    Exit;
  end;

  Preco := StrToFloat(EditPreco.Text);
  Qtd := StrToFloat(EditQtdade.Text);

  Total := Preco * Qtd;

  Linha := GridItens.RowCount;

  GridItens.RowCount := GridItens.RowCount + 1;

  GridItens.Cells[0,Linha] := IntToStr(EditProduto.Tag);
  GridItens.Cells[1,Linha] := EditProduto.Text;
  GridItens.Cells[2,Linha] := EditQtdade.Text;
  GridItens.Cells[3,Linha] := EditPreco.Text;
  GridItens.Cells[4,Linha] := FloatToStr(Total);

  CalcularTotal;

  EditProduto.Text := '';
  EditQtdade.Text  := '';
  EditPreco.Text   := '';

end;

procedure TTelaVenda.ButtonFecharVendaClick(Sender: TObject);
begin
  LimparTela;
  Close;
end;

procedure TTelaVenda.ButtonRemoverItemClick(Sender: TObject);
  var
  Linha : Integer;
  i : Integer;
begin

  Linha := GridItens.Row;

  for i := Linha to GridItens.RowCount - 2 do
  begin
    GridItens.Rows[i] := GridItens.Rows[i+1];
  end;

  GridItens.RowCount := GridItens.RowCount - 1;

  CalcularTotal;
end;

procedure TTelaVenda.ButtonSalvarVendaClick(Sender: TObject);
begin

  if GridItens.RowCount = 0 then
  begin
    ShowMessage('Adicione itens para finalizar a venda');
    Exit;
  end;


  FDQuery1.SQL.Text :=
  'INSERT INTO VENDAS (DATA, CLIENTE_ID, VALOR_TOTAL) VALUES (:DATA,:CLIENTE_ID,:VALOR_TOTAL)';

  FDQuery1.ParamByName('DATA').AsDate := Date;
  FDQuery1.ParamByName('CLIENTE_ID').AsString := EditClienteID.Text;
  FDQuery1.ParamByName('VALOR_TOTAL').AsFloat := StrToFloat(EditTotalVenda.Text);

  FDQuery1.ExecSQL;

  FDQuery1.SQL.Text := 'SELECT MAX(ID) ID FROM VENDAS';
  FDQuery1.Open;

  var VendaID : Integer;

  VendaID := FDQuery1.FieldByName('ID').AsInteger;

  var
  i: Integer;

  for i := 1 to GridItens.RowCount - 1 do
  begin

    FDQuery1.SQL.Text :=
    'INSERT INTO VENDAS_ITENS (VENDA_ID, PRODUTO_ID, QUANTIDADE, PRECO, TOTAL) '+
    'VALUES (:VENDA,:PRODUTO,:QTD,:PRECO,:TOTAL)';

    FDQuery1.ParamByName('VENDA').AsInteger := VendaID;
    FDQuery1.ParamByName('PRODUTO').AsInteger := StrToInt(GridItens.Cells[0,i]);
    FDQuery1.ParamByName('QTD').AsFloat := StrToFloat(GridItens.Cells[2,i]);
    FDQuery1.ParamByName('PRECO').AsFloat := StrToFloat(GridItens.Cells[3,i]);
    FDQuery1.ParamByName('TOTAL').AsFloat := StrToFloat(GridItens.Cells[4,i]);

    FDQuery1.ExecSQL;
  end;


  ShowMessage('Venda salva com sucesso. Número da venda: ' + IntToStr(VendaID));
  LimparTela;

  if Assigned(TelaConsultaVendas) then
  begin
    TelaConsultaVendas.FDQueryVendas.Close;
    TelaConsultaVendas.FDQueryVendas.Open;
  end;

  close;



end;

procedure TTelaVenda.EditClienteExit(Sender: TObject);
begin
  FDQuery1.SQL.Text :=
  'SELECT NOME FROM CLIENTES WHERE NOME = :NOME';

  FDQuery1.ParamByName('NOME').AsString := EditCliente.Text;

  FDQuery1.Open;

  if not FDQuery1.IsEmpty then
    EditCliente.Text := FDQuery1.FieldByName('NOME').AsString
  else
    ShowMessage('Cliente não encontrado');
end;

procedure TTelaVenda.EditClienteIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
    ConsultarCliente;
end;

procedure TTelaVenda.EditClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
    ConsultarCliente;
end;

procedure TTelaVenda.EditProdutoExit(Sender: TObject);
begin
  FDQuery1.SQL.Text :=
  'SELECT DESCRICAO, PRECO_VENDA FROM PRODUTOS WHERE DESCRICAO = :DESC';

  FDQuery1.ParamByName('DESC').AsString := EditProduto.Text;

  FDQuery1.Open;

  if not FDQuery1.IsEmpty then
  begin
    EditProduto.Text := FDQuery1.FieldByName('DESCRICAO').AsString;
    EditPreco.Text := FDQuery1.FieldByName('PRECO_VENDA').AsString;
  end
  else
    ShowMessage('Produto não encontrado');
end;

procedure TTelaVenda.EditProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Valor : Currency;
begin
  if Key = VK_F2 then
  begin

    TelaConsultaProduto := TTelaConsultaProduto.Create(nil);
    TelaConsultaProduto.PermitirEdicao := False;

    try
      if TelaConsultaProduto.ShowModal = mrOk then
      begin
        EditProduto.Text :=
        TelaConsultaProduto.FDQueryProdutos.FieldByName('DESCRICAO').AsString;

        Valor := StrToCurr(TelaConsultaProduto.FDQueryProdutos.FieldByName('PRECO_VENDA').AsString);
        EditPreco.Text := FormatFloat('0.00', Valor);


        EditProduto.Tag :=
        TelaConsultaProduto.FDQueryProdutos.FieldByName('ID').AsInteger;
      end;
    finally
      TelaConsultaProduto.Free;
    end;

  end;
end;

procedure TTelaVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LimparTela;
end;

procedure TTelaVenda.FormCreate(Sender: TObject);
begin
  GridItens.ColCount := 5;
  GridItens.RowCount := 1;

  GridItens.Cells[0,0] := 'ID';
  GridItens.Cells[1,0] := 'Produto';
  GridItens.Cells[2,0] := 'Qtd';
  GridItens.Cells[3,0] := 'Preço';
  GridItens.Cells[4,0] := 'Total';
end;



procedure TTelaVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    LimparTela;
    Close;
  end;
end;

end.
