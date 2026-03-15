object TelaPrincipal: TTelaPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Inicio'
  ClientHeight = 278
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 88
    Top = 8
    Width = 155
    Height = 15
    Caption = 'Sistema de Vendas Jhonathan'
    Color = clHighlight
    ParentColor = False
  end
  object ButtonCadClientes: TButton
    Left = 24
    Top = 40
    Width = 115
    Height = 25
    Caption = 'Cadastrar Clientes'
    TabOrder = 0
    OnClick = ButtonCadClientesClick
  end
  object ButtonCadProdutos: TButton
    Left = 184
    Top = 40
    Width = 121
    Height = 25
    Caption = 'Cadastrar Produtos'
    TabOrder = 1
    OnClick = ButtonCadProdutosClick
  end
  object ButtonVendas: TButton
    Left = 104
    Top = 160
    Width = 113
    Height = 33
    Caption = 'Nova Venda'
    TabOrder = 2
    OnClick = ButtonVendasClick
  end
  object ButtonConsultaCli: TButton
    Left = 24
    Top = 71
    Width = 115
    Height = 42
    Caption = 'Gerenciador Clientes'
    TabOrder = 3
    OnClick = ButtonConsultaCliClick
  end
  object ButtonConsultaProd: TButton
    Left = 184
    Top = 71
    Width = 121
    Height = 42
    Caption = 'Gerenciador Produtos'
    TabOrder = 4
    OnClick = ButtonConsultaProdClick
  end
  object ButtonConsultaVenda: TButton
    Left = 88
    Top = 199
    Width = 145
    Height = 58
    Caption = 'Gerenciador de Vendas'
    TabOrder = 5
    OnClick = ButtonConsultaVendaClick
  end
end
