unit URGuiaAplicacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRGuiaAplicacao = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QrLocalAplicacao: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QrQuantidade: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel24: TQRLabel;
    QrNome: TQRLabel;
    QrCultura: TQRLabel;
    QrEndereco: TQRLabel;
    QrEngenheiro: TQRLabel;
    QrCpf: TQRLabel;
    QrEmpresa: TQRLabel;
    QrEnderecoLocal: TQRLabel;
    QrAreaTratada: TQRLabel;
    QrProduto: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel19: TQRLabel;
    QrNrGuia: TQRLabel;
    QRShape1: TQRShape;
    QRRiscos: TQRLabel;
    QRCuidados: TQRLabel;
    QRFormaAplicacao: TQRLabel;
    QRLabel7: TQRLabel;
    QRNrNota: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRGuiaAplicacao: TFRGuiaAplicacao;

implementation

uses UProduto_cl;

{$R *.DFM}

end.
