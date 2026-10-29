unit UDespesaAntecipadaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, variants, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFDespesaAntecipadaCad = class(TFTCadSimples)
    Opes1: TMenuItem;
    Contabilizar1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    SBCadastro: TSpeedButton;
    Label13: TLabel;
    SBCodContabilDeb: TSpeedButton;
    Label14: TLabel;
    SBCodContabilCred: TSpeedButton;
    Label8: TLabel;
    SBHistoricoContabil: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    SBFilial: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label12: TLabel;
    DBEdit18: TDBEdit;
    SBCodContabilParcDeb: TSpeedButton;
    DBEdit19: TDBEdit;
    Label15: TLabel;
    DBEdit20: TDBEdit;
    SBCodContabilParcCred: TSpeedButton;
    DBEdit21: TDBEdit;
    Label16: TLabel;
    DBEdit22: TDBEdit;
    RelDespesaAntecipada1: TMenuItem;
    Cancelar2: TMenuItem;
    VoltarCancelamento1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    DBNavigator1: TDBNavigator;
    MeKey: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure SBCodContabilDebClick(Sender: TObject);
    procedure SBCodContabilCredClick(Sender: TObject);
    procedure SBHistoricoContabilClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBCadastroClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure Contabilizar1Click(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBCodContabilParcDebClick(Sender: TObject);
    procedure SBCodContabilParcCredClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelDespesaAntecipada1Click(Sender: TObject);
    procedure Cancelar2Click(Sender: TObject);
    procedure VoltarCancelamento1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDespesaAntecipadaCad: TFDespesaAntecipadaCad;

implementation

uses UDespesaAntecipada_cl, UPlanoContaCons, UCadastroCons, UCadastro_cl,
  UPlanoConta_cl, UHistContabilCons, UHistContabil_cl, UParamSistema_cl,
  UPlanilha_cl, UOracle_cl, UFilialCons, UFilial_cl, UContabilParam,
  UUsuario_cl, UDespesaAntecipadaCons, URDespesaAntecipada;

{$R *.DFM}

procedure TFDespesaAntecipadaCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMDespesaAntecipada do
  begin
    QDespesaAntecipada.Open;
    case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) of
      4: begin
         QDespesaAntecipadaCod_Contabil_Cred.EditMask := '#.##.##.######;0;';
         QDespesaAntecipadaCod_Contabil_Deb.EditMask := '#.##.##.######;0;';
         QDespesaAntecipadaCod_Contabil_Parc_Cred.EditMask := '#.##.##.######;0;';
         QDespesaAntecipadaCod_Contabil_Parc_Deb.EditMask := '#.##.##.######;0;';
         end;
      5: begin
         QDespesaAntecipadaCod_Contabil_Cred.EditMask := '#.##.##.##.######;0;';
         QDespesaAntecipadaCod_Contabil_Deb.EditMask := '#.##.##.##.######;0;';
         QDespesaAntecipadaCod_Contabil_Parc_Cred.EditMask := '#.##.##.##.######;0;';
         QDespesaAntecipadaCod_Contabil_Parc_Deb.EditMask := '#.##.##.##.######;0;';
         end;
      6: begin
         QDespesaAntecipadaCod_Contabil_Cred.EditMask := '#.##.##.##.##.######;0;';
         QDespesaAntecipadaCod_Contabil_Deb.EditMask := '#.##.##.##.##.######;0;';
         QDespesaAntecipadaCod_Contabil_Parc_Cred.EditMask := '#.##.##.##.##.######;0;';
         QDespesaAntecipadaCod_Contabil_Parc_Deb.EditMask := '#.##.##.##.##.######;0;';
         end;
    end;
  end;
end;

procedure TFDespesaAntecipadaCad.SBCodContabilDebClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMDespesaAntecipada.QDespesaAntecipadaCod_Contabil_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFDespesaAntecipadaCad.SBCodContabilCredClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMDespesaAntecipada.QDespesaAntecipadaCod_Contabil_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFDespesaAntecipadaCad.SBHistoricoContabilClick(Sender: TObject);
begin
  inherited;
  if FHistContabilCons = nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  if FHistContabilCons.ShowModal = mrOk then
    DMDespesaAntecipada.QDespesaAntecipadaCod_Historico_Contabil.Value := DMHistContabil.QHistContabilConsCod_Historico_Contabil.Value;
