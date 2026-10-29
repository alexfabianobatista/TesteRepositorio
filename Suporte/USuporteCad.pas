unit USuporteCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel, uOracle_cl, DBCtrls, ActnList, ImgList,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFSuporteCad = class(TFTCadSimples)
    DBPDataAbertura: TDBPanel;
    Label1: TLabel;
    DBECodSuporte: TDBEdit;
    SBFechaSuporte: TSpeedButton;
    DBSituacao: TDBText;
    DBPCadastro: TDBPanel;
    DBPUsuario: TDBPanel;
    DBPDataFechamento: TDBPanel;
    DBPTela: TDBPanel;
    DBPModulo: TDBPanel;
    DBPanel4: TDBPanel;
    DBMProblema: TDBMemo;
    DBCBTipoSuporte: TDBComboBox;
    DBMSolucao: TDBMemo;
    DBMObs: TDBMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBRPrioridade: TDBRadioGroup;
    Operaes1: TMenuItem;
    Reabrir1: TMenuItem;
    Cancelar2: TMenuItem;
    DBPFuncao: TDBPanel;
    DBRAtualizacaoEnviada: TDBRadioGroup;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBPCadastroDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBRefreshClick(Sender: TObject);
    procedure DBPUsuarioDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPFuncaoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPTelaDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPModuloDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBFechaSuporteClick(Sender: TObject);
    procedure Reabrir1Click(Sender: TObject);
    procedure Cancelar2Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure DBPFuncaoCodigoChange(Sender: TObject);
    procedure DBECodSuporteChange(Sender: TObject);
    procedure DBPTelaBuscaClick(Sender: TObject);
    procedure DBPFuncaoBuscaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBCBTipoSuporteChange(Sender: TObject);
    procedure sbEnviarSMSClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSuporteCad: TFSuporteCad;

implementation

uses UCadastroCons, Math, UUsuario_cl, USuporte_cl, UUsuarioCons,
  UFuncaoCons, USuporteCons, UTelaCons, UModuloCons, DateUtils, UFuncao_cl,
  UTela_cl, UBiblioteca, IdHTTPHeaderInfo;

{$R *.dfm}

procedure TFSuporteCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DMSuporte.QSuporteIND_SITUACAO do
    if Value = 'ABERTO' then
      DBSituacao.Font.Color := clRed
    else if Value = 'RESOLVIDO' then
      DBSituacao.Font.Color := clGreen
    else
      DBSituacao.Font.Color := clBlue;
end;

procedure TFSuporteCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  MMCadSimples.Items[1].Enabled := DSPrimario.DataSet.State = dsBrowse;
  MMCadSimples.Items[2].Enabled := DSPrimario.DataSet.State = dsBrowse;
  SBFechaSuporte.Enabled := DSPrimario.DataSet.State = dsBrowse;
end;

procedure TFSuporteCad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFSuporteCad.DBPCadastroDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFSuporteCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMSuporte.QSuporte.Open;

  if dmsuporte.QSuporteIND_SITUACAO.Text = 'RESOLVIDO' then
    DBRAtualizacaoEnviada.Enabled := true
  else
    DBRAtualizacaoEnviada.Enabled := false;
end;

procedure TFSuporteCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMSuporte.QSuporte.Close;
  DMOracle.DBCemapa.Rollback;
end;

procedure TFSuporteCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FSuporteCons = nil then
    FSuporteCons := TFSuporteCons.Create(Application);
  with DMSuporte do
  begin
    if FSuporteCons.ShowModal = mrOk then
      if QSuporteConsCOD_SUPORTE.Text <> '' then
      begin
        QSuporte.Close;
        QSuporte.ClearVariables;
        QSuporte.SetVariable('PK', QSuporteConsCOD_SUPORTE.Value);
        QSuporte.Open;
      end;
  end;
  if dmsuporte.QSuporteDT_FECHAMENTO.Text <> '' then
    DBRAtualizacaoEnviada.Enabled := true;
end;

procedure TFSuporteCad.SBRefreshClick(Sender: TObject);
begin
  DMSuporte.QSuporte.SetVariable('PK', DMSuporte.QSuporteCOD_SUPORTE.Value);
  inherited;
end;

procedure TFSuporteCad.DBPUsuarioDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FUsuarioCons;
  Classe := TFUsuarioCons;
end;

procedure TFSuporteCad.DBPFuncaoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFuncaoCons;
  Classe := TFFuncaoCons;
end;

procedure TFSuporteCad.DBPTelaDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTelaCons;
  Classe := TFTelaCons;
end;

procedure TFSuporteCad.DBPModuloDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FModuloCons;
  Classe := TFModuloCons;
end;

