unit URDfc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFRDfc = class(TFTRelSimples)
    detailBand: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrlbAnterior: TQRLabel;
    qrlbAtual: TQRLabel;
    QRGroup1: TQRGroup;
    QRExpr1: TQRExpr;
    QRPDFShape1: TQRPDFShape;
    QRPDFShape2: TQRPDFShape;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    SummaryBand1: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    lbFinalAnterior: TQRLabel;
    lbInicioAnterior: TQRLabel;
    lbInicioAtual: TQRLabel;
    lbFinalAtual: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioAfterPreview(Sender: TObject);
  private
    { Private declarations }
    numero: Integer;
  public
    { Public declarations }
    property PNumero: Integer Read numero Write numero;
  end;

var
  FRDfc: TFRDfc;

implementation

uses UPlanoConta_cl;

{$R *.dfm}

procedure TFRDfc.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if Trim(QRSysData2.Text) = ''  then
    QRSysData2.Text := IntToStr(PNumero)
  else
  begin
    PNumero := PNumero + 1;
    QRSysData2.Text := IntToStr(PNumero);
  end;
end;

procedure TFRDfc.QRPrimarioAfterPreview(Sender: TObject);
begin
  inherited;
  QRSysData2.Text := '';
end;

end.
