program EquilibrioMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  FrmLogin in 'FrmLogin.pas' {FrmLogin1},
  FrmMenu in 'FrmMenu.pas' {FrmMenu1},
  FrmVenda in 'FrmVenda.pas' {FrmVenda1},
  udmPrincipal in 'udmPrincipal.pas' {dmPrincipal: TDataModule},
  udmVenda in 'udmVenda.pas' {dmVenda: TDataModule},
  FrameProduto in 'Frames\FrameProduto.pas' {FremProduto: TFrame},
  FrameItemSelecionado in 'Frames\FrameItemSelecionado.pas' {FramItemSelecionado: TFrame},
  FrameCliente in 'Frames\FrameCliente.pas' {FremCliente: TFrame},
  FrameLogin in 'Frames\FrameLogin.pas' {FremLogin: TFrame},
  FrameTransportadora in 'Frames\FrameTransportadora.pas' {FremTrasportadora: TFrame},
  u99Permissions in 'u99Permissions.pas',
  FrmCamera in 'FrmCamera.pas' {FrmCamera1},
  frmCadastro in 'frmCadastro.pas' {FrmCadastro1},
  FrmStatusVenda in 'FrmStatusVenda.pas' {FrmStatusVenda1},
  FrameVenda in 'Frames\FrameVenda.pas' {FremVenda: TFrame},
  uFormat in 'uFormat.pas',
  FrameNfce in 'Frames\FrameNfce.pas' {FremNfce: TFrame},
  FrameFinanceiroFinal in 'Frames\FrameFinanceiroFinal.pas' {FremFinanceiroFinal: TFrame},
  FrameFinanceiro in 'Frames\FrameFinanceiro.pas' {FremFincanceiro: TFrame},
  frmMensagem in 'frmMensagem.pas' {FrmMensagem1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogin1, FrmLogin1);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TdmVenda, dmVenda);
  Application.CreateForm(TFrmCamera1, FrmCamera1);
  Application.CreateForm(TFrmMensagem1, FrmMensagem1);
  Application.Run;
end.
