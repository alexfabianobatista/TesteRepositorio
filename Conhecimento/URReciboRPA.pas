unit URReciboRPA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, StdCtrls;

type
  TFReciboRPAFrete = class(TForm)
    QRPrimario: TQuickRep;
    DetailBand1: TQRBand;
    QRShape11: TQRShape;
    QRShape8: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRShape7: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLExtenso: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLLocal: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape21: TQRShape;
    QRLabel25: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText15: TQRDBText;
    QRSestSenat: TQRExpr;
    QRDBText5: TQRDBText;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReciboRPAFrete: TFReciboRPAFrete;

implementation

uses URPA_cl, UBiblioteca;

{$R *.DFM}

procedure TFReciboRPAFrete.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMRPA do
  begin
    QRLExtenso.caption := Bib.Extenso(QRRPAFreteVal_Liquido.value ,'Real');
    QRLEndereco.caption:= (QRRPAFreteDesc_endereco.text+' '+QRRPAFreteNum_Endereco.text+' Fone/Fax:'+QRRPAFreteDesc_telefone.text+' '+QRRPAFreteDesc_Fax.text);
    QRLLocal.caption:=('CEP '+QRRPAFreteDesc_cep.text+' '+QRRPAFreteDesc_Cidade.text+' -'+QRRPAFreteCod_estado.text+ '    CGC: '+QRRPAFreteNum_CGC.text);
    If QRRPAFreteInd_Tipo_Rpa.Value = 'M' Then
     Begin
       QRLabel19.Enabled := False;
       QRLabel26.Enabled := False;
     End
    Else
     Begin
       QRLabel19.Enabled := True;
       QRLabel26.Enabled := True;
     End;
  end;
end;

end.
