unit udmVenda;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Comp.UI, FireDAC.Stan.StorageJSON,System.JSON,
  REST.Backend.EMSProvider, FireDAC.Stan.Option, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Stan.Param,
  FireDAC.Stan.Error, REST.Backend.EMSServices, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, REST.Backend.EMSFireDAC, FireDAC.Stan.Async,
  REST.Backend.ServiceTypes, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Backend.EndPoint;

type
  TdmVenda = class(TDataModule)
    EMSProvider1: TEMSProvider;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDSchemaAdapter1: TFDSchemaAdapter;
    EMSFireDACClient1: TEMSFireDACClient;
    fdtbPesquisaPessoa: TFDMemTable;
    ftaPesquisaPessoa: TFDTableAdapter;
    fdtbPesquisaPessoapes_cnpj_cpf: TWideStringField;
    fdtbPesquisaPessoapes_nome: TWideStringField;
    fdtbPesquisaPessoapes_uf: TWideStringField;
    fdtbPesquisaPessoapes_id: TIntegerField;
    FDSchemaAdapter2: TFDSchemaAdapter;
    EMSFireDACClient2: TEMSFireDACClient;
    fdtbPesquisaProdutoVenda: TFDMemTable;
    ftaPesquisaProdutoVenda: TFDTableAdapter;
    fdtbPesquisaProdutoVendapro_id: TIntegerField;
    fdtbPesquisaProdutoVendapro_catalogo: TWideStringField;
    fdtbPesquisaProdutoVendapro_ean: TWideStringField;
    fdtbPesquisaProdutoVendaest_qtde: TBCDField;
    fdtbPesquisaProdutoVendamar_descricao: TWideStringField;
    fdtbPesquisaProdutoVendagrp_descricao: TWideStringField;
    fdtbPesquisaProdutoVendaest_custo: TCurrencyField;
    fdtbPesquisaProdutoVendaest_valor_fixo_atacado: TCurrencyField;
    fdtbPesquisaProdutoVendaest_valor_fixo_varejo: TCurrencyField;
    fdtbPesquisaProdutoVendaest_valor_fixo_promocao: TCurrencyField;
    fdtbPesquisaProdutoVendapro_tipo_calculo_venda: TWideStringField;
    fdtbPesquisaProdutoVendavVendaCalculado: TCurrencyField;
    fdtbPesquisaProdutoVendapro_consulta: TWideStringField;
    fdtbProduto: TFDMemTable;
    fdtbProdutopProID: TStringField;
    fdtbProdutopProduto: TStringField;
    fdtbProdutopQtde: TStringField;
    fdtbProdutopValor: TCurrencyField;
    fdtbProdutopMarca: TStringField;
    fdtbProdutopValorTotal: TCurrencyField;
    fdtbProdutopTotalGeral: TAggregateField;
    fdtbPesquisaPessoagrt_id: TIntegerField;
    fdtbPesquisaProdutoVendacla_id: TIntegerField;
    fdtbProdutopClaID: TStringField;
    FDSchemaAdapter3: TFDSchemaAdapter;
    EMSFireDACClient3: TEMSFireDACClient;
    fdtbTipoPagamento: TFDMemTable;
    ftaTipoPagamento: TFDTableAdapter;
    fdtbTipoPagamentotpg_id: TIntegerField;
    fdtbTipoPagamentotpg_descricao: TWideStringField;
    FDSchemaAdapter4: TFDSchemaAdapter;
    EMSFireDACClient4: TEMSFireDACClient;
    fdtbFormaPagamento: TFDMemTable;
    ftaFormaPagamento: TFDTableAdapter;
    fdtbFormaPagamentofop_id: TIntegerField;
    fdtbFormaPagamentogre_id: TIntegerField;
    fdtbFormaPagamentoemp_id: TIntegerField;
    fdtbFormaPagamentofop_descricao: TWideStringField;
    fdtbFormaPagamentofop_pgminimo: TCurrencyField;
    fdtbFormaPagamentofop_pginicial: TCurrencyField;
    fdtbFormaPagamentofop_pgfinal: TCurrencyField;
    fdtbFormaPagamentotpg_id: TIntegerField;
    fdtbFormaPagamentofop_qtde_parcelas: TSmallintField;
    fdtbFormaPagamentofop_intervalo_parcelas: TSmallintField;
    fdtbFormaPagamentofop_qtde_dias: TSmallintField;
    fdtbFormaPagamentofop_status: TSmallintField;
    fdtbFormaPagamentofop_dia_venc: TSmallintField;
    fdtbFinanceiro: TFDMemTable;
    fdtbFinanceiropQtde: TStringField;
    fdtbFinanceiropDtVencimento: TStringField;
    fdtbFinanceiropTipoPg: TIntegerField;
    fdtbFinanceiropValorParcela: TCurrencyField;
    fdtbFinanceiropNumParcela: TStringField;
    BackendInserirVenda: TBackendEndpoint;
    ResInserirVenda: TRESTResponse;
    FDSchemaAdapter5: TFDSchemaAdapter;
    EMSFireDACClient5: TEMSFireDACClient;
    fdtbConsultarPedidos: TFDMemTable;
    ftaConsultarPedidos: TFDTableAdapter;
    fdtbConsultarPedidosven_id: TIntegerField;
    fdtbConsultarPedidosgre_id: TIntegerField;
    fdtbConsultarPedidosemp_id: TIntegerField;
    fdtbConsultarPedidospes_id: TIntegerField;
    fdtbConsultarPedidosven_dtvenda: TSQLTimeStampField;
    fdtbConsultarPedidospes_nome: TWideStringField;
    fdtbConsultarPedidosven_vnfe: TCurrencyField;
    fdtbConsultarPedidosven_tiponfe: TSmallintField;
    fdtbConsultarPedidosexp_id: TIntegerField;
    fdtbConsultarPedidosexp_status: TIntegerField;
    fdtbConsultarPedidospStatus: TStringField;
    fdtbConsultarPedidosven_nf_emitida: TSmallintField;
    BackendInserirPessoa: TBackendEndpoint;
    ResInserirPessoa: TRESTResponse;
    bckPesqCep: TBackendEndpoint;
    RespPesqCep: TRESTResponse;
    fdtbPesquisaPessoapes_classificacao: TWideStringField;
    fdtbPesquisaProdutoVendagrp_margem: TWideStringField;
    fdtbPesquisaProdutoVendagrp_margem_trabalho: TSmallintField;
    fdtbPesquisaProdutoVendagrp_margem_atacado: TWideStringField;
    EMSFireDACClient6: TEMSFireDACClient;
    FDSchemaAdapter6: TFDSchemaAdapter;
    ftaConsultarCNPJCPF: TFDTableAdapter;
    fdtbConsultarCNPJCPF: TFDMemTable;
    fdtbConsultarCNPJCPFpes_id: TIntegerField;
    fdtbConsultarCNPJCPFpes_cnpj_cpf: TWideStringField;
    bckEndNovaPessoa: TBackendEndpoint;
    RespEndNovaPessoa: TRESTResponse;
    EMSFireDACClient7: TEMSFireDACClient;
    FDSchemaAdapter7: TFDSchemaAdapter;
    ftaPesquisaNF: TFDTableAdapter;
    fdtbPesquisaNF: TFDMemTable;
    fdtbPesquisaNFven_id: TIntegerField;
    fdtbPesquisaNFgre_id: TIntegerField;
    fdtbPesquisaNFemp_id: TIntegerField;
    fdtbPesquisaNFpes_idvd: TIntegerField;
    fdtbPesquisaNFpes_id: TIntegerField;
    fdtbPesquisaNFven_dtvenda: TSQLTimeStampField;
    fdtbPesquisaNFpes_nome: TWideStringField;
    fdtbPesquisaNFven_vnfe: TCurrencyField;
    fdtbPesquisaNFven_tiponfe: TSmallintField;
    fdtbPesquisaNFexp_id: TIntegerField;
    fdtbPesquisaNFexp_status: TIntegerField;
    fdtbPesquisaNFven_nf_emitida: TSmallintField;
    fdtbPesquisaNFven_cancelada: TSmallintField;
    EMSFireDACClient8: TEMSFireDACClient;
    FDSchemaAdapter8: TFDSchemaAdapter;
    ftaPesqXML: TFDTableAdapter;
    fdtbPesqXML: TFDMemTable;
    fdtbPesqXMLnfc_id: TIntegerField;
    fdtbPesqXMLven_id: TIntegerField;
    fdtbPesqXMLnfc_chave: TWideStringField;
    fdtbPesqXMLnfc_xml: TBlobField;
    fdtbPesquisaProdutoVendavalorpromocional: TBCDField;
    fdtbProdutopTotal: TCurrencyField;
    fdtbProdutopTotalDesc: TCurrencyField;
    fdtbProdutovTotal: TAggregateField;
    fdtbProdutovTotalDesc: TAggregateField;
    fdtbProdutopDesc: TCurrencyField;
    fdtbProdutopValorOriginal: TCurrencyField;
    fdtbProdutovTotalOriginal: TAggregateField;
    procedure fdtbConsultarPedidosCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private

    FIDCliente: String;
    FIDProduto: string;
    FIDGrt: string;
    FLocalVenda: string;
    FEmiteNFCe: string;
    FIDCla: string;
    FUF: string;
    FTipoMovim: string;
    FIDTransp: string;
    FClassicacaoCliente: Integer;


    procedure SetIDCliente(Const value: string);
    procedure SetIDProduto(Const value: string);
    procedure SetIDGrt(const Value: string);
    procedure SetEmiteNFCe(const Value: string);
    procedure SetIDCla(const Value: string);
    procedure SetLocalVenda(const Value: string);
    procedure SetTipoMovim(const Value: string);
    procedure SetUF(const Value: string);
    procedure SetIDTransp(const Value: string);
    procedure SetClassicacaoCliente(const Value: Integer);


    { Private declarations }
  public

  endereco,bairro,cidade,uf_,ibge,ibge_uf,complemento,longitude,latitude : string;

  function PesquisaPessoa(pGrupo,pEmpresa,pTipoPessoa,pCampo,pValor : string): String;
  function PesqPedidos(pGrupo,pEmpresa,pIDVendedor, pToken, pIDVenda : string): String;
  function PesquisaNF(pGrupo, pEmpresa, pIDVendedor, pToken, pIDVenda, pDtI, pDtF : string): String;
  function PesqXML(pGrupo, pEmpresa, pToken, pIDVenda : string): String;
  function PesquisaProdutoVenda(pGrupo,pEmpresa,pCampo,pValor, pPromocao, pRegiao, pGrupoTributo, pTipoProduto, pParticipaWMS, pTipoNFe : string): String;
  function PesquisaTipoPagamento(): String;
  function PesquisaFormaPagamento(pGrupo,pValor1, pTipoPag : string): String;
  function PesqCep(pCep : string): String;
  function NovaVenda(pGrupo,pEmpresa,pToken,pPessoa,pVendedor,
                     pTransp,pTipoPg : string; pValorNFe,pValorProd: Double ): String;
  function RemoveAcento(const pText: string): string;
  Function tirapontos(texto : String) : String;
  function consultaPessoa(pGrupo, pCNPJCPF: string): Integer;
  function NovaPessoa(Grupo,Empresa,Nome,Cnpj,endereco,bairro,cidade,numero,uf,ibge,
                          Cep,email,complemento,ativo,TipoEmpresa,Celular,RazaoSocial,IE,pLogin: String): string;

  Function PrimeiroNome(texto : String) : String;


    property IDCliente: string read FIDCliente write SetIDCliente;
    property IDTransp: string read FIDTransp write SetIDTransp;
    property IDProduto: string read FIDProduto write SetIDProduto;
    property IDGrt: string read FIDGrt write SetIDGrt;
    property LocalVenda: string read FLocalVenda write SetLocalVenda;
    property TipoMovim: string read FTipoMovim write SetTipoMovim;
    property EmiteNFCe: string read FEmiteNFCe write SetEmiteNFCe;
    property UF: string read FUF write SetUF;
    property IDCla: string read FIDCla write SetIDCla;
    property ClassicacaoCliente: Integer read FClassicacaoCliente write SetClassicacaoCliente;






    { Public declarations }
  end;

