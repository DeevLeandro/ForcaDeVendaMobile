object dmVenda: TdmVenda
  OnCreate = DataModuleCreate
  Height = 886
  Width = 1281
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
    Left = 180
    Top = 20
  end
  object FDSchemaAdapter1: TFDSchemaAdapter
    Left = 80
    Top = 265
  end
  object EMSFireDACClient1: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter1
    Resource = 'ServerIntegracao'
    Left = 60
    Top = 175
  end
  object fdtbPesquisaPessoa: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaPesquisaPessoa
    StoreDefs = True
    Left = 188
    Top = 296
    object fdtbPesquisaPessoapes_id: TIntegerField
      FieldName = 'pes_id'
      Origin = 'pes_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdtbPesquisaPessoapes_cnpj_cpf: TWideStringField
      FieldName = 'pes_cnpj_cpf'
      Origin = 'pes_cnpj_cpf'
      Size = 18
    end
    object fdtbPesquisaPessoapes_nome: TWideStringField
      FieldName = 'pes_nome'
      Origin = 'pes_nome'
      Size = 60
    end
    object fdtbPesquisaPessoagrt_id: TIntegerField
      FieldName = 'grt_id'
      Origin = 'grt_id'
    end
    object fdtbPesquisaPessoapes_classificacao: TWideStringField
      FieldName = 'pes_classificacao'
      Origin = 'pes_classificacao'
      FixedChar = True
      Size = 1
    end
    object fdtbPesquisaPessoapes_uf: TWideStringField
      FieldName = 'pes_uf'
      Origin = 'pes_uf'
      Size = 2
    end
  end
  object ftaPesquisaPessoa: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter1
    UpdateTableName = 'Table'
    DatSTableName = 'fdqryPesquisaPessoa'
    Left = 178
    Top = 216
  end
  object FDSchemaAdapter2: TFDSchemaAdapter
    Left = 380
    Top = 245
  end
  object EMSFireDACClient2: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter2
    Resource = 'ServerIntegracao'
    Left = 360
    Top = 155
  end
  object fdtbPesquisaProdutoVenda: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaPesquisaProdutoVenda
    StoreDefs = True
    Left = 488
    Top = 286
    object fdtbPesquisaProdutoVendapro_id: TIntegerField
      FieldName = 'pro_id'
      Origin = 'pro_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdtbPesquisaProdutoVendapro_catalogo: TWideStringField
      FieldName = 'pro_catalogo'
      Origin = 'pro_catalogo'
    end
    object fdtbPesquisaProdutoVendapro_ean: TWideStringField
      FieldName = 'pro_ean'
      Origin = 'pro_ean'
      FixedChar = True
      Size = 15
    end
    object fdtbPesquisaProdutoVendaest_qtde: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'est_qtde'
      Origin = 'est_qtde'
      Precision = 15
      Size = 3
    end
    object fdtbPesquisaProdutoVendamar_descricao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'mar_descricao'
      Origin = 'mar_descricao'
      Size = 50
    end
    object fdtbPesquisaProdutoVendagrp_descricao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grp_descricao'
      Origin = 'grp_descricao'
      Size = 50
    end
    object fdtbPesquisaProdutoVendaest_custo: TCurrencyField
      AutoGenerateValue = arDefault
      FieldName = 'est_custo'
      Origin = 'est_custo'
    end
    object fdtbPesquisaProdutoVendaest_valor_fixo_varejo: TCurrencyField
      AutoGenerateValue = arDefault
      FieldName = 'est_valor_fixo_varejo'
      Origin = 'est_valor_fixo_varejo'
    end
    object fdtbPesquisaProdutoVendaest_valor_fixo_promocao: TCurrencyField
      AutoGenerateValue = arDefault
      FieldName = 'est_valor_fixo_promocao'
      Origin = 'est_valor_fixo_promocao'
    end
    object fdtbPesquisaProdutoVendapro_tipo_calculo_venda: TWideStringField
      FieldName = 'pro_tipo_calculo_venda'
      Origin = 'pro_tipo_calculo_venda'
      Size = 1
    end
    object fdtbPesquisaProdutoVendavVendaCalculado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'vVendaCalculado'
      ProviderFlags = []
      Calculated = True
    end
    object fdtbPesquisaProdutoVendapro_consulta: TWideStringField
      FieldName = 'pro_consulta'
      Origin = 'pro_consulta'
      FixedChar = True
      Size = 100
    end
    object fdtbPesquisaProdutoVendacla_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cla_id'
      Origin = 'cla_id'
    end
    object fdtbPesquisaProdutoVendagrp_margem: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grp_margem'
      Origin = 'grp_margem'
      FixedChar = True
      Size = 10
    end
    object fdtbPesquisaProdutoVendagrp_margem_trabalho: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'grp_margem_trabalho'
      Origin = 'grp_margem_trabalho'
    end
    object fdtbPesquisaProdutoVendagrp_margem_atacado: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grp_margem_atacado'
      Origin = 'grp_margem_atacado'
      FixedChar = True
      Size = 10
    end
    object fdtbPesquisaProdutoVendavalorpromocional: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valorpromocional'
      Origin = 'valorpromocional'
      ReadOnly = True
      Precision = 13
      Size = 3
    end
    object fdtbPesquisaProdutoVendaest_valor_fixo_atacado: TCurrencyField
      AutoGenerateValue = arDefault
      FieldName = 'est_valor_fixo_atacado'
      Origin = 'est_valor_fixo_atacado'
    end
  end
  object ftaPesquisaProdutoVenda: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter2
    UpdateTableName = 'Table'
    DatSTableName = 'fdqryPesquisaProdutoVenda'
    Left = 498
    Top = 196
  end
  object fdtbProduto: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 70
    Top = 450
    object fdtbProdutopProID: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pProID'
      Size = 10
    end
    object fdtbProdutopProduto: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pProduto'
      Size = 60
    end
    object fdtbProdutopQtde: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pQtde'
      Size = 10
    end
    object fdtbProdutopValor: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'pValor'
    end
    object fdtbProdutopMarca: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pMarca'
      Size = 60
    end
    object fdtbProdutopValorTotal: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'pValorTotal'
    end
    object fdtbProdutopClaID: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pClaID'
      Size = 5
    end
    object fdtbProdutopTotal: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'pTotal'
    end
    object fdtbProdutopTotalDesc: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'pTotalDesc'
    end
    object fdtbProdutopDesc: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'pDesc'
    end
    object fdtbProdutopValorOriginal: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'pValorOriginal'
    end
    object fdtbProdutopTotalGeral: TAggregateField
      FieldName = 'pTotalGeral'
      Active = True
      DisplayName = ''
      Expression = 'sum(pValorTotal)'
    end
    object fdtbProdutovTotal: TAggregateField
      FieldName = 'vTotal'
      Active = True
      DisplayName = ''
      Expression = 'sum(pTotal)'
    end
    object fdtbProdutovTotalDesc: TAggregateField
      FieldName = 'vTotalDesc'
      Active = True
      DisplayName = ''
      Expression = 'sum(pTotalDesc)'
    end
    object fdtbProdutovTotalOriginal: TAggregateField
      FieldName = 'vTotalOriginal'
      Active = True
      DisplayName = ''
      Expression = 'sum(pValorOriginal)'
    end
  end
  object FDSchemaAdapter3: TFDSchemaAdapter
    Left = 670
    Top = 105
  end
  object EMSFireDACClient3: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter3
    Resource = 'ServerIntegracao'
    Left = 650
    Top = 15
  end
  object fdtbTipoPagamento: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'tpg_id'
        DataType = ftInteger
      end
      item
        Name = 'tpg_descricao'
        DataType = ftWideString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaTipoPagamento
    StoreDefs = True
    Left = 798
    Top = 136
    object fdtbTipoPagamentotpg_id: TIntegerField
      FieldName = 'tpg_id'
      Origin = 'tpg_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdtbTipoPagamentotpg_descricao: TWideStringField
      FieldName = 'tpg_descricao'
      Origin = 'tpg_descricao'
      FixedChar = True
    end
  end
  object ftaTipoPagamento: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter3
    UpdateTableName = 'Table'
    DatSTableName = 'fdtbTipoPagamento'
    Left = 768
    Top = 56
  end
  object FDSchemaAdapter4: TFDSchemaAdapter
    Left = 990
    Top = 105
  end
  object EMSFireDACClient4: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter4
    Resource = 'ServerIntegracao'
    Left = 970
    Top = 15
  end
  object fdtbFormaPagamento: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaFormaPagamento
    StoreDefs = True
    Left = 1118
    Top = 136
    object fdtbFormaPagamentofop_id: TIntegerField
      FieldName = 'fop_id'
      Origin = 'fop_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdtbFormaPagamentogre_id: TIntegerField
      FieldName = 'gre_id'
      Origin = 'gre_id'
    end
    object fdtbFormaPagamentoemp_id: TIntegerField
      FieldName = 'emp_id'
      Origin = 'emp_id'
    end
    object fdtbFormaPagamentofop_descricao: TWideStringField
      FieldName = 'fop_descricao'
      Origin = 'fop_descricao'
      FixedChar = True
    end
    object fdtbFormaPagamentofop_pgminimo: TCurrencyField
      FieldName = 'fop_pgminimo'
      Origin = 'fop_pgminimo'
    end
    object fdtbFormaPagamentofop_pginicial: TCurrencyField
      FieldName = 'fop_pginicial'
      Origin = 'fop_pginicial'
    end
    object fdtbFormaPagamentofop_pgfinal: TCurrencyField
      FieldName = 'fop_pgfinal'
      Origin = 'fop_pgfinal'
    end
    object fdtbFormaPagamentotpg_id: TIntegerField
      FieldName = 'tpg_id'
      Origin = 'tpg_id'
    end
    object fdtbFormaPagamentofop_qtde_parcelas: TSmallintField
      FieldName = 'fop_qtde_parcelas'
      Origin = 'fop_qtde_parcelas'
    end
    object fdtbFormaPagamentofop_intervalo_parcelas: TSmallintField
      FieldName = 'fop_intervalo_parcelas'
      Origin = 'fop_intervalo_parcelas'
    end
    object fdtbFormaPagamentofop_qtde_dias: TSmallintField
      FieldName = 'fop_qtde_dias'
      Origin = 'fop_qtde_dias'
    end
    object fdtbFormaPagamentofop_status: TSmallintField
      FieldName = 'fop_status'
      Origin = 'fop_status'
    end
    object fdtbFormaPagamentofop_dia_venc: TSmallintField
      FieldName = 'fop_dia_venc'
      Origin = 'fop_dia_venc'
    end
  end
  object ftaFormaPagamento: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter4
    UpdateTableName = 'Table'
    DatSTableName = 'fdqryFormaPagamento'
    Left = 1088
    Top = 56
  end
  object fdtbFinanceiro: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 75
    Top = 565
    object fdtbFinanceiropQtde: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pQtde'
      Size = 5
    end
    object fdtbFinanceiropDtVencimento: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pDtVencimento'
      Size = 15
    end
    object fdtbFinanceiropTipoPg: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'pTipoPg'
    end
    object fdtbFinanceiropValorParcela: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'pValorParcela'
    end
    object fdtbFinanceiropNumParcela: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pNumParcela'
      Size = 8
    end
  end
  object BackendInserirVenda: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPOST
    Params = <>
    Resource = 'ServerIntegracao'
    ResourceSuffix = 'NovaVenda'
    Response = ResInserirVenda
    ConnectTimeout = 100000
    ReadTimeout = 100000
    Left = 220
    Top = 440
  end
  object ResInserirVenda: TRESTResponse
    Left = 220
    Top = 540
  end
  object FDSchemaAdapter5: TFDSchemaAdapter
    Left = 690
    Top = 355
  end
  object EMSFireDACClient5: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter5
    Resource = 'ServerIntegracao'
    Left = 680
    Top = 255
  end
  object fdtbConsultarPedidos: TFDMemTable
    OnCalcFields = fdtbConsultarPedidosCalcFields
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaConsultarPedidos
    StoreDefs = True
    Left = 818
    Top = 396
    object fdtbConsultarPedidosven_id: TIntegerField
      FieldName = 'ven_id'
      Origin = 'ven_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdtbConsultarPedidosgre_id: TIntegerField
      FieldName = 'gre_id'
      Origin = 'gre_id'
    end
    object fdtbConsultarPedidosemp_id: TIntegerField
      FieldName = 'emp_id'
      Origin = 'emp_id'
    end
    object fdtbConsultarPedidospes_id: TIntegerField
      FieldName = 'pes_id'
      Origin = 'pes_id'
    end
    object fdtbConsultarPedidosven_dtvenda: TSQLTimeStampField
      FieldName = 'ven_dtvenda'
      Origin = 'ven_dtvenda'
    end
    object fdtbConsultarPedidospes_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'pes_nome'
      Origin = 'pes_nome'
      Size = 60
    end
    object fdtbConsultarPedidosven_vnfe: TCurrencyField
      FieldName = 'ven_vnfe'
      Origin = 'ven_vnfe'
    end
    object fdtbConsultarPedidosven_tiponfe: TSmallintField
      FieldName = 'ven_tiponfe'
      Origin = 'ven_tiponfe'
    end
    object fdtbConsultarPedidosexp_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'exp_id'
      Origin = 'exp_id'
    end
    object fdtbConsultarPedidosexp_status: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'exp_status'
      Origin = 'exp_status'
    end
    object fdtbConsultarPedidosven_nf_emitida: TSmallintField
      FieldName = 'ven_nf_emitida'
      Origin = 'ven_nf_emitida'
    end
    object fdtbConsultarPedidospStatus: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'pStatus'
      Size = 40
    end
  end
  object ftaConsultarPedidos: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter5
    UpdateTableName = 'Table'
    DatSTableName = 'fdqryConsultarPedidos'
    Left = 788
    Top = 306
  end
  object BackendInserirPessoa: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPOST
    Params = <>
    Resource = 'ServerIntegracao'
    ResourceSuffix = 'NovaVenda'
    Response = ResInserirPessoa
    ConnectTimeout = 100000
    ReadTimeout = 100000
    Left = 380
    Top = 485
  end
  object ResInserirPessoa: TRESTResponse
    ContentType = 'application/json'
    Left = 370
    Top = 585
  end
  object bckPesqCep: TBackendEndpoint
    Provider = EMSProvider1
    Params = <>
    Resource = 'ServerIntegracao'
    ResourceSuffix = 'PesqCEP'
    Response = RespPesqCep
    ConnectTimeout = 100000
    ReadTimeout = 100000
    Left = 505
    Top = 460
  end
  object RespPesqCep: TRESTResponse
    ContentType = 'application/json'
    Left = 500
    Top = 560
  end
  object EMSFireDACClient6: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter6
    Resource = 'ServerIntegracao'
    Left = 990
    Top = 286
  end
  object FDSchemaAdapter6: TFDSchemaAdapter
    Left = 990
    Top = 356
  end
  object ftaConsultarCNPJCPF: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter6
    DatSTableName = 'fdqryConsultarCNPJCPF'
    Left = 1130
    Top = 246
  end
  object fdtbConsultarCNPJCPF: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaConsultarCNPJCPF
    StoreDefs = True
    Left = 1130
    Top = 326
    object fdtbConsultarCNPJCPFpes_id: TIntegerField
      FieldName = 'pes_id'
      Origin = 'pes_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdtbConsultarCNPJCPFpes_cnpj_cpf: TWideStringField
      FieldName = 'pes_cnpj_cpf'
      Origin = 'pes_cnpj_cpf'
      Size = 18
    end
  end
  object bckEndNovaPessoa: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPOST
    Params = <>
    Resource = 'ServerPessoa'
    ResourceSuffix = 'InserirNovaPessoa'
    Response = RespEndNovaPessoa
    ConnectTimeout = 100000
    ReadTimeout = 100000
    Left = 94
    Top = 691
  end
  object RespEndNovaPessoa: TRESTResponse
    ContentType = 'application/json'
    Left = 96
    Top = 766
  end
  object EMSFireDACClient7: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter7
    Resource = 'ServerIntegracao'
    Left = 670
    Top = 576
  end
  object FDSchemaAdapter7: TFDSchemaAdapter
    Left = 670
    Top = 646
  end
  object ftaPesquisaNF: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter7
    DatSTableName = 'fdqryPesquisaNF'
    Left = 810
    Top = 536
  end
  object fdtbPesquisaNF: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaPesquisaNF
    StoreDefs = True
    Left = 810
    Top = 616
    object fdtbPesquisaNFven_id: TIntegerField
      FieldName = 'ven_id'
      Origin = 'ven_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdtbPesquisaNFgre_id: TIntegerField
      FieldName = 'gre_id'
      Origin = 'gre_id'
    end
    object fdtbPesquisaNFemp_id: TIntegerField
      FieldName = 'emp_id'
      Origin = 'emp_id'
    end
    object fdtbPesquisaNFpes_idvd: TIntegerField
      FieldName = 'pes_idvd'
      Origin = 'pes_idvd'
    end
    object fdtbPesquisaNFpes_id: TIntegerField
      FieldName = 'pes_id'
      Origin = 'pes_id'
    end
    object fdtbPesquisaNFven_dtvenda: TSQLTimeStampField
      FieldName = 'ven_dtvenda'
      Origin = 'ven_dtvenda'
    end
    object fdtbPesquisaNFpes_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'pes_nome'
      Origin = 'pes_nome'
      Size = 60
    end
    object fdtbPesquisaNFven_vnfe: TCurrencyField
      FieldName = 'ven_vnfe'
      Origin = 'ven_vnfe'
    end
    object fdtbPesquisaNFven_tiponfe: TSmallintField
      FieldName = 'ven_tiponfe'
      Origin = 'ven_tiponfe'
    end
    object fdtbPesquisaNFexp_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'exp_id'
      Origin = 'exp_id'
    end
    object fdtbPesquisaNFexp_status: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'exp_status'
      Origin = 'exp_status'
    end
    object fdtbPesquisaNFven_nf_emitida: TSmallintField
      FieldName = 'ven_nf_emitida'
      Origin = 'ven_nf_emitida'
    end
    object fdtbPesquisaNFven_cancelada: TSmallintField
      FieldName = 'ven_cancelada'
      Origin = 'ven_cancelada'
    end
  end
  object EMSFireDACClient8: TEMSFireDACClient
    Provider = EMSProvider1
    SchemaAdapter = FDSchemaAdapter8
    Resource = 'ServerIntegracao'
    Left = 990
    Top = 516
  end
  object FDSchemaAdapter8: TFDSchemaAdapter
    Left = 990
    Top = 586
  end
  object ftaPesqXML: TFDTableAdapter
    SchemaAdapter = FDSchemaAdapter8
    UpdateTableName = 'fdtbPesqXML'
    DatSTableName = 'fdtbPesqXML'
    Left = 1130
    Top = 476
  end
  object fdtbPesqXML: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Adapter = ftaPesqXML
    StoreDefs = True
    Left = 1130
    Top = 556
    object fdtbPesqXMLnfc_id: TIntegerField
      FieldName = 'nfc_id'
      Origin = 'nfc_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdtbPesqXMLven_id: TIntegerField
      FieldName = 'ven_id'
      Origin = 'ven_id'
    end
    object fdtbPesqXMLnfc_chave: TWideStringField
      FieldName = 'nfc_chave'
      Origin = 'nfc_chave'
      Size = 44
    end
    object fdtbPesqXMLnfc_xml: TBlobField
      FieldName = 'nfc_xml'
      Origin = 'nfc_xml'
    end
  end
end
