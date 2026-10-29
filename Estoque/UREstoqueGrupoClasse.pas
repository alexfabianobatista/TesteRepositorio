unit UREstoqueGrupoClasse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TFREstoqueGrupoClasse = class(TForm)
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
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLPercentual: TQRLabel;
    QRBand4: TQRBand;
    QRLTPercentual: TQRLabel;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel15: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel17: TQRLabel;
    qrlVendedor: TQRLabel;
    QRLPeriodoAnterior: TQRLabel;
    QRLPeriodoAtual: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLPercentualPrint(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QRLTPercentualPrint(sender: TObject; var Value: String);
    procedure QRLabel17Print(sender: TObject; var Value: String);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLabel11Print(sender: TObject; var Value: String);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel16Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  var
   mTPercentual,mValorTotal : Real;
   mTPercentual_ANT,mValorTotal_ANT : Real;
   mTPercentual_class,mTPercentual_class_ant : Real;

var
  FREstoqueGrupoClasse: TFREstoqueGrupoClasse;

implementation

uses UEstoque_cl;

{$R *.DFM}

procedure TFREstoqueGrupoClasse.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  mValorTotal := 0;      // Inicializa valor da variavel.
  mValorTotal_ant:=0;
 // mTPercentual:= 0;      // Inicializa total do percentual
  with DMEstoque do
  begin
    QREstoqueGrupoClasse.First;  // Isto é necessario caso contrario ocorre erro divisão por zero
                                // após a previa e tenta enviar para impressora. by Robson
    while not QREstoqueGrupoClasse.Eof do
    begin
      mValorTotal := mValorTotal + QREstoqueGrupoClasseValor_Total.Value;
      mValorTotal_ANT := mValorTotal_ANT + QREstoqueGrupoClasseValor_Total_ANT.Value;
      QREstoqueGrupoClasse.Next;
    end;
    QREstoqueGrupoClasse.First;  // Posiciona ponteiro no primeiro registro da Query
  end;

  mTPercentual:=0;
  mTPercentual_ANT:=0;
  mTPercentual_class:=0;
  mTPercentual_class_ant:=0;
end;

procedure TFREstoqueGrupoClasse.QRLPercentualPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := FloatToStrF( ( DMEstoque.QREstoqueGrupoClasseVALOR_TOTAL.Value * 100 ) / mValorTotal,ffNumber,10,3 );
  mTPercentual := mTPercentual + StrToFloat(Value);
end;

procedure TFREstoqueGrupoClasse.QRLabel15Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := FloatToStrF( ( DMEstoque.QREstoqueGrupoClasseVALOR_TOTAL_ANT.Value * 100 ) / mValorTotal_ANT,ffNumber,10,3 );
  mTPercentual_ANT := mTPercentual_ANT + StrToFloat(Value);
end;

procedure TFREstoqueGrupoClasse.QRLTPercentualPrint(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF(mTPercentual,ffNumber,10,3);
end;

procedure TFREstoqueGrupoClasse.QRLabel17Print(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF(mTPercentual_ANT,ffNumber,10,3);
end;

procedure TFREstoqueGrupoClasse.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  mTPercentual_class_ant:=mTPercentual_class_ant+(DMEstoque.QREstoqueGrupoClasseVALOR_TOTAL_ANT.Value * 100 ) / mValorTotal_ant;
  mTPercentual_class:=mTPercentual_class+(DMEstoque.QREstoqueGrupoClasseVALOR_TOTAL.Value * 100 ) / mValorTotal;
end;

procedure TFREstoqueGrupoClasse.QRLabel11Print(sender: TObject;
  var Value: String);
begin
  Value:= FloatToStrF(mTPercentual_class,ffNumber,6,3);
end;

procedure TFREstoqueGrupoClasse.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  mTPercentual_class_ant:=0;
  mTPercentual_class:=0;
end;

procedure TFREstoqueGrupoClasse.QRLabel16Print(sender: TObject;
  var Value: String);
begin
  Value:= FloatToStrF(mTPercentual_class_ant,ffNumber,6,3);
end;

end.