var
  dmVenda: TdmVenda;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses  udmPrincipal, FrmLogin;

{ TdmVenda }

function TdmVenda.consultaPessoa(pGrupo, pCNPJCPF: string): Integer;
begin

   Result := 0;

  fdtbConsultarCNPJCPF.Close;
  ftaConsultarCNPJCPF.DatStableName := 'fdqryConsultarCNPJCPF';

  EMSFireDACClient6.GetEndpoint.ResourceSuffix := 'ConsultarCNPJCPF';
  EMSFireDACClient6.GetEndpoint.Params.Clear;
  EMSFireDACClient6.GetEndpoint.Params.AddItem('Grupo', pGrupo);
  EMSFireDACClient6.GetEndpoint.Params.AddItem('Cnpj', pCNPJCPF);
  EMSFireDACClient6.GetData;

  result := fdtbConsultarCNPJCPF.RecordCount;

end;

procedure TdmVenda.DataModuleCreate(Sender: TObject);
begin
 EMSProvider1.URLHost     := 'equilibrioapperp.pontalsistemas.com.br';
 EMSProvider1.URLPort     :=  0;
 EMSProvider1.URLProtocol := 'https';

//  EMSProvider1.URLHost     := '187.0.7.128';
//  EMSProvider1.URLPort     :=  8080;
//  EMSProvider1.URLProtocol := 'http';


