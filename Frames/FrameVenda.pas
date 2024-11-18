unit FrameVenda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects;

type
  TFremVenda = class(TFrame)
    recFundo: TRectangle;
    lblIDVenda: TLabel;
    lblValorVenda: TLabel;
    lblcliente: TLabel;
    lblTipoPagamento: TLabel;
  private
    FPessoa: string;
    FEmpresa: string;
    FGrupo: string;
    procedure SetEmpresa(const Value: string);
    procedure SetGrupo(const Value: string);
    procedure SetPessoa(const Value: string);
    { Private declarations }
  public

    property Grupo: string read FGrupo write SetGrupo;
    property Empresa: string read FEmpresa write SetEmpresa;
    property Pessoa: string read FPessoa write SetPessoa;

    { Public declarations }
  end;

implementation

{$R *.fmx}

uses FrmStatusVenda, udmPrincipal, udmVenda;

{ TFremVenda }

procedure TFremVenda.SetEmpresa(const Value: string);
begin
  FEmpresa := Value;
end;

procedure TFremVenda.SetGrupo(const Value: string);
begin
  FGrupo := Value;
end;

procedure TFremVenda.SetPessoa(const Value: string);
begin
  FPessoa := Value;
end;

end.
