unit udmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Comp.UI, FireDAC.Stan.StorageJSON,
  REST.Backend.EMSProvider, FireDAC.Stan.Option, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Stan.Param,
  FireDAC.Stan.Error, REST.Backend.EMSServices, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, REST.Backend.EMSFireDAC;

type
  TdmPrincipal = class(TDataModule)
    EMSProvider1: TEMSProvider;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDSchemaAdapter1: TFDSchemaAdapter;
    EMSFireDACClient1: TEMSFireDACClient;
    fdtbLogin: TFDMemTable;
    fdtbLoginpes_id: TIntegerField;
    fdtbLoginpes_cnpj_cpf: TWideStringField;
    fdtbLoginpes_nome: TWideStringField;
    fdtbLogingre_id: TIntegerField;
    fdtbLoginemp_id: TIntegerField;
    fdtbLoginpes_uf: TWideStringField;
    fdtbLoginpes_endereco: TWideStringField;
    fdtbLoginpes_bairro: TWideStringField;
    fdtbLoginpes_telefone_principal: TWideStringField;
    fdtbLoginpes_celular_principal: TWideStringField;
    fdtbLoginpes_cidade: TWideStringField;
    fdtbLoginpes_cep: TWideStringField;
    fdtbLoginpes_contato: TWideStringField;
    fdtbLoginpes_complemento: TWideStringField;
    fdtbLoginjur_razao_social: TWideStringField;
    fdtbLoginjur_ie: TWideStringField;
    fdtbLoginpes_email: TWideStringField;
    fdtbLogintie_id: TIntegerField;
    fdtbLogintie_descricao: TWideStringField;
    fdtbLoginjur_farmaceutico: TWideStringField;
    fdtbLoginpla_id: TIntegerField;
    ftaLogin: TFDTableAdapter;
    fdtbLoginpes_id_1: TIntegerField;
    fdtbLogincon_token: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    FEmpresa: String;
    FGrupo: string;
    FPessoa: string;
    FNomeEmpresa: string;
    FToken: String;

    procedure SetEmpresa(Const value: string);
    procedure SetGrupo(Const value: string);
    procedure SetPessoa(const Value: string);
    procedure SetToken(const Value: String);

    procedure SetNomeEmpresa(const Value: string);
    { Private declarations }
  public

   function Login(pUsuario,pSenha : String): Boolean;


    property Token :String read FToken write SetToken;
    property Grupo: string read FGrupo write SetGrupo;
    property Empresa: string read FEmpresa write SetEmpresa;
    property Pessoa: string read FPessoa write SetPessoa;
    property NomeEmpresa: string read FNomeEmpresa write SetNomeEmpresa;


    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin

//  EMSProvider1.URLHost     := '187.0.7.128';
//  EMSProvider1.URLPort     :=  8080;
//  EMSProvider1.URLProtocol := 'http';

  EMSProvider1.URLHost     := 'equilibrioapperp.pontalsistemas.com.br';
  EMSProvider1.URLPort     :=  0;
  EMSProvider1.URLProtocol := 'https';

// EMSProvider1.URLHost     := '172.20.0.107';
// EMSProvider1.URLPort     :=  8080;
// EMSProvider1.URLProtocol := 'http';

end;


function TdmPrincipal.Login(pUsuario, pSenha: String): Boolean;
begin

   fdtbLogin.Close;

  ftaLogin.DatSTableName := 'fdqrylogin';

  EMSFireDACClient1.GetEndpoint.Params.Clear;
  EMSFireDACClient1.GetEndpoint.Params.AddItem('usuario', pUsuario);
  EMSFireDACClient1.GetEndpoint.Params.AddItem('senha', pSenha);
  EMSFireDACClient1.GetData;

Result := (fdtbLogin.RecordCount > 0)


end;



procedure TdmPrincipal.SetEmpresa(const value: string);
begin
fEmpresa := Value;
end;

procedure TdmPrincipal.SetGrupo(const value: string);
begin
FGrupo := Value;
end;

procedure TdmPrincipal.SetNomeEmpresa(const Value: string);
begin
  FNomeEmpresa := Value;
end;

procedure TdmPrincipal.SetPessoa(const Value: string);
begin
FPessoa := Value;
end;

procedure TdmPrincipal.SetToken(const Value: String);
begin
  FToken := Value;
end;

end.