// EMSProvider1.URLHost     := '172.20.0.107';
// EMSProvider1.URLPort     :=  8080;
// EMSProvider1.URLProtocol := 'http';

end;

procedure TdmVenda.fdtbConsultarPedidosCalcFields(DataSet: TDataSet);
begin

  if fdtbConsultarPedidosexp_status.AsString = '' then
   fdtbConsultarPedidospStatus.AsString := 'Pedido em Analise';

  if fdtbConsultarPedidosexp_status.AsString = '0' then
   begin

    if fdtbConsultarPedidosven_nf_emitida.AsInteger = 0 then
     fdtbConsultarPedidospStatus.AsString := 'Pedido aguarando emissão da NFe';

    if fdtbConsultarPedidosven_nf_emitida.AsInteger = 1 then
     fdtbConsultarPedidospStatus.AsString := 'NFe encaminhada a transportadora.';

   end;


end;

function TdmVenda.NovaPessoa(Grupo, Empresa, Nome, Cnpj, endereco, bairro,
  cidade, numero, uf, ibge, Cep, email, complemento,   ativo,
  TipoEmpresa, Celular, RazaoSocial, IE, pLogin: String): string;
var
  CabechalhoJSON : TJSONObject;
begin

  CabechalhoJSON := TJSONObject.Create;
    try
     bckEndNovaPessoa.Params.Clear;
     bckEndNovaPessoa.ClearBody;
        CabechalhoJSON.AddPair('Grupo', Grupo);
        CabechalhoJSON.AddPair('Empresa', Empresa);
        CabechalhoJSON.AddPair('Nome', Nome);
        CabechalhoJSON.AddPair('CNPJCPF', Cnpj);
        CabechalhoJSON.AddPair('Endereco', endereco);
        CabechalhoJSON.AddPair('Bairro', bairro);
        CabechalhoJSON.AddPair('Cidade', cidade);
        CabechalhoJSON.AddPair('Numero', numero);
        CabechalhoJSON.AddPair('UF', uf);
        CabechalhoJSON.AddPair('IBGE', ibge);
        CabechalhoJSON.AddPair('CEP', Cep);
        CabechalhoJSON.AddPair('Email', email);
        CabechalhoJSON.AddPair('Complemento', complemento);
        CabechalhoJSON.AddPair('Ativo', ativo);
        CabechalhoJSON.AddPair('TipoPessoa', TipoEmpresa);
        CabechalhoJSON.AddPair('Celular', Celular);
        CabechalhoJSON.AddPair('RazaoSocial', RazaoSocial);
        CabechalhoJSON.AddPair('Contato', PrimeiroNome(Nome));
        CabechalhoJSON.AddPair('Obs', '');
        CabechalhoJSON.AddPair('IE', IE);
        CabechalhoJSON.AddPair('IDLogin', pLogin);
        CabechalhoJSON.AddPair('Socio', '');
     bckEndNovaPessoa.AddBody(CabechalhoJSON);
     bckEndNovaPessoa.Execute;
    finally
     CabechalhoJSON.Free;
    end;

   result := TEncoding.UTF8.GetString(RespEndNovaPessoa.RawBytes);

  end;

