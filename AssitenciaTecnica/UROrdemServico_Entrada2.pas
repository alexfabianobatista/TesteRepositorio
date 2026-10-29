unit UROrdemServico_Entrada2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFROrdemServico_Entrada2 = class(TFTRelSimples)
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLPlaca: TQRLabel;
    QRDBTPlaca: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRMEquipamento: TQRMemo;
    QRBand4: TQRBand;
    QRLData: TQRLabel;
    QRSLinha: TQRShape;
    QRDBTNome: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServico_Entrada2: TFROrdemServico_Entrada2;

implementation

uses UOrdemServico_cl;

{$R *.dfm}

procedure TFROrdemServico_Entrada2.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  With DMOrdemServico do
  Begin
    QRMEquipamento.Lines.Text := 'EQUIPAMENTO: ' + #13 +#13 +#13 + QREntradaDesc_Equipamento.Value + #13 +#13 + 'MANUTENÇÃO: '+ #13 +#13 +#13 +QREntradaDesc_Solicitacao.Text ;
    QRLTitulo.Caption := QREntradaDESC_FILIAL_DADOS.Text;
    QRLabel1.Caption := '';
    QRLNomeRel.Caption := '';
  end;
end;

end.
