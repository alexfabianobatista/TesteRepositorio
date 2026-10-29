unit URContasReceber_Duplicatas_MEDIBENS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, QRPDFFilt;

type
  TFRContasReceberDuplicatas_MEDIBENS = class(TForm)
    QRPrimario: TQuickRep;
    QRShape5: TQRShape;
    DetailBand1: TQRBand;
    QRLEmpresa: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLabel1: TQRLabel;
    QRLFone: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLCGC: TQRLabel;
    QRLCep: TQRLabel;
    QRLCidade: TQRLabel;
    QRLEstado: TQRLabel;
    QRLabel5: TQRLabel;
    QRLInscricao: TQRLabel;
    QRLEmissao: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape8: TQRShape;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape10: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLEmpresa2: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape15: TQRShape;
    QRLabel31: TQRLabel;
    QRShape16: TQRShape;
    QRLEmpresa3: TQRLabel;
    QRShape13: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel3: TQRLabel;
    QRLE_mail: TQRLabel;
    QRLDt_Aceite: TQRLabel;
    QRLPracaPgto: TQRLabel;
    QRCompositeReport1: TQRCompositeReport;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    procedure FormCreate(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceberDuplicatas_MEDIBENS: TFRContasReceberDuplicatas_MEDIBENS;

implementation

uses UContasReceber_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRContasReceberDuplicatas_MEDIBENS.FormCreate(Sender: TObject);
begin
 // If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ') THEN // Or
//     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR')   Then
    // QRSubDetail1.Enabled := False;
end;

procedure TFRContasReceberDuplicatas_MEDIBENS.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  QRCompositeReport1.Reports.Clear;
  QRCompositeReport1.Reports.Add(QRPrimario);
  if (DMParamSistema.CodEmpresa <> 'DINIZ') and
      (DMParamSistema.CodEmpresa <> 'PIXIXE') and
      (DMParamSistema.CodEmpresa <> 'ALVARES') and //Solicitação 2501
      (DMParamSistema.CodEmpresa <> 'SM') then     //Solicitação 2501
    QRCompositeReport1.Reports.Add(QRPrimario);
end;

end.
