unit UROrcamentoProdutoServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFROrcamentoProdutoServico = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRBand5: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRHRule3: TQRHRule;
    QRBand6: TQRBand;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText29: TQRDBText;
    QRHRule4: TQRHRule;
    QRDBText30: TQRDBText;
    QRLabel20: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrcamentoProdutoServico: TFROrcamentoProdutoServico;

implementation

uses
  UPedido_cl, UOracle_cl;

{$R *.dfm}

procedure TFROrcamentoProdutoServico.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLEmpresa.Caption := DMOracle.BuscaNome('SELECT DESC_FILIAL || ' + QuoteDStr(' Fone:') + ' || DESC_TELEFONE FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(DMPedido.QPedidoCod_Filial.Value));
end;

procedure TFROrcamentoProdutoServico.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := QRPrimario.DataSet.Eof;
end;

procedure TFROrcamentoProdutoServico.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  //aqui...
  
end;

end.
