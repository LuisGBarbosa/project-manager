object dmConnection: TdmConnection
  OldCreateOrder = False
  Height = 246
  Width = 390
  object sqlConnection: TFDConnection
    Params.Strings = (
      
        'Database=E:\Documents\Embarcadero\Studio\Projects\Gerenciador de' +
        ' Projetos\banco de dados\orbneil.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 48
    Top = 32
  end
end
