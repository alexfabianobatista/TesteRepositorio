unit UMalaDiretaCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBPanel, DBCtrls, UBiblioteca, Grids, DBGrids;

type
  TFMalaDiretaCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    DBPanel1: TDBPanel;
    DBPDescricao: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBTStatus: TDBText;
    GroupBox2: TGroupBox;
    DBPanel2: TDBPanel;
    GroupBox3: TGroupBox;
    DBPanel8: TDBPanel;
    DBGDestinos: TDBGrid;
    DBGSmtps: TDBGrid;
    DsDestino: TDataSource;
    DsSMTP: TDataSource;
    Operaes1: TMenuItem;
    Pausarprocessodeenvio1: TMenuItem;
    Retormarprocessodeenvio1: TMenuItem;
    Reenviartodoscomfalhas1: TMenuItem;
    Reenviartodos1: TMenuItem;
    BtnAdicionarDestino: TBitBtn;
    BtnExcluirDestino: TBitBtn;
    BtnExcluirSmtp: TBitBtn;
    BtnAdicionarSmtp: TBitBtn;
    PopupMenu1: TPopupMenu;
    Verficarmensagemdeerro1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtExcluirDestinoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure AtualizaStatus(Status : string);
    procedure Pausarprocessodeenvio1Click(Sender: TObject);
    procedure Retormarprocessodeenvio1Click(Sender: TObject);
    procedure Reenviartodoscomfalhas1Click(Sender: TObject);
    procedure Reenviartodos1Click(Sender: TObject);
    procedure BtnExcluirDestinoClick(Sender: TObject);
    procedure BtnExcluirSmtpClick(Sender: TObject);
    procedure BtnAdicionarDestinoClick(Sender: TObject);
    procedure BtnAdicionarSmtpClick(Sender: TObject);
    procedure Verficarmensagemdeerro1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMalaDiretaCad: TFMalaDiretaCad;

implementation

uses UMalaDireta_cl, UTela_cl, UMalaDiretaCons, UOracle_cl,
  UMensagemEletronicaCons, UCadastroMalaDireta, UCadastroParam,
  UCadastro_Rel_cl, USMTPCons;

{$R *.dfm}

procedure TFMalaDiretaCad.FormActivate(Sender: TObject);
begin
  inherited;                
  DMMalaDireta.QMalaDireta.Open;
  DMTela.VerificaTela('CADASTRO', Self.Caption, Self.Name);

end;

procedure TFMalaDiretaCad.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;

  Bib.addControleCharCase(DBPDescricao, Self.Name);
end;

procedure TFMalaDiretaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DMMalaDireta.QMalaDiretaDESC_STATUS.Value = 'NA FILA' then
    DBTStatus.Font.Color := clBlack
  else if DMMalaDireta.QMalaDiretaDESC_STATUS.Value = 'ENVIANDO' then
    DBTStatus.Font.Color := clBlue
  else if DMMalaDireta.QMalaDiretaDESC_STATUS.Value = 'OK' then
    DBTStatus.Font.Color := clGreen
  else if DMMalaDireta.QMalaDiretaDESC_STATUS.Value = 'PAUSADO' then
    DBTStatus.Font.Color := clRed
  else
    DBTStatus.Font.Color := clWindowText;

  Pausarprocessodeenvio1.Enabled := DMMalaDireta.QMalaDiretaDESC_STATUS.Value = 'ENVIANDO';
  Retormarprocessodeenvio1.Enabled := DMMalaDireta.QMalaDiretaDESC_STATUS.Value = 'PAUSADO';
  Reenviartodoscomfalhas1.Enabled := DMMalaDireta.QMalaDiretaDESC_STATUS.Value = 'OK';
  Reenviartodos1.Enabled := DMMalaDireta.QMalaDiretaDESC_STATUS.Value = 'OK';

  DBGDestinos.ReadOnly := not (DSPrimario.State in [dsEdit, dsInsert]);
  BtnAdicionarDestino.Enabled := DSPrimario.State in [dsEdit, dsInsert];
  BtnAdicionarSmtp.Enabled := DSPrimario.State in [dsEdit, dsInsert];
  BtnExcluirDestino.Enabled := DSPrimario.State in [dsEdit, dsInsert];
  BtnExcluirSmtp.Enabled := DSPrimario.State in [dsEdit, dsInsert];
end;

procedure TFMalaDiretaCad.BtExcluirDestinoClick(Sender: TObject);
begin
  inherited;
  DMMalaDireta.QMalaDiretaDestino.Delete;
end;

