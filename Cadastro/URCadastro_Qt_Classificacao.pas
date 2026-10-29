unit URCadastro_Qt_Classificacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRCadastro_Qt_Classificacao = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QrLTotal: TQRLabel;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QrlTotal_Cadastro: TQRLabel;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCadastro_Qt_Classificacao: TFRCadastro_Qt_Classificacao;

implementation

uses UClassCadastro_cl, UOracle_cl;

{$R *.DFM}

procedure TFRCadastro_Qt_Classificacao.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QrlTotal.Caption := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_CADASTRO ',
              'COD_CLASS_CADASTRO = '+FloatToStr(DMClassCadastro.QRClassCadastroCod_Class_Cadastro.Value));
  QrlTotal_Cadastro.Caption := FloatToStr(StrToFloat(QrlTotal_Cadastro.Caption) + StrToFloat(QrlTotal.Caption));  
end;

procedure TFRCadastro_Qt_Classificacao.QRBand5AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  QrLTotal_Cadastro.Caption := '0';
end;

end.
