unit URNotasES_MovEstoqueItatiba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRNotasES_MovEstoqueItatiba = class(TFTRelSimples)
    QrlCadastro: TQRLabel;
    QRLFilial: TQRLabel;
    QRLcnpj: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel16: TQRLabel;
    QRLbQtChegada: TQRLabel;
    QRLabel7: TQRLabel;
    QRDetalhe: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBTextQtChegada: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel17: TQRLabel;
    QRBand4: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotasES_MovEstoqueItatiba: TFRNotasES_MovEstoqueItatiba;

implementation

uses
  URelatorioVenda_cl; //UParamSistema_cl, UOracle_cl;

{$R *.dfm}

end.
