unit URProtocoloEntregaDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QRExport, QRWebFilt, QRPDFFilt, QuickRpt,
  ExtCtrls;

type
  TFRProtocoloEntregaDocumento = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    MMensagem: TQRMemo;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    LEmpresa: TQRLabel;
    LEndereco: TQRLabel;
    LTelefone: TQRLabel;
    LData: TQRLabel;
    QRLabel11: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProtocoloEntregaDocumento: TFRProtocoloEntregaDocumento;

implementation

uses UContasReceber_cl;

{$R *.dfm}

end.
