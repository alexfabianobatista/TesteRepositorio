unit UReciboParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFReciboParam = class(TForm)
    BtOk: TBitBtn;
    BitBtn1: TBitBtn;
    Label10: TLabel;
    BtConsFilial: TBitBtn;
    MEFilial: TMaskEdit;
    EdFilial: TEdit;
    MENumRecibo: TMaskEdit;
    MENumOS: TMaskEdit;
    MEValor: TMaskEdit;
    MEReferente: TMaskEdit;
    MECliente: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MEData: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    MEResponsavel: TMaskEdit;
    MECodCliente: TMaskEdit;
    BTClienteCons: TBitBtn;
    MeCodResponsavel: TMaskEdit;
    BtResponsavel: TBitBtn;
    procedure BtOkClick(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTClienteConsClick(Sender: TObject);
    procedure MECodClienteExit(Sender: TObject);
    procedure MeCodResponsavelExit(Sender: TObject);
    procedure BtResponsavelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReciboParam: TFReciboParam;

implementation

uses UFilial_cl, URRecibo, UFilialCons, UUsuario_cl, UCadastroCons,
  UCadastro_cl, UOracle_cl, UParamSistema_cl, URReciboOS;

{$R *.DFM}

procedure TFReciboParam.BtOkClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario(MEFilial.Text,'CAIXA'); //SEGURANÇA FILIAL
  ModalResult := mrNone;
  If Trim(MEFilial.Text) = '' Then
    Raise Exception.Create('Filial não Informada!');
  If Trim(MEValor.Text) = '' Then
    Raise Exception.Create('Valor não Informado!');
  If Trim(MEData.Text) = '' Then
    Raise Exception.Create('Data não Informada!');
  If Trim(MECliente.Text) = '' Then
    Raise Exception.Create('Cliente não Informado!');
  If Trim(MEReferente.Text) = '' Then
    Raise Exception.Create('Referencia não Informada!');
  If Trim(MEResponsavel.Text) = '' Then
    Raise Exception.Create('Responsável não Informado!');
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.setVariable('PK',MEFilial.Text);
    QFilial.Open;
  End;
  If FRReciboOS = Nil Then
    FRReciboOS := TFRReciboOS.Create(Application);
  With FRReciboOS do
  Begin
    QRLNumOS.Caption := MENumOS.Text;
    pValor := StrTofloat(MEValor.Text);
    // QRLValor.Caption := MEValor.Text;
    QRLCliente.Caption := MECliente.Text;
    QRLReferente.Caption := MEReferente.Text;
    QRLData.Caption := MEData.Text;
    QRLResponsavel.Caption := MEResponsavel.Text;
    QRLNumRecibo.Caption := Trim(MENumRecibo.Text);
  End;
 //PARA PAPEL MEIA FOLHA
  if DMParamSistema.CodEmpresa = 'SRTERRA' then
  begin
    FRReciboOS.QRPrimario.Page.TopMargin := 50;
    FRReciboOS.QRPrimario.Page.Length := 220;
  end;
  FRReciboOS.QRPrimario.Preview;
  DMFilial.QFilial.Close;
  ModalResult := mrOk;
end;

procedure TFReciboParam.MEFilialExit(Sender: TObject);
begin
  If Trim(MEFilial.Text) <> '' then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',MEFilial.Text);
    QFilial.Open;
    EdFilial.Text := QFilialDesc_Filial.Value;
  End
  Else
    EdFilial.Text := 'Todos';
end;

procedure TFReciboParam.BtConsFilialClick(Sender: TObject);
begin
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    MEFilialExit(Self);
  End;
end;

procedure TFReciboParam.FormActivate(Sender: TObject);
begin
  MEFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  MeData.Text := DateToStr(Date);
end;

procedure TFReciboParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'DINGLIS' Then
  begin
    Action := CaFree;
    FReciboParam := Nil;
  end;
end;

procedure TFReciboParam.BTClienteConsClick(Sender: TObject);
begin
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    MECodCliente.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    MECodClienteExit(Self);
  End;
end;

procedure TFReciboParam.MECodClienteExit(Sender: TObject);
begin
  If Trim(MECodCliente.Text) <> '' then
    MECliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(MECodCliente.Text));
end;
procedure TFReciboParam.MeCodResponsavelExit(Sender: TObject);
begin
  If Trim(MeCodResponsavel.Text) <> '' then
    MeResponsavel.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(MeCodResponsavel.Text));

end;

procedure TFReciboParam.BtResponsavelClick(Sender: TObject);
begin
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    MECodResponsavel.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    MECodResponsavelExit(Self);
  End;

end;

end.
