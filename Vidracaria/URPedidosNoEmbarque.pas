unit URPedidosNoEmbarque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRPedidosNoEmbarque = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape1: TQRShape;
    QRLPeso: TQRLabel;
    QRLMetros: TQRLabel;
    QRLabel8: TQRLabel;
    QRLSeq: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidosNoEmbarque: TFRPedidosNoEmbarque;
  wCont : integer;
implementation

uses UEmbarque_cl, UPedido_cl, UOracle_cl, UBiblioteca;

{$R *.dfm}

procedure TFRPedidosNoEmbarque.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
wPedido : string;
wPeso, wMetros, wPesoProduto : Real;

begin
  inherited;
  wPeso := 0;
  wMetros := 0;
  wCont := 0;
  QRLPeso.Caption :='';
  QRLMetros.Caption := '';

  DMPedido.QPedido.Close;
  DMPedido.QPedido.SetVariable('PK',DMEmbarque.QPedidosNoEmbarqueCOD_PEDIDO_CAB.Text);
  DMPedido.QPedido.Open;

  DMPedido.QRPedido.Close;
  DMPedido.QRPedido.SetVariable('COD_PEDIDO_CAB',DMEmbarque.QPedidosNoEmbarqueCOD_PEDIDO_CAB.Text);
  DMPedido.QRPedido.Open;

  while not (DMPedido.QRPedido.Eof) do
  Begin

    wPeso := wPeso + (DMPedido.QRPedidoNUM_METROS_CUBICOS.Value * DMPedido.QRPedidoQT_PEDIDO.Value);
    wMetros := wMetros + DMPedido.QRPedidoQT_PEDIDO.Value;
    DMPedido.QRPedido.Next;
  end;
  QRLPeso.Caption := FormatFloat('###,###,##0.00',wPeso);
  QRLMetros.Caption :=FormatFloat('###,###,##0.00',wMetros);
end;

procedure TFRPedidosNoEmbarque.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  inc(wCont);
  QRLSeq.Caption := IntToStr(wCont);
end;

end.
