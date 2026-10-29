unit URConsolidacaoR2055;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QuickRpt, QRExport, QRWebFilt, QRPDFFilt,
  ExtCtrls;

type
  TFRConsolidacaoR2055 = class(TFTRelSimples)
    QRGCadastro: TQRGroup;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRSumaryCadastro: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRDBText11: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRConsolidacaoR2055: TFRConsolidacaoR2055;

implementation

uses UReinf_cl;



{$R *.dfm}

procedure TFRConsolidacaoR2055.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMReinf.QAquisicaoR2055.Close;
  Action := CaFree;
  FRConsolidacaoR2055 := nil;
end;

end.