procedure TFMalaDiretaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FMalaDiretaCons = nil then
    FMalaDiretaCons := TFMalaDiretaCons.Create(Application);
  if FMalaDiretaCons.ShowModal = MrOk then
  begin
    MeLocaliza.Text := DMMalaDireta.QMalaDiretaConsCOD_MALA_DIRETA_CAB.Text;
    MELocalizaExit(Sender);
  end;
end;

procedure TFMalaDiretaCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  try
    DMOracle.DBCemapa.Commit;
  except
    on E: Exception do
    begin
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TFMalaDiretaCad.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMensagemEletronicaCons;
  Classe := TFMensagemEletronicaCons;
end;

procedure TFMalaDiretaCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  if FCadastraMalaDireta <> nil then
    FCadastraMalaDireta.Destroy;
  FCadastraMalaDireta := TFCadastraMalaDireta.Create(Application);
  if FCadastraMalaDireta.ShowModal = MrOk then
  begin
    SBAlterarClick(Sender);
  end;
end;

procedure TFMalaDiretaCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DBTStatus.Caption := '';
end;

procedure TFMalaDiretaCad.AtualizaStatus(Status : string);
begin
  if Dialogs.MessageDlg('Realmente deseja atualizar o status de envio?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMOracle.ExecutaSql(
      'UPDATE TB_MALA_DIRETA_CAB' +
      ' SET DESC_STATUS = ' + QuotedStr(Status) +
      ' WHERE COD_MALA_DIRETA_CAB = ' + QuotedStr(DMMalaDireta.QMalaDiretaCOD_MALA_DIRETA_CAB.Text));
      DMMalaDireta.QMalaDireta.Refresh;
      DSPrimarioStateChange(nil);
  end;
end;

procedure TFMalaDiretaCad.Pausarprocessodeenvio1Click(Sender: TObject);
begin
  inherited;
  AtualizaStatus('PAUSADO');
end;

procedure TFMalaDiretaCad.Retormarprocessodeenvio1Click(Sender: TObject);
begin
  inherited;
  AtualizaStatus('NA FILA');
end;

procedure TFMalaDiretaCad.Reenviartodoscomfalhas1Click(Sender: TObject);
begin
  inherited;
  if Dialogs.MessageDlg('Você irá reenviar todos e-mails que tiveram falhas!',
    mtWarning, [mbOK, mbCancel], 0) = mrOK then
  begin
    DMOracle.ExecutaSql(
      'UPDATE TB_MALA_DIRETA_DESTINO' +
      ' SET IND_ENVIO = ' + QuotedStr('N') +
      ' WHERE COD_MALA_DIRETA_CAB = ' + QuotedStr(DMMalaDireta.QMalaDiretaCOD_MALA_DIRETA_CAB.Text) +
      ' AND IND_ENVIO = ' + QuotedStr('E')); 

    DMOracle.ExecutaSql(
      'UPDATE TB_MALA_DIRETA_CAB' +
      ' SET DESC_STATUS = ' + QuotedStr('NA FILA') +
      ' WHERE COD_MALA_DIRETA_CAB = ' + QuotedStr(DMMalaDireta.QMalaDiretaCOD_MALA_DIRETA_CAB.Text));
      DMMalaDireta.QMalaDireta.Refresh;
      DSPrimarioStateChange(nil);
  end;
end;

procedure TFMalaDiretaCad.Reenviartodos1Click(Sender: TObject);
begin
  inherited;
  if Dialogs.MessageDlg('Você irá reenviar todos e-mails!',
    mtWarning, [mbOK, mbCancel], 0) = mrOK then
  begin
    DMOracle.ExecutaSql(
      'UPDATE TB_MALA_DIRETA_DESTINO' +
      ' SET IND_ENVIO = ' + QuotedStr('N') +
      ' WHERE COD_MALA_DIRETA_CAB = ' + QuotedStr(DMMalaDireta.QMalaDiretaCOD_MALA_DIRETA_CAB.Text)); 

    DMOracle.ExecutaSql(
      'UPDATE TB_MALA_DIRETA_CAB' +
      ' SET DESC_STATUS = ' + QuotedStr('NA FILA') +
      ' WHERE COD_MALA_DIRETA_CAB = ' + QuotedStr(DMMalaDireta.QMalaDiretaCOD_MALA_DIRETA_CAB.Text));
      DMMalaDireta.QMalaDireta.Refresh;
      DSPrimarioStateChange(nil);
  end;
end;

procedure TFMalaDiretaCad.BtnExcluirDestinoClick(Sender: TObject);
begin
  inherited;
  if not DMMalaDireta.QMalaDiretaDestino.Eof then
    DMMalaDireta.QMalaDiretaDestino.Delete;
