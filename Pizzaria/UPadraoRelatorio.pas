unit UPadraoRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TFPadraoRelatorio = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLTitulo: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLNomeRel: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRPrimarioAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPadraoRelatorio: TFPadraoRelatorio;

implementation

uses UDmParamSistema;

{$R *.dfm}

procedure TFPadraoRelatorio.FormCreate(Sender: TObject);
begin
  QRLEmpresa.Caption := 'Empresa: ' + DmParamSistema.QParamSistemaDESC_FANTASIA.Value;
  QRLNomeRel.Caption := Self.Name;
end;

procedure TFPadraoRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPadraoRelatorio.QRPrimarioAfterPreview(Sender: TObject);
begin
  Close;
end;

end.
