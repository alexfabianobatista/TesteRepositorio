unit URPosicaoEstoqueEmbarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRPosicaoEstoqueEmbarque = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLPeriodo: TQRLabel;
    QRLFilial: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    qrl1: TQRLabel;
    qrl2: TQRLabel;
    qrl3: TQRLabel;
    qrl4: TQRLabel;
    qrl5: TQRLabel;
    qrl6: TQRLabel;
    qrl7: TQRLabel;
    qrl8: TQRLabel;
    qrl9: TQRLabel;
    qrl10: TQRLabel;
    qrl11: TQRLabel;
    qrl12: TQRLabel;
    qrl13: TQRLabel;
    qrl14: TQRLabel;
    qrl15: TQRLabel;
    qrl16: TQRLabel;
    qrl17: TQRLabel;
    qrl18: TQRLabel;
    qrl19: TQRLabel;
    qrl20: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText25: TQRDBText;
    QRExpr1: TQRExpr;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRChildBand1: TQRChildBand;
    qrlColuna: TQRLabel;
    qrlEmbarque: TQRLabel;
    qrlTonelada: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrlPesoBruto: TQRLabel;
    qrlPesoLiquido: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    wAltura : integer;
  public
    { Public declarations }
    procedure setRowNumEmbarque(num : integer);
  end;

var
  FRPosicaoEstoqueEmbarque: TFRPosicaoEstoqueEmbarque;

implementation

uses UEmbarque_cl;

{$R *.DFM}

procedure TFRPosicaoEstoqueEmbarque.setRowNumEmbarque(num : integer);
begin

  {*** ajusta o numero das colunas ***}
  qrl1.Caption  := IntToStr(num);
  qrl2.Caption  := IntToStr(num + 1 );
  qrl3.Caption  := IntToStr(num + 2 );
  qrl4.Caption  := IntToStr(num + 3 );
  qrl5.Caption  := IntToStr(num + 4 );
  qrl6.Caption  := IntToStr(num + 5 );
  qrl7.Caption  := IntToStr(num + 6 );
  qrl8.Caption  := IntToStr(num + 7 );
  qrl9.Caption  := IntToStr(num + 8 );
  qrl10.Caption := IntToStr(num + 9 );
  qrl11.Caption := IntToStr(num + 10);
  qrl12.Caption := IntToStr(num + 11);
  qrl13.Caption := IntToStr(num + 12);
  qrl14.Caption := IntToStr(num + 13);
  qrl15.Caption := IntToStr(num + 14);
  qrl16.Caption := IntToStr(num + 15);
  qrl17.Caption := IntToStr(num + 16);
  qrl18.Caption := IntToStr(num + 17);
  qrl19.Caption := IntToStr(num + 18);
  qrl20.Caption := IntToStr(num + 19);
end;

procedure TFRPosicaoEstoqueEmbarque.FormCreate(Sender: TObject);
begin
  inherited;
  QRGroup1.Height := 0;
  wAltura := QRChildBand1.Height;
end;

procedure TFRPosicaoEstoqueEmbarque.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  qrl : TQRLabel;
  cont : integer;
  wTotalLiq, wTotalBruto : real;
begin
  inherited;
  DMEmbarque.QREstoqueEmbarqueSub.close;
  DMEmbarque.QREstoqueEmbarqueSub.SetVariable('FILIAL', DMEmbarque.QREstoqueEmbarque.GetVariable('FILIAL'));
  //DMEmbarque.QREstoqueEmbarqueSub.SetVariable('FILIAL', DMEmbarque.QREstoqueEmbarqueCOD_FILIAL.Value);
  DMEmbarque.QREstoqueEmbarqueSub.SetVariable('DT_REFERENCIA',strtodate(DMEmbarque.QREstoqueEmbarque.GetVariable('DT_REFERENCIA')));
  DMEmbarque.QREstoqueEmbarqueSub.SetVariable('DT_REFERENCIA_FINAL',strtodate(DMEmbarque.QREstoqueEmbarque.getVariable('DT_REFERENCIA_FINAL')));
  DMEmbarque.QREstoqueEmbarqueSub.SetVariable('LISTA_EMBARQUE', DMEmbarque.QREstoqueEmbarque.GetVariable('LISTA_EMBARQUE'));
  DMEmbarque.QREstoqueEmbarqueSub.open;

  QRChildBand1.Height := wAltura + qrlColuna.Height * DMEmbarque.QREstoqueEmbarqueSub.RecordCount + 17;
  qrlColuna.Height := 17 * DMEmbarque.QREstoqueEmbarqueSub.RecordCount + 34;
  qrlEmbarque.Height := 17 * DMEmbarque.QREstoqueEmbarqueSub.RecordCount + 34;
  qrlPesoBruto.Height := 17 * DMEmbarque.QREstoqueEmbarqueSub.RecordCount + 34;
  qrlPesoLiquido.Height := 17 * DMEmbarque.QREstoqueEmbarqueSub.RecordCount + 34;

  cont := 0;
  qrlColuna.Caption := '';
  qrlEmbarque.Caption := '';
  qrlPesoBruto.Caption := '';
  qrlPesoLiquido.caption := '';
  wTotalLiq := 0;
  wTotalBruto := 0;
  while not DMEmbarque.QREstoqueEmbarqueSub.eof do
  begin
    cont := cont + 1;
    qrlColuna.Caption := qrlColuna.Caption + DMEmbarque.QREstoqueEmbarqueSubROWNUM_EMBARQUE.Text + chr(13);
    qrlEmbarque.Caption := qrlEmbarque.Caption + DMEmbarque.QREstoqueEmbarqueSubCOD_EMBARQUE.Text + chr(13);
    qrlPesoBruto.Caption := qrlPesoBruto.Caption + DMEmbarque.QREstoqueEmbarqueSubTOT_PESO_BRUTO.Text + chr(13);
    qrlPesoLiquido.Caption := qrlPesoLiquido.Caption + DMEmbarque.QREstoqueEmbarqueSubTOT_PESO_LIQ.Text + chr(13);
    wTotalLiq := wTotalLiq + DMEmbarque.QREstoqueEmbarqueSubTOT_PESO_LIQ.value;
    wTotalBruto := wTotalBruto + DMEmbarque.QREstoqueEmbarqueSubTOT_PESO_BRUTO.value;
    DMEmbarque.QREstoqueEmbarqueSub.Next;
  end;

  qrlColuna.Caption := qrlColuna.Caption + '';
  qrlEmbarque.Caption := qrlEmbarque.Caption + 'Total (Kg): ' + chr(13);
  qrlPesoBruto.Caption := qrlPesoBruto.Caption + FormatFloat('#,##0.00', wTotalBruto) + chr(13);
  qrlPesoLiquido.Caption := qrlPesoLiquido.Caption + FormatFloat('#,##0.00', wTotalLiq) + chr(13);

end;

end.
 