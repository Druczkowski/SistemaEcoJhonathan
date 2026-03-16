object TelaCadClientes: TTelaCadClientes
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Clientes'
  ClientHeight = 163
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object LabelNomeCliente: TLabel
    Left = 32
    Top = 43
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object LabelDocumento: TLabel
    Left = 250
    Top = 43
    Width = 66
    Height = 15
    Caption = 'Documento:'
  end
  object LabelCidade: TLabel
    Left = 384
    Top = 43
    Width = 40
    Height = 15
    Caption = 'Cidade:'
  end
  object Label1: TLabel
    Left = 169
    Top = 43
    Width = 26
    Height = 15
    Caption = 'Tipo:'
  end
  object EditNomeCliente: TEdit
    Left = 32
    Top = 64
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object EditDocumento: TEdit
    Left = 250
    Top = 64
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object EditCidade: TEdit
    Left = 384
    Top = 64
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object ButtonSalvarCli: TButton
    Left = 325
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = ButtonSalvarCliClick
  end
  object ButtonFecharCli: TButton
    Left = 430
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = ButtonFecharCliClick
  end
  object ComboBoxPFPJ: TComboBox
    Left = 169
    Top = 64
    Width = 73
    Height = 23
    TabOrder = 5
    OnChange = ComboBoxPFPJChange
    Items.Strings = (
      'PF'
      'PJ'
      'EXTERIOR')
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from clientes')
    Left = 32
    Top = 104
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
    Left = 120
    Top = 104
  end
end
