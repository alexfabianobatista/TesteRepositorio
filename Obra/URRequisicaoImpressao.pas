unit URRequisicaoImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRRequisicaoImpressao = class(TFTRelSimples)
    QRLCidade: TQRLabel;
    QRLOperacao: TQRLabel;
    QRShape1: TQRShape;
    QRLCliente: TQRLabel;
    QRLObra: TQRLabel;
    QRLFinalidade: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText15: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel12: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRequisicaoImpressao: TFRRequisicaoImpressao;

implementation

uses UObra_cl, UParamSistema_cl;

{$R *.dfm}

end.
