unit URCFOP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRCFOP = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRGroup3: TQRGroup;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLFilial: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLCidade: TQRLabel;
    QRLabel7: TQRLabel;
    QRLAno: TQRLabel;
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    procedure FormCreate(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioEndPage(Sender: TCustomQuickRep);
  private
    { Private declarations }
    wCont : integer;
  public
    { Public declarations }
  end;

var
  FRCFOP: TFRCFOP;

implementation

uses UCFOP_cl;

{$R *.DFM}

procedure TFRCFOP.FormCreate(Sender: TObject);
begin
  inherited;
  wCont := 0;
  //deixa com tamanho zero, pois nao tem nada nas bandas
  QRGroup1.Height := 0;
  QRGroup2.Height := 0;
  //----------
end;

procedure TFRCFOP.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLFilial.Caption := DMCFOP.QRCFOPDESC_FILIAL.Value;
  QRLEndereco.Caption := DMCFOP.QRCFOPDESC_ENDERECO.Value + ' - ' + DMCFOP.QRCFOPDESC_BAIRRO.Value;
  QRLCidade.Caption := DMCFOP.QRCFOPDESC_CIDADE.Value + ' - ' + DMCFOP.QRCFOPCOD_ESTADO.Value;
  QRLCidade.Caption := DMCFOP.QRCFOPDESC_CIDADE.Value + ' - ' + DMCFOP.QRCFOPCOD_ESTADO.Value;
  QRLAno.Caption := IntToStr(DMCFOP.QRCFOPNUM_ANO.value);
end;

procedure TFRCFOP.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  QRGroup2.ForceNewPage := true; //controle para nao imprimir pagina em branco, pois possui dois group
end;

procedure TFRCFOP.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  QRGroup2.ForceNewPage := false; //controle para nao imprimir pagina em branco, pois possui dois group
end;

procedure TFRCFOP.QRGroup3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wCont := wCont + 1;
end;

procedure TFRCFOP.QRGroup3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if wCont = 2 then
  begin
    wCont := 0;
    QRPrimario.NewColumn;
  end;
end;

procedure TFRCFOP.QRPrimarioEndPage(Sender: TCustomQuickRep);
begin
  inherited;
  wCont := 0;
end;

end.
