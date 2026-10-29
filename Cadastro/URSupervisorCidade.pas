unit URSupervisorCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls;

type
  TFRSupervisorCidade = class(TFTRelSimples)
    QRLSupervisor: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand4: TQRBand;
    QRLabel5: TQRLabel;
    QRSysData3: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSupervisorCidade: TFRSupervisorCidade;

implementation

uses UVendedor_cl;

{$R *.dfm}

end.
