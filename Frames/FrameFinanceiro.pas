unit FrameFinanceiro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TFremFincanceiro = class(TFrame)
    recFundo: TRectangle;
    lblQtdeParcela: TLabel;
    lblIntervalo: TLabel;
    Label3: TLabel;
    lblDesscricao: TLabel;
    btnGerar: TRectangle;
  private
    FQtde: string;
    FIntervalo: string;
    procedure SetIntervalo(const Value: string);
    procedure SetQtde(const Value: string);
    { Private declarations }
  public

   property Qtde: string read FQtde write SetQtde;
   property Intervalo: string read FIntervalo write SetIntervalo;

    { Public declarations }
  end;

implementation

{$R *.fmx}

uses FrmVenda, udmPrincipal, udmVenda;

{ TFremFincanceiro }

procedure TFremFincanceiro.SetIntervalo(const Value: string);
begin
  FIntervalo := Value;
end;

procedure TFremFincanceiro.SetQtde(const Value: string);
begin
  FQtde := Value;
end;

end.
