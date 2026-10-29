unit URNotaEntr_Moinho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls;

type
  TFRNotaEntr_Moinho = class(TForm)
    QRPrimario: TQuickRep;
    QRBCabPagina: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRSDProduto: TQRSubDetail;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLEntrada: TQRLabel;
    QRBRodPagina: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRLtotal_nota: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRLCod_Natureza: TQRLabel;
    QRLTipoFrete: TQRLabel;
    QRDBText37: TQRDBText;
    QRLSaida: TQRLabel;
    QRLExtenso1: TQRLabel;
    QRLExtenso2: TQRLabel;
    QRDBText38: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLPrecoSaca: TQRLabel;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    CBLote: TQRChildBand;
    QRLabel1: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText47: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText48: TQRDBText;
    CBClaspar: TQRChildBand;
    QRDBText49: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText54: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText50: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    procedure QRBRodPaginaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBCabPaginaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CBLoteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CBClasparBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotaEntr_Moinho: TFRNotaEntr_Moinho;

implementation

uses UNotaSaida_cl, UBiblioteca;

{$R *.DFM}


procedure TFRNotaEntr_Moinho.QRBRodPaginaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DMNotaSaida do
  Begin
    QRLtotal_nota.Caption := FormatFloat('###,###,##0.00',
                             QNFE_Emitetotal_produtos.Value);
    If QNFE_EmiteInd_Tipo_Frete.Value = 'FOB' Then
      QRLTipoFrete.Caption := '2' // Destinatário
    Else
      QRLTipoFrete.Caption := '1'; // Emitente
  End;
end;

procedure TFRNotaEntr_Moinho.QRBCabPaginaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wExtenso : String;
    wLinha1, wLinha2 : String;
begin
  With DMNotaSaida do
  Begin
    If QNFE_EmiteUF_Filial.Value <> QNFE_EmiteUF_Nota.Value then
      QRLCod_Natureza.Caption := QNFE_EmiteNat_InterEstadual.Text
    Else
      QRLCod_Natureza.Caption := QNFE_EmiteNat_Estadual.Text;

    wExtenso := Bib.Extenso( QNFE_Emitetotal_produtos.Value
                        +QNFE_Emitevlr_Ipi.Value,'REAL');
    Bib.QuebraString(wExtenso,80,wLinha1,wLinha2,'*');
    QRLExtenso1.Caption := wLinha1;
    QRLExtenso2.Caption := wLinha2;
  End;

end;


procedure TFRNotaEntr_Moinho.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DMNotaSaida do
  Begin
    If QNFE_EmiteItInd_Tipo_Produto.Value = 'AGRICOLA' then
    Begin
      PrintBand := True;
      QRLPrecoSaca.Caption := 'Preço em '+FloatToStr(QNFE_EmiteItNum_Embalagem.Value)+' Kg';
    End
    Else
    Begin
      PrintBand := False;
    End;
  End;
end;

procedure TFRNotaEntr_Moinho.CBLoteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := DMNotaSaida.QNFE_EmiteItInd_Imprime_NF.Value = 'S';
end;

procedure TFRNotaEntr_Moinho.CBClasparBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  PrintBand := DMNotaSaida.QNF_EmiteClasparCod_Lote_Tipo.Value > 0;
end;

end.
