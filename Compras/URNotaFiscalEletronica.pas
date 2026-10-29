unit URNotaFiscalEletronica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRNotaFiscalEletronica = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLFilial: TQRLabel;
    QRLOperacao: TQRLabel;
    QRLTipo: TQRLabel;
    QRLCadastro: TQRLabel;
    QRLabel7: TQRLabel;
    QRLEmissao: TQRLabel;
    QRLabel9: TQRLabel;
    QRLRecebimento: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape1: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotaFiscalEletronica: TFRNotaFiscalEletronica;

implementation

uses URelatorio_Compra_cl;

{$R *.dfm}

end.
