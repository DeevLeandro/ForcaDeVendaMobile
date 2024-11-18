unit FrmVenda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  System.Actions, FMX.ActnList, FMX.Edit, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Data.DB, FMX.ListBox, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, u99Permissions,
  FMX.Media, System.IOUtils, FrameItemSelecionado, System.Generics.Collections, Generics.Collections,
  System.TypInfo;

type
  TFrmVenda1 = class(TForm)
    Layout1: TLayout;
    Layout3: TLayout;
    TabControl1: TTabControl;
    StyleBook1: TStyleBook;
    pnlBotoes: TLayout;
    RoundRect1: TRoundRect;
    Layout5: TLayout;
    Layout6: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Label5: TLabel;
    Label6: TLabel;
    TabCliente: TTabItem;
    TabProduto: TTabItem;
    TabFinanceiro: TTabItem;
    TabTransportadora: TTabItem;
    ActionList1: TActionList;
    actCliente: TChangeTabAction;
    actProduto: TChangeTabAction;
    actFinanceiro: TChangeTabAction;
    actTransportadora: TChangeTabAction;
    Layout7: TLayout;
    RoundRect7: TRoundRect;
    Rectangle9: TRectangle;
    RoundRect8: TRoundRect;
    edtPesquisarCliente: TEdit;
    actPrincipal: TChangeTabAction;
    Layout8: TLayout;
    RoundRect9: TRoundRect;
    Rectangle8: TRectangle;
    RoundRect10: TRoundRect;
    edtPesquisaProduto: TEdit;
    btnPesquisar: TRectangle;
    btnCamera: TRectangle;
    TabVenda: TTabItem;
    actVenda: TChangeTabAction;
    Layout4: TLayout;
    Label8: TLabel;
    Rectangle13: TRectangle;
    Layout11: TLayout;
    RoundRect16: TRoundRect;
    Rectangle14: TRectangle;
    Layout12: TLayout;
    RoundRect20: TRoundRect;
    Rectangle15: TRectangle;
    RoundRect21: TRoundRect;
    edtPesquisartrasportadora: TEdit;
    pnl: TRectangle;
    Label20: TLabel;
    Layout10: TLayout;
    pnlInfoVenda: TRoundRect;
    lbCliente: TLabel;
    Rectangle17: TRectangle;
    ImagemFundo: TRectangle;
    btnCarrinho: TRectangle;
    Layout2: TLayout;
    blQtds: TRoundRect;
    lblQtds: TLabel;
    rodapevenda: TRectangle;
    VsbProduto: TVertScrollBox;
    vbsItensSelecionados: TVertScrollBox;
    lbValorfinal: TLabel;
    pnlvertproduto: TRectangle;
    pnlfundovert: TRectangle;
    cbxFinanceiro: TComboBox;
    dtsTipoPagamento: TDataSource;
    pnlvertCliente: TRectangle;
    vsbCliente: TVertScrollBox;
    pnlVertFinanceiro: TRectangle;
    vsbFinanceiro: TVertScrollBox;
    pnlVertFinalFinanceiro: TRectangle;
    vsbFinanceiroFinal: TVertScrollBox;
    btnFechar: TRectangle;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    pnlVertTransporte: TRectangle;
    vsbTrasportadora: TVertScrollBox;
    lbTransportadora: TLabel;
    btnCliente: TRectangle;
    Rectangle: TRectangle;
    btnProduto: TRectangle;
    btnFinanceiro: TRectangle;
    btnTransportadora: TRectangle;
    btnFinalizar: TRectangle;
    fechar1: TRectangle;
    MediaPlayer1: TMediaPlayer;
    BindSourceDB2: TBindSourceDB;
    StringGrid1: TStringGrid;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    procedure Rectangle9Click(Sender: TObject);
    procedure Rectangle8Click(Sender: TObject);
    procedure RoundRect11Click(Sender: TObject);
    procedure Rectangle13Click(Sender: TObject);
    procedure edtPesquisaProdutoChange(Sender: TObject);
    procedure edtPesquisarClienteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCarrinhoClick(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);

    procedure cbxFinanceiroClosePopup(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtPesquisartrasportadoraChange(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnFinanceiroClick(Sender: TObject);
    procedure btnTransportadoraClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCameraClick(Sender: TObject);
    procedure fechar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FidProduto: Integer;
    FQtde: string;
    permissao : T99Permissions;
    FClassicacaoCliente: Integer;
    FFramesXProduto: TDictionary<Integer, TFramItemSelecionado>;

    procedure AddProduto;
    procedure AddCliente;
    procedure AddFinanceiro;
    procedure AddFinanceiroFinal;
    procedure AddTrasportadora;
    procedure ConsultarItem(pStatus,pEditar : integer);
    procedure ClearVertScrollBox(VSBox: TVertScrollBox; Index: integer = -1);
    procedure SetIDProduto(const Value: Integer);
    procedure SetQtde(const Value: string);



    procedure OnClickConfirmar(Sender: TObject);
    procedure OnAdicionar(Sender: TObject);
    procedure OnGerar(Sender: TObject);
    procedure BuscarTransportadora;
    procedure OnAdicionarTransporte(Sender: TObject);
    procedure SetClassicacaoCliente(const Value: Integer);
    procedure SetupSound(Som: string);
    procedure PlaySound;


    { Private declarations }
  public
    { Public declarations }
    procedure BuscarPessoa;
    procedure BuscarProduto;
    procedure Mensagem(texto : string; Tipo: Integer);

    property idProduto: Integer read FidProduto write SetIDProduto;
    property Qtde: string read FQtde write SetQtde;


  end;

var
  FrmVenda1: TFrmVenda1;

implementation



{$R *.fmx}
{$R *.iPad.fmx IOS}
{$R *.iPhone4in.fmx IOS}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}

uses FrmMenu, udmVenda, udmPrincipal, FrameProduto,
  FrameCliente, FrameFinanceiro, FrameFinanceiroFinal, FrameTransportadora,
  FrmCamera, FrmStatusVenda, frmMensagem;






procedure TFrmVenda1.ClearVertScrollBox(VSBox: TVertScrollBox; Index: integer = -1);
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



procedure TFrmVenda1.btnCameraClick(Sender: TObject);
   //Leitura da camera Produto
begin
      //permissao da camera
   if not  permissao.VerifyCameraAccess then
            permissao.Camera(nil, nil )

            else
               begin

                // Abre o form camera

                FrmCamera1.ShowModal(procedure (ModalResult : TModalResult)
                begin

                  // joga tudo o testo no edit

                 edtPesquisaProduto.Text := FrmCamera1.Codigo;

                end);

               end;



end;

procedure TFrmVenda1.Rectangle13Click(Sender: TObject);
begin   //FECHA O FORM VENDA
actProduto.Execute;
pnlBotoes.Visible := True;
end;

procedure TFrmVenda1.btnCarrinhoClick(Sender: TObject);

begin  // CHAMA TELA CONSULTA ITENS

actVenda.Execute;
pnlBotoes.Visible := True;
 ConsultarItem(0,0);

end;

procedure TFrmVenda1.Rectangle2Click(Sender: TObject);
begin   // CHAMA TELA PRODUTO
actProduto.Execute;
pnlBotoes.Visible := True;
end;

procedure TFrmVenda1.Rectangle8Click(Sender: TObject);

begin  //CHAMA TELA VENDA
actVenda.Execute;

end;

procedure TFrmVenda1.Rectangle9Click(Sender: TObject);
begin   //CHAMA TELA VENDA
actVenda.Execute;
end;

procedure TFrmVenda1.RoundRect11Click(Sender: TObject);
begin    //CHAMA TELA VENDA
actVenda.Execute;
end;

procedure TFrmVenda1.SetClassicacaoCliente(const Value: Integer);
begin
  FClassicacaoCliente := Value;
end;

procedure TFrmVenda1.SetIDProduto(const Value: Integer);
begin
  FidProduto := Value;
end;

procedure TFrmVenda1.SetQtde(const Value: string);
begin
  FQtde := Value;
end;


procedure TFrmVenda1.SetupSound(Som: string);
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

procedure TFrmVenda1.PlaySound;
begin

 if MediaPlayer1.State = TMediaState.Playing then
    MediaPlayer1.Stop;

 if MediaPlayer1.Media <> nil  then
    MediaPlayer1.Play;


end;



procedure TFrmVenda1.OnAdicionar(Sender: TObject);
 //BOTÃO AdicionarCliente
var
    rect: TRectangle;
    frame: TFremCliente;
    btnAdicionar : TRoundRect;
begin


  btnAdicionar := TRoundRect(Sender);
    rect := btnAdicionar.Parent as TRectangle;

    if (Sender as TComponent).Owner is TFremCliente then
      frame :=  (Sender as TComponent).Owner as TFremCliente
    else
      Exit;

  if not dmVenda.fdtbProduto.IsEmpty then
    begin
    ClearVertScrollBox(VsbProduto,-1);
    ClearVertScrollBox(vbsItensSelecionados,-1);
    dmVenda.fdtbProduto.EmptyDataSet;
    blQtds.Visible := False;
    lbValorfinal.Text := 'R$ 0,00';
    pnlfundovert.Visible := False;
    pnlvertproduto.Visible := False;
    ImagemFundo.Visible := True;
    end;

lbCliente.Text    :=  frame.Cliente;
dmVenda.IDCliente :=  frame.idCliente.ToString;
dmVenda.ClassicacaoCliente := frame.Classificacao;
SetupSound('add.wav');
PlaySound;
actVenda.Execute;

pnlInfoVenda.Visible := True;
lbCliente.Visible := True;


end;

procedure TFrmVenda1.OnAdicionarTransporte(Sender: TObject);
 //BOTÃO AdicionarTransporte
var
    rect: TRectangle;
    frame: TFremTrasportadora;
    btnAdicionar1 : TRoundRect;
begin


  btnAdicionar1 := TRoundRect(Sender);
    rect := btnAdicionar1.Parent as TRectangle;

    if (Sender as TComponent).Owner is TFremTrasportadora then
      frame :=  (Sender as TComponent).Owner as TFremTrasportadora
    else
      Exit;


lbTransportadora.Text :=   Frame.Transportadora;
dmVenda.IDTransp      :=   Frame.Transportadora;
SetupSound('add.wav');
PlaySound;
actVenda.Execute;
pnlInfoVenda.Visible := True;
lbTransportadora.Visible := True;


end;


procedure TFrmVenda1.OnGerar(Sender: TObject);
var
    rect: TRectangle;
    frame: TFremFincanceiro;
    btnGerar : TRoundRect;
    I,J : Integer;
    pData : TDate;
   qtdparcelas, total, totaldividido: real;
   TotalItens: Currency;
begin

  //BOTÃO GERAR Financeiro
 //-------------------------------------------------
  btnGerar := TRoundRect(Sender);
    rect := btnGerar.Parent as TRectangle;

    if (Sender as TComponent).Owner is TFremFincanceiro then
      frame :=  (Sender as TComponent).Owner as TFremFincanceiro
    else
      Exit;

  begin



   if not dmvenda.fdtbFinanceiro.IsEmpty then
     begin
        dmvenda.fdtbFinanceiro.EmptyDataSet;
        ClearVertScrollBox(vsbFinanceiroFinal,-1);
     end;

   TotalItens := dmVenda.fdtbProdutopTotalGeral.Value;



   for I := 1 to frame.Qtde.ToInteger do
   begin

     if I = 1 then
      begin
        qtdparcelas        := StrToInt(frame.Qtde);
        totaldividido      := trunc((TotalItens / StrToFloat(frame.Qtde)) * 100) / 100 ;
        totaldividido      := TotalItens - (totaldividido * (qtdparcelas - 1));
      end
       else
        begin
         totaldividido := trunc((TotalItens / StrToFloat(frame.Qtde)) * 100) / 100 ;
        end;


     dmVenda.fdtbFinanceiro.Open;
     dmVenda.fdtbFinanceiro.Insert;
     dmVenda.fdtbFinanceiropQtde.AsFloat         := qtdparcelas;
     if i = 1 then
      dmVenda.fdtbFinanceiropDtVencimento.AsString  := DateToStr(Now + dmvenda.fdtbFormaPagamentofop_qtde_dias.AsInteger)
        ELSE
          dmVenda.fdtbFinanceiropDtVencimento.AsString := DateToStr(pData + frame.Intervalo.ToInteger);

     dmVenda.fdtbFinanceiropNumParcela.AsString :=  I.ToString +'/' + frame.Qtde;
     dmVenda.fdtbFinanceiropTipoPg.AsInteger      := dmvenda.fdtbTipoPagamentotpg_id.AsInteger;
     dmVenda.fdtbFinanceiropValorParcela.AsCurrency  := TotalDividido;
     dmVenda.fdtbFinanceiro.Post;

     pnlVertFinalFinanceiro.Visible := True;
     pnlVertFinalFinanceiro.Align := TAlignLayout.Client;
     AddFinanceiroFinal;


     pData :=   dmVenda.fdtbFinanceiropDtVencimento.AsDateTime;

   end;




  end;
end;


procedure TFrmVenda1.OnClickConfirmar(Sender: TObject);
 //BOTÃO CONFIRMAR
var
    rect: TRectangle;
    frame: TFremProduto;
    frameCliente : TFremCliente;
    btnConfirmar : TRoundRect;
    vTotal,vTotalDesc : Double;
begin

 pnlfundovert.Visible := True;
 ImagemFundo.Visible := False;
 rodapevenda.Visible := True;

  btnConfirmar := TRoundRect(Sender);
    rect := btnConfirmar.Parent as TRectangle;

    if (Sender as TComponent).Owner is TFremProduto then
      frame :=  (Sender as TComponent).Owner as TFremProduto
    else
      Exit;


    if frame.edtQtde.Text = '' then
     begin
      SetupSound('error1.wav');
      PlaySound;
      Mensagem('Digite a quantidade.',1);
      exit;
     end;

   if frame.Valor <= 0 then
      begin
        SetupSound('error1.wav');
        PlaySound;
       Mensagem('Produto com valor = 0 não é valido',1);
       exit;
      end;

     blQtds.Visible := True;
     btnFinanceiro.Enabled     := True;
     btnTransportadora.Enabled  := True;
     btnFinalizar.Enabled       := True;
     btnCarrinho.Enabled := True;

     // se for inserir um novo produto destruir o financeiro antes.
     if not dmvenda.fdtbFinanceiro.IsEmpty then
      begin
        dmvenda.fdtbFinanceiro.EmptyDataSet;
        ClearVertScrollBox(vsbFinanceiroFinal,-1);
      end;

       dmVenda.fdtbProduto.Open;
      if dmvenda.fdtbProduto.Locate('pProID', frame.idProduto ,[]) then
        begin
             dmVenda.fdtbProduto.Edit;
             dmVenda.fdtbProdutopQtde.AsString       := FloatToStr(frame.Qtde.ToDouble + StrToFloat(frame.edtQtde.Text));
             dmVenda.fdtbProdutopProID.AsInteger     := frame.idProduto;
             dmVenda.fdtbProdutopValorTotal.Value    := frame.Valor * StrToFloat(dmVenda.fdtbProdutopQtde.AsString);
             dmVenda.fdtbProdutopValorOriginal.Value := frame.Valor * StrToFloat(dmVenda.fdtbProdutopQtde.AsString );
             dmVenda.fdtbProdutopTotalDesc.Value     := frame.ValorPromocao * StrToFloat(dmVenda.fdtbProdutopQtde.AsString);


           if frame.ValorPromocao > 0  then
                begin
                 dmVenda.fdtbProdutopValorTotal.Value := frame.ValorPromocao * StrToFloat(dmVenda.fdtbProdutopQtde.AsString);
                 dmVenda.fdtbProdutopTotalDesc.Value  := frame.ValorPromocao * StrToFloat(dmVenda.fdtbProdutopQtde.AsString);

                end
                else
                 begin
                  dmVenda.fdtbProdutopValorTotal.Value := frame.Valor * StrToFloat(dmVenda.fdtbProdutopQtde.AsString);
                  dmVenda.fdtbProdutopTotal.Value      := frame.Valor * StrToFloat(dmVenda.fdtbProdutopQtde.AsString);
                 end;

         frame.Qtde := dmVenda.fdtbProdutopQtde.AsString;
         dmVenda.fdtbProduto.Post;

         ConsultarItem(0,0);

        end
         else
           begin
             dmVenda.fdtbProduto.Insert;
             dmVenda.fdtbProdutopProID.AsInteger  := frame.idProduto ;
             dmVenda.fdtbProdutopClaID.AsString   := frame.IDCla;
             dmVenda.fdtbProdutopProduto.AsString := frame.Produto;
             dmVenda.fdtbProdutopQtde.AsString    := frame.edtQtde.Text;
             dmVenda.fdtbProdutopMarca.AsString   := frame.Marca;
             dmVenda.fdtbProdutopValor.Value      := frame.Valor;
             dmVenda.fdtbProdutopDesc.Value       := frame.ValorPromocao;
             dmVenda.fdtbProdutopValorOriginal.Value  := frame.Valor * StrToFloat(frame.edtQtde.Text);
             frame.Qtde   := frame.edtQtde.Text;

             if frame.ValorPromocao > 0  then
                begin
                 dmVenda.fdtbProdutopValorTotal.Value := frame.ValorPromocao * StrToFloat(frame.edtQtde.Text);
                 dmVenda.fdtbProdutopTotalDesc.Value  := frame.ValorPromocao * StrToFloat(frame.edtQtde.Text);

                end
                else
                 begin
                  dmVenda.fdtbProdutopValorTotal.Value := frame.Valor * StrToFloat(frame.edtQtde.Text);
                  dmVenda.fdtbProdutopTotal.Value      := frame.Valor * StrToFloat(frame.edtQtde.Text);
                 end;

           dmVenda.fdtbProduto.Post;
           ConsultarItem(0,0);
           end;


   SetupSound('carrinho.wav');
   PlaySound;

   frame.edtQtde.Text := EmptyStr;

   if dmVenda.fdtbProdutopTotalGeral.Value < 0 then
    lbValorfinal.Text := 'Total: R$ 0,00'
     else
      lbValorfinal.Text := FormatFloat('R$ ,0.00', dmVenda.fdtbProdutopTotalGeral.Value);



   lblQtds.Text :=  IntToStr(dmVenda.fdtbProduto.RecordCount);



end;




procedure TFrmVenda1.btnClienteClick(Sender: TObject);
begin     //CHAMA TELA cliente
actCliente.Execute;
end;

procedure TFrmVenda1.btnExcluirClick(Sender: TObject);
var  //EXCLUI ITEM SELECIONADOS
frame : TFramItemSelecionado;
btnExcluir : TRoundRect;
rect: TRectangle;

begin

//=======================================
// pega o frame selecionadado
 btnExcluir := TRoundRect(Sender);
    rect := btnExcluir.Parent as TRectangle;

  if (Sender as TComponent).Owner is TFramItemSelecionado then
      frame :=  (Sender as TComponent).Owner as TFramItemSelecionado
    else
      Exit;

//========================================
//Exclui um a um dos itens
  dmVenda.fdtbProduto.Edit;

 dmVenda.fdtbProduto.First;
  while not dmVenda.fdtbProduto.Eof do
   begin

     if dmVenda.fdtbProdutopProID.AsInteger = frame.idProduto then
      begin
      FFramesXProduto.Remove(frame.idProduto);
      dmVenda.fdtbProduto.Delete;
      SetupSound('excluir.wav');
      PlaySound;
      dmVenda.fdtbProduto.ApplyUpdates;
      ClearVertScrollBox(vbsItensSelecionados,frame.Index);
      end;

    dmVenda.fdtbProduto.Next;
   end;


  lblQtds.Text :=   IntToStr(dmVenda.fdtbProduto.RecordCount);

//===============================================
//Exclui todos os itens da lista e zera a lista e volta para a lista produto

  if dmVenda.fdtbProdutopTotalGeral.Value <= 0 then
     begin
      lbValorfinal.Text := 'Total: R$ 0,00';
      blQtds.Visible := False;
      btnFinanceiro.Enabled := False;
      btnTransportadora.Enabled := False;
      btnFinalizar.Enabled := False;
      actProduto.Execute;
      pnlfundovert.Visible := False;
      btnCarrinho.Enabled := False;
     end
     else
       lbValorfinal.Text := FormatFloat('R$ ,0.00', dmVenda.fdtbProdutopTotalGeral.Value);



end;


procedure TFrmVenda1.AddCliente;
var   //Lista de Clientes
    frame: TFremCliente;
begin
    frame := TFremCliente.create(nil);


    frame.position.Y := 9999999999;
    frame.Align := TAlignLayout.Top;



    frame.lblnomeCliente.Text := dmVenda.fdtbPesquisaPessoapes_id.AsString +' - '+ dmVenda.fdtbPesquisaPessoapes_nome.AsString;
    frame.lblCpf_Cnpj.Text := 'CNPJ - CPF: ' + dmVenda.fdtbPesquisaPessoapes_cnpj_cpf.AsString;
    frame.lblUF.Text := 'UF: ' + dmVenda.fdtbPesquisaPessoapes_uf.AsString;

    frame.idCliente := dmVenda.fdtbPesquisaPessoapes_id.AsInteger;
    frame.Cliente := dmVenda.fdtbPesquisaPessoapes_nome.AsString;
    frame.UF := dmVenda.fdtbPesquisaPessoapes_uf.AsString;
    frame.IDGrt := dmVenda.fdtbPesquisaPessoagrt_id.AsInteger;
    frame.Classificacao := dmVenda.fdtbPesquisaPessoapes_classificacao.AsInteger;

    frame.btnAdicionar.OnClick := OnAdicionar;
    vsbCliente.AddObject(Frame);
    if  Odd(frame.Index) then
    frame.recFundo.Fill.Color := $ffededed;

    frame.btnAdicionar.Tag := dmVenda.fdtbPesquisaPessoapes_id.AsInteger;





    frame.btnAdicionar.onClick := OnAdicionar;





    vsbCliente.AddObject(frame);

end;


procedure TFrmVenda1.AddFinanceiro;
var   //Lista de Financeiro

    frame: TFremFincanceiro;
begin
    frame := TFremFincanceiro.create(nil);


    frame.position.Y := 9999999999;
    frame.Align := TAlignLayout.Top;



    frame.lblDesscricao.Text := dmVenda.fdtbFormaPagamentofop_id.AsString +' - '+ dmVenda.fdtbFormaPagamentofop_descricao.AsString;
    frame.lblQtdeParcela.Text := 'Qtde Parcela: ' + dmVenda.fdtbFormaPagamentofop_qtde_parcelas.AsString;
    frame.lblIntervalo.Text := 'Intervalo: ' + dmVenda.fdtbFormaPagamentofop_intervalo_parcelas.AsString;

    frame.Qtde := dmVenda.fdtbFormaPagamentofop_qtde_parcelas.AsString;
    frame.Intervalo := dmVenda.fdtbFormaPagamentofop_intervalo_parcelas.AsString;


    frame.btnGerar.OnClick := OnGerar;
    vsbCliente.AddObject(Frame);
    if  Odd(frame.Index) then
    frame.recFundo.Fill.Color := $ffededed;

    frame.btnGerar.Tag := dmVenda.fdtbFormaPagamentofop_id.AsInteger;


    vsbFinanceiro.AddObject(frame);


end;

procedure TFrmVenda1.AddFinanceiroFinal;
var   //Lista do Financeiro final

    frame: TFremFinanceiroFinal;
begin
    frame := TFremFinanceiroFinal.create(nil);


    frame.position.Y := 9999999999;
    frame.Align := TAlignLayout.Top;



    frame.lblDesscrica.Text := 'Data: ' + dmVenda.fdtbFinanceiropDtVencimento.AsString;
    frame.lblQtdeParcel.Text := 'Qtde Parcela: ' + dmVenda.fdtbFinanceiropQtde.AsString;
    frame.lblInterval.Text := 'Intervalo: ' + dmVenda.fdtbFinanceiropNumParcela.AsString;
    frame.lblValorParcela.Text := 'Valor: ' + FormatFloat('R$ ,0.00', dmVenda.fdtbFinanceiropValorParcela.Value);



    vsbFinanceiroFinal.AddObject(Frame);
    if  Odd(frame.Index) then
    frame.recFundo.Fill.Color := $ffededed;


    vsbFinanceiroFinal.AddObject(frame);
end;



procedure TFrmVenda1.AddProduto;
var     //Lista de produto

    frame: TFremProduto;

    vValorSugerido : Double;
begin
    frame := TFremProduto.create(nil);


    frame.position.Y := 9999999999;
    frame.Align := TAlignLayout.Top;



  //==========================================
//CONVERTE AS LABELS DOS FRAMES

      case dmVenda.fdtbPesquisaProdutoVendapro_tipo_calculo_venda.AsInteger of

       0,1:begin

         if dmVenda.ClassicacaoCliente = 0 then
          begin
          vValorSugerido  :=   (dmVenda.fdtbPesquisaProdutoVendagrp_margem_atacado.AsFloat * dmVenda.fdtbPesquisaProdutoVendaest_custo.AsFloat) / 100 + dmVenda.fdtbPesquisaProdutoVendaest_custo.AsFloat;
          frame.lblPromocao.Visible := False;
          end;

         if dmVenda.ClassicacaoCliente = 1 then
           begin
           vValorSugerido  :=   (dmVenda.fdtbPesquisaProdutoVendagrp_margem.AsFloat * dmVenda.fdtbPesquisaProdutoVendaest_custo.AsFloat) / 100 + dmVenda.fdtbPesquisaProdutoVendaest_custo.AsFloat;
           frame.lblPromocao.Visible := False;
           end;

        if dmVenda.fdtbPesquisaProdutoVendavalorpromocional.Value > 0 then
           begin
            frame.lblPromocao.Visible := True;
            frame.lblPromocao.Text := FormatFloat('R$ ,0.00', dmVenda.fdtbPesquisaProdutoVendavalorpromocional.AsFloat);
           end;

       end;
       2:begin

         if dmVenda.ClassicacaoCliente = 0 then
           begin
           vValorSugerido  := dmVenda.fdtbPesquisaProdutoVendaest_valor_fixo_atacado.AsCurrency;
           frame.lblPromocao.Visible := False;
           end;

         if dmVenda.ClassicacaoCliente = 1 then
           begin
           vValorSugerido  := dmVenda.fdtbPesquisaProdutoVendaest_valor_fixo_varejo.AsCurrency;
           frame.lblPromocao.Visible := False;
           end;

        if dmVenda.fdtbPesquisaProdutoVendavalorpromocional.Value > 0 then
           begin
            frame.lblPromocao.Visible := True;
            frame.lblPromocao.Text := FormatFloat('R$ ,0.00', dmVenda.fdtbPesquisaProdutoVendavalorpromocional.AsFloat);
           end;


       end
        else
          begin
           vValorSugerido  := dmVenda.fdtbPesquisaProdutoVendaest_valor_fixo_varejo.AsCurrency;

           if dmVenda.fdtbPesquisaProdutoVendavalorpromocional.Value > 0 then
              begin
               frame.lblPromocao.Visible := True;
               frame.lblPromocao.Text := FormatFloat('R$ ,0.00', dmVenda.fdtbPesquisaProdutoVendavalorpromocional.AsFloat);
              end;

          end;


      end;



    frame.lblnome.Text := dmVenda.fdtbPesquisaProdutoVendapro_id.AsString +' - '+ dmVenda.fdtbPesquisaProdutoVendapro_consulta.AsString;
    frame.lblMarca.Text := 'Marca: ' + dmVenda.fdtbPesquisaProdutoVendamar_descricao.AsString + '      Estoque: ' + dmVenda.fdtbPesquisaProdutoVendaest_qtde.AsString;
    frame.lblValor.Text := FormatFloat('R$ ,0.00', vValorSugerido);



    frame.idProduto := dmVenda.fdtbPesquisaProdutoVendapro_id.AsInteger;
    frame.Produto := dmVenda.fdtbPesquisaProdutoVendapro_consulta.AsString;
    frame.Marca := dmVenda.fdtbPesquisaProdutoVendamar_descricao.AsString;
    frame.Valor := vValorSugerido;
    frame.IDCla := dmVenda.fdtbPesquisaProdutoVendacla_id.AsString;
    frame.ValorAtacado := dmVenda.fdtbPesquisaProdutoVendaest_valor_fixo_atacado.AsCurrency;
    frame.ValorVarejo  := dmVenda.fdtbPesquisaProdutoVendaest_valor_fixo_varejo.AsCurrency;
    frame.ValorPromocao := dmVenda.fdtbPesquisaProdutoVendavalorpromocional.AsCurrency;
    frame.ValorCusto := dmVenda.fdtbPesquisaProdutoVendaest_custo.AsCurrency;
    frame.GrupoMargem := dmVenda.fdtbPesquisaProdutoVendagrp_margem.AsInteger;
    frame.GrupoMargemTrabalho := dmVenda.fdtbPesquisaProdutoVendagrp_margem_trabalho.AsInteger;
    frame.GrupoMargemAtacado := dmVenda.fdtbPesquisaProdutoVendagrp_margem_atacado.AsInteger;
    frame.edtQtde.Text := dmVenda.fdtbProdutopQtde.AsString;
    frame.edtQtde.Text := EmptyStr;



    frame.btnconfirmar.OnClick := OnClickConfirmar;
    VsbProduto.AddObject(Frame);
    if  Odd(frame.Index) then
    frame.recFundo.Fill.Color := $ffededed;

    frame.btnconfirmar.Tag := dmVenda.fdtbPesquisaProdutoVendapro_id.AsInteger;






    frame.btnConfirmar.onClick := OnClickConfirmar;





    VsbProduto.AddObject(frame);

end;


procedure TFrmVenda1.AddTrasportadora;
var   //Lista de TransPortadora
    frame: TFremTrasportadora;
begin
//==========================================
//CRIA O FRAME E POSICIONA
    frame := TFremTrasportadora.create(nil);

    frame.position.Y := 9999999999;
    frame.Align := TAlignLayout.Top;


//==========================================
//CONVERTE AS LABELS DOS FRAMES

    frame.lblnomeTransp.Text := dmVenda.fdtbPesquisaPessoapes_id.AsString +' - '+ dmVenda.fdtbPesquisaPessoapes_nome.AsString;
    frame.lblCnpjTrasnp.Text := 'CNPJ: ' + dmVenda.fdtbPesquisaPessoapes_cnpj_cpf.AsString;
    frame.lblUFTransp.Text := 'UF: ' + dmVenda.fdtbPesquisaPessoapes_uf.AsString;

    frame.idTransportadora := dmVenda.fdtbPesquisaPessoapes_id.AsInteger;
    frame.Transportadora := dmVenda.fdtbPesquisaPessoapes_nome.AsString;
    frame.UF := dmVenda.fdtbPesquisaPessoapes_uf.AsString;
    frame.IDGrt := dmVenda.fdtbPesquisaPessoagrt_id.AsInteger;

//==========================================
//BOTAO CLICK DENTRO DO FRAME

    frame.btnAdicionar1.OnClick := OnAdicionarTransporte;
    vsbTrasportadora.AddObject(Frame);
    if  Odd(frame.Index) then
    frame.recFundo.Fill.Color := $ffededed;

    frame.btnAdicionar1.Tag := dmVenda.fdtbPesquisaPessoapes_id.AsInteger;

     vsbTrasportadora.AddObject(frame);

end;

procedure TFrmVenda1.btnSairClick(Sender: TObject);
begin  //fecha form
FrmVenda1.Close;
end;



procedure TFrmVenda1.btnTransportadoraClick(Sender: TObject);
begin  //CHAMA TELA TRANSPORTADOORA

actTransportadora.Execute;

end;

procedure TFrmVenda1.btnFecharClick(Sender: TObject);

//=================================
//BOTÃO FECHAR

begin

 Application.CreateForm(TFrmMenu1, FrmMenu1);
       FrmMenu1.Show;
  FrmVenda1.Close;
end;

procedure TFrmVenda1.btnFinalizarClick(Sender: TObject);
Var
 pVenda : String;
 p : string;
begin //BOTÃO FINALIZAR VENDA

  if dmVenda.IDCliente = '' then
   begin
     SetupSound('error1.wav');
     PlaySound;
    Mensagem('Não foi selecionado um cliente valido.',1) ;
    exit;
   end;

  if dmVenda.fdtbFinanceiro.IsEmpty then
   begin
      SetupSound('error1.wav');
                PlaySound;
    Mensagem('Não foi selecionado uma forma de pagamento.',1) ;
    exit;
   end;

  if dmVenda.fdtbProduto.IsEmpty then
   begin
    SetupSound('error1.wav');
                PlaySound;
    Mensagem('Não foi selecionado uma produto valido.',1) ;
    exit;
   end;


  if dmPrincipal.Token = '' then
    begin
       SetupSound('error1.wav');
       PlaySound;
     Mensagem('Não exite Token gerado para sua empresa. Entre em contato com o suporte.',1);

     exit;
    end;

   Mensagem('Deseja realmente finalizar a venda?',2)



end;

procedure TFrmVenda1.btnFinanceiroClick(Sender: TObject);
begin  //CHAMA TELA FINANCEIRO

   actFinanceiro.Execute;
   dmVenda.PesquisaTipoPagamento;
end;


procedure TFrmVenda1.btnProdutoClick(Sender: TObject);
begin       //CHAMA TELA Produto
actProduto.Execute;

end;


procedure TFrmVenda1.BuscarPessoa;
begin     //FAZ A BUSCA DE PESSOA
  dmVenda.PesquisaPessoa(dmPrincipal.Grupo,dmPrincipal.Empresa,
    '1','cliente',edtPesquisarCliente.Text);

//==========================================
//CRIA A LISTA DA PESSOA CHAMANDO A LISTA DOS FRAME

 while not (dmVenda.fdtbPesquisaPessoa.Eof) do
    begin


     AddCliente;
     dmVenda.fdtbPesquisaPessoa.Next;

    end;

end;



procedure TFrmVenda1.BuscarTransportadora;
begin     //FAZ A BUSCA DA Trasnportadora

  dmVenda.PesquisaPessoa(dmPrincipal.Grupo,dmPrincipal.Empresa,
    '5','pes_nome',edtPesquisartrasportadora.Text);

//==========================================
//CRIA A LISTA Da TRANSPORTADORA CHAMANDO A LISTA DOS FRAME

 while not (dmVenda.fdtbPesquisaPessoa.Eof) do
    begin


     AddTrasportadora;
     dmVenda.fdtbPesquisaPessoa.Next;

    end;

end;



procedure TFrmVenda1.BuscarProduto;

begin  //PROCEDURE bUSCAR PRODUTO

//===========================================
// BUSCA O PRODUTO APARTIR DE SUAS CONDIÇOES NO SERVIDOR



  dmVenda.PesquisaProdutoVenda(dmPrincipal.Grupo, dmPrincipal.Empresa, 'produto',
                               edtPesquisaProduto.Text, '0', '0', '0', '4,2,3', '0', '1');

//==========================================
//CRIA A LISTA DE PRODUTO CHAMANDO A LISTA DOS FRAME

  while not (dmVenda.fdtbPesquisaProdutoVenda.Eof) do
    begin

     AddProduto;
     dmVenda.fdtbPesquisaProdutoVenda.Next;

    end;
end;



procedure TFrmVenda1.cbxFinanceiroClosePopup(Sender: TObject);
begin   //EVENTO Combo box

//=========================================
//LIMPA A LISTA  DO FINANCEIRO

   if  not dmVenda.fdtbFormaPagamento.IsEmpty then
   begin
    dmVenda.fdtbFormaPagamento.EmptyDataSet;
    ClearVertScrollBox(vsbFinanceiro, -1);
   end;

//===================================================
//CHAMA A LISTA FINANCEIRO
     dmVenda.PesquisaFormaPagamento(dmPrincipal.Grupo,
                                dmVenda.fdtbProdutopTotalGeral.Value,
                                dmVenda.fdtbTipoPagamentotpg_id.AsString);


   pnlVertFinalFinanceiro.Visible := False;
  //==========================================
//CRIA A LISTA DO FINANCEIRO CHAMANDO A LISTA DOS FRAME
  dmVenda.fdtbFormaPagamento.First;
  while not (dmVenda.fdtbFormaPagamento.Eof) do
    begin

     pnlVertFinanceiro.Visible := True;
     AddFinanceiro;

     dmVenda.fdtbFormaPagamento.Next;

    end;

end;

procedure TFrmVenda1.ConsultarItem(pStatus,pEditar : integer);
 var
freme : TFramItemSelecionado;
i: Integer;
jaCriado: TDictionary<Integer, Boolean>;

begin    //Lista de itens da escolha do produto


 if pStatus = 0 then
    begin

     //===========================================
     //Alinha os itens da lista
     vbsItensSelecionados.BeginUpdate;
     if not FFramesXProduto.TryGetValue(dmVenda.fdtbProduto.FieldByName('pProID').AsInteger, freme) then
       begin
       freme := TFramItemSelecionado.Create(nil);
       freme.position.Y := 9999999999;
       freme.Align := TAlignLayout.Top;
       FFramesXProduto.Add(dmVenda.fdtbProduto.FieldByName('pProID').AsInteger, freme);
       end;


    end;


    //=============================================
    //atualiza o frame

     if pEditar = 1  then
         begin
         if not jaCriado.ContainsKey(dmVenda.fdtbProduto.FieldByName('pProID').AsInteger) then
            begin
            freme := TFramItemSelecionado.Create(nil);
            freme.position.Y := 9999999999;
            freme.Align := TAlignLayout.Top;
            FFramesXProduto.Add(dmVenda.fdtbProduto.FieldByName('pProID').AsInteger, freme);
            jaCriado.Add(dmVenda.fdtbProduto.FieldByName('pProID').AsInteger, True);
            end;

         end;




     freme.idProduto := dmVenda.fdtbProdutopProID.AsInteger;
     freme.lblnom.Text := dmVenda.fdtbProduto.FieldByName('pProID').AsString +' - '+ dmVenda.fdtbProduto.FieldByName('pProduto').AsString;
     freme.lblValo.Text := 'R$ ' + FormatFloat('#0.00', (dmVenda.fdtbProduto.FieldByName('pValor').AsCurrency));
     freme.lblMarc.Text := 'Marca: ' + dmVenda.fdtbProduto.FieldByName('pMarca').AsString;
     freme.lblQtde.Text := 'Qtde: ' + dmVenda.fdtbProduto.FieldByName('pQtde').AsString;
     freme.lblValortotal.Text := FormatFloat('R$ ,0.00', StrToFloat(dmVenda.fdtbProdutopValorTotal.AsString));


     if dmVenda.fdtbProdutopDesc.Value > 0 then
     begin
     freme.lblPromocao.Visible := True;
     freme.lblPromocao.Text := FormatFloat('R$ ,0.00', dmVenda.fdtbProdutopDesc.AsFloat);
     end
       else
        freme.lblPromocao.Visible := False;


     freme.btnExcluir.OnClick := btnExcluirClick;
     vbsItensSelecionados.AddObject(Freme);
     if  Odd(freme.Index) then
      freme.recFundo.Fill.Color := $ffededed;



     vbsItensSelecionados.EndUpdate;



end;



procedure TFrmVenda1.edtPesquisaProdutoChange(Sender: TObject);
 // PESQUISA PRODUTO

begin

//===========================================
// limpa a lista de produtos
  if  not dmVenda.fdtbPesquisaProdutoVenda.IsEmpty then
   begin
    dmVenda.fdtbPesquisaProdutoVenda.EmptyDataSet;
    ClearVertScrollBox(VsbProduto, -1);
   end;

//============================================
//busca os produtos

   pnlvertproduto.Visible := True;
     if Length(edtPesquisaProduto.Text) > 2 then
        BuscarProduto;

//=============================================
//Erro de digitação ou nome curto

//   if Length(edtPesquisaProduto.Text) < 2 then
//       begin
//       SetupSound('error1.wav');
//       PlaySound;
//       Mensagem('Nome digitado muito curto',1);
//
//       Exit
//       end;

   if dmVenda.fdtbPesquisaProdutoVenda.IsEmpty then
      begin
      SetupSound('error1.wav');
      PlaySound;
      Mensagem('Produto não Localizado.',1);

      end;
end;

procedure TFrmVenda1.edtPesquisarClienteChange(Sender: TObject);
begin   //BUSCA PESSOA


//===========================================
// limpa a lista de cliente

 if  not dmVenda.fdtbPesquisaPessoa.IsEmpty then
   begin
    dmVenda.fdtbPesquisaPessoa.EmptyDataSet;
    ClearVertScrollBox(vsbCliente, -1);
   end;

//============================================
//busca os clientes

   pnlvertCliente.Visible := True;
   BuscarPessoa;


//=============================================
//Erro de digitação ou nome curto

//    if Length(edtPesquisarCliente.Text) < 3 then
//       begin
//       SetupSound('error1.wav');
//       PlaySound;
//       Mensagem('Nome digitado muito curto',1);
//
//       Exit
//       end;

   if dmVenda.fdtbPesquisaPessoa.IsEmpty then
      begin
      SetupSound('error1.wav');
      PlaySound;
      Mensagem('Cliente não Localizado.',1);

      end;

end;

procedure TFrmVenda1.edtPesquisartrasportadoraChange(Sender: TObject);
 //BUSCA PESSOA

begin
//===========================================
// limpa a lista de cliente

 if  not dmVenda.fdtbPesquisaPessoa.IsEmpty then
   begin
    dmVenda.fdtbPesquisaPessoa.EmptyDataSet;
    ClearVertScrollBox(vsbCliente, -1);
   end;

//============================================
//busca os clientes

   pnlVertTransporte.Visible := True;

   if Length(edtPesquisaProduto.Text) > 2 then
   BuscarTransportadora;


//=============================================
//Erro de digitação ou nome curto

//  if Length(edtPesquisartrasportadora.Text) < 3 then
//       begin
//       SetupSound('error1.wav');
//       PlaySound;
//       Mensagem('Nome digitado muito curto',1);
//
//       Exit
//       end;

   if dmVenda.fdtbPesquisaPessoa.IsEmpty then
      begin
      SetupSound('error1.wav');
      PlaySound;
      Mensagem('Transportadora não Localizada.',1);
      //ShowMessage('Cliente não Localizado.')

      end;
end;

procedure TFrmVenda1.fechar1Click(Sender: TObject);
begin
FrmVenda1.Close;
end;

procedure TFrmVenda1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if not dmvenda.fdtbProduto.IsEmpty then
    begin
     dmvenda.fdtbProduto.EmptyDataSet;
     ClearVertScrollBox(VsbProduto,-1);
    end;

end;

procedure TFrmVenda1.FormCreate(Sender: TObject);

begin //estanciando variavel permissão


 permissao := T99Permissions.Create;
 FFramesXProduto := TDictionary<Integer, TFramItemSelecionado>.Create;

end;

procedure TFrmVenda1.FormDestroy(Sender: TObject);
begin //destruindo varial permissão

  permissao.DisposeOf;
  FFramesXProduto.Free;

end;

procedure TFrmVenda1.FormShow(Sender: TObject);
begin    //ONSHOW FORM


//==========================================
//Deixa os itens indesejados  invisiveis

pnlVertTransporte.Visible := False;
pnlVertFinalFinanceiro.Visible := False;
TabControl1.ActiveTab := TabVenda;
pnlInfoVenda.Visible := False;
blQtds.Visible := False;
pnlfundovert.Visible := False;
pnlvertCliente.Visible := False;
pnlvertproduto.Visible := False;
pnlVertFinanceiro.Visible := False;
pnlfundovert.Visible := False;
rodapevenda.Visible := False;
lbTransportadora.Visible := False;
lbCliente.Visible := False;
btnCarrinho.Enabled := False;

btnFinanceiro.Enabled := False;
btnTransportadora.Enabled := False;
btnFinalizar.Enabled := False;




end;

procedure TFrmVenda1.Mensagem(texto: string; Tipo: Integer);
begin  //Procedure mensagem

 case Tipo of
 0: begin
    //Mensagem Sucesso

    FrmMensagem1.imgSucesso.Visible := True;
    FrmMensagem1.imgErro.Visible := False;
    FrmMensagem1.imgAlerta.Visible := False;
    FrmMensagem1.btnCancelar.Visible := False;
    FrmMensagem1.btnConfirmar.Visible := False;
    FrmMensagem1.btnOk.Visible := True;
    end;
  1: begin
     //Mensagem Erro

     FrmMensagem1.imgSucesso.Visible := False;
     FrmMensagem1.imgErro.Visible := True;
     FrmMensagem1.imgAlerta.Visible := False;
     FrmMensagem1.btnCancelar.Visible := False;
     FrmMensagem1.btnConfirmar.Visible := False;
     FrmMensagem1.btnOk.Visible := True;
     end;

  2: begin
     //Mensagem Alerta

     FrmMensagem1.imgSucesso.Visible := False;
     FrmMensagem1.imgErro.Visible := False;
     FrmMensagem1.imgAlerta.Visible := True;
     FrmMensagem1.btnCancelar.Visible := True;
     FrmMensagem1.btnCancelar.Align := TAlignLayout.Right;
     FrmMensagem1.btnCancelar.Margins.Right := 70;


     FrmMensagem1.btnConfirmar.Visible := True;
     FrmMensagem1.btnConfirmar.Align := TAlignLayout.Left;
     FrmMensagem1.btnConfirmar.Margins.Left := 70;
     FrmMensagem1.btnOk.Visible := False;

     end;

 end;

//Recebe texto

FrmMensagem1.MensagemConf_Cancel(texto);
FrmMensagem1.Show;
FrmMensagem1.BringToFront;

end;

end.