function TdmVenda.NovaVenda(pGrupo, pEmpresa,pToken,pPessoa,pVendedor,pTransp,
   pTipoPg: string; pValorNFe,pValorProd: Double): String;
var
 CabechalhoJSON  : TJSONObject;
 DadosJSON       : TJSONObject;
 ItensJSON       : TJSONArray;
 FinanceirosJSON  : TJSONArray;
begin


  try

    CabechalhoJSON := TJSONObject.Create;
    try

        CabechalhoJSON.AddPair('Grupo',pGrupo);
        CabechalhoJSON.AddPair('Empresa',pEmpresa);
        CabechalhoJSON.AddPair('Token',pToken);
        CabechalhoJSON.AddPair('IDPessoa',pPessoa);
        CabechalhoJSON.AddPair('IDVendedor',pVendedor);
        CabechalhoJSON.AddPair('IDTransp',pTransp);
        CabechalhoJSON.AddPair('LocalVenda','1');
        CabechalhoJSON.AddPair('TipoMovim','1');
        CabechalhoJSON.AddPair('TipoPg',pTipoPg);
        CabechalhoJSON.AddPair('EmiteNFCe','0');
        CabechalhoJSON.AddPair('vProduto',pValorNFe);
        CabechalhoJSON.AddPair('vNFe',pValorProd);
        // Cadastrar Produto
        //-----------------------------------------------------------------------------------
        ItensJSON := TJSONArray.Create;
        CabechalhoJSON.AddPair('Itens', ItensJSON);

        Self.fdtbProduto.First;
        while not Self.fdtbProduto.Eof do
         begin

          DadosJSON := TJSONObject.Create;

          DadosJSON.AddPair('IDProduto', Self.fdtbProdutopProID.AsString);
          DadosJSON.AddPair('Qtde', Self.fdtbProdutopQtde.AsString);
          DadosJSON.AddPair('vUnt', Self.fdtbProdutopValor.AsString);

          if Self.fdtbProdutopTotalDesc.AsString = '' then
           begin
           DadosJSON.AddPair('vTotalItem', Self.fdtbProdutopValorOriginal.AsString);
           DadosJSON.AddPair('vDesc', '0');
           end
            else
             begin
              DadosJSON.AddPair('vTotalItem', Self.fdtbProdutopTotalDesc.AsString);
              DadosJSON.AddPair('vDesc', Self.fdtbProdutopDesc.AsString);
             end;



          ItensJSON.Add(DadosJSON);
          Self.fdtbProduto.Next;

         end;

        // Cadastrar Financeiro
        //----------------------------------------------------------------------------------
        FinanceirosJSON := TJSONArray.Create;
        CabechalhoJSON.AddPair('Financeiro', FinanceirosJSON);

        Self.fdtbFinanceiro.First;
        while not Self.fdtbFinanceiro.Eof do
         begin

          DadosJSON := TJSONObject.Create;

           DadosJSON.AddPair('IDForPg', Self.fdtbFormaPagamentofop_id.AsString);
           DadosJSON.AddPair('Qtde', Self.fdtbFinanceiropQtde.AsString);
           DadosJSON.AddPair('DtVencimento', Self.fdtbFinanceiropDtVencimento.AsString);
           DadosJSON.AddPair('Parcela', Self.fdtbFinanceiropNumParcela.AsString);
           DadosJSON.AddPair('vParcela', Self.fdtbFinanceiropValorParcela.AsString);

          FinanceirosJSON.Add(DadosJSON);
          Self.fdtbFinanceiro.Next;

         end;

      //------------------------------------------------------------------------------------
      BackendInserirVenda.AddBody(CabechalhoJSON);
      BackendInserirVenda.Execute;
      //------------------------------------------------------------------------------------



     if  Pos('erro', TEncoding.UTF8.GetString(ResInserirVenda.RawBytes)) <> 0  then
        Result :=  'Erro: ' +tirapontos(copy(TEncoding.UTF8.GetString(ResInserirVenda.RawBytes),10,50));

      if  Pos('Venda', TEncoding.UTF8.GetString(ResInserirVenda.RawBytes)) <> 0  then
        Result := tirapontos(copy(TEncoding.UTF8.GetString(ResInserirVenda.RawBytes),11,50));



    finally
      CabechalhoJSON.Free;
    end;

  except
    on E: Exception do
      raise Exception.Create('Erro na gravação da venda! ' + #13 + ' ' +
        E.Message);
  end;


