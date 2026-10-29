unit URTributacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRTributacao = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTributacao: TFRTributacao;

implementation

uses UTributacao_cl, UOracle_cl;

{$R *.DFM}

procedure TFRTributacao.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
{    QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_FILIAL FROM TB_FILIAL, TB_PARAM_SISTEMA',
                                                       'TB_FILIAL.COD_FILIAL = TB_PARAM_SISTEMA.COD_FILIAL');
    QRLNomeRel.Caption := Self.Name;}
end;

end.
