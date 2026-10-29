unit URComprovanteEntrega;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRComprovanteEntrega = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRLNome: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLRecebedor: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRComprovanteEntrega: TFRComprovanteEntrega;

implementation

uses UNotaSaida_cl, UOracle_cl;

{$R *.DFM}

procedure TFRComprovanteEntrega.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  QRLNome.Caption := 'Nome: '+DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                                       'COD_CADASTRO = ' + DMNOTASAIDA.QNOTASAIDACOD_CADASTRO.TEXT);
  QRLRecebedor.Caption := 'Recebedor: '+DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                                       'COD_CADASTRO = ' + DMNOTASAIDA.QNOTASAIDACOD_CADASTRO.TEXT);

  end;

end.
