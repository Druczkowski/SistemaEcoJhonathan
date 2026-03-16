object TelaConsultaVendas: TTelaConsultaVendas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Gerenciador de Vendas'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 616
    Height = 241
    DataSource = DataSourceVendas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'ID Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Caption = 'Data Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Caption = 'Cliente'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Title.Caption = 'Valor Venda'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 247
    Width = 616
    Height = 194
    DataSource = DataSourceItens
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VENDA_ID'
        Title.Caption = 'ID Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUTO'
        Title.Caption = 'Descri'#231#227'o Produto'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Title.Caption = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Title.Caption = 'Pre'#231'o'
        Visible = True
      end>
  end
  object FDQueryVendas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      '    V.ID,'
      '    V.DATA,'
      '    C.NOME AS CLIENTE,'
      '    V.VALOR_TOTAL'
      'FROM VENDAS V'
      'JOIN CLIENTES C ON C.ID = V.CLIENTE_ID'
      'ORDER BY V.ID DESC')
    Left = 280
    Top = 80
    object FDQueryVendasID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryVendasDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object FDQueryVendasCLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FDQueryVendasVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
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
    Left = 368
    Top = 96
  end
  object FDQueryItens: TFDQuery
    Connection = FDConnection2
    SQL.Strings = (
      'SELECT'
      '    I.ID,'
      '    I.VENDA_ID,'
      '    P.DESCRICAO AS PRODUTO,'
      '    I.QUANTIDADE,'
      '    I.PRECO'
      'FROM VENDAS_ITENS I'
      'JOIN PRODUTOS P ON P.ID = I.PRODUTO_ID'
      'WHERE I.VENDA_ID = :ID_VENDA')
    Left = 312
    Top = 328
    ParamData = <
      item
        Name = 'ID_VENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryItensID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryItensVENDA_ID: TIntegerField
      FieldName = 'VENDA_ID'
      Origin = 'VENDA_ID'
    end
    object FDQueryItensPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FDQueryItensQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object FDQueryItensPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object FDConnection2: TFDConnection
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
    Left = 400
    Top = 344
  end
  object DataSourceVendas: TDataSource
    DataSet = FDQueryVendas
    Left = 504
    Top = 136
  end
  object DataSourceItens: TDataSource
    DataSet = FDQueryItens
    Left = 504
    Top = 336
  end
end
