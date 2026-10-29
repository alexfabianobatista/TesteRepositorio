unit UMdfeLoteCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, CustomDialog,
  UFmManifesto, UFmDatas, ExtCtrls, OraTeste, NfeCliente, ImgList, UFmFilial,
  ComCtrls;

type
  TStringArray = Array of String;

  TMdfeFoco = (mtNone, mtDamdfe, mtEmail, mtConsulta, mtExportar, mtRetornoEnvio);

  TFMdfeLoteCons = class(TFTConsulta, INFeClienteListener)
    DSItem: TDataSource;
    FMDataEnvio: TFmDatas;
    RGSituacao: TRadioGroup;
    Panel1: TPanel;
    SplConsultaLoteNfe: TSplitter;
    Panel2: TPanel;
    DBGLoteMDFe: TDBGrid;
    Panel3: TPanel;
    Label2: TLabel;
    DBGLoteMDFeItem: TDBGrid;
    BtConsultarSefaz: TBitBtn;
    ILChecks: TImageList;
    BtDamdfe: TBitBtn;
    BtEmail: TBitBtn;
    PEmail: TPanel;
    CBEmailXML: TCheckBox;
    CBEmailPDF: TCheckBox;
    BtEmailEnviar: TBitBtn;
    PMCteLoteItem: TPopupMenu;
    CopiarchavedeacessoCHAVE1: TMenuItem;
    BtConsulta: TBitBtn;
    VerretornoMDFe1: TMenuItem;
    TFoco: TTimer;
    SalvarXMLMDFe1: TMenuItem;
    BtExcluir: TBitBtn;
    FmFilial: TFmFilial;
    VerretornodecancelamentoMDFe1: TMenuItem;
    BtExportar: TBitBtn;
    StatusBar1: TStatusBar;
    FMDataCriacao: TFmDatas;
    SaveDialog1: TSaveDialog;
    CbSelectAll: TCheckBox;
    FmManifesto1: TFmManifesto;
    procedure BtProcurarClick(Sender: TObject);
    procedure DBGLoteMDFeDblClick(Sender: TObject);
    procedure BtConsultarSefazClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGLoteMDFeItemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGLoteMDFeItemCellClick(Column: TColumn);
    procedure BtDamdfeClick(Sender: TObject);
    procedure BtEmailClick(Sender: TObject);
    procedure BtEmailEnviarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PMCteLoteItemPopup(Sender: TObject);
    procedure CopiarchavedeacessoCHAVE1Click(Sender: TObject);
    procedure BtConsultaClick(Sender: TObject);
    procedure VerretornoMDFe1Click(Sender: TObject);
    procedure TFocoTimer(Sender: TObject);
    procedure SalvarXMLMDFe1Click(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure VerretornodecancelamentoMDFe1Click(Sender: TObject);
    procedure SBInverteSelecaoClick(Sender: TObject);
    procedure BtExportarClick(Sender: TObject);
    procedure CbSelectAllClick(Sender: TObject);
    procedure FmManifesto1BtManifestoClick(Sender: TObject);
  private
    procedure DestacaBotaoFoco;
    procedure EstacaBotaoFoco;
  protected
    FFoco: TMdfeFoco;
    FBotaoFoco: TBitBtn;
  public
    destructor Destroy; override;
    procedure EventoOcorrido(Evento: TNFeClienteEvento);
    procedure LimpaParametros;
    procedure Buscar;
    procedure CarregaManifesto(Codigo: Integer);
    property Foco: TMdfeFoco read FFoco write FFoco default mtNone;
  end;

var
  FMdfeLoteCons: TFMdfeLoteCons;

const
  MSG_OPCAO_COPIA_CHAVE: String = 'Copiar &chave de acesso (%CHAVE%)';

implementation

uses UOracle_cl, StrUtils, UNfe_cl, UNFeRetorno, Clipbrd,
  NFeRPCRetorno, DBClient, UBiblioteca, Math, UNFeParam, UMdfeLote_cl;

{$R *.dfm}

procedure TFMdfeLoteCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  Buscar;
end;

procedure TFMdfeLoteCons.Buscar;
  procedure InsVariavel(DataS: TOracleDataset1; Variavel, Valor: String);
  begin
    if Trim(Valor) <> '' then
      DataS.SetVariable(Variavel, Trim(Valor))
    else
      DataS.SetVariable(Variavel, null);
  end;
var
  wData: String;
begin
  with DMMdfeLote do
  begin
    QMdfeLoteCons.Close;
    QMdfeLoteCons.ClearVariables;
    InsVariavel(QMdfeLoteCons, 'ID_LOTE', METexto.Text);
    InsVariavel(QMdfeLoteCons, 'COD_MANIFESTO', FmManifesto1.MeManifesto.Text);
    InsVariavel(QMdfeLoteCons, 'FILIAL', FmFilial.MeFilial.Text);
    wData := FMDataCriacao.MeDtInicial.Text;
    InsVariavel(QMdfeLoteCons, 'DT_CRIACAO_I', wData + IfThen(wData <> '', ' 00:00:00'));
    wData := FMDataCriacao.MeDtFinal.Text;
    InsVariavel(QMdfeLoteCons, 'DT_CRIACAO_F', wData + IfThen(wData <> '', ' 23:59:59'));
    wData := FMDataEnvio.MeDtInicial.Text;
    InsVariavel(QMdfeLoteCons, 'DT_ENVIO_I', wData + IfThen(wData <> '', ' 00:00:00'));
    wData := FMDataEnvio.MeDtFinal.Text;
    InsVariavel(QMdfeLoteCons, 'DT_ENVIO_F', wData + IfThen(wData <> '', ' 23:59:59'));
    case RGSituacao.ItemIndex of
      0: InsVariavel(QMdfeLoteCons, 'SITUACAO', IntToStr(SIT_MDFE_LOTE_CRIADO));
      1: InsVariavel(QMdfeLoteCons, 'SITUACAO', IntToStr(SIT_MDFE_LOTE_ENVIADO));
    end;
    QMdfeLoteCons.Open;
  end;
end;

procedure TFMdfeLoteCons.DBGLoteMDFeDblClick(Sender: TObject);
begin
  inherited;
  ModalResult := MrOk;
end;

procedure TFMdfeLoteCons.LimpaParametros;
begin
  METexto.Text := '';
  FmManifesto1.MeManifesto.Text := '';
  FmManifesto1.MeManifestoExit(Self);
  FMDataCriacao.MeDtInicial.Text := '';
  FMDataCriacao.MeDtFinal.Text := '';
  FMDataEnvio.MeDtInicial.Text := '';
  FMDataEnvio.MeDtFinal.Text := '';
  RGSituacao.ItemIndex := 2;
end;

procedure TFMdfeLoteCons.EventoOcorrido(Evento: TNFeClienteEvento);
var
  IdLote: Double;
begin
  if (Evento.Funcao = fuEnviaLote) and (Evento.Evento = evRetorno) and
      (Evento.Valor > 0) then
  begin
    IdLote := Evento.Params[0];
    DMMdfeLote.ConfirmaEnvioLoteMdfe(IdLote);
    if (MessageDlg('Lote enviado, situação: ' + IntToStr(Evento.Valor) + ' - ' +
        DMNfe.getWSMessage(Evento.Valor) + '. Deseja ver o Lote?', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes) then
    begin
      LimpaParametros;
      METexto.Text := IntToStr(Trunc(IdLote));
      Buscar;
      ShowModal;
    end;
  end;
end;

destructor TFMdfeLoteCons.Destroy;
begin
  TNFeCliente.RemoveListener(Self);
  inherited Destroy;
end;

procedure TFMdfeLoteCons.BtConsultarSefazClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with DMMdfeLote do
    if not QMdfeLoteConsID_LOTE.IsNull then
    begin
      AcaoEmLote(TAcoesLoteMDFe.Create.Add(alConsultaMDFe));
      i := DMMdfeLote.QMdfeLote.RecNo;
      Buscar;
      DMMdfeLote.QMdfeLote.RecNo := i;
    end;
end;

procedure TFMdfeLoteCons.FormActivate(Sender: TObject);
begin
  inherited;
  DSConsulta.DataSet := DMMdfeLote.QMdfeLoteCons;
  DSItem.DataSet := DMMdfeLote.CDSMdfeLoteItemCons;
  try
    DBGLoteMDFeItem.SelectedIndex := DBGLoteMDFeItem.SelectedIndex + 1;
  except
  end;
  case Foco of
    mtDamdfe:
    begin
      FBotaoFoco := BtDamdfe;
      FBotaoFoco.SetFocus;
      TFoco.Enabled := True;
      BtDamdfeClick(Sender);
    end;
    mtExportar:
    begin
      FBotaoFoco := BtExportar;
      FBotaoFoco.SetFocus;
      TFoco.Enabled := True;
      BtExportarClick(Sender);
    end;
    mtEmail:
    begin
      PEmail.Visible := True;
      FBotaoFoco := BtEmailEnviar;
      FBotaoFoco.SetFocus;
      TFoco.Enabled := True;
    end;
    mtConsulta:
    begin
      FBotaoFoco := BtConsulta;
      FBotaoFoco.SetFocus;
      TFoco.Enabled := True;
      BtConsultaClick(Sender);
    end;
    mtRetornoEnvio:
    begin
      VerretornoMDFe1Click(Sender);
    end;
  end;
end;

procedure TFMdfeLoteCons.DBGLoteMDFeItemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.FieldName = 'IND_SELECIONADO' then
  begin
    DBGLoteMDFeItem.Canvas.FillRect(Rect);
    if DMMdfeLote.CDSMdfeLoteItemConsIND_SELECIONADO.Value = 'S' then
      ILChecks.Draw(DBGLoteMDFeItem.Canvas, Rect.Left + 5, Rect.Top + 1, 0)
    else
      ILChecks.Draw(DBGLoteMDFeItem.Canvas, Rect.Left + 5, Rect.Top + 1, 1);
  end;
end;

procedure TFMdfeLoteCons.DBGLoteMDFeItemCellClick(Column: TColumn);
begin
  inherited;
  with DMMdfeLote do
    if (Column.FieldName = 'IND_SELECIONADO') then
    begin
      if (not CDSMdfeLoteItemCons.IsEmpty) then
        InverteSelecaoItem;
      try
        DBGLoteMDFeItem.SelectedIndex := DBGLoteMDFeItem.SelectedIndex + 1;
      except
      end;
    end;
end;

procedure TFMdfeLoteCons.BtDamdfeClick(Sender: TObject);
begin
  inherited;
  with DMMdfeLote do
    if CDSMdfeLoteItemCons.RecordCount > 0 then
    begin
      if FNFeParam = nil then
        FNFeParam := TFNFeParam.Create(Application);
      FNFeParam.AtivaPagina(2);
      FNFeParam.ME2NumVias.Text := '1';
      FNFeParam.ME2Impressora.Text := CDSMdfeLoteItemConsDESC_IMPRESSORA_DACTE.Value;
      if FNFeParam.ShowModal = MrOk then
      begin
        CDSMdfeLoteItemCons.First;
        while not CDSMdfeLoteItemCons.Eof do
        begin
          if CDSMdfeLoteItemConsIND_SELECIONADO.Value = 'S' then
          begin
            CDSMdfeLoteItemCons.Edit;
            CDSMdfeLoteItemConsNUM_VIAS_DAMDFE.Value := StrToInt('0' +
                Trim(FNFeParam.ME2NumVias.Text));
            CDSMdfeLoteItemConsDESC_IMPRESSORA_DACTE.Value :=
                Trim(FNFeParam.ME2Impressora.Text);
            CDSMdfeLoteItemCons.Post;
          end;
          CDSMdfeLoteItemCons.Next;
        end;
        if CDSMdfeLoteItemConsDESC_IMPRESSORA_DACTE.Value = '' then
          MessageDlg('Impressora não informada.'+#13+#10+
              'Por favor, informe uma impressora.',
              mtInformation, [mbOK], 0)
        else
          AcaoEmLote(TAcoesLoteMDFe.Create.Add(alDamdfe));
      end;
    end;
end;

procedure TFMdfeLoteCons.BtEmailClick(Sender: TObject);
begin
  inherited;
  PEmail.Visible := not PEmail.Visible;
end;

procedure TFMdfeLoteCons.BtEmailEnviarClick(Sender: TObject);
begin
  inherited;
  PEmail.Visible := False;
  with DMMdfeLote do
    if CDSMdfeLoteItemCons.RecordCount > 0 then
    begin
      CDSMdfeLoteItemCons.First;
      while not CDSMdfeLoteItemCons.Eof do
      begin
        CDSMdfeLoteItemCons.Edit;
        CDSMdfeLoteItemConsEMAIL_XML.Value := IfThen(CBEmailXML.Checked, 'S', 'N');
        CDSMdfeLoteItemConsEMAIL_PDF.Value := IfThen(CBEmailPDF.Checked, 'S', 'N');
        CDSMdfeLoteItemCons.Post;

        CDSMdfeLoteItemCons.Next;
      end;
      AcaoEmLote(TAcoesLoteMDFe.Create.Add(alEmailMDFe));
    end;
end;

procedure TFMdfeLoteCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PEmail.Visible := False;
  TFoco.Enabled := False;
  if FBotaoFoco <> nil then
    EstacaBotaoFoco;
  Foco := mtNone;
end;

procedure TFMdfeLoteCons.PMCteLoteItemPopup(Sender: TObject);
  procedure ColocaChave(Chave: String);
  begin
    CopiarchavedeacessoCHAVE1.Caption := StringReplace(MSG_OPCAO_COPIA_CHAVE,
        '%CHAVE%', Chave, [rfReplaceAll]);
  end;
var
  i: Integer;
begin
  inherited;
  for i := 0 to PMCteLoteItem.Items.Count - 1 do
    PMCteLoteItem.Items.Items[i].Enabled := not DMMdfeLote.CDSMdfeLoteItemCons.IsEmpty;
  if DMMdfeLote.CDSMdfeLoteItemCons.IsEmpty then
    ColocaChave('')
  else
    ColocaChave(DMMdfeLote.CDSMdfeLoteItemConsDESC_CHAVE_ACESSO.Value);
end;

procedure TFMdfeLoteCons.CopiarchavedeacessoCHAVE1Click(
  Sender: TObject);
begin
  inherited;
  Clipboard.SetTextBuf(PChar(DMMdfeLote.CDSMdfeLoteItemConsDESC_CHAVE_ACESSO.Value));
end;

procedure TFMdfeLoteCons.BtConsultaClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with DMMdfeLote do
  begin
    AcaoEmLote(TAcoesLoteMDFe.Create.Add(alConsultaProtocoloMDFe));

    Buscar;
    SetSelecaoItem;
  end;
end;

procedure TFMdfeLoteCons.VerretornoMDFe1Click(Sender: TObject);
var
  Ret: TNFeRPCRetorno;
begin
  inherited;
  Ret := TNFeRPCRetorno.Create;
  Ret.Status := StrToInt('0' + DMMdfeLote.CDSMdfeLoteItemConsDESC_RETORNO_PROCESSAMENTO.Value);
  Ret.Motivo := DMMdfeLote.CDSMdfeLoteItemConsDESC_MSG_VALIDACAO_LOTE.Value;
  Ret.Descricao := DMMdfeLote.CDSMdfeLoteItemConsDESC_MSG_VALIDACAO.Value;
  if FNFeRetorno = nil then
    FNFeRetorno := TFNFeRetorno.Create(Application);
  FNFeRetorno.Carrega(ACAO_ENVIO_MDFE,Ret);
  FNFeRetorno.ShowModal;
end;

procedure TFMdfeLoteCons.CarregaManifesto(Codigo: Integer);
begin
  LimpaParametros;
  FmManifesto1.MeManifesto.Text := IntToStr(Codigo);
  Buscar;
  with DMMdfeLote do
  begin
    CDSMdfeLoteItemCons.First;
    while not (CDSMdfeLoteItemCons.Eof or (CDSMdfeLoteItemConsCOD_MANIFESTO.Value =
        Codigo)) do
      CDSMdfeLoteItemCons.Next;
    if CDSMdfeLoteItemConsCOD_MANIFESTO.Value = Codigo then
      SetSelecaoItem;
  end;
end;

procedure TFMdfeLoteCons.DestacaBotaoFoco;
begin
  FBotaoFoco.Font.Style := FBotaoFoco.Font.Style + [fsBold];
  FBotaoFoco.Font.Size := 12;
  FBotaoFoco.Font.Color := clGreen;
end;

procedure TFMdfeLoteCons.EstacaBotaoFoco;
begin
  FBotaoFoco.Font.Style := FBotaoFoco.Font.Style - [fsBold];
  FBotaoFoco.Font.Size := 8;
  FBotaoFoco.Font.Color := clWindowText;
end;

procedure TFMdfeLoteCons.TFocoTimer(Sender: TObject);
begin
  inherited;
  if FBotaoFoco <> nil then
  begin
    if FBotaoFoco.Tag <= 4 then
    begin
      if FBotaoFoco.Tag mod 2 = 0 then
        DestacaBotaoFoco
      else
        EstacaBotaoFoco;
      FBotaoFoco.Tag := FBotaoFoco.Tag + 1;
    end
    else
    begin
      EstacaBotaoFoco;
      FBotaoFoco.Tag := 0;
      TFoco.Enabled := False;
    end;
  end;
end;

procedure TFMdfeLoteCons.SalvarXMLMDFe1Click(Sender: TObject);
begin
  inherited;
  BtExportarClick(Sender);
end;

procedure TFMdfeLoteCons.BtExcluirClick(Sender: TObject);
var
  b: boolean;
  i: Integer;
begin
  inherited;
  with DMMdfeLote do
    if not QMdfeLoteConsID_LOTE.IsNull then
      if (MessageDlg('Tem certeza que deseja excluir esse lote do sistema?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        b := DMOracle.DBCemapa.InTransaction;
        QMdfeLote.Close;
        QMdfeLote.ClearVariables;
        QMdfeLote.SetVariable('PK', QMdfeLoteConsID_LOTE.Value);
        QMdfeLote.Open;

        QMdfeLote.Delete;
        if not b then //Se não está no meio de outra transação, pode efetuar commit;
          DMOracle.DBCemapa.Commit;

        i := QMdfeLoteCons.RecNo;
        Buscar;
        QMdfeLoteCons.RecNo := i;
      end;
end;

procedure TFMdfeLoteCons.VerretornodecancelamentoMDFe1Click(
  Sender: TObject);
var
  Ret: TNFeRPCRetorno;
begin
  inherited;
  Ret := TNFeRPCRetorno.Create;
  Ret.Status := StrToInt('0' + DMMdfeLote.CDSMdfeLoteItemConsDESC_RETORNO_CANCELAMENTO.Value);
  Ret.Motivo := DMMdfeLote.CDSMdfeLoteItemConsDESC_MSG_CANCELAMENTO.Value;
  Ret.Descricao := '';
  if FNFeRetorno = nil then
    FNFeRetorno := TFNFeRetorno.Create(Application);
  FNFeRetorno.Carrega(ACAO_CANCELA, Ret);
  FNFeRetorno.ShowModal;
end;

procedure TFMdfeLoteCons.SBInverteSelecaoClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with DMMdfeLote do
    if not CDSMdfeLoteItemCons.IsEmpty then
    begin
      i := CDSMdfeLoteItemCons.RecNo;
      CDSMdfeLoteItemCons.First;
      while not CDSMdfeLoteItemCons.Eof do
      begin
        InverteSelecaoItem;

        CDSMdfeLoteItemCons.Next;
      end;
      CDSMdfeLoteItemCons.RecNo := i;
    end;
end;

procedure TFMdfeLoteCons.BtExportarClick(Sender: TObject);
var
  wNome: String;
begin
  inherited;
    with DMMdfeLote do
    if CDSMdfeLoteItemCons.RecordCount > 0 then
    begin
        CDSMdfeLoteItemCons.First;
        while not CDSMdfeLoteItemCons.Eof do
        begin
          if CDSMdfeLoteItemConsIND_SELECIONADO.Value = 'S' then
          begin
            wNome := XML_FILE_NAME_MDFE;
            wNome := StringReplace(wNome, '%FILIAL%', QMdfeLoteConsCOD_FILIAL.Text,[rfReplaceAll]);
            wNome := StringReplace(wNome, '%SERIE%', CDSMdfeLoteItemConsCOD_SERIE.Value, [rfReplaceAll]);
            wNome := StringReplace(wNome, '%NUMERO%', CDSMdfeLoteItemConsNUM_MANIFESTO.Text, [rfReplaceAll]);
            SaveDialog1.FileName := wNome;
          if(SaveDialog1.Execute) then
          begin
            if(SaveDialog1.FilterIndex = 2) then
              with DMMdfeLote do
                DMNfe.SalvaXMLMDFe(CDSMdfeLoteItemConsDESC_CHAVE_ACESSO.Value,wNome+'.xml', CDSMdfeLoteItemConsDESC_XML_MDFE.Value, CDSMdfeLoteItemConsDESC_XML_RETORNO.Value)
            else
            begin
              CDSMdfeLoteItemCons.Edit;
              CDSMdfeLoteItemConsDESC_IMPRESSORA_DACTE.Value :=
                  Trim(SaveDialog1.FileName+'.pdf');
              CDSMdfeLoteItemCons.Post;
              if CDSMdfeLoteItemConsDESC_IMPRESSORA_DACTE.Value = '' then
                MessageDlg('Não foi informado o local para gravar o arquivo.'+#13+#10+
                    'Por favor, informe um local.',
                    mtInformation, [mbOK], 0)
              else
                AcaoEmLote(TAcoesLoteMDFe.Create.Add(alSalvaDamdfePdf));
            end;
          end;
        end;
        CDSMdfeLoteItemCons.Next;
      end;
    end;
end;

procedure TFMdfeLoteCons.CbSelectAllClick(Sender: TObject);
begin
  inherited;
  with DMMdfeLote do
  begin
      CDSMdfeLoteItemCons.First;
      if (not CDSMdfeLoteItemCons.IsEmpty) then
        while not CDSMdfeLoteItemCons.Eof do
        begin
          if not (CDSMdfeLoteItemCons.State in [DsEdit, DsInsert]) then
            CDSMdfeLoteItemCons.Edit;
          if CbSelectAll.Checked then
            CDSMdfeLoteItemConsIND_SELECIONADO.Value := 'S'
          else
            CDSMdfeLoteItemConsIND_SELECIONADO.Value := 'N';
          if CDSMdfeLoteItemCons.State in [DsEdit, DsInsert] then
            CDSMdfeLoteItemCons.Post;
          try
            DBGLoteMDFeItem.SelectedIndex := DBGLoteMDFeItem.SelectedIndex + 1;
            CDSMdfeLoteItemCons.Next;
          except
          end;
        end;
  end;
end;

procedure TFMdfeLoteCons.FmManifesto1BtManifestoClick(
  Sender: TObject);
begin
  inherited;
  FmManifesto1.BtManifestoClick(Sender);
end;

initialization
begin
  RegisterClass(TFMdfeLoteCons);
//  if FNfEletronicaLoteCons = nil then
//    FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
//  TNFeCliente.AddListener(FNfEletronicaLoteCons);
end;

end.

