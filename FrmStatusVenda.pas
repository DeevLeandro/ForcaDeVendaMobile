unit FrmStatusVenda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit,
  System.Bluetooth, System.Bluetooth.Components, FMX.ListBox, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.TabControl, System.Actions, FMX.ActnList,
  FMX.Media, System.IOUtils;

type
  TFrmStatusVenda1 = class(TForm)
    Layout1: TLayout;
    Layout4: TLayout;
    Rectangle17: TRectangle;
    btnFechar: TRectangle;
    RoundRect8: TRoundRect;
    btnPesquisar: TRectangle;
    pnlvertVenda: TRectangle;
    vsbVenda: TVertScrollBox;
    StyleBook1: TStyleBook;
    edtPesquisaVenda: TEdit;
    Layout2: TLayout;
    TabControl1: TTabControl;
    TabStatusVenda: TTabItem;
    TabImpressao: TTabItem;
    Memo1: TMemo;
    MediaPlayer1: TMediaPlayer;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaVendaChange(Sender: TObject);


  private


  procedure AddVenda;
  procedure BuscarVenda;
    procedure PlaySound;
    procedure SetupSound(Som: string);




    { Private declarations }
  public

 procedure ClearVertScrollBox(VSBox: TVertScrollBox; Index: integer = -1 );

    { Public declarations }
  end;

var
  FrmStatusVenda1: TFrmStatusVenda1;

implementation

{$R *.fmx}



uses FrmMenu, FrameVenda, udmVenda, udmPrincipal, FrmVenda;


procedure TFrmStatusVenda1.AddVenda;
var     //Lista de venda

    frame: TFremVenda;
begin
    frame := TFremVenda.create(nil);


    frame.position.Y := 9999999999;
    frame.Align := TAlignLayout.Top;



  //==========================================
//CONVERTE AS LABELS DOS FRAMES

    frame.lblcliente.Text := dmVenda.fdtbConsultarPedidospes_id.AsString +' - '+ dmVenda.fdtbConsultarPedidospes_nome.AsString;
    frame.lblIDVenda.Text := 'ID Venda : ' + dmVenda.fdtbConsultarPedidosven_id.AsString + '      data: ' + dmVenda.fdtbConsultarPedidosven_dtvenda.AsString;
    frame.lblValorVenda.Text := FormatFloat('R$ ,0.00', StrToFloat(dmVenda.fdtbConsultarPedidosven_vnfe.AsString));
    frame.lblTipoPagamento.Text := 'Status:' + dmVenda.fdtbConsultarPedidospStatus.AsString;

    frame.Grupo := dmVenda.fdtbConsultarPedidosgre_id.AsString;
    frame.Empresa := dmVenda.fdtbConsultarPedidosemp_id.AsString;
    frame.Pessoa := dmVenda.fdtbConsultarPedidospes_id.AsString;



    vsbVenda.AddObject(Frame);
    if  Odd(frame.Index) then
    frame.recFundo.Fill.Color := $ffededed;


    vsbVenda.AddObject(frame);

end;




procedure TFrmStatusVenda1.ClearVertScrollBox(VSBox: TVertScrollBox; Index: integer = -1);
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





procedure TFrmStatusVenda1.btnFecharClick(Sender: TObject);
begin

  Application.CreateForm(TFrmMenu1, FrmMenu1);
       FrmMenu1.Show;

  FrmStatusVenda1.Close;

end;


procedure TFrmStatusVenda1.BuscarVenda;
begin  //PROCEDURE bUSCAR venda

//===========================================
// BUSCA a venda APARTIR DE SUAS CONDIÇOES NO SERVIDOR

dmVenda.PesqPedidos(dmPrincipal.Grupo, dmPrincipal.Empresa, dmPrincipal.Pessoa,dmPrincipal.Token, edtPesquisaVenda.Text);

//==========================================
//CRIA A LISTA venda CHAMANDO A LISTA DOS FRAME

   while not (dmVenda.fdtbConsultarPedidos.Eof) do

    begin

     AddVenda;
     dmVenda.fdtbConsultarPedidos.Next;

    end;
end;

procedure TFrmStatusVenda1.edtPesquisaVendaChange(Sender: TObject);
begin

//===========================================
// limpa a lista de venda
  if  not dmVenda.fdtbConsultarPedidos.IsEmpty then
   begin
    dmVenda.fdtbConsultarPedidos.EmptyDataSet;
    ClearVertScrollBox(vsbVenda, -1);
   end;

//============================================
//busca a venda

   pnlvertVenda.Visible := True;
     if Length(edtPesquisaVenda.Text) > 2 then
        BuscarVenda;

//=============================================
//Erro de digitação ou nome curto

   //if Length(edtPesquisaVenda.Text) = 0 then
       begin
       // BuscarVenda;

       // Exit
       end;

   if dmVenda.fdtbConsultarPedidos.IsEmpty then
      begin

      SetupSound('error1.wav');
      PlaySound;
      FrmVenda1.Mensagem('Venda não Localizada.',1);

      end;

end;


procedure TFrmStatusVenda1.SetupSound(Som: string);
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

procedure TFrmStatusVenda1.PlaySound;
begin

 if MediaPlayer1.State = TMediaState.Playing then
    MediaPlayer1.Stop;

 if MediaPlayer1.Media <> nil  then
    MediaPlayer1.Play;
end;

procedure TFrmStatusVenda1.FormShow(Sender: TObject);
begin


TabControl1.ActiveTab := TabStatusVenda;
pnlvertVenda.Visible := False;
end;

end.
