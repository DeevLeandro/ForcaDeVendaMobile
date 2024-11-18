unit FrameProduto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.Media, System.IOUtils;

type
  TFremProduto = class(TFrame)
    recFundo: TRectangle;
    lblMarca: TLabel;
    lblValor: TLabel;
    RoundRect1: TRoundRect;
    edtQtde: TEdit;
    btnconfirmar: TRoundRect;
    Label3: TLabel;
    lblnome: TLabel;
    imgFoto: TRectangle;
    lblPromocao: TLabel;
  private
    FidProduto: Integer;
    FQtde: string;
    FProduto: string;
    FMarca: string;
    FValor: Double;
    FIDCla: string;
    FValorVarejo: Double;
    FValorPromocao: Double;
    FValorAtacado: Double;
    FGrupoMargem: Integer;
    FGrupoMargemAtacado: Integer;
    FGrupoMargemTrabalho: Integer;
    FValorCusto: Double;

    procedure SetQtde(const Value: string);
    procedure SetIDProduto(const Value: Integer);
    procedure SetMarca(const Value: string);
    procedure SetProduto(const Value: string);
    procedure SetValor(const Value: Double);
    procedure SetIDCla(const Value: string);
    procedure SetValorAtacado(const Value: Double);
    procedure SetValorPromocao(const Value: Double);
    procedure SetValorVarejo(const Value: Double);
    procedure SetGrupoMargem(const Value: Integer);
    procedure SetGrupoMargemAtacado(const Value: Integer);
    procedure SetGrupoMargemTrabalho(const Value: Integer);
    procedure SetValorCusto(const Value: Double);
    { Private declarations }
  public
    { Public declarations }
    property idProduto: Integer read FidProduto write SetIDProduto;
    property Produto: String read FProduto write SetProduto;
    property Marca: string read FMarca write SetMarca;
    property Valor: Double read FValor write SetValor;
    property Qtde: string read FQtde write SetQtde;
    property IDCla: string read FIDCla write SetIDCla;
    property ValorAtacado: Double read FValorAtacado write SetValorAtacado;
    property ValorVarejo: Double read FValorVarejo write SetValorVarejo;
    property ValorPromocao: Double read FValorPromocao write SetValorPromocao;
    property GrupoMargem: Integer read FGrupoMargem write SetGrupoMargem;
    property GrupoMargemTrabalho: Integer read FGrupoMargemTrabalho write SetGrupoMargemTrabalho;
    property GrupoMargemAtacado: Integer read FGrupoMargemAtacado write SetGrupoMargemAtacado;
    property ValorCusto: Double read FValorCusto write SetValorCusto;



  end;

implementation

{$R *.fmx}

uses FrmVenda, udmVenda, udmPrincipal;



{ TFremProduto }




procedure TFremProduto.SetGrupoMargem(const Value: Integer);
begin
  FGrupoMargem := Value;
end;

procedure TFremProduto.SetGrupoMargemAtacado(const Value: Integer);
begin
  FGrupoMargemAtacado := Value;
end;

procedure TFremProduto.SetGrupoMargemTrabalho(const Value: Integer);
begin
  FGrupoMargemTrabalho := Value;
end;

procedure TFremProduto.SetIDCla(const Value: string);
begin
  FIDCla := Value;
end;

procedure TFremProduto.SetIDProduto(const Value: Integer);
begin
  FidProduto := Value;
end;

procedure TFremProduto.SetMarca(const Value: string);
begin
  FMarca := Value;
end;

procedure TFremProduto.SetProduto(const Value: string);
begin
  FProduto := Value;
end;

procedure TFremProduto.SetQtde(const Value: string);
begin
  FQtde := Value;
end;

procedure TFremProduto.SetValor(const Value: Double);
begin
  FValor := Value;
end;

procedure TFremProduto.SetValorAtacado(const Value: Double);
begin
  FValorAtacado := Value;
end;

procedure TFremProduto.SetValorCusto(const Value: Double);
begin
  FValorCusto := Value;
end;

procedure TFremProduto.SetValorPromocao(const Value: Double);
begin
  FValorPromocao := Value;
end;

procedure TFremProduto.SetValorVarejo(const Value: Double);
begin
  FValorVarejo := Value;
end;

end.
