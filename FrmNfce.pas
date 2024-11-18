unit FrmNfce;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.DateTimeCtrls, FMX.ListBox, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type
  TFrmNfce1 = class(TForm)
    Layout1: TLayout;
    Layout4: TLayout;
    Rectangle17: TRectangle;
    btnFechar: TRectangle;
    RoundRect8: TRoundRect;
    btnPesquisar: TRectangle;
    edtPesquisaNfce: TEdit;
    pnlvertNfce: TRectangle;
    vsbNfce: TVertScrollBox;
    StyleBook1: TStyleBook;
    Layout2: TLayout;
    TabControl1: TTabControl;
    TabNFCe: TTabItem;
    TabImpressao: TTabItem;
    ActionList1: TActionList;
    actNfce: TChangeTabAction;
    actImpressao: TChangeTabAction;
    StyleBook2: TStyleBook;
    dtInicial: TDateEdit;
    dtFinal: TDateEdit;
    Layout3: TLayout;
    Rectangle1: TRectangle;
    cbxBluethoof: TComboBox;
    Rectangle14: TRectangle;
    Rectangle2: TRectangle;
    Memo1: TMemo;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaNfceChange(Sender: TObject);
    procedure Rectangle14Click(Sender: TObject);
  private
    procedure BuscarVenda;
    procedure ClearVertScrollBox(VSBox: TVertScrollBox; Index: integer = -1);
    procedure AddNfce;
    procedure OnGerar(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNfce1: TFrmNfce1;

implementation

{$R *.fmx}

uses FrmMenu, udmPrincipal, udmVenda, FrameNfce;

procedure TFrmNfce1.AddNfce;
var     //Lista de Nfce

    frame: TFremNfce;
begin
    frame := TFremNfce.create(nil);


    frame.position.Y := 9999999999;
    frame.Align := TAlignLayout.Top;

    frame.lblDescricao.Text := dmVenda.fdtbPesquisaNFpes_id.AsString +' - '+ dmVenda.fdtbPesquisaNFpes_nome.AsString;
    frame.lblQtdeTitulos.Text := 'ID Venda : ' + dmVenda.fdtbPesquisaNFven_id.AsString + '      data: ' + dmVenda.fdtbPesquisaNFven_dtvenda.AsString;
    frame.lblIntervalo.Text := FormatFloat('R$ ,0.00', StrToFloat(dmVenda.fdtbPesquisaNFven_vnfe.AsString));

    frame.Grupo := dmVenda.fdtbPesquisaNFgre_id.AsString;
    frame.Empresa := dmVenda.fdtbPesquisaNFemp_id.AsString;
    frame.Pessoa := dmVenda.fdtbPesquisaNFpes_id.AsString;
    frame.IDvenda := dmVenda.fdtbPesquisaNFven_id.AsInteger;
    frame.NFCCancelada := dmVenda.fdtbPesquisaNFven_cancelada.AsInteger;
    frame.NFCEmitido :=  dmVenda.fdtbPesquisaNFven_nf_emitida.AsInteger;

  //==========================================
//CONVERTE AS LABELS DOS FRAMES

   if frame.NFCEmitido <= 0 then
      begin
        frame.lblStatus.Text := 'NFC-e não Emitida';
        frame.btVerd.Visible := False;
        frame.btVermelho.Visible := True;
        frame.lblCancelada.Visible := False;
        frame.btnVermelho.Visible := False;
        frame.btnVerde.Visible := False;

      end
       else
          begin

            frame.lblStatus.Text := 'NFC-e Emitida';
            frame.btVerd.Visible := True;
            frame.btVermelho.Visible := False;
            frame.lblCancelada.Visible := True;
            frame.lblTextBotao.Text := 'Imprimir'

          end;

   case frame.NFCEmitido of

    1,2:begin

      if frame.NFCCancelada <= 0 then
        begin
         frame.lblCancelada.Text := 'NFC-e não Cancela';
         frame.btnVerde.Visible := False;
        frame.btnVermelho.Visible := True;
        frame.lblCancelada.Visible := True;
        end
          else
           begin
            frame.lblCancelada.Text := 'NFC-e Cancelada';
            frame.btnVerde.Visible := True;
            frame.btnVermelho.Visible := False;
           end;

    end;
    0:begin

    end;



   end;




    frame.btnGerar.OnClick := OnGerar;

    vsbNfce.AddObject(Frame);
    if  Odd(frame.Index) then
    frame.recFundo.Fill.Color := $ffededed;


    vsbNfce.AddObject(frame);

end;

procedure TFrmNfce1.ClearVertScrollBox(VSBox: TVertScrollBox; Index: integer = -1);
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




procedure TFrmNfce1.edtPesquisaNfceChange(Sender: TObject);
begin
//===========================================
// limpa a lista de nfc-e
  if  not dmVenda.fdtbPesquisaNF.IsEmpty then
   begin
    dmVenda.fdtbPesquisaNF.EmptyDataSet;
    ClearVertScrollBox(vsbNfce, -1);
   end;

//============================================
//busca a nfc-e

   pnlvertNfce.Visible := True;
     if Length(edtPesquisaNfce.Text) > 2 then
        BuscarVenda;

//=============================================
//Erro de digitação ou nome curto

   //if Length(edtPesquisaVenda.Text) = 0 then
       begin
       // BuscarVenda;

       // Exit
       end;

   if dmVenda.fdtbPesquisaNF.IsEmpty then
      ShowMessage('NFC-e não Localizada.')
end;

procedure TFrmNfce1.BuscarVenda;
begin  //PROCEDURE bUSCAR venda

//===========================================
// BUSCA A lista nfce APARTIR DE SUAS CONDIÇOES NO SERVIDOR

dmVenda.PesquisaNF(dmPrincipal.Grupo, dmPrincipal.Empresa, dmPrincipal.Pessoa,dmPrincipal.Token, edtPesquisaNfce.Text,dtInicial.ToString, dtFinal.ToString);

//==========================================
//CRIA A LISTA nf-e CHAMANDO A LISTA DOS FRAME

   while not (dmVenda.fdtbPesquisaNF.Eof) do

    begin

     AddNfce;
     dmVenda.fdtbPesquisaNF.Next;

    end;
end;




procedure TFrmNfce1.FormShow(Sender: TObject);
begin
pnlvertNfce.Visible := False;
actNfce.Execute;
dtInicial.DateTime := Now - 30;
dtFinal.DateTime := Now;

end;

procedure TFrmNfce1.OnGerar(Sender: TObject);
var //BtnGerar
    rect: TRectangle;
    frame: TFremNfce;
    btnGerar : TRoundRect;
    I : Integer;
    pData : TDate;

begin

  //BOTÃO GERAR NFC-E
 //-------------------------------------------------
  btnGerar := TRoundRect(Sender);
    rect := btnGerar.Parent as TRectangle;

    if (Sender as TComponent).Owner is TFremNfce then
      frame :=  (Sender as TComponent).Owner as TFremNfce
    else
      Exit;



actImpressao.Execute;
dmVenda.PesqXML(dmPrincipal.Grupo, dmPrincipal.Empresa,dmPrincipal.Token, frame.IDvenda.ToString);

   if not dmVenda.fdtbPesqXML.IsEmpty then
    begin



    Memo1.Lines.Add(dmVenda.fdtbPesqXMLnfc_xml.AsString);

    end;


end;

procedure TFrmNfce1.Rectangle14Click(Sender: TObject);
begin
actNfce.Execute;
end;

procedure TFrmNfce1.btnFecharClick(Sender: TObject);
begin
  Application.CreateForm(TFrmMenu1, FrmMenu1);
       FrmMenu1.Show;
 FrmNfce1.Close;

end;

end.
