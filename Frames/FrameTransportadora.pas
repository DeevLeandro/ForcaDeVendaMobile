unit FrameTransportadora;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TFremTrasportadora = class(TFrame)
    recFundo: TRectangle;
    lblCnpjTrasnp: TLabel;
    lblUFTransp: TLabel;
    btnAdicionar1: TRoundRect;
    Label3: TLabel;
    lblnomeTransp: TLabel;
    imgFoto: TRectangle;
  private
    FTransportadora: string;
    FUF: string;
    FIDGrt: Integer;
    FidTransportadora: Integer;
    procedure SetIDGrt(const Value: Integer);
    procedure SetIDTransportadora(const Value: Integer);
    procedure SetTransportadora(const Value: string);
    procedure SetUF(const Value: string);
    { Private declarations }
  public

  property idTransportadora: Integer read FidTransportadora write SetIDTransportadora;
  property Transportadora: string read FTransportadora write SetTransportadora;
  property UF: string read FUF write SetUF;
  property IDGrt: Integer read FIDGrt write SetIDGrt;

    { Public declarations }
  end;

implementation

{$R *.fmx}

uses FrmVenda, udmPrincipal, udmVenda;

{ TFrame1 }

procedure TFremTrasportadora.SetIDGrt(const Value: Integer);
begin
  FIDGrt := Value;
end;

procedure TFremTrasportadora.SetIDTransportadora(const Value: Integer);
begin
  FidTransportadora := Value;
end;

procedure TFremTrasportadora.SetTransportadora(const Value: string);
begin
  FTransportadora := Value;
end;

procedure TFremTrasportadora.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
