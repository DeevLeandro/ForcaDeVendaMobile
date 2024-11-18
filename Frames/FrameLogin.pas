unit FrameLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects;

type
  TFremLogin = class(TFrame)
    recFundo: TRectangle;
    lblnome: TLabel;
    btnEntrar: TRoundRect;
    Rectangle1: TRectangle;
  private
    FPessoa: string;
    FEmpresa: string;
    FGrupo: string;
    FNomeEmpresa: string;
    FToken: string;
    procedure SetEmpresa(const Value: string);
    procedure SetGrupo(const Value: string);
    procedure SetPessoa(const Value: string);
    procedure SetNomeEmpresa(const Value: string);
    procedure SetToken(const Value: string);
    { Private declarations }
  public

      property Grupo: string read FGrupo write SetGrupo;
      property Empresa: string read FEmpresa write SetEmpresa;
      property Pessoa: string read FPessoa write SetPessoa;
       property NomeEmpresa: string read FNomeEmpresa write SetNomeEmpresa;
       property Token: string read FToken write SetToken;
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses FrmLogin, udmPrincipal, udmVenda, FrmMenu;

{ TFremLogin }

procedure TFremLogin.SetEmpresa(const Value: string);
begin
  FEmpresa := Value;
end;

procedure TFremLogin.SetGrupo(const Value: string);
begin
  FGrupo := Value;
end;

procedure TFremLogin.SetNomeEmpresa(const Value: string);
begin  FNomeEmpresa := Value;
end;

procedure TFremLogin.SetPessoa(const Value: string);
begin
  FPessoa := Value;
end;

procedure TFremLogin.SetToken(const Value: string);
begin
  FToken := Value;
end;

end.
