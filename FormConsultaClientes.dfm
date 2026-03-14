object TelaConsultaCliente: TTelaConsultaCliente
  Left = 0
  Top = 0
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
  object Edit1: TEdit
    Left = 104
    Top = 80
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'Edit1'
  end
  object DBGrid1: TDBGrid
    Left = 200
    Top = 200
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
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
    LoginPrompt = False
    Left = 136
    Top = 336
  end
end
