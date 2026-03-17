object TelaConsultaProduto: TTelaConsultaProduto
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Consultar Produto'
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
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 99
    Height = 15
    Caption = 'Pesquisar Produto:'
  end
  object DBGrid1: TDBGrid
    Left = -1
    Top = 29
    Width = 625
    Height = 412
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
        Title.Caption = 'ID Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_VENDA'
        Title.Caption = 'Pre'#231'o Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADE'
        Title.Caption = 'Unidade de Medida'
        Visible = True
      end>
  end
  object EditConsultaProduto: TEdit
    Left = 119
    Top = 5
    Width = 242
    Height = 23
    TabOrder = 1
    OnChange = EditConsultaProdutoChange
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
  object FDQueryProdutos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT ID, DESCRICAO, PRECO_VENDA, UNIDADE'
      'FROM PRODUTOS'
      'ORDER BY DESCRICAO')
    Left = 240
    Top = 328
    object FDQueryProdutosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQueryProdutosPRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      DisplayFormat = 'R$ #,##0.00'
      Precision = 18
      Size = 2
    end
    object FDQueryProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQueryProdutos
    Left = 336
    Top = 368
  end
end
