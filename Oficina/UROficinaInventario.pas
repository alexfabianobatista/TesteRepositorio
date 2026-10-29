unit UROficinaInventario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFROficinaInventario = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROficinaInventario: TFROficinaInventario;

implementation

{$R *.DFM}

end.
