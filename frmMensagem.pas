unit frmMensagem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Media, System.IOUtils;

type
  TFrmMensagem1 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    imgSucesso: TRectangle;
    Layout3: TLayout;
    lblTexto: TLabel;
    Layout4: TLayout;
    btnConfirmar: TRoundRect;
    Label1: TLabel;
    btnCancelar: TRoundRect;
    Label2: TLabel;
    btnOk: TRoundRect;
    Label3: TLabel;
    imgAlerta: TRectangle;
    imgErro: TRectangle;
    MediaPlayer1: TMediaPlayer;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FMensagem: TForm;
    AProConf : TProc;
    AProCancel : TProc;
    procedure SetMensagem(const Value: TForm);
    procedure SetupSound(Som: string);
    procedure PlaySound;
    procedure ClearVertScrollBox(VSBox: TVertScrollBox; Index: integer = -1);
    { Private declarations }
  public

  property Mensagem: TForm read FMensagem write SetMensagem;

  procedure MensagemConf_Cancel(texto: string);
    { Public declarations }
  end;

var
  FrmMensagem1: TFrmMensagem1;

implementation

{$R *.fmx}

uses FrmVenda, udmPrincipal, udmVenda, FrmStatusVenda;

procedure TFrmMensagem1.MensagemConf_Cancel(texto: string);
begin
lblTexto.Text :=  texto;
end;

procedure TFrmMensagem1.btnConfirmarClick(Sender: TObject);
Var
 pVenda : String;
 p : string;
begin //BOTÃO FINALIZAR VENDA




 pVenda := dmVenda.NovaVenda(dmPrincipal.Grupo,dmPrincipal.Empresa,dmPrincipal.Token,
                              dmVenda.IDCliente,dmPrincipal.Pessoa,dmVenda.IDTransp,
                                dmVenda.fdtbTipoPagamentotpg_id.AsString,
                                dmVenda.fdtbProdutovTotalOriginal.value,
                                dmVenda.fdtbProdutopTotalGeral.Value);



      if  Pos('Erro', pVenda) = 0  then
             begin

               FrmVenda1.lbCliente.Text        := '';
               FrmVenda1.lbTransportadora.Text := '';

               // destruir o financeiro
               if not dmvenda.fdtbFinanceiro.IsEmpty then
                begin
                  dmvenda.fdtbFinanceiro.EmptyDataSet;
                  ClearVertScrollBox(FrmVenda1.vsbFinanceiroFinal,-1);
                end;



               // destruir o Produto
               if not dmvenda.fdtbProduto.IsEmpty then
                begin
                  dmvenda.fdtbProduto.EmptyDataSet;
                  ClearVertScrollBox(FrmVenda1.VsbProduto,-1);
                  ClearVertScrollBox(FrmVenda1.vbsItensSelecionados,-1);
                  ClearVertScrollBox(FrmVenda1.vsbCliente,-1);

                end;

                SetupSound('caixa.mp3');
                PlaySound;

               Application.CreateForm(TFrmStatusVenda1, FrmStatusVenda1);
                   FrmStatusVenda1.Show;
               FrmStatusVenda1.edtPesquisaVenda.Text := pVenda;
               FrmStatusVenda1.edtPesquisaVenda.OnChange(Self);
                   FrmVenda1.Close;
                   FrmMensagem1.Close




              

             end
              else
              begin
                FrmVenda1.Mensagem(pVenda,1);
              end;


end;



procedure TFrmMensagem1.btnCancelarClick(Sender: TObject);
begin

Close;
end;

procedure TFrmMensagem1.btnOkClick(Sender: TObject);
begin
Close;
end;

procedure TFrmMensagem1.ClearVertScrollBox(VSBox: TVertScrollBox; Index: integer = -1);
var     //exclui os itens
    i: integer;
    frame: TFrame;
begin
    try
        VSBox.BeginUpdate;

        if Index >= 0 then
            TFrame(VSBox.Content.Children[Index]).DisposeOf
        else
        for i := VSBox.Content.ChildrenCount - 1 downto 0 do
            if VSBox.Content.Children[i] is TFrame then
                TFrame(VSBox.Content.Children[i]).DisposeOf;

    finally
        VSBox.EndUpdate;
    end;

end;

procedure TFrmMensagem1.SetMensagem(const Value: TForm);
begin
  FMensagem := Value;
end;

procedure TFrmMensagem1.SetupSound(Som: string);
var
   Arquivo: string;
begin

  {$IFDEF MSWINDOWS}

  Arquivo := System.SysUtils.GetCurrentDir + '\' + Som;
  {$ELSE}
 Arquivo := TPath.Combine(TPath.GetDocumentsPath, Som);
  {$ENDIF}

 MediaPlayer1.Clear;
 MediaPlayer1.FileName := Arquivo;

end;

procedure TFrmMensagem1.PlaySound;
begin

 if MediaPlayer1.State = TMediaState.Playing then
    MediaPlayer1.Stop;

 if MediaPlayer1.Media <> nil  then
    MediaPlayer1.Play;


end;


end.
