unit URLivroFiscalIPI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QRExport, QRPDFFilt, QRWebFilt, Variants;

type
  TTipoRelatorio = (trDebito, trCredito);
  TFRLivroFiscalIPI = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLTitulo: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRLNomeRel: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRBand4: TQRBand;
    QRLInscricao: TQRLabel;
    QRLCnpj: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLPaginaI: TQRLabel;
    QRShape1: TQRShape;
    QRLDescDebito: TQRLabel;
    QRLDescCredito: TQRLabel;
    QRLValDebito: TQRLabel;
    QRLValCredito: TQRLabel;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRLValTotalDebito: TQRLabel;
    QRLValTotalCredito: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRLTituloSummary: TQRLabel;
    QRLabel4: TQRLabel;
    QRLSaldoDevedor: TQRLabel;
    QRLabel5: TQRLabel;
    QRLImpostoRecolher: TQRLabel;
    QRLabel11: TQRLabel;
    QRLSaldoCredor: TQRLabel;
    QRCompoIPI: TQRCompositeReport;
    QRBand5: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    procedure FormCreate(Sender: TObject);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRCompoIPIAddReports(Sender: TObject);
  private
    { Private declarations }
    fCod_Filial: Real;
    fPaginaCorrente: Integer;
//    fQueryDebito: TDataSet;
//    fQueryCredito: TDataSet;
    fTipo: TTipoRelatorio;
    procedure setTipo(const Value: TTipoRelatorio);
  public
    { Public declarations }
    Property pCod_Filial : Real Read fCod_Filial Write fCod_Filial;
    Property pPaginaCorrente : Integer Read fPaginaCorrente Write fPaginaCorrente;
//    Property QueryDebito: TDataSet Read fQueryDebito Write fQueryDebito;
//    Property QueryCredito: TDataSet Read fQueryCredito Write fQueryCredito;
    Property Tipo: TTipoRelatorio read fTipo write setTipo default trCredito;
  end;

var
  FRLivroFiscalIPI: TFRLivroFiscalIPI;
  wValDeb, wValCred: Real;

implementation

uses UOracle_cl, UCadastro_cl, ULivroFiscalIPI_cl, ULivroFiscalParam, DB,
  UBiblioteca, URRegEntradaIPI, URRegSaidaIPI;

{$R *.DFM}


procedure TFRLivroFiscalIPI.FormCreate(Sender: TObject);
var
  wEmail : TQREmail;
  wSql, wRes :array of String;
begin

  setLength(wSql,5);
  setLength(wRes,5);

  wSql[0] := 'SELECT DESC_EMAIL FROM TB_EMAIL';
  wSql[1] := 'SELECT DESC_SENHA FROM TB_EMAIL';
  wSql[2] := 'SELECT DESC_SMTP FROM TB_EMAIL';
  wSql[3] := 'SELECT NUM_PORTA_SMTP FROM TB_EMAIL';
  wSql[4] := 'SELECT IND_SSL FROM TB_EMAIL';

  DMOracle.BuscaNomes(wSql, wRes);

  wEmail.EmailAddress := wRes[0];
  wEmail.Password := wRes[1];
  wEmail.Smtp := wRes[2];
  wEmail.SmtpPort := StrToInt(wRes[3]);
  wEmail.SSL := (wRes[4] = 'S');

  QRPrimario.Email := wEmail;

  QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT DESC_EMPRESA FROM TB_PARAM_SISTEMA ',
                                                       'COD_FILIAL >= 0');
  QRLNomeRel.Caption := Self.Name;

end;

