unit FrameCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Objects, FMX.Controls.Presentation;

type
  TFremCliente = class(TFrame)
    recFundo: TRectangle;
    lblCpf_Cnpj: TLabel;
    lblUF: TLabel;
    btnAdicionar: TRoundRect;
    Label3: TLabel;
    lblnomeCliente: TLabel;
    imgFoto: TRectangle;
  private
    FUF: string;
    FCliente: string;
    FidCliente: Integer;
    FIDGrt: Integer;
    FClassificacao: Integer;
    procedure SetCliente(const Value: string);
    procedure SetIDCliente(const Value: Integer);
    procedure SetUF(const Value: string);
    procedure SetIDGrt(const Value: Integer);
    procedure SetClassificacao(const Value: Integer);
    { Private declarations }
  public

  property idCliente: Integer read FidCliente write SetIDCliente;
  property Cliente: string read FCliente write SetCliente;
  property UF: string read FUF write SetUF;
  property IDGrt: Integer read FIDGrt write SetIDGrt;
  property Classificacao: Integer read FClassificacao write SetClassificacao;


    { Public declarations }
  end;

implementation

{$R *.fmx}

uses FrmVenda, udmPrincipal, udmVenda;

{ TFremCliente }

procedure TFremCliente.SetClassificacao(const Value: Integer);
begin
  FClassificacao := Value;
end;

procedure TFremCliente.SetCliente(const Value: string);
begin
  FCliente := Value;
end;

procedure TFremCliente.SetIDCliente(const Value: Integer);
begin
  FidCliente := Value;
end;

procedure TFremCliente.SetIDGrt(const Value: Integer);
begin
  FIDGrt := Value;
end;

procedure TFremCliente.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
