unit URImagemPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, jpeg;

type
  TFRImagemPedido = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLDescFilial: TQRLabel;
    QRLCadastro: TQRLabel;
    QRBand3: TQRBand;
    QRImagemPedido: TQRImage;
    QRDBTNumPedido: TQRDBText;
    QRDBTCodOperacao: TQRDBText;
    QRLabel6: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLabel7: TQRLabel;
    QRLFone: TQRLabel;
    QRLabel8: TQRLabel;
    QRLCidade: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRImagemPedido: TFRImagemPedido;

implementation

uses UOracle_cl, UPedido_cl;

{$R *.dfm}

procedure TFRImagemPedido.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLDescFilial.Caption := DMOracle.FastSelect('DESC_FILIAL','TB_FILIAL','COD_FILIAL = ' + DMPedido.QPedidoCOD_FILIAL.Text);
  QRLCadastro.Caption := DMOracle.FastSelect('NOME','TB_CADASTRO','COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text);
  QRLEndereco.Caption := DMOracle.FastSelect('DESC_ENDERECO','TB_CADASTRO','COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text);
  QRLCidade.Caption := DMOracle.FastSelect('DESC_CIDADE','TB_CADASTRO','COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text);
  QRLFone.Caption := DMOracle.FastSelect('DESC_TELEFONE','TB_CADASTRO','COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text);

  QRLTitulo.Caption := 'Relatório de imagem do pedido.';
end;

procedure TFRImagemPedido.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  jpeg: tjpegimage;
  buf: tmemorystream;
begin
  inherited;
  try
    jpeg := TJpegImage.Create;
    buf := Tmemorystream.Create;
    DMPedido.QImagemPedidoIMG_IMAGEM.SaveToStream(buf);
    buf.Position:=0;
    jpeg.LoadFromStream(buf);
    QRImagemPedido.Picture.Assign(jpeg);
  finally
    buf.free;
    jpeg.free;
  end;
end;

end.
