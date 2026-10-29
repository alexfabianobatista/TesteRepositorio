unit URDepMapaCalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRDepMapaCalculo = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLAnoPassado: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBDescricao: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRLabel20: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRLabel21: TQRLabel;
    QRLAnoAtual: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel24: TQRLabel;
    QRLDtBase: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel25: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand4: TQRBand;
    QRLabel26: TQRLabel;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRLabel27: TQRLabel;
    QRDBText20: TQRDBText;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRDepMapaCalculo: TFRDepMapaCalculo;

implementation

uses UDepreciacao_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRDepMapaCalculo.FormCreate(Sender: TObject);
begin
  inherited;
  QRGroup1.Height := 0;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AB' then
  begin
    QRBand4.Height := 0;
    QRGroup2.Height := 0;
  end;

  if QRPrimario.DataSet = nil then
    QRPrimario.DataSet := DMDepreciacao.QRMapaCalculo;

  if (dmParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO') or
     (dmParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CAVALCA') or
     (dmParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PEQUENAS') then
    QRDBDescricao.DataField := 'DESC_PRODUTO';
end;

end.
