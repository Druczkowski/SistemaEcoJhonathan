unit FormClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TTelaCadClientes = class(TForm)
    EditNomeCliente: TEdit;
    LabelNomeCliente: TLabel;
    EditDocumento: TEdit;
    EditCidade: TEdit;
    LabelDocumento: TLabel;
    LabelCidade: TLabel;
    ButtonSalvarCli: TButton;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    ButtonFecharCli: TButton;
    procedure ButtonSalvarCliClick(Sender: TObject);
    procedure ButtonFecharCliClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaCadClientes: TTelaCadClientes;

implementation

{$R *.dfm}

procedure TTelaCadClientes.ButtonFecharCliClick(Sender: TObject);
begin
  Close;
end;

procedure TTelaCadClientes.ButtonSalvarCliClick(Sender: TObject);
begin
  if EditNomeCliente.Text = '' then
  begin
    ShowMessage('Informe o nome');
    EditNomeCliente.SetFocus;
    Exit;
  end;

  if EditDocumento.Text = '' then
  begin
    ShowMessage('Informe o documento');
    EditDocumento.SetFocus;
    Exit;
  end;

  if EditCidade.Text = '' then
  begin
    ShowMessage('Informe a cidade');
    EditCidade.SetFocus;
    Exit;
  end;

  FDQuery1.Close;
  FDQuery1.SQL.Text := 'SELECT ID FROM CLIENTES WHERE DOCUMENTO = :DOCUMENTO';
  FDQuery1.ParamByName('DOCUMENTO').AsString := EditDocumento.Text;
  FDQuery1.Open;

  if not FDQuery1.IsEmpty then
  begin
    if MessageDlg('Documento já cadastrado. Deseja continuar mesmo assim?',
       mtConfirmation, [mbYes, mbNo], 0) = mrNo then
       Exit;
  end;

  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('INSERT INTO CLIENTES (NOME, DOCUMENTO, CIDADE)');
  FDQuery1.SQL.Add('VALUES (:NOME, :DOCUMENTO, :CIDADE)');

  FDQuery1.ParamByName('NOME').AsString := EditNomeCliente.Text;
  FDQuery1.ParamByName('DOCUMENTO').AsString := EditDocumento.Text;
  FDQuery1.ParamByName('CIDADE').AsString := EditCidade.Text;

  FDQuery1.ExecSQL;

  ShowMessage('Cliente salvo!');

  EditNomeCliente.Text := '';
  EditDocumento.Text := '';
  EditCidade.Text := '';
  EditNomeCliente.SetFocus;
end;

end.
