unit frmCadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.Edit, FMX.ListBox, uFormat, FMX.Media, System.IOUtils;

type
  TFrmCadastro1 = class(TForm)
    Layout1: TLayout;
    Layout4: TLayout;
    Rectangle17: TRectangle;
    Label8: TLabel;
    btnFechar: TRectangle;
    pnlBotoes: TRoundRect;
    btnPessoa: TRectangle;
    btnProduto: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Layout3: TLayout;
    TabControl1: TTabControl;
    TabCadCliente: TTabItem;
    TabCadProduto: TTabItem;
    TabPrincipal: TTabItem;
    Layout10: TLayout;
    ImagemFundo: TRectangle;
    pnlfundovert: TRectangle;
    vbsItensSelecionados: TVertScrollBox;
    rodapevenda: TRectangle;
    lbValorfinal: TLabel;
    ActionList1: TActionList;
    actCadCliente: TChangeTabAction;
    actCadProduto: TChangeTabAction;
    actPrincipal: TChangeTabAction;
    StyleBook1: TStyleBook;
    RoundRect2: TRoundRect;
    edtnome: TEdit;
    pnlIE: TRoundRect;
    edtIE: TEdit;
    RoundRect4: TRoundRect;
    edtcnpj_Cpf: TEdit;
    RoundRect5: TRoundRect;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    RoundRect6: TRoundRect;
    Label7: TLabel;
    RoundRect7: TRoundRect;
    edtCep: TEdit;
    Label9: TLabel;
    RoundRect9: TRoundRect;
    Label10: TLabel;
    edtIbge: TEdit;
    RoundRect8: TRoundRect;
    edtEndereco: TEdit;
    Label11: TLabel;
    RoundRect10: TRoundRect;
    edtNumero: TEdit;
    Label12: TLabel;
    RoundRect11: TRoundRect;
    edtComplemento: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    RoundRect12: TRoundRect;
    edtBairro: TEdit;
    RoundRect13: TRoundRect;
    edtCidade: TEdit;
    Label15: TLabel;
    RoundRect14: TRoundRect;
    edtCelular: TEdit;
    btnCancelar: TRoundRect;
    btnSalvar: TRoundRect;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Layout2: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout11: TLayout;
    Layout12: TLayout;
    edtEmail: TEdit;
    edtUF: TEdit;
    Layout13: TLayout;
    Layout14: TLayout;
    pnlRazaosocial: TRoundRect;
    edtRazaosocial: TEdit;
    Label19: TLabel;
    RadFisica: TRadioButton;
    RadJuridica: TRadioButton;
    MediaPlayer1: TMediaPlayer;
    btnPesquisar: TRectangle;
    procedure btnFecharClick(Sender: TObject);
    procedure btnPessoaClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtcnpj_CpfEnter(Sender: TObject);
    procedure edtcnpj_CpfExit(Sender: TObject);
    procedure edtCelularEnter(Sender: TObject);
    procedure edtCelularExit(Sender: TObject);
    procedure edtCepEnter(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
    procedure RadJuridicaChange(Sender: TObject);
    procedure RadFisicaChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    procedure PlaySound;
    procedure SetupSound(Som: string);
    { Private declarations }
  public

 function ValidaEdt(campo,text: string) :string;
    { Public declarations }
  end;

var
  FrmCadastro1: TFrmCadastro1;

implementation

{$R *.fmx}

uses FrmMenu,udmVenda, udmPrincipal, FrmVenda;

procedure TFrmCadastro1.btnCancelarClick(Sender: TObject);
begin
actPrincipal.Execute;
pnlBotoes.Visible := True;
ImagemFundo.Align := TAlignLayout.Center;



end;

procedure TFrmCadastro1.btnFecharClick(Sender: TObject);
begin
  Application.CreateForm(TFrmMenu1, FrmMenu1);
       FrmMenu1.Show;
  actPrincipal.Execute;
 FrmCadastro1.Close;



end;

procedure TFrmCadastro1.btnPesquisarClick(Sender: TObject);
var
 pEndereco : String;
begin

  pEndereco := dmVenda.PesqCep(EdtCep.Text);

   if pEndereco = '1' then
    begin
     edtEndereco.Text := dmVenda.endereco;
     edtBairro.Text   := dmVenda.bairro;
     edtIbge.Text     := dmVenda.ibge;
     edtuf.Text       := dmVenda.uf_;
     edtCidade.Text   :=  dmVenda.Cidade;
    end;

end;

procedure TFrmCadastro1.btnPessoaClick(Sender: TObject);
begin
actCadCliente.Execute;
pnlBotoes.Visible := False;

RadFisica.IsChecked := True;




end;

procedure TFrmCadastro1.FormCreate(Sender: TObject);
begin
actPrincipal.Execute;

btnProduto.Enabled := False;


end;

procedure TFrmCadastro1.RadFisicaChange(Sender: TObject);
begin
pnlIE.Enabled := False;
pnlRazaosocial.Enabled := False;
edtIE.Enabled := False;
edtRazaosocial.Enabled := False;
end;

procedure TFrmCadastro1.RadJuridicaChange(Sender: TObject);
begin

pnlIE.Enabled := True;
pnlRazaosocial.Enabled := True;
edtIE.Enabled := True;
edtRazaosocial.Enabled := True;

end;

procedure TFrmCadastro1.btnProdutoClick(Sender: TObject);
begin

 actCadProduto.Execute;

end;

procedure TFrmCadastro1.SetupSound(Som: string);
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

function TFrmCadastro1.ValidaEdt(campo,text: string ): string;
var
 texto : string;
begin

  if text = '' then
  Result := 'Campo está vazio'
   else
     Result := '0';


end;

procedure TFrmCadastro1.PlaySound;
begin

 if MediaPlayer1.State = TMediaState.Playing then
    MediaPlayer1.Stop;

 if MediaPlayer1.Media <> nil  then
    MediaPlayer1.Play;


end;

procedure TFrmCadastro1.btnSalvarClick(Sender: TObject);
var
Tipo,ResultadoValidacao : string;
pResultado: string;
begin




    // se caso for dependente ele pode fazer o cadastro sem restrição.
   if ResultadoValidacao <> '' then
    begin
        ShowMessage(ResultadoValidacao);
        Abort;
    end;

   if RadJuridica.IsChecked = True then
    Tipo := '0'
     else
       Tipo := '1';

   if RadJuridica.IsChecked = True then
    begin

      if edtRazaoSocial.Text = '' then
        begin
            SetupSound('error1.wav');
            PlaySound;
           FrmVenda1.Mensagem('Quando pessoa jurídica, informe a Razão Social.',1);
           edtRazaoSocial.SetFocus;
           exit;
        end;

    end;


  pResultado := ValidaEdt('edtNome',edtnome.Text);
   if pResultado <> '0' then
    begin

      SetupSound('error1.wav');
            PlaySound;
     FrmVenda1.Mensagem(pResultado,1);
     exit;
    end;
  pResultado := ValidaEdt('edtCep',edtCep.Text);
   if pResultado <> '0' then
      begin
      SetupSound('error1.wav');
      PlaySound;
     FrmVenda1.Mensagem(pResultado,1);
     exit;
    end;


  FrmVenda1.Mensagem( dmVenda.NovaPessoa(dmPrincipal.Grupo, dmPrincipal.Empresa,
                     edtNome.Text, edtcnpj_Cpf.Text, edtEndereco.Text, edtBairro.Text,
                     edtCidade.Text, edtNumero.Text, edtUF.Text, edtIBge.Text,
                     edtCep.Text, edtEmail.Text, edtComplemento.Text, '0',
                      Tipo, edtCelular.Text,edtRazaoSocial.Text,edtIE.Text,
                     dmPrincipal.Pessoa),0);


  SetupSound('sucesso.wav');
  PlaySound;

  actPrincipal.Execute;
  pnlBotoes.Visible := True;



end;

procedure TFrmCadastro1.edtCepEnter(Sender: TObject);
begin
ResetFormat(edtCep);
end;

procedure TFrmCadastro1.edtCepExit(Sender: TObject);
begin
Formatar(edtCep, TFormato.CEP);
end;

procedure TFrmCadastro1.edtcnpj_CpfEnter(Sender: TObject);
begin
ResetFormat(edtcnpj_Cpf);
end;

procedure TFrmCadastro1.edtcnpj_CpfExit(Sender: TObject);
var
 pCNPJ_CPF : string;
begin

        pCNPJ_CPF :=  edtcnpj_Cpf.Text;


      if RadFisica.IsChecked = True then
         begin
          Formatar(edtcnpj_Cpf, TFormato.CPF);
         end;

     if RadJuridica.IsChecked = True then
          begin
          Formatar(edtcnpj_Cpf, TFormato.CNPJ);
         end;



        if dmVenda.consultaPessoa((dmPrincipal.Grupo), edtcnpj_Cpf.Text) > 0  then
          begin
            // verifica se o cliente e prospeto, pois pode cadastrar sem cnpj_cpf
            if dmVenda.fdtbConsultarCNPJCPF.RecordCount > 0 then
              begin

                FrmVenda1.Mensagem('Já existe um cadastro com esses dados.',1);
                btnSalvar.Enabled := False;
                SetupSound('erro1.wav');
                   PlaySound;
                Exit;
              end;
          end
           else
            begin
              btnSalvar.Enabled := True;
            end;




end;

procedure TFrmCadastro1.edtCelularEnter(Sender: TObject);
begin

 ResetFormat(edtCelular);

end;

procedure TFrmCadastro1.edtCelularExit(Sender: TObject);
begin
 Formatar(edtCelular, TFormato.Celular);
end;

end.
