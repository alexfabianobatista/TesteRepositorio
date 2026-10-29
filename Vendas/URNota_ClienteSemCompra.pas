unit URNota_ClienteSemCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_ClienteSemCompra = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLVendedor: TQRLabel;
    QRBand4: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel9: TQRLabel;
    QRLTipoCadastro: TQRLabel;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRLSupervisor: TQRLabel;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRLBairro: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_ClienteSemCompra: TFRNota_ClienteSemCompra;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