end;

procedure TFMalaDiretaCad.BtnExcluirSmtpClick(Sender: TObject);
begin
  inherited;
  if not DMMalaDireta.QMalaDiretaSMTP.Eof then
    DMMalaDireta.QMalaDiretaSMTP.Delete;
end;

procedure TFMalaDiretaCad.BtnAdicionarDestinoClick(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[26].TabVisible := True;

  if FCadastroParam.ShowModal = mrOk then
  begin
    with DMCadastro_Rel do
    begin
      QRDestinosMalaDireta.Close;
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_CADASTRO', Trim(FCadastroParam.Fm26Cadastro.MeCadastro.Text));
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_ESTADO', Trim(FCadastroParam.Fm26Estado.MeEstado.Text));
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_CLASS_CADASTRO', Trim(FCadastroParam.Fm26Classificacao.MeClassificacao.Text));
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_REGIAO', Trim(FCadastroParam.Fm26Regiao.MeRegiao.Text));
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_RAMO', Trim(FCadastroParam.Fm26Ramo.MeRamo.Text));
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_TIPO_CADASTRO', Trim(FCadastroParam.Fm26TipoCadastro.MeTipoCadastro.Text));
      Bib.setVariableOuNull(QRDestinosMalaDireta, 'COD_VENDEDOR', Trim(FCadastroParam.Fm26Vendedor.MeVendedor.Text));
      if FCadastroParam.CB26ConsideraData.Checked then
      begin
        QRDestinosMalaDireta.SetVariable('DT_NASC_INICIO', DateToStr(FCadastroParam.DTP26NascInicio.DateTime));
        QRDestinosMalaDireta.SetVariable('DT_NASC_FIM', DateToStr(FCadastroParam.DTP26NascFinal.DateTime));
      end
      else
      begin
        QRDestinosMalaDireta.SetVariable('DT_NASC_INICIO', Null);
        QRDestinosMalaDireta.SetVariable('DT_NASC_FIM', Null);
      end;
      QRDestinosMalaDireta.Open;
      QRDestinosMalaDireta.First;

      while not QRDestinosMalaDireta.Eof do
      begin
        with DMMalaDireta do
        begin
          if Trim(QRDestinosMalaDiretaDESC_E_MAIL.Text) <> '' then
          begin
            QMalaDiretaDestino.Insert;
            QMalaDiretaDestinoCOD_MALA_DIRETA_CAB.Value := QMalaDiretaCOD_MALA_DIRETA_CAB.Value;
            QMalaDiretaDestinoDESC_EMAIL_DESTINO.Value := QRDestinosMalaDiretaDESC_E_MAIL.Text;
            QMalaDiretaDestinoDESC_NOME_DESTINO.Value := Bib.TitleCase(LowerCase(QRDestinosMalaDiretaNOME.Text));
            QMalaDiretaDestinoIND_ENVIO.Value := 'N';
            QMalaDiretaDestino.Post;
          end;
          QRDestinosMalaDireta.Next;
        end;
      end;

    end;
  end;
end;

procedure TFMalaDiretaCad.BtnAdicionarSmtpClick(Sender: TObject);
begin
  inherited;
  if FSMTPCons = nil then
    FSMTPCons := TFSMTPCons.Create(Application);

  FSMTPCons.BtProcurarClick(Sender);
  if FSMTPCons.ShowModal = mrOk then
  begin
    with DMMalaDireta do
    begin
      if QSMTPConsQT_HORAS.Value < 1 then
        raise Exception.Create('O servidor SMTP deve ter ao menos 1 hora de intervalo de envio.');

      if QSMTPConsQT_EMAIL.Value < 1 then
        raise Exception.Create('O servidor SMTP deve ter ao menos 1 e-mail de intervalo de envio.');

      QMalaDiretaSMTP.Insert;
      QMalaDiretaSMTPCOD_SMTP.Value := QSMTPConsCOD_SMTP.Value;
      QMalaDiretaSMTPCOD_MALA_DIRETA_CAB.Value := QMalaDiretaCOD_MALA_DIRETA_CAB.Value;
      QMalaDiretaSMTP.Post;
    end;
  end;
end;

procedure TFMalaDiretaCad.Verficarmensagemdeerro1Click(Sender: TObject);
begin
  inherited;
  with DMMalaDireta do
    if not QMalaDiretaDestino.Eof then
      if QMalaDiretaDestinoDESC_ERRO_ENVIO.Value <> '' then
        ShowMessage(QMalaDiretaDestinoDESC_ERRO_ENVIO.Value)
      else
        ShowMessage('Nenhum erro encontrado');
end;

end.
