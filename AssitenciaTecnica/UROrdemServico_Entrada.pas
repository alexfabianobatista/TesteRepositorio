unit UROrdemServico_Entrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QRExport, QRWebFilt, QRPDFFilt, Printers;

type
  TFROrdemServico_Entrada = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRMEquipamento: TQRMemo;
    QRLabel7: TQRLabel;
    QRMManutencao: TQRMemo;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRSLinha: TQRShape;
    QRDBTNome: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRDBText11: TQRDBText;
    qrlAviso: TQRLabel;
    QRSLinha2: TQRShape;
    QRDBTNome2: TQRDBText;
    QRLData: TQRLabel;
    QRLPlaca: TQRLabel;
    QRDBTPlaca: TQRDBText;
    QRLSenhaEquip: TQRLabel;
    QRDBSenhaEquip: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRLSite: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioAfterPrint(Sender: TObject);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServico_Entrada: TFROrdemServico_Entrada;

implementation

uses UOrdemServico_cl, URelPreview, UParamSistema_cl, DB;

{$R *.DFM}

procedure TFROrdemServico_Entrada.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DMOrdemServico do
  Begin
    QRMEquipamento.Lines.Text := QREntradaDesc_Equipamento.Value ;
    QRMManutencao.Lines.Text := QREntradaDesc_Solicitacao.Text;
  end;
end;

procedure TFROrdemServico_Entrada.QRPrimarioAfterPrint(Sender: TObject);
begin
  (*
  If FRelPreview = Nil Then
    FRelPreview := TFRelPreview.Create(Application);
  FRelPreview.QRPreview.QRPrinter := QRPrimario.QRPrinter;
  FRelPreview.Show;
  *)
end;

procedure TFROrdemServico_Entrada.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIPECAS' then
    QRPrimario.Page.Length := 297;
  QRPrimario.QRPrinter.PaperSize := QRPrimario.Page.PaperSize;
  QRPrimario.QRPrinter.PaperLength := Round(QRPrimario.Page.Length);
  QRPrimario.QRPrinter.PaperWidth := Round(QRPrimario.Page.Width);
  if DMParamSistema.CodEmpresa = 'CENTERFRIO' then
  begin
      qrlAviso.Caption := DMOrdemServico.QREntradaDESC_OBS.AsString;
  end;

  if (DMParamSistema.CodEmpresa = 'ZIEL') then
    QRLabel6.Caption := 'Moto: ';
end;

procedure TFROrdemServico_Entrada.FormCreate(Sender: TObject);
begin
  QRSLinha2.Width := 0;
  QRDBTNome2.DataField := '';
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'NIR' then
  begin
    qrlAviso.Caption := '';
    QRDBTNome.DataField := 'DESC_FILIAL';
    QRLSenhaEquip.Enabled := False;
    QRDBSenhaEquip.Enabled := False;
    QRLSite.Enabled := False;
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INNET') then
    begin
      qrlAviso.Caption := 'OS APARELHOS NÃO RETIRADOS APÓS 90 DIAS SERÃO REVENDIDOS OU ' +
          'DESMONTADOS PARA PAGAMENTO DE DESPESAS.' + chr(13) + 'CIENTE E DE ACORDO';
      QRDBTNome2.DataField := 'NOME';
      QRSLinha2.Width := 241;
      QRSLinha.Top := QRSLinha.Top - 30;
      QRDBTNome.Top := QRDBTNome.Top - 30;

    end;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIPECAS' then
    begin
      QRDBTNome.DataField := 'NOME';
      QRDBTNome.Top := 940;
      QRSLinha.Top := 930;
      QRDBTNome.Left := 290;
      QRSLinha.Left := 290;
      QRDBTNome.Width := 400;
      QRSLinha.Width := 400;
      QRSLinha2.Width := 713;
      QRSLinha2.Left := 8;
      QRSLinha2.Top := 870;
      QRDBTNome2.Enabled := False;
      qrlAviso.AutoStretch := False;
      qrlAviso.Caption := 'Declaro estar de acordo com os serviços descritos acima.';
      qrlAviso.Top := 880;
      qrlAviso.Height := 40;
      QRLData.Enabled := True;
      QRLData.Left := 200;
      QRLData.Top := 921;
      QRMManutencao.Font.Size := 12;
      QRLPlaca.Enabled := True;
      QRDBTPlaca.Enabled := True;
    end;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRENTO' then
    begin
      qrlAviso.Enabled := False;
      QRSLinha.Enabled := False;
      QRDBTNome.Enabled := False;
      QRMManutencao.Height := 160;
    end;
  end
  else
  begin
    QRDBTNome.DataField := 'NOME';
    QRPrimario.PrinterSettings.Copies := 2; //Por Gian 01/10/2020. Solicitado pelo Cesar
  end;
end;

end.
