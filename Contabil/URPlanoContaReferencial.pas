unit URPlanoContaReferencial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRPlanoContaReferencial = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLNumPagina: TQRLabel;
    QRDBText1: TQRDBText;
  private
    { Private declarations }
    FPag_Inicial,FPag_Inicial_Param: Integer;
   public
    { Public declarations }
    Property Pag_Inicial: Integer Read FPag_Inicial write FPag_Inicial;
    Property Pag_Inicial_Param: Integer Read FPag_Inicial_Param write FPag_Inicial_Param;
  end;

var
  FRPlanoContaReferencial: TFRPlanoContaReferencial;

implementation

uses UParamSistema_cl, UPlanoContaReferencial_cl;

{$R *.DFM}

end.
