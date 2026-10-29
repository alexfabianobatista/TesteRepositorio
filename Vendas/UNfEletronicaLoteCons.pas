unit UNfEletronicaLoteCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, CustomDialog,
  UFmNota, UFmDatas, ExtCtrls, OraTeste, NfeCliente, ImgList, UFmFilial,
  ComCtrls, ActnList;

type
  TStringArray = Array of String;

  TNfeFoco = (nfNone, nfDanfe, nfEmail, nfConsulta, nfExportar, nfRetornoEnvio);

  TFNfEletronicaLoteCons = class(TFTConsulta, INFeClienteListener)
    DSItem: TDataSource;
    FMNota: TFmNota;
    FMDataEnvio: TFmDatas;
    RGSituacao: TRadioGroup;
    Panel1: TPanel;
    SplConsultaLoteNfe: TSplitter;
    Panel2: TPanel;
    DBGLoteNfe: TDBGrid;
    Panel3: TPanel;
    Label2: TLabel;
    DBGLoteNfeItem: TDBGrid;
    BtConsultarSefaz: TBitBtn;
    ILChecks: TImageList;
    BtDanfe: TBitBtn;
    BtEmail: TBitBtn;
    PEmail: TPanel;
    CBEmailXML: TCheckBox;
    CBEmailPDF: TCheckBox;
    BtEmailEnviar: TBitBtn;
    PMNfeLoteItem: TPopupMenu;
    CopiarchavedeacessoCHAVE1: TMenuItem;
    BtConsulta: TBitBtn;
    VerretornodaNFe1: TMenuItem;
    TFoco: TTimer;
    SalvarXMLdestaNFe1: TMenuItem;
    BtExcluir: TBitBtn;
    FmFilial: TFmFilial;
    VerretornodecancelamentodaNFe1: TMenuItem;
    BtExportar: TBitBtn;
    StatusBar1: TStatusBar;
    FMDataCriacao: TFmDatas;
    SaveDialog1: TSaveDialog;
    CbSelectAll: TCheckBox;
    procedure FMNotaEntradaBtNotaClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure DBGLoteNfeDblClick(Sender: TObject);
    procedure BtConsultarSefazClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGLoteNfeItemDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGLoteNfeItemCellClick(Column: TColumn);
    procedure BtDanfeClick(Sender: TObject);
    procedure BtEmailClick(Sender: TObject);
    procedure BtEmailEnviarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PMNfeLoteItemPopup(Sender: TObject);
    procedure CopiarchavedeacessoCHAVE1Click(Sender: TObject);
    procedure BtConsultaClick(Sender: TObject);
    procedure VerretornodaNFe1Click(Sender: TObject);
    procedure TFocoTimer(Sender: TObject);
    procedure SalvarXMLdestaNFe1Click(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure VerretornodecancelamentodaNFe1Click(Sender: TObject);
    procedure SBInverteSelecaoClick(Sender: TObject);
    procedure BtExportarClick(Sender: TObject);
    procedure CbSelectAllClick(Sender: TObject);
  private
    procedure DestacaBotaoFoco;
    procedure EstacaBotaoFoco;
  protected
    FFoco: TNfeFoco;
    FBotaoFoco: TBitBtn;
  public
    destructor Destroy; override;
    procedure EventoOcorrido(Evento: TNFeClienteEvento);
    procedure LimpaParametros;
    procedure Buscar;
    procedure CarregaNota(Codigo: Integer);
    property Foco: TNfeFoco read FFoco write FFoco default nfNone;
  end;

var
  FNfEletronicaLoteCons: TFNfEletronicaLoteCons;

const
  MSG_OPCAO_COPIA_CHAVE: String = 'Copiar &chave de acesso (%CHAVE%)';

implementation

uses UOracle_cl, UNfEletronicaLote_cl, StrUtils, UNfe_cl, UNFeRetorno, Clipbrd,
  NFeRPCRetorno, DBClient, UBiblioteca, Math, UNFeParam, UParamSistema_cl,
  UUsuario_cl;

{$R *.dfm}

procedure TFNfEletronicaLoteCons.FMNotaEntradaBtNotaClick(Sender: TObject);
begin
  inherited;
  if MessageDlgCustom('Consulta de Nota', mtConfirmation, [mbYes,mbNo],
    ['Nota de &Entrada', 'Nota de &Saída'], nil) = mrYes then
    FMNota.Tag := 0
  else
    FMNota.Tag := 1;
  FMNota.BtNotaClick(Sender);
end;

procedure TFNfEletronicaLoteCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  Buscar;
end;

procedure TFNfEletronicaLoteCons.Buscar;
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
  with DMNfEletronicaLote do
  begin
    QNfeLoteCons.Close;
    QNfeLoteCons.ClearVariables;
    InsVariavel(QNfeLoteCons, 'ID_LOTE', METexto.Text);
    InsVariavel(QNfeLoteCons, 'NOTA_CAB', FMNota.MeNota.Text);
    InsVariavel(QNfeLoteCons, 'FILIAL', FmFilial.MeFilial.Text);
    //wData := FMDataCriacao.MeDtInicial.Text;
    //InsVariavel(QNfeLoteCons, 'DT_CRIACAO_I', wData + IfThen(wData <> '', ' 00:00:00'));
    //wData := FMDataCriacao.MeDtFinal.Text;
    //InsVariavel(QNfeLoteCons, 'DT_CRIACAO_F', wData + IfThen(wData <> '', ' 23:59:59'));
    //wData := FMDataEnvio.MeDtInicial.Text;
    //InsVariavel(QNfeLoteCons, 'DT_ENVIO_I', wData + IfThen(wData <> '', ' 00:00:00'));
    //wData := FMDataEnvio.MeDtFinal.Text;
    //InsVariavel(QNfeLoteCons, 'DT_ENVIO_F', wData + IfThen(wData <> '', ' 23:59:59'));
    case RGSituacao.ItemIndex of
      0: InsVariavel(QNfeLoteCons, 'SITUACAO', IntToStr(SIT_NF_E_LOTE_CRIADO));
      1: InsVariavel(QNfeLoteCons, 'SITUACAO', IntToStr(SIT_NF_E_LOTE_ENVIADO));
    end;
    QNfeLoteCons.Open;
  end;
end;

procedure TFNfEletronicaLoteCons.DBGLoteNfeDblClick(Sender: TObject);
begin
  inherited;
  ModalResult := MrOk;
end;

procedure TFNfEletronicaLoteCons.LimpaParametros;
begin
  METexto.Text := '';
  FMNota.MeNota.Text := '';
  FMNota.MeNotaExit(Self);
  FMDataCriacao.MeDtInicial.Text := '';
  FMDataCriacao.MeDtFinal.Text := '';
  FMDataEnvio.MeDtInicial.Text := '';
  FMDataEnvio.MeDtFinal.Text := '';
  RGSituacao.ItemIndex := 2;
end;

procedure TFNfEletronicaLoteCons.EventoOcorrido(Evento: TNFeClienteEvento);
var
  IdLote: Double;
begin
  if (Evento.Funcao = fuEnviaLote) and (Evento.Evento = evRetorno) and
      (Evento.Valor > 0) then
  begin
    IdLote := Evento.Params[0];
    DMNfEletronicaLote.ConfirmaEnvioLoteNfe(IdLote);
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

destructor TFNfEletronicaLoteCons.Destroy;
begin
  TNFeCliente.RemoveListener(Self);
  inherited Destroy;
end;

procedure TFNfEletronicaLoteCons.BtConsultarSefazClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with DMNfEletronicaLote do
    if not QNfeLoteConsID_LOTE.IsNull then
    begin
      AcaoEmLote(TAcoesLote.Create.Add(alConsulta));
      i := DMNfEletronicaLote.QNfeLote.RecNo;
      Buscar;
      DMNfEletronicaLote.QNfeLote.RecNo := i;
    end;
end;

procedure TFNfEletronicaLoteCons.FormActivate(Sender: TObject);
begin
  inherited;
  if DSConsulta.DataSet = nil then
    DSConsulta.DataSet := DMNfEletronicaLote.QNfeLoteCons;
  try
    DBGLoteNfeItem.SelectedIndex := DBGLoteNfeItem.SelectedIndex + 1;
  except
  end;
  case Foco of
    nfDanfe:
    begin
      FBotaoFoco := BtDanfe;
      FBotaoFoco.SetFocus;
      TFoco.Enabled := True;
      BtDanfeClick(Sender);
    end;
    nfExportar:
    begin
      FBotaoFoco := BtExportar;
      FBotaoFoco.SetFocus;
      TFoco.Enabled := True;
      BtExportarClick(Sender);
    end;
    nfEmail:
    begin
      PEmail.Visible := True;
      FBotaoFoco := BtEmailEnviar;
      FBotaoFoco.SetFocus;
      TFoco.Enabled := True;
    end;
    nfConsulta:
    begin
      FBotaoFoco := BtConsulta;
      FBotaoFoco.SetFocus;
      TFoco.Enabled := True;
      BtConsultaClick(Sender);
    end;
    nfRetornoEnvio:
    begin
      VerretornodaNFe1Click(Sender);
    end;
  end;
end;

procedure TFNfEletronicaLoteCons.DBGLoteNfeItemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.FieldName = 'IND_SELECIONADO' then
  begin
    DBGLoteNfeItem.Canvas.FillRect(Rect);
    if DMNfEletronicaLote.CDSNfeLoteItemConsIND_SELECIONADO.Value = 'S' then
      ILChecks.Draw(DBGLoteNfeItem.Canvas, Rect.Left + 5, Rect.Top + 1, 0)
    else
      ILChecks.Draw(DBGLoteNfeItem.Canvas, Rect.Left + 5, Rect.Top + 1, 1);
  end;
end;

procedure TFNfEletronicaLoteCons.DBGLoteNfeItemCellClick(Column: TColumn);
begin
  inherited;
  with DMNfEletronicaLote do
    if (Column.FieldName = 'IND_SELECIONADO') then
    begin
      if (not CDSNfeLoteItemCons.IsEmpty) then
        InverteSelecaoItem;
      try
        DBGLoteNfeItem.SelectedIndex := DBGLoteNfeItem.SelectedIndex + 1;
      except
      end;
    end;
end;

procedure TFNfEletronicaLoteCons.BtDanfeClick(Sender: TObject);
begin
  inherited;
  with DMNfEletronicaLote do
    if CDSNfeLoteItemCons.RecordCount > 0 then
    begin
      if FNFeParam = nil then
        FNFeParam := TFNFeParam.Create(Application);
      FNFeParam.AtivaPagina(2);
      FNFeParam.ME2NumVias.Text := '1';
      if CDSNfeLoteItemConsCOD_SERIE_MODELO.Value = '65' then
        FNFeParam.ME2Impressora.Text  := DMOracle.FastSelect('DESC_IMPRESSORA_DANFE_NFCE', 'TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente)) //CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE_NFCE.Value
      else
        FNFeParam.ME2Impressora.Text  := DMOracle.FastSelect('DESC_IMPRESSORA_DANFE', 'TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente)); //CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE.Value;
      if FNFeParam.ShowModal = MrOk then
      begin
        CDSNfeLoteItemCons.First;
        while not CDSNfeLoteItemCons.Eof do
        begin
          if CDSNfeLoteItemConsIND_SELECIONADO.Value = 'S' then
          begin
            CDSNfeLoteItemCons.Edit;
            if CDSNfeLoteItemConsCOD_SERIE_MODELO.Value = '65' then
            begin
              CDSNfeLoteItemConsNUM_VIAS_DANFE_NFCE.Value := StrToInt('0' +
                  Trim(FNFeParam.ME2NumVias.Text));
              CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE_NFCE.Value :=
                  Trim(FNFeParam.ME2Impressora.Text);
            end
            else
            begin
              CDSNfeLoteItemConsNUM_VIAS_DANFE.Value := StrToInt('0' +
                  Trim(FNFeParam.ME2NumVias.Text));
              CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE.Value :=
                  Trim(FNFeParam.ME2Impressora.Text);
            end;
            CDSNfeLoteItemCons.Post;
          end;
          CDSNfeLoteItemCons.Next;
        end;
        if ((CDSNfeLoteItemConsCOD_SERIE_MODELO.Value = '55') and
            (CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE.Value = '')) or
           ((CDSNfeLoteItemConsCOD_SERIE_MODELO.Value = '65') and
            (CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE_NFCE.Value = ''))  then
          MessageDlg('Impressora não informada.'+#13+#10+
              'Por favor, informe uma impressora.',
              mtInformation, [mbOK], 0)
        else
          AcaoEmLote(TAcoesLote.Create.Add(alDanfe));
      end;
    end;
end;

procedure TFNfEletronicaLoteCons.BtEmailClick(Sender: TObject);
begin
  inherited;
  PEmail.Visible := not PEmail.Visible;
end;

procedure TFNfEletronicaLoteCons.BtEmailEnviarClick(Sender: TObject);
begin
  inherited;
  PEmail.Visible := False;
  with DMNfEletronicaLote do
    if CDSNfeLoteItemCons.RecordCount > 0 then
    begin
      CDSNfeLoteItemCons.First;
      while not CDSNfeLoteItemCons.Eof do
      begin
        CDSNfeLoteItemCons.Edit;
        CDSNfeLoteItemConsEMAIL_XML.Value := IfThen(CBEmailXML.Checked, 'S', 'N');
        CDSNfeLoteItemConsEMAIL_PDF.Value := IfThen(CBEmailPDF.Checked, 'S', 'N');
        CDSNfeLoteItemCons.Post;

        CDSNfeLoteItemCons.Next;
      end;
      AcaoEmLote(TAcoesLote.Create.Add(alEmail));
    end;
end;

procedure TFNfEletronicaLoteCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PEmail.Visible := False;
  TFoco.Enabled := False;
  if FBotaoFoco <> nil then
    EstacaBotaoFoco;
  Foco := nfNone;
end;

procedure TFNfEletronicaLoteCons.PMNfeLoteItemPopup(Sender: TObject);
  procedure ColocaChave(Chave: String);
  begin
    CopiarchavedeacessoCHAVE1.Caption := StringReplace(MSG_OPCAO_COPIA_CHAVE,
        '%CHAVE%', Chave, [rfReplaceAll]);
  end;
var
  i: Integer;
begin
  inherited;
  for i := 0 to PMNfeLoteItem.Items.Count - 1 do
    PMNfeLoteItem.Items.Items[i].Enabled := not DMNfEletronicaLote.CDSNfeLoteItemCons.IsEmpty;
  if DMNfEletronicaLote.CDSNfeLoteItemCons.IsEmpty then
    ColocaChave('')
  else
    ColocaChave(DMNfEletronicaLote.CDSNfeLoteItemConsDESC_CHAVE_ACESSO.Value);
end;

procedure TFNfEletronicaLoteCons.CopiarchavedeacessoCHAVE1Click(
  Sender: TObject);
begin
  inherited;
  Clipboard.SetTextBuf(PChar(DMNfEletronicaLote.CDSNfeLoteItemConsDESC_CHAVE_ACESSO.Value));
end;

procedure TFNfEletronicaLoteCons.BtConsultaClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with DMNfEletronicaLote do
  begin
    if CDSNfeLoteItemConsIND_NFSE.Value = 'NAO' then
      AcaoEmLote(TAcoesLote.Create.Add(alConsultaProtocolo))
    else
      if (CDSNfeLoteItemConsNUM_NFSE.Value <> '') and (CDSNfeLoteItemConsCOD_PAIS_IBGE.Value = 1058) then
        AcaoEmLote(TAcoesLote.Create.Add(alConsNFSe))
      else
        AcaoEmLote(TAcoesLote.Create.Add(alConsNfseRps));
    Buscar;
    SetSelecaoItem;
  end;
end;

procedure TFNfEletronicaLoteCons.VerretornodaNFe1Click(Sender: TObject);
var
  Ret: TNFeRPCRetorno;
begin
  inherited;
  Ret := TNFeRPCRetorno.Create;
  Ret.Status := StrToInt('0' + DMNfEletronicaLote.CDSNfeLoteItemConsDESC_RETORNO_PROCESSAMENTO.Value);
  Ret.Motivo := DMNfEletronicaLote.CDSNfeLoteItemConsDESC_MSG_VALIDACAO_LOTE.Value;
  Ret.Descricao := DMNfEletronicaLote.CDSNfeLoteItemConsDESC_MSG_VALIDACAO.Value;
  if FNFeRetorno = nil then
    FNFeRetorno := TFNFeRetorno.Create(Application);
  FNFeRetorno.Carrega(ACAO_ENVIO_NFE,Ret);
  FNFeRetorno.ShowModal;
end;

procedure TFNfEletronicaLoteCons.CarregaNota(Codigo: Integer);
begin
  LimpaParametros;
  FMNota.MeNota.Text := IntToStr(Codigo);
  Buscar;
  with DMNfEletronicaLote do
  begin
    CDSNfeLoteItemCons.First;
    while not (CDSNfeLoteItemCons.Eof or (CDSNfeLoteItemConsCOD_NOTA_CAB.Value =
        Codigo)) do
      CDSNfeLoteItemCons.Next;
    if CDSNfeLoteItemConsCOD_NOTA_CAB.Value = Codigo then
      SetSelecaoItem;
  end;
end;

procedure TFNfEletronicaLoteCons.DestacaBotaoFoco;
begin
  FBotaoFoco.Font.Style := FBotaoFoco.Font.Style + [fsBold];
  FBotaoFoco.Font.Size := 12;
  FBotaoFoco.Font.Color := clGreen;
end;

procedure TFNfEletronicaLoteCons.EstacaBotaoFoco;
begin
  FBotaoFoco.Font.Style := FBotaoFoco.Font.Style - [fsBold];
  FBotaoFoco.Font.Size := 8;
  FBotaoFoco.Font.Color := clWindowText;
end;

procedure TFNfEletronicaLoteCons.TFocoTimer(Sender: TObject);
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

procedure TFNfEletronicaLoteCons.SalvarXMLdestaNFe1Click(Sender: TObject);
begin
  inherited;
  BtExportarClick(Sender);
end;

procedure TFNfEletronicaLoteCons.BtExcluirClick(Sender: TObject);
var
  b: boolean;
  i: Integer;
begin
  inherited;
  with DMNfEletronicaLote do
    if not QNfeLoteConsID_LOTE.IsNull then
      if (MessageDlg('Tem certeza que deseja excluir esse lote do sistema?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        b := DMOracle.DBCemapa.InTransaction;
        QNfeLote.Close;
        QNfeLote.ClearVariables;
        QNfeLote.SetVariable('PK', QNfeLoteConsID_LOTE.Value);
        QNfeLote.Open;

        QNfeLote.Delete;
        if not b then //Se não está no meio de outra transação, pode efetuar commit;
          DMOracle.DBCemapa.Commit;

        i := QNfeLoteCons.RecNo;
        Buscar;
        QNfeLoteCons.RecNo := i;
      end;
end;

procedure TFNfEletronicaLoteCons.VerretornodecancelamentodaNFe1Click(
  Sender: TObject);
var
  Ret: TNFeRPCRetorno;
begin
  inherited;
  Ret := TNFeRPCRetorno.Create;
  Ret.Status := StrToInt('0' + DMNfEletronicaLote.CDSNfeLoteItemConsDESC_RETORNO_CANCELAMENTO.Value);
  Ret.Motivo := DMNfEletronicaLote.CDSNfeLoteItemConsDESC_MSG_CANCELAMENTO.Value;
  Ret.Descricao := '';
  if FNFeRetorno = nil then
    FNFeRetorno := TFNFeRetorno.Create(Application);
  FNFeRetorno.Carrega(ACAO_CANCELA, Ret);
  FNFeRetorno.ShowModal;
end;

procedure TFNfEletronicaLoteCons.SBInverteSelecaoClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with DMNfEletronicaLote do
    if not CDSNfeLoteItemCons.IsEmpty then
    begin
      i := CDSNfeLoteItemCons.RecNo;
      CDSNfeLoteItemCons.First;
      while not CDSNfeLoteItemCons.Eof do
      begin
        InverteSelecaoItem;

        CDSNfeLoteItemCons.Next;
      end;
      CDSNfeLoteItemCons.RecNo := i;
    end;
end;

procedure TFNfEletronicaLoteCons.BtExportarClick(Sender: TObject);
var
  wNome: String;

begin
  inherited;
    with DMNfEletronicaLote do
    if CDSNfeLoteItemCons.RecordCount > 0 then
    begin
        CDSNfeLoteItemCons.First;
        while not CDSNfeLoteItemCons.Eof do
        begin
          if CDSNfeLoteItemConsIND_SELECIONADO.Value = 'S' then
          begin
            if CDSNfeLoteItemConsIND_NFSE.Value = 'SIM' then
            begin
              if (DMParamSistema.CodEmpresa = 'NFCE-MINGO') or (DMParamSistema.CodEmpresa = 'MEDSYSTEM') or
                 (DMParamSistema.CodEmpresa = 'SERVITEC') or (DMParamSistema.CodEmpresa = 'RRPECAS')  or
                 (DMParamSistema.CodEmpresa = 'USIMED') or (DMParamSistema.CodEmpresa = 'CKTINTAS') or
                 (DMParamSistema.CodEmpresa = 'RSMECANICA') then
//Adicionado para ao exportar a nota de serviço para a ultramaq o nome do arquivo tenha o numero da nota e não o numero do rps
//Adicionado para a Servitec. 29/04/2022 - Alex -- Medsystem 14/04/2023 - Alex ---- Adicionado RRPECAS. Alex 18/10/2023
//Adicionado Usimed. Solicitado por Neide. 31/10/2023. Alex
//CKTintas empresa nova da Servitec. Alex 31/01/2024.
              begin
                wNome := XML_FILE_NAME_NFSE;
                wNome := StringReplace(wNome, '%FILIAL%', QNfeLoteConsCOD_FILIAL.Text,[rfReplaceAll]);
                wNome := StringReplace(wNome, '%SERIE%', CDSNfeLoteItemConsCOD_SERIE.Value, [rfReplaceAll]);
                wNome := StringReplace(wNome, '%NUMERO%', CDSNfeLoteItemConsNUM_NFSE.Text, [rfReplaceAll]);
                SaveDialog1.FileName := wNome;
              end
              else
              begin
                wNome := XML_FILE_NAME_NFSE;
                wNome := StringReplace(wNome, '%FILIAL%', QNfeLoteConsCOD_FILIAL.Text,[rfReplaceAll]);
                wNome := StringReplace(wNome, '%SERIE%', CDSNfeLoteItemConsCOD_SERIE.Value, [rfReplaceAll]);
                wNome := StringReplace(wNome, '%NUMERO%', CDSNfeLoteItemConsNUM_NOTA.Text, [rfReplaceAll]);
                SaveDialog1.FileName := wNome;
              end;
            end
            else
            begin
              wNome := XML_FILE_NAME;
              wNome := StringReplace(wNome, '%FILIAL%', QNfeLoteConsCOD_FILIAL.Text,[rfReplaceAll]);
              wNome := StringReplace(wNome, '%SERIE%', CDSNfeLoteItemConsCOD_SERIE.Value, [rfReplaceAll]);
              wNome := StringReplace(wNome, '%NUMERO%', CDSNfeLoteItemConsNUM_NOTA.Text, [rfReplaceAll]);
              SaveDialog1.FileName := wNome;
            end;
          if(SaveDialog1.Execute) then
          begin
            if(SaveDialog1.FilterIndex = 2) then
              with DMNfEletronicaLote do
                DMNfe.SalvaXML(CDSNfeLoteItemConsDESC_CHAVE_ACESSO.Value,wNome+'.xml', CDSNfeLoteItemConsDESC_XML_NFE.Value, CDSNfeLoteItemConsDESC_XML_RETORNO.Value)
            else
            begin
              CDSNfeLoteItemCons.Edit;
              if CDSNfeLoteItemConsCOD_SERIE_MODELO.Value = '65' then
                CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE_NFCE.Value :=
                  Trim(SaveDialog1.FileName+'.pdf')
              else
                CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE.Value :=
                  Trim(SaveDialog1.FileName+'.pdf');
              CDSNfeLoteItemCons.Post;
              if (CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE.Value = '') and
                 (CDSNfeLoteItemConsDESC_IMPRESSORA_DANFE_NFCE.Value = '') then
                MessageDlg('Não foi informado o local para gravar o arquivo.'+#13+#10+
                    'Por favor, informe um local.',
                    mtInformation, [mbOK], 0)
              else
                AcaoEmLote(TAcoesLote.Create.Add(alSalvaDanfePdf));
            end;
          end;
        end;
        CDSNfeLoteItemCons.Next;
      end;
    end;
end;

procedure TFNfEletronicaLoteCons.CbSelectAllClick(Sender: TObject);
begin
  inherited;
  with DMNfEletronicaLote do
  begin
      CDSNfeLoteItemCons.First;
      if (not CDSNfeLoteItemCons.IsEmpty) then
        while not CDSNfeLoteItemCons.Eof do
        begin
          if not (CDSNfeLoteItemCons.State in [DsEdit, DsInsert]) then
            CDSNfeLoteItemCons.Edit;
          if CbSelectAll.Checked then
            CDSNfeLoteItemConsIND_SELECIONADO.Value := 'S'
          else
            CDSNfeLoteItemConsIND_SELECIONADO.Value := 'N';
          if CDSNfeLoteItemCons.State in [DsEdit, DsInsert] then
            CDSNfeLoteItemCons.Post;
          try
            DBGLoteNfeItem.SelectedIndex := DBGLoteNfeItem.SelectedIndex + 1;
            CDSNfeLoteItemCons.Next;
          except
          end;
        end;
  end;
end;

initialization
begin
  RegisterClass(TFNfEletronicaLoteCons);
//  if FNfEletronicaLoteCons = nil then
//    FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
//  TNFeCliente.AddListener(FNfEletronicaLoteCons);
end;

end.

