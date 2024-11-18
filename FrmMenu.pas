unit FrmMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, System.Math.Vectors,
  FMX.Controls3D, FMX.Objects3D, FMX.MultiView, FMX.TreeView;

type
  TFrmMenu1 = class(TForm)
    Layout2: TLayout;
    btnMenu: TRoundRect;
    Rectangle1: TRectangle;
    lbMenu: TLabel;
    pnlprincipal: TLayout;
    MultiView1: TMultiView;
    StyleBook1: TStyleBook;
    Rectangle2: TRectangle;
    TreeView1: TTreeView;
    TreeViewItem1: TTreeViewItem;
    TreeViewItem2: TTreeViewItem;
    TreeViewItem3: TTreeViewItem;
    TreeViewItem4: TTreeViewItem;
    TreeViewItem5: TTreeViewItem;
    TreeViewItem6: TTreeViewItem;
    TreeViewItem7: TTreeViewItem;
    TreeViewItem8: TTreeViewItem;
    TreeViewItem9: TTreeViewItem;
    TreeViewItem10: TTreeViewItem;
    btnFaturamento: TRoundRect;
    Label2: TLabel;
    btnVenda: TRoundRect;
    Label3: TLabel;
    btnFinanceiro: TRoundRect;
    Label4: TLabel;
    RoundRect4: TRoundRect;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    TreeViewItem11: TTreeViewItem;
    procedure btnMenuClick(Sender: TObject);
    procedure TreeViewItem4Click(Sender: TObject);
    procedure TreeViewItem1Click(Sender: TObject);
    procedure TreeViewItem2Click(Sender: TObject);
    procedure TreeViewItem3Click(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFinanceiroClick(Sender: TObject);
    procedure btnFaturamentoClick(Sender: TObject);
    procedure TreeViewItem5Click(Sender: TObject);
    procedure TreeViewItem10Click(Sender: TObject);
    procedure TreeViewItem11Click(Sender: TObject);
    procedure TreeViewItem9Click(Sender: TObject);
    procedure TreeViewItem8Click(Sender: TObject);
    procedure TreeViewItem7Click(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }

  end;

var
  FrmMenu1: TFrmMenu1;

implementation

{$R *.fmx}

uses FrmLogin, FrmVenda, udmPrincipal, FrameLogin, FrmStatusVenda, frmCadastro;



procedure TFrmMenu1.btnFaturamentoClick(Sender: TObject);
begin  // btn cadastro

Application.CreateForm(TFrmCadastro1, FrmCadastro1);
     FrmCadastro1.Show;
FrmCadastro1.actPrincipal.Execute;
FrmMenu1.Close;

end;

procedure TFrmMenu1.btnFinanceiroClick(Sender: TObject);
begin //btn status venda

 Application.CreateForm(TFrmStatusVenda1, FrmStatusVenda1);
        FrmStatusVenda1.Show;
  FrmMenu1.Close;
end;

procedure TFrmMenu1.btnMenuClick(Sender: TObject);
begin //colapsed multi view

MultiView1.NavigationPaneOptions.CollapsedWidth := 300;
end;

procedure TFrmMenu1.btnVendaClick(Sender: TObject);
begin

 Application.CreateForm(TFrmVenda1, FrmVenda1);
  FrmVenda1.Show;
  FrmMenu1.Close;
 FrmVenda1.pnlBotoes.Visible := True;
end;

procedure TFrmMenu1.FormShow(Sender: TObject);
begin  //on show
lbMenu.Text := copy(dmPrincipal.NomeEmpresa,0,40);

TreeViewItem6.Enabled := False;
TreeViewItem7.Enabled := False;
TreeViewItem8.Enabled := False;

end;

procedure TFrmMenu1.TreeViewItem10Click(Sender: TObject);
begin   //chama form venda

 Application.CreateForm(TFrmVenda1, FrmVenda1);
FrmVenda1.Show;
end;

procedure TFrmMenu1.TreeViewItem11Click(Sender: TObject);
begin // chama o status da venda

 Application.CreateForm(TFrmStatusVenda1, FrmStatusVenda1);
 FrmStatusVenda1.Show;

end;

procedure TFrmMenu1.TreeViewItem1Click(Sender: TObject);
begin
TreeViewItem1.IsExpanded := True;
end;

procedure TFrmMenu1.TreeViewItem2Click(Sender: TObject);
begin
TreeViewItem2.IsExpanded := True;
end;

procedure TFrmMenu1.TreeViewItem3Click(Sender: TObject);
begin
TreeViewItem3.IsExpanded := True;
end;

procedure TFrmMenu1.TreeViewItem4Click(Sender: TObject);
begin

FrmMenu1.Close;

end;

procedure TFrmMenu1.TreeViewItem5Click(Sender: TObject);
begin // chama cadastro pessoa
Application.CreateForm(TFrmCadastro1, FrmCadastro1);
FrmCadastro1.show;
FrmMenu1.Close;

end;

procedure TFrmMenu1.TreeViewItem7Click(Sender: TObject);
begin   //chama pesquisa pessoa


FrmVenda1.Show;
FrmVenda1.actCliente.Execute;
FrmVenda1.edtPesquisarClienteChange(Self);
end;

procedure TFrmMenu1.TreeViewItem8Click(Sender: TObject);
begin //chama pesquisa produto

FrmVenda1.Show;
FrmVenda1.actProduto.Execute;
FrmVenda1.pnlBotoes.Visible := False;
FrmVenda1.Rectangle8.Visible := False;
FrmVenda1.Layout2.Visible := False;
FrmVenda1.fechar1.Visible := True;

FrmVenda1.edtPesquisaProdutoChange(Self);
end;

procedure TFrmMenu1.TreeViewItem9Click(Sender: TObject);
begin
Application.CreateForm(TFrmStatusVenda1, FrmStatusVenda1);
FrmStatusVenda1.Show;
FrmMenu1.Close;
end;

end.

