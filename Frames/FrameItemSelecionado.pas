unit FrameItemSelecionado;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TFramItemSelecionado = class(TFrame)
    recFundo: TRectangle;
    lblMarc: TLabel;
    lblValo: TLabel;
    btnExcluir: TRoundRect;
    Label3: TLabel;
    lblnom: TLabel;
    lblQtde: TLabel;
    imgFoto: TRectangle;
    lblValorTotal: TLabel;
    lblPromocao: TLabel;
  private
    FidProduto: Integer;
    procedure SetIDProduto(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }

   property idProduto: Integer read FidProduto write SetIDProduto;

  end;

implementation

{$R *.fmx}

uses FrmVenda, udmPrincipal, udmVenda;

{ TFramItemSelecionado }

procedure TFramItemSelecionado.SetIDProduto(const Value: Integer);
begin
  FidProduto := Value;
end;

end.
