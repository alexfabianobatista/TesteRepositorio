unit URNotaExplicativa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, UOracle_cl, QRExport;

type
  TFRNotaExplicativa = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    QRLTitular: TQRLabel;
    QRLabel7: TQRLabel;
    QRLCpf_Administrador: TQRLabel;
    QRLabel8: TQRLabel;
    QRLContador: TQRLabel;
    QRLCrc: TQRLabel;
    QRLCpf_Contador: TQRLabel;
    QRLabel5: TQRLabel;
    QRRichText1: TQRRichText;
    QRRTFFilter1: TQRRTFFilter;
    QRDBRichText1: TQRDBRichText;
    QRBand2: TQRBand;
    QRLEmpresa: TQRLabel;
    QRLabel2: TQRLabel;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel1: TQRLabel;
    QRLNumPagina: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    vNum_Pagina: Real;
    wBalancoPatrimonial: TForm;
  end;

var
  FRNotaExplicativa: TFRNotaExplicativa;   

implementation
uses UPlanilha_cl, UContabilParam, URBalancoPatrimonial;
{$R *.dfm}

procedure TFRNotaExplicativa.FormCreate(Sender: TObject);
var
  wEmail : TQREmail;
  Buscador: TBuscador;
  wPortaSmtp: String;
begin
  Buscador := TBuscador.Create;
  Buscador.Limpa;
  Buscador.Adiciona('DESC_EMAIL', 'TB_EMAIL');
  Buscador.Adiciona('DESC_SENHA', 'TB_EMAIL');
  Buscador.Adiciona('DESC_SMTP', 'TB_EMAIL');
  Buscador.Adiciona('NUM_PORTA_SMTP','TB_EMAIL');
  Buscador.Adiciona('IND_SSL', 'TB_EMAIL');
  Buscador.Adiciona('DESC_EMPRESA', 'TB_PARAM_SISTEMA');
  Buscador.Buscar;

  wEmail.EmailAddress := Buscador.Proximo;
  wEmail.Password := Buscador.Proximo;
  wEmail.Smtp := Buscador.Proximo;

  wPortaSmtp := Buscador.Proximo;
  if(wPortaSmtp <> '') then
    wEmail.SmtpPort := StrToInt(wPortaSmtp);
  wEmail.SSL := Buscador.Proximo = 'S';

  QRPrimario.Email := wEmail;
end;

procedure TFRNotaExplicativa.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wContador,wResponsavel : integer;
begin
//  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
//  Begin
    QRLabel6.Enabled := true;
    QRLTitular.Enabled := true;
    QRLabel7.Enabled := true;
    QRLCpf_Administrador.Enabled := true;
    QRLabel8.Enabled := true;
    QRLContador.Enabled := true;
    QRLCrc.Enabled := true;
    QRLCpf_Contador.Enabled := true;
//    QRBand5.Height := 186;

    try
      wContador := StrToInt(DMOracle.BuscaNome('SELECT COD_CADASTRO_CONTABILISTA FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(FContabilParam.ME3CodFilial.Text)))
    except
      wContador := 0;
    end;

    try
      wResponsavel := StrToInt(DMOracle.BuscaNome('SELECT COD_CADASTRO_RESPONSAVEL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(FContabilParam.ME3CodFilial.Text)))
    except
      wResponsavel := 0;
    end;

    FRNotaExplicativa.QRLContador.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wContador));
    FRNotaExplicativa.QRLCrc.Caption := 'CRC: ' + DMOracle.BuscaNome('SELECT DESC_CRC FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wContador));
    FRNotaExplicativa.QRLCpf_Contador.Caption := 'CPF: ' + DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wContador));
    FRNotaExplicativa.QRLTitular.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wResponsavel));
    FRNotaExplicativa.QRLCpf_Administrador.Caption := 'CPF: ' + DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wResponsavel));

end;

procedure TFRNotaExplicativa.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TFRBalancoPatrimonial(wBalancoPatrimonial).Num_Linhas
    := TFRBalancoPatrimonial(wBalancoPatrimonial).Num_Linhas + 1;
  QRLNumPagina.Caption
    :=FloatToStr(TFRBalancoPatrimonial(wBalancoPatrimonial).Num_Linhas);
end;

end.