end;

procedure TFDespesaAntecipadaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBFilial.Enabled := SBConfirmar.Enabled;
  SBCadastro.Enabled := SBConfirmar.Enabled;
  SBCodContabilDeb.Enabled := SBConfirmar.Enabled;
  SBCodContabilCred.Enabled := SBConfirmar.Enabled;
  SBCodContabilParcDeb.Enabled := SBConfirmar.Enabled;
  SBCodContabilParcCred.Enabled := SBConfirmar.Enabled;
  SBHistoricoContabil.Enabled := SBConfirmar.Enabled;
  DBEdit11.ReadOnly := DsPrimario.State = DsEdit;
  DBEdit3.ReadOnly := DsPrimario.State = DsEdit;
  DBEdit5.ReadOnly := DsPrimario.State = DsEdit;
  DBEdit7.ReadOnly := DsPrimario.State = DsEdit;
  DBEdit8.ReadOnly := DsPrimario.State = DsEdit;
  DBEdit16.ReadOnly := DsPrimario.State = DsEdit;
  DBEdit14.ReadOnly := DsPrimario.State = DsEdit;
  DBEdit16.ReadOnly := DsPrimario.State = DsEdit;
  DBEdit18.ReadOnly := DsPrimario.State = DsEdit;
  DBEdit20.ReadOnly := DsPrimario.State = DsEdit;
  If DsPrimario.State = DsEdit Then
   Begin
     SbFilial.Enabled := False;
     SBCodContabilDeb.Enabled := False;
     SBCodContabilCred.Enabled := False;
     SBCodContabilParcDeb.Enabled := False;
     SBCodContabilParcCred.Enabled := False;
     SBHistoricoContabil.Enabled := False;
   End;
end;

procedure TFDespesaAntecipadaCad.SBCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMDespesaAntecipada.QDespesaAntecipadaCOD_CADASTRO.Value := DMCadastro.QCadastroConsCOD_CADASTRO.Value;
end;

procedure TFDespesaAntecipadaCad.SBConfirmarClick(Sender: TObject);
var
  wPlanilha: Integer;
begin
  If (DsPrimario.State = DsInsert) And
     (DMDespesaAntecipada.QDespesaAntecipadaCOD_CONTABIL_DEB.Value <> '') And
     (DMDespesaAntecipada.QDespesaAntecipadaCOD_CONTABIL_CRED.Value <> '') Then
  Begin
    if not DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.StartTransaction;
    try
      DMPlanilha.QLanctoContabilCad.Close;
      DMPlanilha.QLanctoContabilCad.Open;
      wPlanilha:=DMOracle.Sequencia('PLANILHA');
      DMPlanilha.QLanctoContabilCad.Insert;
      DMPlanilha.QLanctoContabilCadCOD_PLANILHA.Value:=wPlanilha;
      DMPlanilha.QLanctoContabilCadCOD_FILIAL.Value:=DMDespesaAntecipada.QDespesaAntecipadaCOD_FILIAL.Value;
      DMPlanilha.QLanctoContabilCadCOD_HISTORICO_CONTABIL.Value:=DMDespesaAntecipada.QDespesaAntecipadaCOD_HISTORICO_CONTABIL.Value;
      DMPlanilha.QLanctoContabilCadIND_OPERACAO.Value:='D';
      DMPlanilha.QLanctoContabilCadCOD_PLANO_CONTA.Text:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+#39+Trim(DMDespesaAntecipada.QDespesaAntecipadaCOD_CONTABIL_DEB.Value)+#39);
      DMPlanilha.QLanctoContabilCadNUM_CONTRAPARTIDA.Value:=DMDespesaAntecipada.QDespesaAntecipadaCOD_CONTABIL_CRED.Value;
      DMPlanilha.QLanctoContabilCadDESC_COMPLEMENTO.Value:=DMDespesaAntecipada.QDespesaAntecipadaDESC_COMPLEMENTO.Value;
      DMPlanilha.QLanctoContabilCadVAL_LANCAMENTO.Value:=DMDespesaAntecipada.QDespesaAntecipadaVAL_DESPESA.Value;
      DMPlanilha.QLanctoContabilCadDT_LANCAMENTO.Value:=DMDespesaAntecipada.QDespesaAntecipadaDT_LANCAMENTO.Value;
      DMPlanilha.QLanctoContabilCad.Post;
      DMPlanilha.QLanctoContabilCad.Insert;
      DMPlanilha.QLanctoContabilCadCOD_PLANILHA.Value:=wPlanilha;
      DMPlanilha.QLanctoContabilCadCOD_FILIAL.Value:=DMDespesaAntecipada.QDespesaAntecipadaCOD_FILIAL.Value;
      DMPlanilha.QLanctoContabilCadCOD_HISTORICO_CONTABIL.Value:=DMDespesaAntecipada.QDespesaAntecipadaCOD_HISTORICO_CONTABIL.Value;
      DMPlanilha.QLanctoContabilCadIND_OPERACAO.Value:='C';
      DMPlanilha.QLanctoContabilCadCOD_PLANO_CONTA.Text:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+#39+Trim(DMDespesaAntecipada.QDespesaAntecipadaCOD_CONTABIL_CRED.Value)+#39);
      DMPlanilha.QLanctoContabilCadNUM_CONTRAPARTIDA.Value:=DMDespesaAntecipada.QDespesaAntecipadaCOD_CONTABIL_DEB.Value;
      DMPlanilha.QLanctoContabilCadDESC_COMPLEMENTO.Value:=DMDespesaAntecipada.QDespesaAntecipadaDESC_COMPLEMENTO.Value;
      DMPlanilha.QLanctoContabilCadVAL_LANCAMENTO.Value:=DMDespesaAntecipada.QDespesaAntecipadaVAL_DESPESA.Value;
      DMPlanilha.QLanctoContabilCadDT_LANCAMENTO.Value:=DMDespesaAntecipada.QDespesaAntecipadaDT_LANCAMENTO.Value;
      DMPlanilha.QLanctoContabilCad.Post;
      if DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      Raise;
    end;
  End;
  inherited;
