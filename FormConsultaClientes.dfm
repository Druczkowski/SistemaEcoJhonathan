object TelaConsultaCliente: TTelaConsultaCliente
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Consultar Cliente'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 8
    Width = 625
    Height = 433
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOCUMENTO'
        Title.Caption = 'Documento '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Title.Caption = 'Cidade'
        Visible = True
      end>
  end
  object FDQueryClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT ID, NOME, DOCUMENTO, CIDADE'
      'FROM CLIENTES'
      'ORDER BY NOME')
    Left = 240
    Top = 328
  end
  object DataSource1: TDataSource
    DataSet = FDQueryClientes
    Left = 336
    Top = 368
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      
        'Database=C:\Users\Druczkowski\Documents\Sistema Venda Eco\BD\VEN' +
        'DASECOJ.FDB'
      'Password=masterkey'
      'User_Name=sysdba'
      'Server=localhost'
      'OSAuthent=No')
    Connected = True
    LoginPrompt = False
    Left = 136
    Top = 336
  end
end
