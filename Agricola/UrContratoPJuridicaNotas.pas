unit UrContratoPJuridicaNotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFrContratoPJuridicaNotas = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRLPeriodo: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRObservacao: TQRMemo;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrContratoPJuridicaNotas: TFrContratoPJuridicaNotas;

implementation

uses UContrato_Pjuridica_cl;

{$R *.DFM}

procedure TFrContratoPJuridicaNotas.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    wAux : String;
    i: Integer;
  const
    wBranco :String = '                  '; //18
begin
  inherited;
  wAux := '';
  With DMContrato_PJuridica Do
  Begin
    QRContrato_PJuridica_Parcelas.Close;
    QRContrato_PJuridica_Parcelas.SetVariable('COD_CONTRATO_PJURIDICA', QRContratoPJuridicaNotaCOD_CONTRATO_PJURIDICA.Value);
    QRContrato_PJuridica_Parcelas.Open;
    QRObservacao.Lines.Clear;
    While not(QRContrato_PJuridica_Parcelas.Eof) Do
     Begin
       wAux := QRContrato_PJuridica_ParcelasDT_PAGTO.Text;
       wAux := wAux + copy(wBranco,1,(length(wBranco)-length(FormatFloat('#,##0.00', QRContrato_PJuridica_ParcelasVAL_PAGTO.Value)))) + FormatFloat('#,##0.00', QRContrato_PJuridica_ParcelasVAL_PAGTO.Value);
       wAux := wAux + '    ' + QRContrato_PJuridica_ParcelasDESC_OBSERVACAO.Text;
       QRObservacao.Lines.Add(wAux);
       QRContrato_PJuridica_Parcelas.Next;
     End;

     QRObservacao.Height := QRObservacao.Lines.Count * 16;
     QRBand4.Height := QRObservacao.Top + QRObservacao.Height + 2;

//     ShowMessage(IntToStr(QRObservacao.Height) + ' - ' + IntToStr(QRBand3.Height));
  End;
end;

end.
