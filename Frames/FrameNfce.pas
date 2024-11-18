unit FrameNfce;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TFremNfce = class(TFrame)
    recFundo: TRectangle;
    lblQtdeTitulos: TLabel;
    lblIntervalo: TLabel;
    btnGerar: TRoundRect;
    lblTextBotao: TLabel;
    lblDescricao: TLabel;
    btnVerde: TRectangle;
    btnVermelho: TRectangle;
    lblCancelada: TLabel;
    lblStatus: TLabel;
    btVermelho: TRectangle;
    btVerd: TRectangle;
  private
    FPessoa: string;
    FIDvenda: Integer;
    FEmpresa: string;
    FGrupo: string;
    FToken: string;
    FNFCCancelada: Integer;
    FNFCEmitido: Integer;
    procedure SetEmpresa(const Value: string);
    procedure SetGrupo(const Value: string);
    procedure SetIDvenda(const Value: Integer);
    procedure SetPessoa(const Value: string);
    procedure SetToken(const Value: string);
    procedure SetNFCCancelada(const Value: Integer);
    procedure SetNFCEmitido(const Value: Integer);
    { Private declarations }
  public

  property IDvenda: Integer read FIDvenda write SetIDvenda;
  property Grupo: string read FGrupo write SetGrupo;
  property Empresa: string read FEmpresa write SetEmpresa;
  property Pessoa: string read FPessoa write SetPessoa;
  property Token: string read FToken write SetToken;
  property NFCCancelada: Integer read FNFCCancelada write SetNFCCancelada;
  property NFCEmitido: Integer read FNFCEmitido write SetNFCEmitido;

    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TFremNfce }

procedure TFremNfce.SetEmpresa(const Value: string);
begin
  FEmpresa := Value;
end;

procedure TFremNfce.SetGrupo(const Value: string);
begin
  FGrupo := Value;
end;

procedure TFremNfce.SetIDvenda(const Value: Integer);
begin
  FIDvenda := Value;
end;

procedure TFremNfce.SetNFCCancelada(const Value: Integer);
begin
  FNFCCancelada := Value;
end;

procedure TFremNfce.SetNFCEmitido(const Value: Integer);
begin
  FNFCEmitido := Value;
end;

procedure TFremNfce.SetPessoa(const Value: string);
begin
  FPessoa := Value;
end;

procedure TFremNfce.SetToken(const Value: string);
begin
  FToken := Value;
end;

end.