end;

function TdmVenda.PesquisaFormaPagamento(pGrupo, pValor1,
  pTipoPag: string): String;
begin

 fdtbFormaPagamento.Close;
 ftaFormaPagamento.DatSTableName := 'fdqryFormaPagamento';

  EMSFireDACClient4.GetEndpoint.Params.Clear;
  EMSFireDACClient4.GetEndpoint.ResourceSuffix := 'PesqFormaPagamento';
  EMSFireDACClient4.GetEndpoint.Params.AddItem('Grupo', pGrupo);
  EMSFireDACClient4.GetEndpoint.Params.AddItem('Valor', pValor1);
  EMSFireDACClient4.GetEndpoint.Params.AddItem('TipoPagamento', pTipoPag);
  EMSFireDACClient4.GetData;

  fdtbFormaPagamento.RecordCount;

end;

function TdmVenda.PesquisaNF(pGrupo, pEmpresa, pIDVendedor, pToken,
  pIDVenda, pDtI, pDtF: string): String;
begin

    fdtbPesquisaNF.Close;
 ftaPesquisaNF.DatSTableName := 'fdqryPesquisaNF';

  EMSFireDACClient7.GetEndpoint.Params.Clear;
  EMSFireDACClient7.GetEndpoint.ResourceSuffix := 'PesquisarNF';
  EMSFireDACClient7.GetEndpoint.Params.AddItem('Grupo', pGrupo);
  EMSFireDACClient7.GetEndpoint.Params.AddItem('Empresa', pEmpresa);
  EMSFireDACClient7.GetEndpoint.Params.AddItem('IDVendedor', pIDVendedor);
  EMSFireDACClient7.GetEndpoint.Params.AddItem('Token', pToken);
  EMSFireDACClient7.GetEndpoint.Params.AddItem('IDVenda', pIDVenda);
  EMSFireDACClient7.GetEndpoint.Params.AddItem('DtI', pDtI);
  EMSFireDACClient7.GetEndpoint.Params.AddItem('DtF', pDtF);
  EMSFireDACClient7.GetData;

  fdtbPesquisaNF.RecordCount;


