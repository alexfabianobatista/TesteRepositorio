unit URRPA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, StdCtrls, QRExport, QRWebFilt,
  QRPDFFilt;

type
  TFRelatorioRPA = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
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
    QRDBText15: TQRDBText;
    QRLEndereco: TQRLabel;
    QRLLocal: TQRLabel;
    Label1: TLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape14: TQRShape;
    QRShape13: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape15: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioRPA: TFRelatorioRPA;

implementation

uses URPA_cl, UBiblioteca;

{$R *.DFM}

procedure TFRelatorioRPA.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with DMRPA do
  begin
    QRLExtenso.caption := Bib.Extenso(QRRPAFreteVal_servico.value ,'Real');
    QRLEndereco.caption:= (QRRPAFreteDesc_endereco.text+' '+QRRPAFreteNum_Endereco.text+' Fone/Fax:'+QRRPAFreteDesc_telefone.text+' '+QRRPAFreteDesc_Fax.text);
    QRLLocal.caption:=('CEP '+QRRPAFreteDesc_cep.text+' '+QRRPAFreteDesc_Cidade.text+' -'+QRRPAFreteCod_estado.text);
  end;
end;

end.