end;

procedure TFDespesaAntecipadaCad.Contabilizar1Click(Sender: TObject);
var
  wPlanilha: Integer;
  wDtLcto: String;
begin
  inherited;
  if FContabilParam = nil then
    FContabilParam := TFContabilParam.Create(Application);
  FContabilParam.PGRelatorio.Pages[8].TabVisible := True;
  if FContabilParam.ShowModal = mrOk then
  begin
  //valida período
    If (Trim(FContabilParam.CB8Mes.Text)='') or (Trim(FContabilParam.CB8Ano.Text)='') then
      Raise Exception.Create('Período Contábil deve ser Informado');
    with DMDespesaAntecipada do
    begin
      QContabilizar.Close;
      If Trim(FContabilParam.ME8Filial.Text) = '' then
        QContabilizar.SetVariable('FILIAL',NULL)
      else
        QContabilizar.SetVariable('FILIAL',Trim(FContabilParam.ME8Filial.Text));
      QContabilizar.SetVariable('MES',Trim(FContabilParam.CB8Mes.Text)+'/'+Trim(FContabilParam.CB8Ano.Text));
      QContabilizar.Open;
      If QContabilizar.RecordCount = 0 then
        Raise Exception.Create('Todas as Despesas Antecipadas do Período já estão Contabilizadas');
      wPlanilha := DMOracle.Sequencia('PLANILHA');
      wDtLcto := IntToStr(DiasMes(StrToInt(Trim(FContabilParam.CB8Mes.Text))))+'/'+Trim(FContabilParam.CB8Mes.Text)+'/'+Trim(FContabilParam.CB8Ano.Text);
      QContabilizar.First;
      Try
        DMOracle.DBCemapa.StartTransaction;
        While not QContabilizar.Eof do  //contabiliza as parcelas
        begin
          //lançamento débito
          DMPlanilha.QLanctoContabilCad.Close;
          DMPlanilha.QLanctoContabilCad.Open;
          DMPlanilha.QLanctoContabilCad.Insert;
          DMPlanilha.QLanctoContabilCadCOD_PLANILHA.Value := wPlanilha;
          DMPlanilha.QLanctoContabilCadCOD_FILIAL.Value := QContabilizarCOD_FILIAL.Value;
          DMPlanilha.QLanctoContabilCadCOD_HISTORICO_CONTABIL.Value := QContabilizarCOD_HISTORICO_CONTABIL.Value;
          DMPlanilha.QLanctoContabilCadIND_OPERACAO.Value := 'D';
          DMPlanilha.QLanctoContabilCadCOD_PLANO_CONTA.Text := DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+#39+Trim(QContabilizarCOD_CONTABIL_PARC_DEB.Value)+#39);
          DMPlanilha.QLanctoContabilCadNUM_CONTRAPARTIDA.Value := QContabilizarCOD_CONTABIL_PARC_CRED.Value;
          DMPlanilha.QLanctoContabilCadDESC_COMPLEMENTO.Value := QContabilizarDESC_COMPLEMENTO.Text;
          DMPlanilha.QLanctoContabilCadVAL_LANCAMENTO.Value := QContabilizarVAL_PARCELA.Value;
          DMPlanilha.QLanctoContabilCadDT_LANCAMENTO.Text := wDtLcto;
          DMPlanilha.QLanctoContabilCad.Post;
          DMPlanilha.QLanctoContabilCad.Insert;
          //lançamento crédito
          DMPlanilha.QLanctoContabilCadCOD_PLANILHA.Value:=wPlanilha;
          DMPlanilha.QLanctoContabilCadCOD_FILIAL.Value := QContabilizarCOD_FILIAL.Value;
          DMPlanilha.QLanctoContabilCadCOD_HISTORICO_CONTABIL.Value := QContabilizarCOD_HISTORICO_CONTABIL.Value;
          DMPlanilha.QLanctoContabilCadIND_OPERACAO.Value:='C';
          DMPlanilha.QLanctoContabilCadCOD_PLANO_CONTA.Text := DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+#39+Trim(QContabilizarCOD_CONTABIL_PARC_CRED.Value)+#39);
          DMPlanilha.QLanctoContabilCadNUM_CONTRAPARTIDA.Value := QContabilizarCOD_CONTABIL_PARC_DEB.Value;
          DMPlanilha.QLanctoContabilCadDESC_COMPLEMENTO.Value := QContabilizarDESC_COMPLEMENTO.Text;
          DMPlanilha.QLanctoContabilCadVAL_LANCAMENTO.Value := QContabilizarVAL_PARCELA.Value;
          DMPlanilha.QLanctoContabilCadDT_LANCAMENTO.Text := wDtLcto;
          DMPlanilha.QLanctoContabilCad.Post;
          //atualiza parcela
          If DMOracle.DBCemapa.InTransaction then
            DMOracle.DBCemapa.Commit;
          QDespesaAntecipParc.Close;
          QDespesaAntecipParc.SetVariable('PK',QContabilizarCOD_DESPESA_ANTECIP_PARC.Value);
          QDespesaAntecipParc.SetVariable('DESPESA',NULL);
          QDespesaAntecipParc.Open;
          QDespesaAntecipParc.Edit;
          QDespesaAntecipParcIND_CONTABILIZADO.Value := 'SIM';
          QDespesaAntecipParcDT_CONTABILIZACAO.Text := wDtLcto;
          QDespesaAntecipParcCOD_USUARIO_CONT.Value := DMUsuario.CodUsuarioCorrente;
          QDespesaAntecipParc.Post;
          QContabilizar.Next;
        end;
        DMOracle.DBCemapa.Commit;
      Except
        DMPlanilha.QLanctoContabilCad.Cancel;
        DMOracle.DBCemapa.Rollback;
      End;
      showMessage('Foram gerados '+IntToStr(QContabilizar.RecordCount)+' Lançamentos Contábeis');
    end;
  end;
