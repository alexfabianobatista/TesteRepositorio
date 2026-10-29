unit URNota_ClasseData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QRExport, QRPDFFilt, QRWebFilt, Variants;
                                          
type
  TFRNota_ClasseData = class(TForm)
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
    QRLabel3: TQRLabel;
    QRLFilial: TQRLabel;
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand4: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    QRCompositeReport1: TQRCompositeReport;
    procedure FormCreate(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
    fCod_Filial : Real;
  public
    { Public declarations }
    Property pCod_Filial : Real Read fCod_Filial Write fCod_Filial;
  end;

var
  FRNota_ClasseData: TFRNota_ClasseData;

implementation

uses UOracle_cl, UCadastro_cl, URelatorioVenda_cl, URNota_ClasseDataRes;

{$R *.DFM}


procedure TFRNota_ClasseData.FormCreate(Sender: TObject);
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
  wEmail.SSL := wRes[4] = '1';
  QRPrimario.Email := wEmail;
  QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT DESC_EMPRESA FROM TB_PARAM_SISTEMA ',
                                                       'COD_FILIAL >= 0');
  QRLNomeRel.Caption := Self.Name;
end;

procedure TFRNota_ClasseData.QRCompositeReport1AddReports(Sender: TObject);
begin
  QRCompositeReport1.Reports.Clear;
  QRCompositeReport1.Reports.Add(FRNota_ClasseData.QRPrimario);
  QRCompositeReport1.Reports.Add(FRNota_ClasseDataRes.QRPrimario);
end;

end.
