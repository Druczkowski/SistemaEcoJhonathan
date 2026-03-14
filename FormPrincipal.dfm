object TelaPrincipal: TTelaPrincipal
  Left = 0
  Top = 0
  Caption = 'Inicio'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object ButtonCadClientes: TButton
    Left = 64
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Clientes'
    TabOrder = 0
    OnClick = ButtonCadClientesClick
  end
  object ButtonCadProdutos: TButton
    Left = 208
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Produtos'
    TabOrder = 1
    OnClick = ButtonCadProdutosClick
  end
  object ButtonVendas: TButton
    Left = 104
    Top = 112
    Width = 137
    Height = 57
    Caption = 'Vendas'
    TabOrder = 2
    OnClick = ButtonVendasClick
  end
end
