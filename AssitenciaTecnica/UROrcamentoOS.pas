unit UROrcamentoOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl, DB, StdCtrls, Mask, DBCtrls;

type
  TFROrcamentoOS = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRILogo: TQRImage;
    QRLLogo: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText16: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText19: TQRDBText;
    QRHRule1: TQRHRule;
    QRDBText20: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLValidadeOrcamento: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBDesc_Complemento: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBEquipamento: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBServico: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRLDocPendentes: TQRLabel;
    QRMDocPendente: TQRMemo;
    QRLabel35: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText39: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrcamentoOS: TFROrcamentoOS;

implementation
uses UOrdemServico_cl, UParamSistema_cl;
{$R *.dfm}

procedure TFROrcamentoOS.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'GEOPRO' then
  begin
      QRLabel12.Enabled := False;
      QRDBText11.Enabled := False;
      QRLabel15.Enabled := False;
      QRExpr3.Enabled := False;
      QRLabel16.Enabled := False;
      QRExpr4.Enabled := False;
      QRLabel17.Enabled := False;
      QRExpr5.Enabled := False;
      QRLabel12.Enabled := False;
      QRDBText11.Enabled := False;
      QRLabel24.Enabled := False;
      QRDBText21.Enabled := False;
      QRLabel9.Enabled := False;
      QRDBText16.Enabled := False;
      QRDBText17.Enabled := False;
      QRLabel2.Enabled := False;
      QRSysData2.Enabled := False;

      QRLTitulo.Top:= 30;
      QRLTitulo.Left:= 630;
      QRDBText12.Top:= 30;
      QRDBText12.Left:= 724;

      QRLabel26.Enabled := True;
      QRDBText23.Enabled := True;

      //QRLabel22.Caption := 'Técnico: ';

      QRLNomeRel.Enabled := False;

      QRSysData1.Enabled := False;

      QRDBText9.Enabled := False;
      QRDBText8.Left := 172;

      QRDBText22.Enabled := False;
      QRLabel27.Enabled := False;


  end;

  if (DMParamSistema.CodEmpresa = 'GEOPRO') or (DMParamSistema.CodEmpresa = 'USIMED') or (DMParamSistema.CodEmpresa = 'FURGOESMED') or
     (DMParamSistema.CodEmpresa = 'JOFER')  or (DMParamSistema.CodEmpresa = 'ZANONI') or (DMParamSistema.CodEmpresa = 'NIR')        or
     (DMParamSistema.CodEmpresa = 'ALFA')   or (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin//Adicionado Jofer. Alex 07/11/2025 Adicionado NIR, solicitado por Marcos. 09/01/2026 Alex
     QRDBDesc_Complemento.Enabled := True;
  end;

  if (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin
     QRDBText25.DataField := 'DESC_EMPRESA';
     QRDBText33.Enabled := True;
     QRLabel34.Enabled := True;
     QRDBText19.Enabled := True;
     QRLabel12.Enabled := true;
     QRDBText11.Enabled := true;

     QRDBText33.Left := 52;
     QRDBText33.Width := 170;
     QRDBText33.DataField := 'DESC_CARACTERISTICA';
     QRLabel34.Caption := 'Modelo: ';
  end;

  if (DMParamSistema.CodEmpresa = 'FURGOESMED') then
  begin
    QRLabel15.Enabled := false;
    QRLabel16.Enabled := false;
    QRLabel18.Enabled := false;
    QRLabel19.Enabled := false;
    QRExpr3.Enabled := false;
    QRExpr4.Enabled := false;
    QRExpr6.Enabled := false;
    QRExpr7.Enabled := false;

    QRBand5.Height := 50;
    QRLabel17.top := 2;
    QRLabel20.top := 18;
    QRLabel23.top := 34;
    QRExpr5.top := 2;
    QRExpr8.top := 18;
    QRExpr1.top := 34;
  end;

  if (DMParamSistema.CodEmpresa = 'NFCE-IVO') or (DMParamSistema.CodEmpresa = 'ZANONI') or (DMParamSistema.CodEmpresa = 'ALFA') or
     (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
    QRLabel31.Caption := 'Mecânico';

  if (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
    QRLabel31.Caption := 'Eletricista: ';

end;

procedure TFROrcamentoOS.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'GEOPRO' then
  begin

    QRLValidadeOrcamento.Enabled := True;
    QRDBEquipamento.Enabled      := True;
    QRLDocPendentes.Enabled      := True;
    QRMDocPendente.Enabled       := True;
    QRMDocPendente.Lines.Clear;

    with DMOrdemServico do
    begin
    if QrOrcamentoOSind_matricula_imovel.Text <> '' then
      QRMDocPendente.Lines.Add(QrOrcamentoOSIND_MATRICULA_IMOVEL.Text);

    if QrOrcamentoOSIND_CCIR.Text <> '' then
      QRMDocPendente.Lines.Add(QrOrcamentoOSIND_CCIR.Text);

    if QrOrcamentoOSIND_ITR.Text <> '' then
      QRMDocPendente.Lines.Add(QrOrcamentoOSIND_ITR.Text);

    if QrOrcamentoOSIND_CAR.Text <> '' then
      QRMDocPendente.Lines.Add(QrOrcamentoOSIND_CAR.Text);

    if QrOrcamentoOSIND_MAPA.Text <> '' then
      QRMDocPendente.Lines.Add(QrOrcamentoOSIND_MAPA.Text);

    if QrOrcamentoOSIND_MEMORIAL_DESCRITIVO.Text <> '' then
      QRMDocPendente.Lines.Add(QrOrcamentoOSIND_MEMORIAL_DESCRITIVO.Text);

    if QrOrcamentoOSIND_COPIA_RG_PROPRIETARIO.Text <> '' then
      QRMDocPendente.Lines.Add(QrOrcamentoOSIND_COPIA_RG_PROPRIETARIO.Text);

    if QrOrcamentoOSIND_COPIA_CPF_PROPRIETARIO.Text <> '' then
      QRMDocPendente.Lines.Add(QrOrcamentoOSIND_COPIA_CPF_PROPRIETARIO.Text);

    if QrOrcamentoOSIND_CERT_CASAMENTO.Text <> '' then
      QRMDocPendente.Lines.Add(QrOrcamentoOSIND_CERT_CASAMENTO.Text);

    if QrOrcamentoOSIND_COMP_ENDERECO.Text <> '' then
      QRMDocPendente.Lines.Add(QrOrcamentoOSIND_COMP_ENDERECO.Text);

    if QrOrcamentoOSIND_CONTRATO_COMPRA_VENDA.Text <> '' then
      QRMDocPendente.Lines.Add(QrOrcamentoOSIND_CONTRATO_COMPRA_VENDA.Text);

  end;
  end;
//Solicitado pela Rosana da CenterFrio pois tem um cliente deles que precisa que apareça junto aos produtos a descrição do serviço e do equipamento. Alex 23/03/2022
  if (DMParamSistema.CodEmpresa = 'CENTERFRIO') or (DMParamSistema.CodEmpresa = 'PATELI') or (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin
    QRDBEquipamento.Enabled := True;
    QRDBServico.Enabled := True;
    QRLabel33.Enabled := True;
    QRLabel32.Enabled := True;
  end;
//Solicitado pela Cecilia da Begnini para conferir os dados do equipamento. Alex 03/11/2023. cod_suporte: 8221
  if (DMParamSistema.CodEmpresa = 'BENINI') then
  begin
    QRDBEquipamento.Enabled := True;
    QRDBEquipamento.AutoStretch := True;
    QRDBEquipamento.AutoSize := True;
    QRDBEquipamento.Top := 170;
    QRLabel33.Enabled := True;
    QRLabel33.Top := 145;
  end;
end;

procedure TFROrcamentoOS.FormCreate(Sender: TObject);
begin
  inherited;
  //Aleteração no relatório para tirar o número de fabricante para a cod empresa FURGOES MEDIANEIRA
    if (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'USIMED') then
    begin
     QRDBText16.Enabled := False;
     QRLabel9.Enabled := False;
     QRLabel4.Left := 80;
     QRDBText2.Left := 80;
     QRDBText2.Width := 340;
     QRBand2.Enabled := False;
    end;

    if (DMParamSistema.CodEmpresa = 'CENTERFRIO') or (DMParamSistema.CodEmpresa = 'CASAFILTRO') or (DMParamSistema.CodEmpresa = 'ZANONI') or
       (DMParamSistema.CodEmpresa = 'RRPECAS')    or (DMParamSistema.CodEmpresa = 'RSMECANICA') or (DMParamSistema.CodEmpresa = 'ALFA')   or
       (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
    begin
      QRDBText19.Enabled := true;
      QRLabel22.Enabled := true;
    end;

    if (DMParamSistema.CodEmpresa <> 'JOFER') 	   and (DMParamSistema.CodEmpresa <> 'MEDISYSTEM') and (DMParamSistema.CodEmpresa <> 'FURGOESMED') and
       (DMParamSistema.CodEmpresa <> 'BENINI') 	   and (DMParamSistema.CodEmpresa <> 'REDIESEL')   and (DMParamSistema.CodEmpresa <> 'DATEL') 	   and
       (DMParamSistema.CodEmpresa <> 'PATELI') 	   and (DMParamSistema.CodEmpresa <> 'NFCE-IVO')   and (DMParamSistema.CodEmpresa <> 'ZANONI')     and
       (DMParamSistema.CodEmpresa <> 'NIR')        and (DMParamSistema.CodEmpresa <> 'ALFA')       and (DMParamSistema.CodEmpresa <> 'RENATOAUTO') then
    begin//Adicionado NIR, solicitado por Marcos. 09/01/2026 Alex
      QRLabel12.Enabled := false;
      QRDBText11.Enabled := false;
      QRLabel24.Enabled := false;
      QRDBText21.Enabled := false;

      QRLabel26.Enabled := true;
      QRDBText23.Enabled := true;
    end;

    if (DMParamSistema.CodEmpresa = 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA') then
    begin
      QRLabel31.Caption := 'Mecânico: ';
      QRLabel22.Caption := 'Mecânico 2: ';
    end;
end;

procedure TFROrcamentoOS.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
{Kaio da Furgões Medianeira solicitou para manter o complemento, pois como possuem produto generico a observação contém a informação do registro realizado.
Alex 30/08/2023}  
  if (DMParamSistema.CodEmpresa = 'GEOPRO') or (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'ZANONI') or
     (DMParamSistema.CodEmpresa = 'ALFA')   or (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin
    if DMOrdemServico.QrOrcamentoOSDESC_COMPLEMENTO.Value <> '' then
      QRBand4.Height := 36
    else
      QRBand4.Height := 17;
  end;
  if (DMParamSistema.CodEmpresa = 'USIMED') or (DMParamSistema.CodEmpresa = 'JOFER') or (DMParamSistema.CodEmpresa = 'NIR') then    // Andre 14-06-2023 Solicitação de Inclusão para Orçamento
  begin//Adicionado Jofer. Alex 07/11/2025 Adicionado NIR, solicitado por Marcos. 09/01/2026 Alex
    if DMOrdemServico.QrOrcamentoOSDESC_COMPLEMENTO.Value <> '' then
    begin
      QRBand4.Height := 40;
      QRDBDesc_Complemento.Left := 80;
      QRDBDesc_Complemento.Width := 340;
      QRDBDesc_Complemento.AutoStretch := True;
    end
    else
      QRBand4.Height := 17;
  end;
end;

procedure TFROrcamentoOS.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa <> 'ALFA') then
  begin
    QRLabel35.Enabled := False;
    QRLabel35.Visible := False;
    QRLabel36.Enabled := False;
    QRLabel36.Visible := False;
    QRLabel37.Enabled := False;
    QRLabel37.Visible := False;
    QRLabel38.Enabled := False;
    QRLabel38.Visible := False;
    QRDBText36.Enabled := False;
    QRDBText36.Visible := False;
    QRDBText37.Enabled := False;
    QRDBText37.Visible := False;
    QRDBText38.Enabled := False;
    QRDBText38.Visible := False;
    QRDBText39.Enabled := False;
    QRDBText39.Visible := False;
  end;
  if (DMParamSistema.CodEmpresa = 'ALFA') then
  begin
    QRBand1.Height := 157;
    QRLabel24.Visible := False;
    QRLabel24.Enabled := False;
    QRDBText21.Visible := False;
    QRDBText21.Enabled := False;
    QRLabel22.Enabled := False;
    QRLabel22.Visible := False;
    QRDBText11.Visible := False;
    QRDBText11.Enabled := False;

    QRLabel35.Top := 116;
    QRLabel36.Top := 116;
    QRLabel37.Top := 116;
    QRDBText36.Top := 116;
    QRDBText37.Top := 116;
    QRDBText38.Top := 116;
    QRLabel38.Top := 136;
    QRDBText39.Top := 136;
  end;
end;

procedure TFROrcamentoOS.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'ALFA') then
    QRBand2.Enabled := False;
end;

end.
