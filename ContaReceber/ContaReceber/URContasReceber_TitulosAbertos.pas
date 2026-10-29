unit URContasReceber_TitulosAbertos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasReceber_TitulosAberto = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand6: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr3: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRBand7: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText10: TQRDBText;
    QRLDepartamento: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRChildBand1: TQRChildBand;
    QRDBText13: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText15: TQRDBText;
    QRExpr10: TQRExpr;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRLabel5: TQRLabel;
    QRLNome: TQRLabel;
    QRLOutros: TQRLabel;
    QRLEndereco: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText14: TQRDBText;
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceber_TitulosAberto: TFRContasReceber_TitulosAberto;

implementation

uses UContasReceber_cl, URContrato, UParamSistema_cl;

{$R *.DFM}

procedure TFRContasReceber_TitulosAberto.QRBand3AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  If Trim(DMContasReceber.QRContasReceber_TitulosAbertoDesc_Observacao.Text) <> '' Then
     QRChildBand1.Enabled := True
  Else
     QRChildBand1.Enabled := False;

end;

procedure TFRContasReceber_TitulosAberto.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRContasReceber_TitulosAberto.QRPrimario);
  QRCompositeReport1.Reports.Add(FRContrato.QRPrimario);

end;

procedure TFRContasReceber_TitulosAberto.QRGroup2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  With DMContasReceber Do
  Begin
    QRLNome.Caption := QRContasReceber_TitulosAbertoNome.Value + ' - ' +
                       QRContasReceber_TitulosAbertoDESC_TELEFONE.Value + ' - ' +
                       QRContasReceber_TitulosAbertoDESC_CELULAR.Value;
     If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
       QRLNome.Caption := QRLNome.Caption + ' - ' + QRContasReceber_TitulosAbertoDesc_Fone_Empresa.Value
     Else
     begin
       if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' Then
         QRLNome.Caption := QRLNome.Caption + ' - ' +
                            QRContasReceber_TitulosAbertoNOME_VENDEDOR.Value
       else
         QRLNome.Caption := QRLNome.Caption + ' - ' +
                            QRContasReceber_TitulosAbertoDESC_CLASSIFICACAO.Value + ' - ' +
                            QRContasReceber_TitulosAbertoNOME_VENDEDOR.Value;
     end;
    QRLEndereco.Caption := QRContasReceber_TitulosAbertoDesc_Endereco.Value + ' - ' +
                           QRContasReceber_TitulosAbertoDesc_Cidade.Value + ' - ' +
                           QRContasReceber_TitulosAbertoCod_Estado.Value + ' - ' +
                           QRContasReceber_TitulosAbertoDesc_Cep.Value + ' - ' +
                           QRContasReceber_TitulosAbertoNum_Cgc_Cpf.Value;
  end;
end;

procedure TFRContasReceber_TitulosAberto.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO' then
  Begin
    QRDBText14.Enabled := True;
    QRDBText14.Width := 60;
    QRDBText5.Enabled := False;
  end;
end;

end.
