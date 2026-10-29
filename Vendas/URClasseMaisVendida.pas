unit URClasseMaisVendida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRClasseMaisVendida = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel9: TQRLabel;
    QRExpr6: TQRExpr;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRExpr10: TQRExpr;
    QRLabel24: TQRLabel;
    QRExpr15: TQRExpr;
    QRExpr11: TQRExpr;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr12: TQRExpr;
    QRGroup1: TQRGroup;
    QRLClasse: TQRLabel;
    QRBand6: TQRBand;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    QRExpr20: TQRExpr;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRClasseMaisVendida: TFRClasseMaisVendida;

implementation

uses URelatorioVenda_cl, UOracle_cl, UNotaSaidaParam;

{$R *.dfm}

procedure TFRClasseMaisVendida.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);


begin
  inherited;
  DMRelatorio_Venda.QRClasseMaisVendidanum_vendas.Value := StrToInt(DMOracle.BuscaNome('SELECT COUNT(COD_NOTA_CAB) FROM TB_NOTA_CAB','DT_EMISSAO >= '+
                                            chr(39)+Trim(FNotaSaidaParam.ME32DtInicial.Text)+ chr(39)+'AND DT_EMISSAO <= '+
                                            chr(39)+Trim(FNotaSaidaParam.ME32DtFinal.Text)+ chr(39)+'AND (COD_OPERACAO = 3 OR COD_OPERACAO = 17)'));
  

end;

procedure TFRClasseMaisVendida.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLClasse.Caption := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE ='+DMRelatorio_Venda.QRCLasseMaisVendidaNUM_CLASSE.Text +
                                          ' AND NUM_SUBCLASSE = ''0''');
end;

end.
