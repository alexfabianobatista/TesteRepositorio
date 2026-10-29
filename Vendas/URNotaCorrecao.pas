unit URNotaCorrecao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QRPDFFilt;

type
  TFRNotaCorrecao = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRLEndereco: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLRef: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBRodape: TQRBand;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLEspecificacao34: TQRLabel;
    QRShape14: TQRShape;
    QRLEsp34: TQRLabel;
    QRLabel32: TQRLabel;
    QRLEsp35: TQRLabel;
    QRLabel34: TQRLabel;
    QRLEsp36: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotaCorrecao: TFRNotaCorrecao;

implementation

uses UNotaSaida_cl, UNotaCorrecao_cl, UNotaCorrecao;

{$R *.DFM}

procedure TFRNotaCorrecao.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DMNotaCorrecao do
  Begin
    QRLEndereco.Caption := QRNotaCorrecaodesc_Cidade.Value +' '+ FormatDateTime('dd "de" mmmm "de" yyyy', QRNotaCorrecaoDt_Carta_Correcao.Value );

    if (DMNotaCorrecao.pCodConhecimento = 0) and (DMNotaCorrecao.pCodConhecimentoFrete = 0) then //é nota
      QRLRef.Caption := QRNotaCorrecaoDesc_Origem_Nota.Value + ' Nota fiscal Nr.'+QRNotaCorrecaonum_nf.Text+' série '+QRNotaCorrecaodesc_serie.Text
                        +' datada de ' + QRNotaCorrecaodt_emissao.Text
    else // é conhecimento de frete
    begin
      if Trim(QRNotaCorrecaoDesc_Origem_Nota.Value) = 'Nossa' then
        QRLRef.Caption := 'Nosso'
      else 
        QRLRef.Caption := 'Seu';
      QRLRef.Caption:=QRLRef.Caption+' Conhecimento de Frete Nr.'+QRNotaCorrecaonum_nf.Text+' série '+QRNotaCorrecaodesc_serie.Text
                        +' datado de ' + QRNotaCorrecaodt_emissao.Text;
    end;
  End;
end;

end.
