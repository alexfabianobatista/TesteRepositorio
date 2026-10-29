unit URNotasOperacaoResumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, StdCtrls, QRWebFilt,
  QRPDFFilt;

type
  TFRNotasOperacaoResumo = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLFilial: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel7: TQRLabel;
    QRLEntrada_Saida: TQRLabel;
    QRBand5: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel12: TQRLabel;
    QRLTipo: TQRLabel;
    QRBand6: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel14: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotasOperacaoResumo: TFRNotasOperacaoResumo;

implementation

uses ULivroFiscal_Cl;

{$R *.DFM}

procedure TFRNotasOperacaoResumo.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DmLivroFiscal.QRNotasOperacaoResumoInd_Entrada_Saida.Value = 'E'
  Then
     QRLEntrada_Saida.Caption := 'ENTRADA'
  Else
     QRLEntrada_Saida.Caption := 'SAIDA';
end;

procedure TFRNotasOperacaoResumo.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DMLivroFiscal.QRNotasOperacaoResumoInd_Fisica_Juridica.Value = 'J' Then
     QRLTipo.Caption := 'Juridica'
  else
     QRLTipo.Caption := 'Física';
end;

end.