end;

function TdmVenda.PesquisaPessoa(pGrupo, pEmpresa, pTipoPessoa,pCampo,pValor: string): String;
begin

 fdtbPesquisaPessoa.Close;
 ftaPesquisaPessoa.DatSTableName := 'fdqryPesquisaPessoa';

  EMSFireDACClient1.GetEndpoint.Params.Clear;
  EMSFireDACClient1.GetEndpoint.ResourceSuffix := 'Pessoa';
  EMSFireDACClient1.GetEndpoint.Params.AddItem('Grupo', pGrupo);
  EMSFireDACClient1.GetEndpoint.Params.AddItem('Empresa', pEmpresa);
  EMSFireDACClient1.GetEndpoint.Params.AddItem('TIPO_PESSOA', pTipoPessoa);
  EMSFireDACClient1.GetEndpoint.Params.AddItem('CAMPO', pCampo);
  EMSFireDACClient1.GetEndpoint.Params.AddItem('VALOR', pValor);
  EMSFireDACClient1.GetEndpoint.Params.AddItem('PES_ID', '0');
  EMSFireDACClient1.GetData;

  fdtbPesquisaPessoa.RecordCount;


end;

function TdmVenda.PesqCep(pCep: string ): String;
 var
 pMsn : string;
begin

  bckPesqCep.Params.Clear;
  bckPesqCep.Params.AddItem('cep', pCEP);
  bckPesqCep.Execute;

     endereco  :=  RespPesqCep.Headers.Values['endereco'];
     bairro    :=  RespPesqCep.Headers.Values['bairro'];
     cidade    :=  RespPesqCep.Headers.Values['cidade'];
     uf_        :=  RespPesqCep.Headers.Values['uf'];
     ibge      :=  RespPesqCep.Headers.Values['ibge'];
     ibge_uf   :=  RespPesqCep.Headers.Values['ibge_uf'];
     complemento  := RespPesqCep.Headers.Values['complemento'];
     longitude    := RespPesqCep.Headers.Values['longitude'];
     latitude     := RespPesqCep.Headers.Values['latitude'];

  if RespPesqCep.Headers.Values['endereco'] <> '' then
   Result := '1';

  RespPesqCep.Headers.Clear;
  bckPesqCep.Params.Clear;

