unit URCartaCobrancaFaville;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TFRCartaCobrancaFaville = class(TForm)
    QRepCartaCobrancaFaville: TQuickRep;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel4: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCartaCobrancaFaville: TFRCartaCobrancaFaville;

implementation

uses UContasReceber_cl, UOracle_cl;

{$R *.DFM}

procedure TFRCartaCobrancaFaville.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  //FRCartaCobrancaFaville.QRLabel20.Caption:= DMContasReceber.QRCartaCobrancaDESC_FILIAL.Text + ', localizada na rodovia BR163-Km277 na cidade de Marechal Cândido Rondon, Estado do Paraná, vem, por'+
  //                                                                                ' intermédio desta, notificá-lo de que consta em nosso sistema a existência de débitos referentes ao não' +
  //                                                                                ' pagamento de títulos, conforme demonstrativo abaixo:';
  FRCartaCobrancaFaville.QRLabel4.Caption:= (DMContasReceber.QRCartaCobrancaDESC_CIDADE_COBRANCA.Text + '  ' + DMContasReceber.QRCartaCobrancaDESC_ESTADO_COBRANCA.Text);
end;

procedure TFRCartaCobrancaFaville.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //FRCartaCobrancaFaville.QRLabel14.Caption:='Informamos que os valores foram corrigidos pelo INPC + 1% de juros, até a data de '+DateToStr(DMOracle.DataServ);
  //FRCartaCobrancaFaville.QRLabel15.Caption:='Com o intuito de solucionarmos amigável e extrajudicialmente a questão, pedimos, encarecidamente, que entre em ' +
  //                                          'contato com a notificante na pessoa do Dr. Jean, pelo fone (045) 254-5600 (ramal 220) - DEPARTAMENTO JURÍDICO - '+
  //                                          'para que possamos regularizar sua situação.';
  //FRCartaCobrancaFaville.QRLabel16.Caption:='Caso o referido débito já tenha sido quitado ao tempo do recebimento desta, favor desconsiderar essa notificação.';
  //FRCartaCobrancaFaville.QRLabel17.Caption:='Certos de que seremos prontamente atendidos nesse cordial pedido, desde já agradecemos sua compreensão.';
  //FRCartaCobrancaFaville.QRLabel18.Caption:='Atenciosamente,';
  //FRCartaCobrancaFaville.QRLabel7.Caption:='DEPARTAMENTO JURÍDICO';
  FRCartaCobrancaFaville.QRLabel22.Caption:= DMContasReceber.QRCartaCobrancaDESC_FILIAL.Text;
end;

procedure TFRCartaCobrancaFaville.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  FRCartaCobrancaFaville.QRLabel21.Caption:=FormatDateTime(' dd "de" MMMM "de" yyyy',DMOracle.DataServ);
end;

end.