procedure TFSuporteCad.SBFechaSuporteClick(Sender: TObject);
begin
  inherited;
  with DMSuporte do
  begin
    if not QSuporte.Eof then
    begin
    if ((QSuporteIND_SITUACAO.Value <> 'RESOLVIDO E ENVIADO') and (QSuporteIND_SITUACAO.Value <> 'RESOLVIDO')) then
    begin
      SBRefreshClick(Self);
      QSuporte.Edit;
      if QSuporteDT_FECHAMENTO.IsNull then
        QSuporteDT_FECHAMENTO.Value := Date;
      QSuporteIND_SITUACAO.Value := 'RESOLVIDO';
        DBRAtualizacaoEnviada.Enabled := true;
        SBFechaSuporte.Enabled := false;
      QSuporte.Post;
      SBRefreshClick(Self);
    end
    else
    ShowMessage('Suporte já esta Resolvido');
    end;
  end;
end;

procedure TFSuporteCad.Reabrir1Click(Sender: TObject);
begin
  inherited;
  with DMSuporte do
  begin
    if not QSuporte.Eof then
    begin
      QSuporte.Edit;
      QSuporteIND_SITUACAO.Value := 'ABERTO';
      QSuporteIND_ATUALI_ENVIADA.Value := 'NAO';
      QSuporteDT_HR_ENVIO.Text := '';
      QSuporteDT_FECHAMENTO.text := '';
      SBFechaSuporte.Enabled := true;
      DBRAtualizacaoEnviada.Enabled := false;
      QSuporte.Post;
      SBRefreshClick(Self);
    end;
  end;
end;

procedure TFSuporteCad.Cancelar2Click(Sender: TObject);
begin
  inherited;
  with DMSuporte do
  begin
    if not QSuporte.Eof then
    begin
      if QSuporteIND_SITUACAO.Value <> 'ABERTO' then
        raise Exception.Create('Só é possível desistir de um caso aberto.');
      QSuporte.Edit;
      QSuporteIND_SITUACAO.Value := 'NÃO RESOLVIDO';
      QSuporte.Post;
      SBRefreshClick(Self);
    end;
  end;
end;

procedure TFSuporteCad.SBAlterarClick(Sender: TObject);
begin
  //with DMSuporte do
  //if not QSuporte.Eof then
    //if QSuporteCOD_ANALISTA_SUPORTE.Value <> DMUsuario.CodUsuarioCorrente then
    // raise Exception.Create('Só o próprio analista pode alterar suportes atrelados a ele.');
  inherited;

end;

procedure TFSuporteCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);

  FCadastroCons.Caption := 'Selecione o Cliente';
  (DBPCadastro.Components[3] as TSpeedButton).Click;

  DMSuporte.QSuporteNOME_CONTATO.Value := InputBox('Nome Contato','Informe o nome do contato', '');
  DMFuncao.QModuloCons.Close;
  DMFuncao.QModuloCons.Open;
  if FModuloCons = nil then
    FModuloCons := TFModuloCons.Create(Application);

  FModuloCons.Caption := 'Selecione o Módulo';
  (DBPModulo.Components[3] as TSpeedButton).Click;

  if FTelaCons = nil then
    FTelaCons := TFTelaCons.Create(Application);

  FTelaCons.Caption := 'Selecione a Tela';
  (DBPTela.Components[3] as TSpeedButton).Click;

  if FFuncaoCons = nil then
    FFuncaoCons := TFFuncaoCons.Create(Application);    

  FFuncaoCons.Caption := 'Selecione a Função';
  (DBPFuncao.Components[3] as TSpeedButton).Click;  
end;

procedure TFSuporteCad.DBPFuncaoCodigoChange(Sender: TObject);
begin
  inherited;
  DMSuporte.QSuporteNOME_TELA.Value := '';
  DMSuporte.QSuporteNOME_MODULO.Value := '';
  if DBPFuncao.DBEdit.Text <> ''  then
  begin
    if not DMFuncao.QFuncaoCons.Eof then
    begin
      DMSuporte.QSuporteNOME_TELA.Value := DMFuncao.QFuncaoConsNOME_TELA.Value;
      DMSuporte.QSuporteNOME_MODULO.Value := DMFuncao.QFuncaoConsNOME_MODULO.Value;
    end
    else
    begin
      DMSuporte.QSuporteNOME_TELA.Value :=
        DMOracle.FastSelect('NOME_TELA','TB_FUNCAO','COD_FUNCAO = ' +
          DBPFuncao.DBEdit.Text);
      DMSuporte.QSuporteNOME_MODULO.Value :=
        DMOracle.FastSelect('NOME_MODULO','TB_MODULO','COD_MODULO = 0' +
          DMOracle.FastSelect('COD_MODULO','TB_TELAS','NOME_TELA = ' +
          QuotedStr(DMSuporte.QSuporteNOME_TELA.Value)));
    end;
  end;