end;

procedure TFDespesaAntecipadaCad.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    DMDespesaAntecipada.QDespesaAntecipadaCOD_FILIAL.Value := DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFDespesaAntecipadaCad.SBCodContabilParcDebClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMDespesaAntecipada.QDespesaAntecipadaCod_Contabil_Parc_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFDespesaAntecipadaCad.SBCodContabilParcCredClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMDespesaAntecipada.QDespesaAntecipadaCod_Contabil_Parc_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFDespesaAntecipadaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FDespesaAntecipadaCons = nil then
    FDespesaAntecipadaCons := TFDespesaAntecipadaCons.Create(Application);
  if FDespesaAntecipadaCons.ShowModal = mrOk then
  begin
    with DMDespesaAntecipada do
    begin
      QDespesaAntecipada.Close;
      QDespesaAntecipada.SetVariable('PK',QDespesaAntecipadaConsCOD_DESPESA_ANTECIPADA.Value);
      QDespesaAntecipada.Open;
    end;
  end;
end;

procedure TFDespesaAntecipadaCad.RelDespesaAntecipada1Click(
  Sender: TObject);
begin
  inherited;
  if FContabilParam = nil then
    FContabilParam := TFContabilParam.Create(Application);
  FContabilParam.PGRelatorio.Pages[9].TabVisible := True;
  if FContabilParam.ShowModal = mrOk then
  begin
  //valida período
    if Trim(FContabilParam.ME9Data_I.Text)='' then
      Raise Exception.Create('Data inicial deve ser Informada');
    if Trim(FContabilParam.ME9Data_F.Text)='' then
      FContabilParam.ME9Data_F.Text := DateToStr(Date);
    with DMDespesaAntecipada do
    begin
      QRDespesaAntecipada.Close;
      if Trim(FContabilParam.ME9Filial.Text) = '' then
        QRDespesaAntecipada.SetVariable('FILIAL',NULL)
      else
        QRDespesaAntecipada.SetVariable('FILIAL',Trim(FContabilParam.ME9Filial.Text));
      if Trim(FContabilParam.ME9Cadastro.Text) = '' then
        QRDespesaAntecipada.SetVariable('CADASTRO',NULL)
      else
        QRDespesaAntecipada.SetVariable('CADASTRO',Trim(FContabilParam.ME9Cadastro.Text));
      QRDespesaAntecipada.SetVariable('DATA_I',Trim(FContabilParam.ME9Data_I.Text));
      QRDespesaAntecipada.SetVariable('DATA_F',Trim(FContabilParam.ME9Data_F.Text));
      QRDespesaAntecipada.Open;
      if FRDespesaAntecipada = nil then
        FRDespesaAntecipada := TFRDespesaAntecipada.Create(Application);
      FRDespesaAntecipada.QRLFilial.Caption := 'Filial: '+Trim(FContabilParam.Ed9Filial.Text);
      FRDespesaAntecipada.QRLPeriodo.Caption := 'Período Emissão de '+Trim(FContabilParam.ME9Data_I.Text)+' Até '+Trim(FContabilParam.ME9Data_F.Text);
      if FContabilParam.RGPreview.ItemIndex = 0 then
        FRDespesaAntecipada.QRPrimario.Preview
      else
        FRDespesaAntecipada.QRPrimario.Print;
      QRDespesaAntecipada.Close;
    end;
  end;
