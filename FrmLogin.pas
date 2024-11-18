unit FrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, System.Rtti,
  FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Data.DB, FMX.ScrollBox, FMX.Grid, System.IOUtils,
  FMX.Media, System.Notification, DateUtils ;

type
  TFrmLogin1 = class(TForm)
    Layout: TLayout;
    Circle1: TCircle;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    RoundRect3: TRoundRect;
    Layout4: TLayout;
    RoundRect1: TRoundRect;
    edtLogin: TEdit;
    Layout5: TLayout;
    RoundRect2: TRoundRect;
    edtsenha: TEdit;
    Layout6: TLayout;
    btnEntrar: TRoundRect;
    Label2: TLabel;
    StyleBook1: TStyleBook;
    Layout7: TLayout;
    pnlLogin: TRectangle;
    vsblogin: TVertScrollBox;
    btnOlhoAberto: TRectangle;
    btnOlhoFechado: TRectangle;
    MediaPlayer1: TMediaPlayer;
    NotificationCenter1: TNotificationCenter;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOlhoFechadoClick(Sender: TObject);
    procedure btnOlhoAbertoClick(Sender: TObject);
    procedure lblSairClick(Sender: TObject);
    procedure NotificationCenter1ReceiveLocalNotification(Sender: TObject;
      ANotification: TNotification);
    procedure FormShow(Sender: TObject);

  private
    procedure AddLogin;
    procedure OnEntrar(Sender: TObject);
    procedure ClearVertScrollBox(VSBox: TVertScrollBox; Index: integer = -1);
    procedure PlaySound;
    procedure SetupSound(Som: string);
    procedure EnviarNotificacao(Nome, Titulo, Texto: string);
    procedure EnviarNotificacaoAgendada(Nome, Titulo, Texto: string;
      segundos: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin1: TFrmLogin1;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}

uses FrmMenu,udmPrincipal, FrameLogin, FrmVenda;



procedure TFrmLogin1.SetupSound(Som: string);
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

procedure TFrmLogin1.PlaySound;
begin

 if MediaPlayer1.State = TMediaState.Playing then
    MediaPlayer1.Stop;

 if MediaPlayer1.Media <> nil  then
    MediaPlayer1.Play;


end;

procedure TFrmLogin1.AddLogin;
var   //Lista de login
    frame: TFremLogin;
begin
    frame := TFremLogin.create(nil);


    frame.position.Y := 9999999999;
    frame.Align := TAlignLayout.Top;



    frame.lblnome.Text := dmPrincipal.fdtbLoginemp_id.AsString +' - '+ dmPrincipal.fdtbLoginpes_nome.AsString;


   frame.Grupo := dmPrincipal.fdtbLogingre_id.AsString;
    frame.Empresa := dmPrincipal.fdtbLoginemp_id.AsString;
    frame.Pessoa := dmPrincipal.fdtbLoginpes_id_1.AsString;
    frame.NomeEmpresa := dmPrincipal.fdtbLoginpes_nome.AsString;
    frame.Token       := dmPrincipal.fdtbLogincon_token.AsString;

    frame.btnEntrar.OnClick := OnEntrar;
    vsblogin.AddObject(Frame);
    if  Odd(frame.Index) then
    frame.recFundo.Fill.Color := $ffededed;


    vsblogin.AddObject(frame);

end;





procedure TFrmLogin1.btnEntrarClick(Sender: TObject);

begin

     if not dmPrincipal.fdtbLogin.IsEmpty then
     begin
      ClearVertScrollBox(vsblogin,-1);
      dmPrincipal.fdtbLogin.EmptyDataSet;

     end;


   pnlLogin.Visible := True;
  try

    dmPrincipal.Login(edtLogin.Text, edtSenha.Text);
    while not (dmPrincipal.fdtbLogin.Eof) do
     begin
      AddLogin;
      dmPrincipal.fdtbLogin.Next;
     end;


    if  dmPrincipal.fdtbLogin.RecordCount < 0 then
      begin
         SetupSound('error.wav');
         PlaySound;
        FrmVenda1.Mensagem('login ou senha invalido.',1);
        exit;
      end;
    if  dmPrincipal.fdtbLogin.RecordCount = 0 then
      begin
         SetupSound('error.wav');
         PlaySound;
        FrmVenda1.Mensagem('login ou senha invalido.',1);

        exit;
      end;

  finally

  end;


