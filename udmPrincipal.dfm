object dmPrincipal: TdmPrincipal
  OnCreate = DataModuleCreate
  Height = 589
  Width = 823
  PixelsPerInch = 120
  object EMSProvider1: TEMSProvider
    ApiVersion = '1'
    AppSecret = 'DE1BA56B-43C5-469D-9BD2-4EB146EB8473'
    URLHost = 'localhost'
    URLPort = 8080
    Left = 50
    Top = 20
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 360
    Top = 20
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 190
    Top = 20
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    Left = 180
    Top = 215
  end
  object EMSFireDACClient1: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter1
    Resource = 'ServerLogin'
    Left = 180
    Top = 135
  end
  object fdtbLogin: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaLogin
    StoreDefs = True
    Left = 288
    Top = 246
    object fdtbLoginpes_id: TIntegerField
      FieldName = 'pes_id'
      Origin = 'pes_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdtbLoginpes_cnpj_cpf: TWideStringField
      FieldName = 'pes_cnpj_cpf'
      Origin = 'pes_cnpj_cpf'
      Size = 18
    end
    object fdtbLoginpes_nome: TWideStringField
      FieldName = 'pes_nome'
      Origin = 'pes_nome'
      Size = 60
    end
    object fdtbLogingre_id: TIntegerField
      FieldName = 'gre_id'
      Origin = 'gre_id'
    end
    object fdtbLoginemp_id: TIntegerField
      FieldName = 'emp_id'
      Origin = 'emp_id'
    end
    object fdtbLoginpes_uf: TWideStringField
      FieldName = 'pes_uf'
      Origin = 'pes_uf'
      Size = 2
    end
    object fdtbLoginpes_endereco: TWideStringField
      FieldName = 'pes_endereco'
      Origin = 'pes_endereco'
      Size = 60
    end
    object fdtbLoginpes_bairro: TWideStringField
      FieldName = 'pes_bairro'
      Origin = 'pes_bairro'
      Size = 50
    end
    object fdtbLoginpes_telefone_principal: TWideStringField
      FieldName = 'pes_telefone_principal'
      Origin = 'pes_telefone_principal'
      Size = 15
    end
    object fdtbLoginpes_celular_principal: TWideStringField
      FieldName = 'pes_celular_principal'
      Origin = 'pes_celular_principal'
      Size = 15
    end
    object fdtbLoginpes_cidade: TWideStringField
      FieldName = 'pes_cidade'
      Origin = 'pes_cidade'
      Size = 50
    end
    object fdtbLoginpes_cep: TWideStringField
      FieldName = 'pes_cep'
      Origin = 'pes_cep'
      Size = 11
    end
    object fdtbLoginpes_contato: TWideStringField
      FieldName = 'pes_contato'
      Origin = 'pes_contato'
      Size = 60
    end
    object fdtbLoginpes_complemento: TWideStringField
      FieldName = 'pes_complemento'
      Origin = 'pes_complemento'
      Size = 50
    end
    object fdtbLoginjur_razao_social: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'jur_razao_social'
      Origin = 'jur_razao_social'
      ProviderFlags = []
      FixedChar = True
      Size = 60
    end
    object fdtbLoginjur_ie: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'jur_ie'
      Origin = 'jur_ie'
      ProviderFlags = []
    end
    object fdtbLoginpes_email: TWideStringField
      FieldName = 'pes_email'
      Origin = 'pes_email'
      Size = 50
    end
    object fdtbLogintie_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tie_id'
      Origin = 'tie_id'
    end
    object fdtbLogintie_descricao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tie_descricao'
      Origin = 'tie_descricao'
      Size = 50
    end
    object fdtbLoginjur_farmaceutico: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'jur_farmaceutico'
      Origin = 'jur_farmaceutico'
      Size = 60
    end
    object fdtbLoginpla_id: TIntegerField
      FieldName = 'pla_id'
      Origin = 'pla_id'
    end
    object fdtbLoginpes_id_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'pes_id_1'
      Origin = 'pes_id'
    end
    object fdtbLogincon_token: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'con_token'
      Origin = 'con_token'
      FixedChar = True
      Size = 40
    end
  end
  object ftaLogin: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter1
    UpdateTableName = 'Table'
    DatSTableName = 'fdqrylogin'
    Left = 278
    Top = 166
  end
end
