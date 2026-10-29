unit URReciboCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, QRPDFFilt;

type
  TFRReciboCaixa = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLValorExtenso: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLData: TQRLabel;
    QRLabel13: TQRLabel;
    QRLResponsavel: TQRLabel;
    QRDBText10: TQRDBText;
    QRSysData1: TQRSysData;
    QRLRecibo: TQRLabel;
    QRLNumero: TQRLabel;
    QRLabel1: TQRLabel;
    QRLComplemento: TQRLabel;
    QRLNumDocumento: TQRLabel;
    QRLValor: TQRLabel;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel16: TQRLabel;
    QRLValorExtenso1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText15: TQRDBText;
    QRLData1: TQRLabel;
    QRLabel21: TQRLabel;
    QRLResponsavel1: TQRLabel;
    QRDBText16: TQRDBText;
    QRSysData2: TQRSysData;
    QRLRecibo1: TQRLabel;
    QRLNumero1: TQRLabel;
    QRLabel25: TQRLabel;
    QRLComplemento1: TQRLabel;
    QRLNumDocumento1: TQRLabel;
    QRLValor1: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText19: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    procedure FormCreate(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRReciboCaixa: TFRReciboCaixa;

implementation

uses UFilial_cl, UParamSistema_cl, UCaixaCons;

{$R *.DFM}

procedure TFRReciboCaixa.FormCreate(Sender: TObject);
begin
  If DMParamSistema.CodEmpresa = 'GRASEL' Then
   Begin
     QuickRep1.Page.Length := 297;
     QRBand2.Enabled := True;
   End;
end;

procedure TFRReciboCaixa.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if (DMParamSistema.CodEmpresa = 'SONOBOM') then
   begin
     QRDBText2.DataSet := DMParamSistema.QParamSistema;
     QRDBText2.DataField := 'DESC_EMPRESA';
   end;

   if (DMParamSistema.CodEmpresa <> 'GRASEL') and (DMParamSistema.CodEmpresa <> 'SONOBOM') then
   begin
      QRDBText2.Enabled := false;
      QRLabel13.Enabled := false;

      QRDBText18.Enabled := true;
      QRDBText18.Font.Style := [fsbold];
      QRLabel20.Enabled := true;
      QRLabel20.Font.Style := [fsbold];
      QRDBText17.Enabled := true;
      QRLabel17.Enabled := true;
      QRLabel3.Font.Style := [fsbold];
      QRSysData1.Font.Style := [fsbold];
      QRLabel6.Font.Style := [fsbold];
      QRLNumero.Font.Style := [fsbold];
      QRLRecibo.Font.Style := [fsbold];
      QRLValor.Font.Style := [fsbold];
      QRLValorExtenso.Font.Style := [fsbold];
      QRLResponsavel.Font.Style := [fsbold];

      QRLabel7.Caption:= 'A importância de R$ ';
      QRLValor.Left:= 170;
      QRLabel8.Caption:= 'Recebemos de: ';
      QRLRecibo.Left:= 125;
      QRSysData1.Left:= 656;
      QRSysData1.Top:= 60;
      QRLabel3.Left:= 573;
      QRLabel3.Top:= 60;
      QRLResponsavel.Left:= 150;
   end;
end;

end.
