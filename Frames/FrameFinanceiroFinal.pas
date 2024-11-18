unit FrameFinanceiroFinal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects;

type
  TFremFinanceiroFinal = class(TFrame)
    recFundo: TRectangle;
    lblQtdeParcel: TLabel;
    lblInterval: TLabel;
    lblDesscrica: TLabel;
    lblValorParcela: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses FrmVenda, udmPrincipal, udmVenda;

end.
