unit UREstoque_Classe_Sint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFREstoqueClasseSint = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRLPercentual: TQRLabel;
    QRLTPercentual: TQRLabel;
    QRLabel8: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLPercentualPrint(sender: TObject; var Value: String);
    procedure QRLTPercentualPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREstoqueClasseSint: TFREstoqueClasseSint;
  var mTPercentual, mValorTotal : Real;

implementation

uses UEstoque_cl;

{$R *.DFM}

procedure TFREstoqueClasseSint.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;

  mValorTotal := 0;      // Inicializa valor da variavel.
  mTPercentual:= 0;      // Inicializa total do percentual
  with DMEstoque do
  begin
    QREstoqueClasseSint.First;  // Isto é necessario caso contrario ocorre erro divisão por zero
                                // após a previa e tenta enviar para impressora. by Robson
    while not QREstoqueClasseSint.Eof do
    begin
      mValorTotal := mValorTotal + QREstoqueClasseSintVALOR_TOTAL.Value;
      QREstoqueClasseSint.Next;
    end;
    QREstoqueClasseSint.First;  // Posiciona ponteiro no primeiro registro da Query
  end;
end;

procedure TFREstoqueClasseSint.QRLPercentualPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := FloatToStrF( ( DMEstoque.QREstoqueClasseSintVALOR_TOTAL.Value * 100 ) / mValorTotal,ffNumber,10,3 );
  mTPercentual := mTPercentual + StrToFloat(Value);
end;

procedure TFREstoqueClasseSint.QRLTPercentualPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := FloatToStrF(mTPercentual,ffNumber,10,3);
end;

end.
