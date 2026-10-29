unit UReciboComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFReciboComissao = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLData: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLHistorico: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLNomeVendedor: TQRLabel;
    QRLCodigoVendedor: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLCep: TQRLabel;
    QRLCidade: TQRLabel;
    QRLEstado: TQRLabel;
    QRLCnpj: TQRLabel;
    QRLFone: TQRLabel;
    QRLComissao: TQRLabel;
    QRLIrrf: TQRLabel;
    QRLValLiquido: TQRLabel;
    QRLExtenso: TQRLabel;
    QRLDescFilial: TQRLabel;
    QRLDescCidade: TQRLabel;
    QRLVendedor: TQRLabel;
    QRTextFilter1: TQRTextFilter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReciboComissao: TFReciboComissao;

implementation

{$R *.DFM}

end.
