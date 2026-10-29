unit URComissaoArtista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRComissaoArtista = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRSConsultor: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLValComissaoGeralConsultor: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRLValComissaoConsultor: TQRLabel;
    QRLabel12: TQRLabel;
    QRLValComissaoArtista: TQRLabel;
    QRLValComissaoGaleria: TQRLabel;
    QRLValComissaoGeralArtista: TQRLabel;
    QRLValComissaoGeralGaleria: TQRLabel;
    QRLPeriodo: TQRLabel;
    procedure QRSConsultorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSConsultorAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRComissaoArtista: TFRComissaoArtista;
  wSobra, wComissao, wDiferenca, wValTotalComissaoConsultor,
  wComissaoArtista, wValTotalComissaoArtista : double;


implementation

uses UOracle_cl, URelatorioVenda_cl;
{$R *.dfm}

procedure TFRComissaoArtista.QRSConsultorBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLValComissaoGeralConsultor.Caption := FormatFloat('#,##,##0.00',wValTotalComissaoConsultor);
  QRLValComissaoGeralArtista.Caption := FormatFloat('#,##,##0.00',wValTotalComissaoArtista);
  QRLValComissaoGeralGaleria.Caption := FormatFloat('#,##,##0.00',wValTotalComissaoArtista);
end;

procedure TFRComissaoArtista.FormCreate(Sender: TObject);
begin
  inherited;
  wSobra := 0;
  wComissao := 0;
  wComissaoArtista := 0;
end;

procedure TFRComissaoArtista.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with DMRelatorio_Venda do
  begin
    //CÁLCULO COMISSÃO CONSULTOR
    if QRComissaoArtistaVAL_LIQUIDO.Value <= 70000 then
    begin
      wDiferenca := 0;
      wComissao := (QRComissaoArtistaVAL_LIQUIDO.Value * (QRComissaoArtistaPERC_COMISSAO1.Value/100));
      QRLValComissaoConsultor.Caption := FormatFloat('#,##,##0.00',wComissao);
    end
    else
    begin
      wSobra := (QRComissaoArtistaVAL_LIQUIDO.Value - 70000);
      wDiferenca := ((QRComissaoArtistaVAL_LIQUIDO.Value - 10000)*(QRComissaoArtistaPERC_COMISSAO2.Value/100));
      wComissao := ((QRComissaoArtistaVAL_LIQUIDO.Value - wSobra)*(QRComissaoArtistaPERC_COMISSAO1.Value/100));
      QRLValComissaoConsultor.Caption := FormatFloat('#,##,##0.00',wComissao+wDiferenca);
    end;
    wValTotalComissaoConsultor := wValTotalComissaoConsultor + wComissao + wDiferenca;
    //CÁLCULO COMISSÃO ARTISTA E GALERIA
    wComissaoArtista := (QRComissaoArtistaVAL_LIQUIDO.Value - StrToFloat(QRLValComissaoConsultor.Caption))/2;
    QRLValComissaoArtista.Caption := FormatFloat('#,##,##0.00',wComissaoArtista);//(QRComissaoArtistaVAL_LIQUIDO.Value - StrToFloat(QRLValComissaoConsultor.Caption))/2);
    QRLValComissaoGaleria.Caption := FormatFloat('#,##,##0.00',wComissaoArtista);
    wValTotalComissaoArtista := wValTotalComissaoArtista + wComissaoArtista;
  end;

end;

procedure TFRComissaoArtista.QRSConsultorAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wValTotalComissaoConsultor := 0;
  wValTotalComissaoArtista   := 0;
end;

procedure TFRComissaoArtista.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wValTotalComissaoConsultor := 0;
  wValTotalComissaoArtista   := 0;
end;

end.
