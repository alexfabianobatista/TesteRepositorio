unit URTermoResponsabilidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QRExport, QuickRpt, ExtCtrls;

type
  TFRTermoResponsabilidade = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRLCidade: TQRLabel;
    QRShape1: TQRShape;
    QRMemo4: TQRMemo;
    QRDBText1: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTermoResponsabilidade: TFRTermoResponsabilidade;

implementation

uses UEmprestimo_cl;

{$R *.DFM}

end.
