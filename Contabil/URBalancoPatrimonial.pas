unit URBalancoPatrimonial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QRExport, QRXMLSFilt, QRPDFFilt;

type
  TFRBalancoPatrimonial = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBTDescPlano: TQRDBText;
    QRDBText2: TQRDBText;
    QRLNumPagina: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLValorPeriodoAtual: TQRLabel;
    QRBand6: TQRBand;
    QRLFilial: TQRLabel;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRLTitular: TQRLabel;
    QRLabel7: TQRLabel;
    QRLCpf_Administrador: TQRLabel;
    QRLabel8: TQRLabel;
    QRLContador: TQRLabel;
    QRLCrc: TQRLabel;
    QRLCpf_Contador: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRXMLSFilter1: TQRXMLSFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRDBText1: TQRDBText;
    QRLValorPeriodoAnterior: TQRLabel;
    QRCompositeReport1: TQRCompositeReport;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
    FPag_Inicial,FPag_Inicial_Param,FNum_Linhas: real;
   public
    { Public declarations }
    Property Pag_Inicial: Real Read FPag_Inicial write FPag_Inicial;
    Property Pag_Inicial_Param: Real Read FPag_Inicial_Param write FPag_Inicial_Param;
    Property Num_Linhas : Real Read FNum_Linhas write FNum_Linhas;
  end;

var
  vNum_Pagina:Real;
  FRBalancoPatrimonial: TFRBalancoPatrimonial;

implementation

uses UPlanilha_cl, UOracle_cl, UParamSistema_cl, UContabilParam,
  UMensagemNotaExplicativa, URNotaExplicativa;

{$R *.DFM}

procedure TFRBalancoPatrimonial.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  case Trunc(DMPlanilha.QRBalancoPatrimonialNUM_GRAU.Value) of
    1:begin
      QRDBTDescPlano.Left:=8;
      QRBand2.Font.Style:=[fsBold];
      QRBand2.Font.Size:=10;
      end;
    2:begin
      QRDBTDescPlano.Left:=24;
      QRBand2.Font.Style:=[fsBold];
      QRBand2.Font.Size:=9;
      end;
    3:begin
      QRDBTDescPlano.Left:=40;
      QRBand2.Font.Style:=[];
      QRBand2.Font.Size:=8;
      end;
    4:begin
      QRDBTDescPlano.Left:=56;
      QRBand2.Font.Style:=[];
      QRBand2.Font.Size:=8;
      end;
    5:begin
      QRDBTDescPlano.Left:=72;
      QRBand2.Font.Style:=[];
      QRBand2.Font.Size:=8;
      end;
    6:begin
      QRDBTDescPlano.Left:=88;
      QRBand2.Font.Style:=[];
      QRBand2.Font.Size:=8;
      end;
  end;
end;

procedure TFRBalancoPatrimonial.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
//  QRPrimario.QRPrinter.PaperLength := Round(QRPrimario.Page.Length);
//  QRPrimario.QRPrinter.PaperWidth := Round(QRPrimario.Page.Width);
  vNum_Pagina:=Pag_Inicial;
  Num_Linhas:=Pag_Inicial;
end;

procedure TFRBalancoPatrimonial.FormCreate(Sender: TObject);
begin
  QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT DESC_EMPRESA FROM TB_PARAM_SISTEMA','COD_FILIAL >= 0');
end;

procedure TFRBalancoPatrimonial.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
    QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL ='+FContabilParam.ME3CodFilial.Text);

  vNum_Pagina:=vNum_Pagina+1;
  QRLNumPagina.Caption:=FloatToStr(vNum_Pagina);
  Num_Linhas:=vNum_Pagina;
end;

procedure TFRBalancoPatrimonial.QRBand6AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  FPag_Inicial:=FPag_Inicial_Param;
end;