end;

function TdmVenda.PesqPedidos(pGrupo, pEmpresa, pIDVendedor, pToken, pIDVenda: string): String;
begin

 fdtbConsultarPedidos.Close;
 ftaConsultarPedidos.DatSTableName := 'fdqryConsultarPedidos';

  EMSFireDACClient5.GetEndpoint.Params.Clear;
  EMSFireDACClient5.GetEndpoint.ResourceSuffix := 'PesqPedidos';
  EMSFireDACClient5.GetEndpoint.Params.AddItem('Grupo', pGrupo);
  EMSFireDACClient5.GetEndpoint.Params.AddItem('Empresa', pEmpresa);
  EMSFireDACClient5.GetEndpoint.Params.AddItem('IDVendedor', pIDVendedor);
  EMSFireDACClient5.GetEndpoint.Params.AddItem('Token', pToken);
  EMSFireDACClient5.GetEndpoint.Params.AddItem('IDVenda', pIDVenda);
  EMSFireDACClient5.GetData;

  fdtbConsultarPedidos.RecordCount;

end;

function TdmVenda.PesquisaProdutoVenda(pGrupo, pEmpresa, pCampo,
  pValor, pPromocao, pRegiao, pGrupoTributo, pTipoProduto, pParticipaWMS, pTipoNFe: string): String;