end;

procedure TFDespesaAntecipadaCad.Cancelar2Click(Sender: TObject);
begin
  inherited;
  If DMDespesaAntecipada.QDespesaAntecipadaCOD_DESPESA_ANTECIPADA.Text = '' Then
     Raise exception.Create('Selecionar uma despesa para cancelar');
  if MessageDlg('Confima Cancelamento?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Begin
    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('Update TB_DESPESA_ANTECIPADA SET IND_SITUACAO = ' + Chr(39) + '2' + Chr(39) + ' Where COD_DESPESA_ANTECIPADA='+DMDespesaAntecipada.QDespesaAntecipadaCOD_DESPESA_ANTECIPADA.Text);
      QExecSQL.ExecSQL;
      DBCemapa.Commit;
      SBRefreshClick(self);
    End;
  End;

end;

procedure TFDespesaAntecipadaCad.VoltarCancelamento1Click(Sender: TObject);
begin
  inherited;
  If DMDespesaAntecipada.QDespesaAntecipadaCOD_DESPESA_ANTECIPADA.Text = '' Then
     Raise exception.Create('Selecionar uma despesa para voltar cancelamento');
  if MessageDlg('Confima Volta Cancelamento?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Begin
    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('Update TB_DESPESA_ANTECIPADA SET IND_SITUACAO = ' + Chr(39) + '1' + Chr(39) + ' Where COD_DESPESA_ANTECIPADA='+DMDespesaAntecipada.QDespesaAntecipadaCOD_DESPESA_ANTECIPADA.Text);
      QExecSQL.ExecSQL;
      DBCemapa.Commit;
      SBRefreshClick(self);
    End;
  End;

end;

procedure TFDespesaAntecipadaCad.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If (key = 40) Or (key = 9) Then  // pressionado seta para baixo ou tab (com estas teclas conseguiria inserir novo registro
     Key := 0;
end;

end.