end;

procedure TFSuporteCad.DBECodSuporteChange(Sender: TObject);
begin
  inherited;
  MMCadSimples.Items[2].Items[0].Enabled := DMSuporte.QSuporteIND_SITUACAO.Value <> 'ABERTO';
  MMCadSimples.Items[2].Items[1].Enabled := DMSuporte.QSuporteIND_SITUACAO.Value = 'ABERTO';
  SBFechaSuporte.Enabled := DMSuporte.QSuporteIND_SITUACAO.Value = 'ABERTO';
end;

procedure TFSuporteCad.DBPTelaBuscaClick(Sender: TObject);
var wCodModulo: String;
begin
  DMTela.QTelaCons.ClearVariables;
  if DBPModulo.DBEdit.Text <> '' then
  begin
    wCodModulo := DMOracle.FastSelect('COD_MODULO','TB_MODULO','NOME_MODULO = ' +
      QuotedStr(DBPModulo.DBEdit.Text));
    DMTela.QTelaCons.SetVariable('MODULO', wCodModulo);
  end;
  DMTela.QTelaCons.Close;
  DMTela.QTelaCons.Open;
  inherited;
end;

procedure TFSuporteCad.DBPFuncaoBuscaClick(Sender: TObject);
begin
  FFuncaoCons.METela.Text := DBPTela.DBEdit.Text;
  FFuncaoCons.BtProcurarClick(Self);
  DBCBTipoSuporte.SetFocus;
  inherited;
end;

procedure TFSuporteCad.FormCreate(Sender: TObject);
begin
  inherited;
  TEdit(DBMProblema).CharCase := ecUpperCase;
  TEdit(DBMSolucao).CharCase := ecUpperCase;
  TEdit(DBMObs).CharCase := ecUpperCase;
end;

procedure TFSuporteCad.DBCBTipoSuporteChange(Sender: TObject);
begin
  inherited;
  DBMProblema.SetFocus;
end;

procedure TFSuporteCad.sbEnviarSMSClick(Sender: TObject);
var
  mensagem, nomeFantasia, razaoSocial: String;
begin
  nomeFantasia := dmoracle.FastSelect('DESC_FANTASIA','TB_CADASTRO',
      'COD_CADASTRO = ' + DMSuporte.QSuporteCOD_CADASTRO.Text);
  razaoSocial := dmoracle.FastSelect('NOME','TB_CADASTRO',
      'COD_CADASTRO = ' + DMSuporte.QSuporteCOD_CADASTRO.Text);
  if DBECodSuporte.Text <> '' then
  begin
    if messageDlg('Deseja realmente enviar o SMS?', mtConfirmation, [mbyes, mbno], 0) <> mryes then
      Abort;
    mensagem := 'Sup.: ' +
      Bib.ift(nomeFantasia = '',razaoSocial,nomeFantasia)
       + '. Problema: '+
      DMSuporte.QSuporteDESC_PROBLEMA.Value;

    MessageDlg(Bib.EnviaSMSApiWeb(0,mensagem,'45988016557'), mtInformation, [mbOK], 0);
  end;
end;

procedure TFSuporteCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  if DMSuporte.QSuporteIND_PRIORIDADE.Value = 4 then
    sbEnviarSMSClick(Self);

  if (DMSuporte.QSuporteIND_ATUALI_ENVIADA.Text = 'SIM') AND (DMSuporte.QSuporteDT_FECHAMENTO.Text <> '') then
  begin
    dmsuporte.QSuporte.Edit;
    DMSuporte.QSuporteDT_HR_ENVIO.Value := DMORACLE.DataHoraServ;
    DMSUPORTE.QSuporteIND_SITUACAO.Text := 'RESOLVIDO E ENVIADO';
    dmsuporte.QSuporte.Post;
    DBRAtualizacaoEnviada.Enabled := false;
  end;
  if (DMSuporte.QSuporteIND_ATUALI_ENVIADA.Text = 'NAO') then
  begin
    dmsuporte.QSuporte.Edit;
    DMSuporte.QSuporteDT_HR_ENVIO.text := '';
    if dmsuporte.QSuporteDT_FECHAMENTO.Text <> '' then
      DMSUPORTE.QSuporteIND_SITUACAO.Text := 'RESOLVIDO'
    else
      DMSUPORTE.QSuporteIND_SITUACAO.Text := 'ABERTO';
    dmsuporte.QSuporte.post;
  end;
end;

end.
