object frmConsultaMembros: TfrmConsultaMembros
  Left = 0
  Top = 0
  Caption = 'Membros'
  ClientHeight = 445
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Roboto'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pnlPrincipal: TCardPanel
    Left = 0
    Top = 0
    Width = 789
    Height = 445
    Align = alClient
    ActiveCard = cardConsultaMembros
    Caption = 'pnlPrincipal'
    TabOrder = 0
    object cardConsultaMembros: TCard
      Left = 1
      Top = 1
      Width = 787
      Height = 443
      Caption = 'ConsultaCard'
      CardIndex = 0
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 787
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 8
          Width = 71
          Height = 19
          Caption = 'Pesquisar'
        end
        object btnPesquisar: TButton
          Left = 632
          Top = 16
          Width = 145
          Height = 43
          Caption = 'Pesquisar'
          TabOrder = 0
          OnClick = btnPesquisarClick
        end
        object edtCampoPesquisa: TEdit
          Left = 24
          Top = 27
          Width = 378
          Height = 27
          TabOrder = 1
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 73
        Width = 787
        Height = 297
        Align = alClient
        DataSource = dataSourceMembros
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Roboto'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'funcao'
            Title.Caption = 'Fun'#231#227'o'
            Width = 300
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 370
        Width = 787
        Height = 73
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object btnAdicionar: TButton
          Left = 25
          Top = 5
          Width = 112
          Height = 60
          Caption = 'Adicionar'
          TabOrder = 0
          OnClick = btnAdicionarClick
        end
        object btnEditar: TButton
          Left = 157
          Top = 5
          Width = 112
          Height = 60
          Caption = 'Editar'
          TabOrder = 1
          OnClick = btnEditarClick
        end
        object btnApagar: TButton
          Left = 290
          Top = 6
          Width = 112
          Height = 59
          Caption = 'Apagar'
          TabOrder = 2
          OnClick = btnApagarClick
        end
        object btnDetalhes: TButton
          Left = 418
          Top = 6
          Width = 112
          Height = 59
          Caption = 'Detalhes'
          TabOrder = 3
          OnClick = btnDetalhesClick
        end
      end
    end
    object DadosMembro: TCard
      Left = 1
      Top = 1
      Width = 787
      Height = 443
      Caption = 'DadosCard'
      CardIndex = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object Label3: TLabel
        Left = 80
        Top = 15
        Width = 42
        Height = 19
        Caption = 'Nome'
      end
      object Label4: TLabel
        Left = 80
        Top = 86
        Width = 53
        Height = 19
        Caption = 'Fun'#231#227'o'
      end
      object edtNome: TEdit
        Left = 80
        Top = 40
        Width = 393
        Height = 27
        TabOrder = 0
      end
      object edtFuncao: TEdit
        Left = 80
        Top = 111
        Width = 393
        Height = 27
        TabOrder = 1
      end
      object btnCancelar: TButton
        Left = 592
        Top = 376
        Width = 145
        Height = 44
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = btnCancelarClick
      end
      object btnSalvar: TButton
        Left = 441
        Top = 376
        Width = 145
        Height = 44
        Caption = 'Salvar'
        TabOrder = 3
        OnClick = btnSalvarClick
      end
    end
  end
  object sqlMembros: TFDQuery
    Connection = dmConnection.sqlConnection
    SQL.Strings = (
      'select * from membros')
    Left = 393
    Top = 209
  end
  object cdsMembros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMembros'
    Left = 569
    Top = 209
    object cdsMembrosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 200
    end
    object cdsMembrosfuncao: TStringField
      FieldName = 'funcao'
      Origin = 'funcao'
      Size = 200
    end
    object cdsMembrosid: TAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object dspMembros: TDataSetProvider
    DataSet = sqlMembros
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 489
    Top = 209
  end
  object dataSourceMembros: TDataSource
    DataSet = cdsMembros
    Left = 657
    Top = 265
  end
end