procedure TFRBalancoPatrimonial.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
VAR
wContador, wResponsavel : integer;
begin
//  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
//  Begin
    QRBand6.Height := 110;

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

    FRBalancoPatrimonial.QRLContador.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wContador));
    FRBalancoPatrimonial.QRLCrc.Caption := 'CRC: ' + DMOracle.BuscaNome('SELECT DESC_CRC FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wContador));
    FRBalancoPatrimonial.QRLCpf_Contador.Caption := 'CPF: ' + DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wContador));
    FRBalancoPatrimonial.QRLTitular.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wResponsavel));
    FRBalancoPatrimonial.QRLCpf_Administrador.Caption := 'CPF: ' + DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wResponsavel));

    {FRBalancoPatrimonial.QRLContador.Caption := 'PAULO GUSTMANN D`AVILA';
    FRBalancoPatrimonial.QRLCrc.Caption := 'CONTADOR CRC/PR 044.801/O-0';
    FRBalancoPatrimonial.QRLCpf_Contador.Caption := 'CPF: 498.877.349-34';
    FRBalancoPatrimonial.QRLCpf_Administrador.Caption := 'Cpf: 588.414.829-15';
    FRBalancoPatrimonial.QRLTitular.Caption := 'ROQUE COLOMBO';
    //FRDRE.QRLCpf_Administrador.Caption := 'CPF: 557.258.139-91';}
{  end
  else
  Begin
    FRBalancoPatrimonial.QRLContador.Caption := '';
    FRBalancoPatrimonial.QRLCrc.Caption := '';
    FRBalancoPatrimonial.QRLCpf_Contador.Caption := '';
    FRBalancoPatrimonial.QRLCpf_Administrador.Caption := '';
    FRBalancoPatrimonial.QRLTitular.Caption := '';
    FRBalancoPatrimonial.QRLCpf_Administrador.Caption := '';
  end; }
end;

procedure TFRBalancoPatrimonial.QRBand5BeforePrint(Sender: TQRCustomBand;
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
    QRBand5.Height := 186;

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

    FRBalancoPatrimonial.QRLContador.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wContador));
    FRBalancoPatrimonial.QRLCrc.Caption := 'CRC: ' + DMOracle.BuscaNome('SELECT DESC_CRC FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wContador));
    FRBalancoPatrimonial.QRLCpf_Contador.Caption := 'CPF: ' + DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wContador));
    FRBalancoPatrimonial.QRLTitular.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wResponsavel));
    FRBalancoPatrimonial.QRLCpf_Administrador.Caption := 'CPF: ' + DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(wResponsavel));

    {FRBalancoPatrimonial.QRLContador.Caption := 'PAULO GUSTMANN D`AVILA';
    FRBalancoPatrimonial.QRLCrc.Caption := 'CONTADOR CRC/PR 044.801/O-0';
    FRBalancoPatrimonial.QRLCpf_Contador.Caption := 'CPF: 498.877.349-34';
    FRBalancoPatrimonial.QRLCpf_Administrador.Caption := 'Cpf: 588.414.829-15';
    FRBalancoPatrimonial.QRLTitular.Caption := 'ROQUE COLOMBO'; }
    //FRDRE.QRLCpf_Administrador.Caption := 'CPF: 557.258.139-91';
//  end
//  else

{
  Retirado por Junior 27-02/2014.
  Motivo. Foi criado o cadastro Nota Explicativa p/ Balanço Patrimonial pelo motivo de ficar registrado no sistema. Antes
  apenas informava o descritivo mas no ano seguinte o cliente não sabia o que estava escrito no ano anterior.}

{  if DMParamSistema.CodEmpresa = 'GRASEL' then
  begin
    if FMensagemNotaExplicativa = nil then
      FMensagemNotaExplicativa := TFMensagemNotaExplicativa.Create(Application);
    if (FMensagemNotaExplicativa.ShowModal = mrOK) then
    begin
      QRMemo1.Lines := FMensagemNotaExplicativa.Memo1.Lines;
      QRMemo1.Enabled := True;
      QRMemo1.Height := 350;
      QRBand5.Height := 400;
      QRMemo1.Top := 40;
    end;
//    else
//      QRBand5.Enabled := False;
  end
//  else
//    QRBand5.Enabled := False;}
end;

procedure TFRBalancoPatrimonial.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  QRCompositeReport1.Reports.Add(FRBalancoPatrimonial.QRPrimario);
  FRNotaExplicativa.wBalancoPatrimonial := self;
  QRCompositeReport1.Reports.Add(FRNotaExplicativa.QRPrimario);
end;

end.
