unit URDepartamento_Departamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRDepartamento_Departamento = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRDepartamento_Departamento: TFRDepartamento_Departamento;

implementation

uses UDepartamento_cl;

{$R *.DFM}

end.
