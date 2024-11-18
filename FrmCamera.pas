unit FrmCamera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Media, FMX.Layouts,
  ZXing.ScanManager, ZXing.ReadResult, ZXing.BarcodeFormat, FMX.Platform;

type
  TFrmCamera1 = class(TForm)
    CameraComponent: TCameraComponent;
    lblErro: TLabel;
    imgCamera: TImage;
    Layout4: TLayout;
    Rectangle17: TRectangle;
    Label8: TLabel;
    btnFechar: TRectangle;
    procedure CameraComponentSampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
     FScanManager : TScanManager;
     FScanInProgress: Boolean;
     FFrameTake : Integer;
    procedure processarImagem;

    { Private declarations }
  public

    Codigo : string;

    { Public declarations }
  end;

var
  FrmCamera1: TFrmCamera1;

implementation

{$R *.fmx}

uses FrmVenda;


procedure TFrmCamera1.FormCreate(Sender: TObject);
begin // estacia a variavel na criação do formulario

  FScanManager := TScanManager.Create(TBarcodeFormat.Auto, nil);

end;

procedure TFrmCamera1.FormDestroy(Sender: TObject);
begin //destroi tudo

FScanManager.DisposeOf;
end;

procedure TFrmCamera1.FormShow(Sender: TObject);
begin //onshow
  FFrameTake := 0;
  CameraComponent.Active := False;
  CameraComponent.Kind := TCameraKind.BackCamera;
  CameraComponent.FocusMode := TFocusMode.ContinuousAutoFocus;
  CameraComponent.Quality := TVideoCaptureQuality.MediumQuality;
  CameraComponent.Active := True;

end;

procedure TFrmCamera1.processarImagem;
var  //Processamento de imagem
   bpm : TBitmap;
   ReadResult : TReadResult;


begin

//======================================
//a cada imagem que entrar reculpera a imagem e joga no timagem

  CameraComponent.SampleBufferToBitmap(imgCamera.Bitmap, True);

//======================================
//verifica se ja nao está em processamento

  if FScanInProgress = True then
     exit;

//======================================
//incrementou o frame rate

  Inc(FFrameTake);

//======================================
//faz a leitura de 4 em 4 frames

  if FFrameTake mod 4 <> 0 then
     Exit;

 //======================================
//istencia o bmp com base na imagem que esta no fundo

  bpm := TBitmap.Create;
  bpm.Assign(imgCamera.Bitmap);
  ReadResult := nil;

  try

  //marca o inicio de um scaniamento

   FScanInProgress := True;

     try

      // Faz o Scaniamento

      ReadResult := FScanManager.Scan(bpm);

        if ReadResult <> nil then

      //se conseguir ler a imagem no scaniamento joga para variavel codigo e fecha
        begin

         CameraComponent.Active := False;
         Codigo := ReadResult.text;
         Close;

        end;

      // SE algo deu errado joga o erro na lbl
     except on ex: exception do

     lblErro.Text := ex.Message;
     end;

  finally

   // e por fim desabilita o prossecamento e mata a memoria

  bpm.DisposeOf;
  ReadResult.DisposeOf;
  FScanInProgress := False;

  end;





end;

procedure TFrmCamera1.btnFecharClick(Sender: TObject);
begin  //fecha form

   CameraComponent.Active := False;
   Close;
   FrmVenda1.Show;


end;

procedure TFrmCamera1.CameraComponentSampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin

    processarImagem;

end;

end.
