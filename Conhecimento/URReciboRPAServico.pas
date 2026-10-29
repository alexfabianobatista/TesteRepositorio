unit URReciboRPAServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, StdCtrls, ExtCtrls;

type
  TFReciboRPAServico = class(TForm)
    QRPrimario: TQuickRep;
    DetailBand1: TQRBand;
    Label1: TLabel;
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
    QRLExtenso: TQRLabel;
    QRDBText15: TQRDBText;
    QRLEndereco: TQRLabel;
    QRLLocal: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
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
    QRDBText18: TQRDBText;
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
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRShape15: TQRShape;
    QRShape13: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReciboRPAServico: TFReciboRPAServico;

implementation

uses URPA_cl, UBiblioteca;

{$R *.DFM}

procedure TFReciboRPAServico.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMRPA do
  begin
    QRLExtenso.caption := Bib.Extenso(QRRPAServicoVal_Liquido.value ,'Real');
    QRLEndereco.caption:= (QRRPAServicoDesc_endereco.text+' '+QRRPAServicoNum_Endereco.text+' Fone/Fax:'+QRRPAServicoDesc_telefone.text+' '+QRRPAServicoDesc_Fax.text);
    QRLLocal.caption:=('CEP '+QRRPAServicoDesc_cep.text+' '+QRRPAServicoDesc_Cidade.text+' -'+QRRPAServicoCod_estado.text+ '    CGC: '+QRRPAServicoNum_CGC.text);
  end;
end;

end.