begin
 fdtbPesquisaProdutoVenda.Close;
 ftaPesquisaProdutoVenda.DatSTableName := 'fdqryPesquisaProdutoVenda';

  EMSFireDACClient2.GetEndpoint.Params.Clear;
  EMSFireDACClient2.GetEndpoint.ResourceSuffix := 'Produto';
  EMSFireDACClient2.GetEndpoint.Params.AddItem('Grupo', pGrupo);
  EMSFireDACClient2.GetEndpoint.Params.AddItem('Empresa', pEmpresa);
  EMSFireDACClient2.GetEndpoint.Params.AddItem('CAMPO', pCampo);
  EMSFireDACClient2.GetEndpoint.Params.AddItem('VALOR', pValor);
  EMSFireDACClient2.GetEndpoint.Params.AddItem('Promocao', pPromocao);
  EMSFireDACClient2.GetEndpoint.Params.AddItem('Regiao', pRegiao);
  EMSFireDACClient2.GetEndpoint.Params.AddItem('GrupoTributo', pGrupoTributo);
  EMSFireDACClient2.GetEndpoint.Params.AddItem('TipoProduto', pTipoProduto);
  EMSFireDACClient2.GetEndpoint.Params.AddItem('ParticipaWMS', pParticipaWMS);
  EMSFireDACClient2.GetEndpoint.Params.AddItem('TipoNFe', pTipoNFe);
  EMSFireDACClient2.GetEndpoint.Params.AddItem('LimiteBusca', '1');
  EMSFireDACClient2.GetEndpoint.Params.AddItem('PES_ID', '0');
  EMSFireDACClient2.GetData;

  fdtbPesquisaProdutoVenda.RecordCount;
end;

function TdmVenda.PesquisaTipoPagamento: String;
begin

fdtbTipoPagamento.Close;
 ftaTipoPagamento.DatSTableName := 'fdqryTipoPagamento';

  EMSFireDACClient3.GetEndpoint.Params.Clear;
  EMSFireDACClient3.GetEndpoint.ResourceSuffix := 'PesTipoPagamento';

  EMSFireDACClient3.GetData;

  fdtbTipoPagamento.RecordCount;

 end;




function TdmVenda.PesqXML(pGrupo, pEmpresa, pToken, pIDVenda: string): String;
begin

 fdtbPesqXML.Close;
 ftaPesqXML.DatSTableName := 'fdqryPesqXML';

  EMSFireDACClient8.GetEndpoint.Params.Clear;
  EMSFireDACClient8.GetEndpoint.ResourceSuffix := 'PesqXML';
  EMSFireDACClient8.GetEndpoint.Params.AddItem('Grupo', pGrupo);
  EMSFireDACClient8.GetEndpoint.Params.AddItem('Empresa', pEmpresa);
  EMSFireDACClient8.GetEndpoint.Params.AddItem('Token', pToken);
  EMSFireDACClient8.GetEndpoint.Params.AddItem('IDVenda', pIDVenda);
  EMSFireDACClient8.GetData;

  fdtbPesqXML.RecordCount;


end;

function TdmVenda.PrimeiroNome(texto: String): String;
var
PNome : String;
begin

PNome := '';
if pos (' ',texto) <> 0 then
PNome := copy (texto, 1, pos (' ', texto) - 1);


end;

function TdmVenda.RemoveAcento(const pText: string): string;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := string(USAscii20127(pText));
end;

procedure TdmVenda.SetClassicacaoCliente(const Value: Integer);
begin
  FClassicacaoCliente := Value;
end;

procedure TdmVenda.SetEmiteNFCe(const Value: string);
begin
  FEmiteNFCe := Value;
end;

procedure TdmVenda.SetIDCla(const Value: string);
begin
  FIDCla := Value;
end;

procedure TdmVenda.SetIDCliente(const value: string);
begin
FIDCliente := value;
end;

procedure TdmVenda.SetIDGrt(const Value: string);
begin
  FIDGrt := Value;
end;

procedure TdmVenda.SetIDProduto(const value: string);
begin
FIDProduto := value;
end;

procedure TdmVenda.SetIDTransp(const Value: string);
begin
  FIDTransp := Value;
end;

procedure TdmVenda.SetLocalVenda(const Value: string);
begin
  FLocalVenda := Value;
end;

procedure TdmVenda.SetTipoMovim(const Value: string);
begin
  FTipoMovim := Value;
end;

procedure TdmVenda.SetUF(const Value: string);
begin
  FUF := Value;
end;

function TdmVenda.tirapontos(texto: String): String;
begin

  While pos('}', Texto) <> 0 Do
         delete(Texto,pos('}', Texto),1);
  While pos('"', Texto) <> 0 Do
         delete(Texto,pos('"', Texto),1);

        Result := Texto;
end;

end.