procedure TFRLivroFiscalIPI.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  (*
  If (QRPrimario.QRPrinter.PaperWidth < QRPrimario.Page.Width)
     or
     (QRPrimario.QRPrinter.PaperLength < QRPrimario.Page.Length) Then
  Begin
    If MessageDlg('Dimensões do relatório diferente da Conf. da Impressora.'
               +#13+'Largura: Relatório='+ FloatToStr(QRPrimario.Page.Width)
               +' Drive='+FloatToStr(QRPrimario.QRPrinter.PaperWidth)
               +#13+'Comprimento: Relatório='+FloatToStr(QRPrimario.Page.Length)
               +' Drive='+FloatToStr( QRPrimario.QRPrinter.PaperLength ), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
    End;
  End;
  *)
//  QRPrimario.QRPrinter.PaperLength := Round(QRPrimario.Page.Length);
//  QRPrimario.QRPrinter.PaperWidth := Round(QRPrimario.Page.Width);

(*
  If FRelPreview = Nil Then
    FRelPreview := TFRelPreview.Create(Application);
  FRelPreview.QRPreview.QRPrinter := QRPrimario.QRPrinter;
  FRelPreview.pLarguraPagina := QRPrimario.Page.
  FRelPreview.Show;
*)
  wValDeb := 0;
  wValCred := 0;
  if fTipo = trCredito then
    DMLivroFiscalIPI.QRLivroFiscalIPIDeb.First
  else
    DMLivroFiscalIPI.QRLivroFiscalIPICred.First;
end;

procedure TFRLivroFiscalIPI.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLPaginaI.Caption := FormatFloat('####0',pPaginaCorrente);
  pPaginaCorrente := pPaginaCorrente + 1;
end;

procedure TFRLivroFiscalIPI.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  pPaginaCorrente := StrToInt(Trim(FLivroFiscalParam.Me22Pagina.Text));
end;

procedure TFRLivroFiscalIPI.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLDescDebito.Caption := '';
  QRLDescCredito.Caption := '';
  QRLValDebito.Caption := '';
  QRLValCredito.Caption := '';
  if not DMLivroFiscalIPI.QRLivroFiscalIPIDeb.Eof then
  begin
    QRLDescDebito.Caption := DMLivroFiscalIPI.QRLivroFiscalIPIDebdescricao.Value;
    QRLValDebito.Caption := DMLivroFiscalIPI.QRLivroFiscalIPIDebVALOR.Text;

    wValDeb := wValDeb + DMLivroFiscalIPI.QRLivroFiscalIPIDebVALOR.Value;
  end;
  if not DMLivroFiscalIPI.QRLivroFiscalIPICred.Eof then
  begin
    QRLDescCredito.Caption := DMLivroFiscalIPI.QRLivroFiscalIPICreddescricao.Value;
    QRLValCredito.Caption := DMLivroFiscalIPI.QRLivroFiscalIPICredVALOR.Text;

    wValCred := wValCred + DMLivroFiscalIPI.QRLivroFiscalIPICredVALOR.Value;
  end;
  if fTipo = trCredito then
    DMLivroFiscalIPI.QRLivroFiscalIPIDeb.Next
  else
    DMLivroFiscalIPI.QRLivroFiscalIPICred.Next;
end;

procedure TFRLivroFiscalIPI.setTipo(const Value: TTipoRelatorio);
begin
  fTipo := Value;
  if Value = trCredito then
    QRPrimario.DataSet := DMLivroFiscalIPI.QRLivroFiscalIPICred
  else
    QRPrimario.DataSet := DMLivroFiscalIPI.QRLivroFiscalIPIDeb;
end;

procedure TFRLivroFiscalIPI.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wSaldo: Real;
begin
  QRLValTotalDebito.Caption := FormatFloat('#,###,##0.00', wValDeb);
  QRLValTotalCredito.Caption := FormatFloat('#,###,##0.00', wValCred);

  QRLTituloSummary.Caption := 'IPI NO PERÍODO ' +
    Bib.NomeMes(Trunc(DMLivroFiscalIPI.QRLivroFiscalIPIDebMES.Value)) + '/' +
    DMLivroFiscalIPI.QRLivroFiscalIPIDebANO.Text;

  wSaldo := wValCred - wValDeb;
  if wSaldo < 0 then
  begin
    QRLSaldoDevedor.Caption := FormatFloat('#,###,##0.00', wSaldo * -1);
    QRLImpostoRecolher.Caption := FormatFloat('#,###,##0.00', wSaldo * -1);
    QRLSaldoCredor.Caption := '0,00';
  end
  else
  begin
    QRLSaldoDevedor.Caption := '0,00';
    QRLImpostoRecolher.Caption := '0,00';
    QRLSaldoCredor.Caption := FormatFloat('#,###,##0.00', wSaldo);
  end;

//  if (wValDeb > wValCred) then
//  begin
//    QRLImpostoRecolher.Caption := FormatFloat('#,###,##0.00', wValDeb - wValCred);
//    QRLSaldoCredor.Caption := '0,00';
//  end
//  else
//  begin
//    QRLImpostoRecolher.Caption := '0,00';
//    QRLSaldoCredor.Caption := FormatFloat('#,###,##0.00', wValCred - wValDeb);
//  end;
end;

procedure TFRLivroFiscalIPI.QRCompoIPIAddReports(Sender: TObject);
begin
  QRCompoIPI.Reports.Add(FRRegEntradaIPI.QRPrimario);
  QRCompoIPI.Reports.Add(FRRegSaidaIPI.QRPrimario);
  QRCompoIPI.Reports.Add(FRLivroFiscalIPI.QRPrimario);
end;

end.
