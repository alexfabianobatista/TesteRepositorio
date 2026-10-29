unit URReciboTermica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, grimgctrl;

type
  TFRReciboTermica = class(TForm)
    QRReciboTermica: TQuickRep;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRHRule1: TQRHRule;
    QRLabel5: TQRLabel;
    QRHRule2: TQRHRule;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRHRule3: TQRHRule;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    QRLNrParcelas: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLFone: TQRLabel;
    QRFilial: TQRLabel;
    QRLJuros: TQRLabel;
    QRLabel1: TQRLabel;
    QRLDesconto: TQRLabel;
    QRLRecebido: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText7: TQRDBText;
    QRHRule4: TQRHRule;
    QRLabel3: TQRLabel;
    QRTotalRecebido: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRReciboTermica: TFRReciboTermica;

implementation
uses UOracle_cl, UContasReceber_cl, UFilial_cl;
{$R *.dfm}

procedure TFRReciboTermica.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var wValJuro, wValDesconto, wValRecebido : double;
begin
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK',DMContasReceber.QContasReceber_CabCod_Filial.Value);
  DMFilial.QFilial.Open;

  QRFilial.Caption      := DMFilial.QFilialDESC_FILIAL.Text;
  QRLEndereco.Caption   := 'Endereço: ' + DMFilial.QFilialDESC_ENDERECO.Text;
  QRLFone.Caption       := 'Fone: ' + DMFilial.QFilialDESC_TELEFONE.Text;
  QRLNrParcelas.Caption := DMOracle.BuscaNome('SELECT MAX(NUM_PARCELA) FROM TB_CONTA_RECEBER_CAB','COD_FILIAL = '+DMContasReceber.QContasReceber_CabCod_Filial.Text +
     ' AND COD_CADASTRO = ' + DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text + ' AND NUM_TITULO='+DMContasReceber.QContasReceber_CabNum_Titulo.Text);
  wValJuro := StrToFloat('0'+DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','COD_CONTA_RECEBER_CAB = '+DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Text +
                              'AND IND_TIPO_MOVIMENTO = '+QuotedStr('RECEBTO. JUROS') ));
  wValDesconto := StrToFloat('0'+DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','COD_CONTA_RECEBER_CAB = '+DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Text +
                              'AND IND_TIPO_MOVIMENTO = '+QuotedStr('DESC. CONCEDIDO') ));

  QRLJuros.Caption    := FormatFloat('###,###,##0.00',wValJuro);
  QRLDesconto.Caption := FormatFloat('###,###,##0.00',wValDesconto);
  wValRecebido        := (DMContasReceber.QContasReceber_CabVAL_ORIGINAL.Value + wValJuro - wValDesconto);
  QRLRecebido.Caption := FormatFloat('###,###,##0.00',wValRecebido);
  QRTotalRecebido.Caption := FormatFloat('###,###,##0.00',wValRecebido);

end;

end.