end;

procedure TFrmLogin1.btnOlhoAbertoClick(Sender: TObject);
begin
btnOlhoFechado.Visible := True;
btnOlhoAberto.Visible := False;
edtsenha.Password := True;

end;

procedure TFrmLogin1.btnOlhoFechadoClick(Sender: TObject);
begin
btnOlhoFechado.Visible := False;
btnOlhoAberto.Visible := True;
edtsenha.Password := False;

end;

procedure TFrmLogin1.FormCreate(Sender: TObject);
begin
edtLogin.SetFocus;
pnlLogin.Visible := False;
//edtLogin.Text := 'FLAVIO.FARM';
//edtsenha.Text := '235188';
end;


procedure TFrmLogin1.FormShow(Sender: TObject);
begin

//  EnviarNotificacaoAgendada('BemVindo','Seja Bem Vindo a EquilíbrioMobile' ,'Caso precise de ajuda entre em contato com o Suporte', 2);

end;

procedure TFrmLogin1.lblSairClick(Sender: TObject);
begin

FrmLogin1.Close;
end;

procedure TFrmLogin1.NotificationCenter1ReceiveLocalNotification(
  Sender: TObject; ANotification: TNotification);
begin    //mensagem da notificação

//   if ANotification.Name = 'BemVindo' then
//      ShowMessage('Faça suas Venda de um jeito facil e pratico');


end;

procedure TFrmLogin1.ClearVertScrollBox(VSBox: TVertScrollBox; Index: Integer = -1);
var     //exclui os itens da Lista
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

procedure TFrmLogin1.EnviarNotificacaoAgendada(Nome, Titulo, Texto: string; segundos: integer);
var            //Notificação agendada
 MinhaNotificacao : TNotification;
begin

//  MinhaNotificacao := FrmLogin1.NotificationCenter1.CreateNotification;
//
//
//   try
//
//    MinhaNotificacao.Name := Nome;
//    MinhaNotificacao.Title := Titulo;
//    MinhaNotificacao.AlertBody := Texto;
//    MinhaNotificacao.FireDate := IncSecond(Now, segundos);
//
//    //FrmLogin1.NotificationCenter1.PresentNotification(MinhaNotificacao);
//    FrmLogin1.NotificationCenter1.ScheduleNotification(MinhaNotificacao);
//   finally
//
//   MinhaNotificacao.DisposeOf;
//
//   end;

end;

procedure TFrmLogin1.EnviarNotificacao(Nome, Titulo, Texto: string);
var              //notificação por click
 MinhaNotificacao : TNotification;
begin

//   MinhaNotificacao := FrmLogin1.NotificationCenter1.CreateNotification;
//
//
//  try
//
//    MinhaNotificacao.Name := Nome;
//    MinhaNotificacao.Title := Titulo;
//    MinhaNotificacao.AlertBody := Texto;
//
//    FrmLogin1.NotificationCenter1.PresentNotification(MinhaNotificacao);
//
//  finally
//
//   MinhaNotificacao.DisposeOf;
//
//  end;

end;


procedure TFrmLogin1.OnEntrar(Sender: TObject);

 //BOTÃO entrar
var
    rect: TRectangle;
    frame: TFremLogin;
    btnEntrar : TRoundRect;
begin


  btnEntrar := TRoundRect(Sender);
    rect := btnEntrar.Parent as TRectangle;

    if (Sender as TComponent).Owner is TFremLogin then
      frame :=  (Sender as TComponent).Owner as TFremLogin
    else
      Exit;

 IF not dmPrincipal.fdtbLogin.IsEmpty then
     begin

      pnlLogin.Visible := True;


           dmPrincipal.Grupo := frame.Grupo;
           dmPrincipal.Empresa := frame.Empresa;
           dmPrincipal.Pessoa := frame.Pessoa;
           dmPrincipal.NomeEmpresa := frame.NomeEmpresa;
           dmPrincipal.Token := frame.Token;

           SetupSound('sucesso.wav');
           PlaySound;

//            SetupSound('caixa.mp3');
//           PlaySound;

      Application.CreateForm(TFrmVenda1, FrmVenda1);
       FrmVenda1.Show;
       //EnviarNotificacao('FacaSuas','Faça suas Vendas de um jeito simples' ,' ');

     end;

end;

end.
