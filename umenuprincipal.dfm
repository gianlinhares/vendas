object fmenuprincipal: Tfmenuprincipal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Menu Principal'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = main_menu
  PrintScale = poNone
  TextHeight = 15
  object pnl_menu: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 442
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 622
    ExplicitHeight = 433
  end
  object main_menu: TMainMenu
    Left = 360
    Top = 136
    object mnu_cadastro: TMenuItem
      Caption = 'Cadastros'
      object mnu_cliente_cad: TMenuItem
        Caption = 'Cliente'
        OnClick = mnu_cliente_cadClick
      end
      object mnu_fornec_cad: TMenuItem
        Caption = 'Fornecedor'
        OnClick = mnu_fornec_cadClick
      end
      object mnu_produtos_cad: TMenuItem
        Caption = 'Produtos'
        OnClick = mnu_produtos_cadClick
      end
    end
    object mnu_vendas_princ: TMenuItem
      Caption = 'Vendas'
      object mnu_vendas_cad: TMenuItem
        Caption = 'Vendas'
        OnClick = mnu_vendas_cadClick
      end
    end
    object mnu_consultas: TMenuItem
      Caption = 'Consultas'
      object mnu_cliente_cons: TMenuItem
        Caption = 'Cliente'
        OnClick = mnu_cliente_consClick
      end
      object mnu_fornec_cons: TMenuItem
        Caption = 'Fornecedor'
        OnClick = mnu_fornec_consClick
      end
      object mnu_produtos_cons: TMenuItem
        Caption = 'Produtos'
        OnClick = mnu_produtos_consClick
      end
      object mnu_vendas_cons: TMenuItem
        Caption = 'Vendas'
        OnClick = mnu_vendas_consClick
      end
    end
    object mnu_sair: TMenuItem
      Caption = 'Sair do Programa'
      OnClick = mnu_sairClick
    end
  end
end
