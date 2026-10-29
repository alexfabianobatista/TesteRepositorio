unit UCteLoteCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, CustomDialog,
  UFmConhecimento, UFmDatas, ExtCtrls, OraTeste, NfeCliente, ImgList, UFmFilial,
  ComCtrls;

type
  TStringArray = Array of String;

  TCteFoco = (ctNone, ctDacte, ctEmail, ctConsulta, ctExportar, ctRetornoEnvio);

  TFCteLoteCons = class(TFTConsulta, INFeClienteListener)
    DSItem: TDataSource;
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
    PMCteLoteItem: TPopupMenu;
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
    FmConhecimento1: TFmConhecimento;
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
    procedure PMCteLoteItemPopup(Sender: TObject);
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
    procedure FmConhecimento1BtConhecimentoClick(Sender: TObject);
  private
    procedure DestacaBotaoFoco;
    procedure EstacaBotaoFoco;
  protected
    FFoco: TCteFoco;
    FBotaoFoco: TBitBtn;
  public
    destructor Destroy; override;
    procedure EventoOcorrido(Evento: TNFeClienteEvento);
    procedure LimpaParametros;
    procedure Buscar;
    procedure CarregaConhecimento(Codigo: Integer);
    property Foco: TCteFoco read FFoco write FFoco default ctNone;
  end;

var
  FCteLoteCons: TFCteLoteCons;

const
  MSG_OPCAO_COPIA_CHAVE: String = 'Copiar &chave de acesso (%CHAVE%)';

implementation

uses UOracle_cl, StrUtils, UNfe_cl, UNFeRetorno, Clipbrd,
  NFeRPCRetorno, DBClient, UBiblioteca, Math, UNFeParam, UCteLote_cl;

{$R *.dfm}

procedure TFCteLoteCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  Buscar;
end;

procedure TFCteLoteCons.Buscar;
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
  with DMCteLote do
  begin
    QCteLoteCons.Close;
    QCteLoteCons.ClearVariables;
    InsVariavel(QCteLoteCons, 'ID_LOTE', METexto.Text);
    InsVariavel(QCteLoteCons, 'COD_CONHECIMENTO', FmConhecimento1.MeConhecimento.Text);
    InsVariavel(QCteLoteCons, 'FILIAL', FmFilial.MeFilial.Text);
    //wData := FMDataCriacao.MeDtInicial.Text;
    //InsVariavel(QCteLoteCons, 'DT_CRIACAO_I', wData + IfThen(wData <> '', ' 00:00:00'));
    //wData := FMDataCriacao.MeDtFinal.Text;
    //InsVariavel(QCteLoteCons, 'DT_CRIACAO_F', wData + IfThen(wData <> '', ' 23:59:59'));
    //wData := FMDataEnvio.MeDtInicial.Text;
    //InsVariavel(QCteLoteCons, 'DT_ENVIO_I', wData + IfThen(wData <> '', ' 00:00:00'));
    //wData := FMDataEnvio.MeDtFinal.Text;
    //InsVariavel(QCteLoteCons, 'DT_ENVIO_F', wData + IfThen(wData <> '', ' 23:59:59'));
    case RGSituacao.ItemIndex of
      0: InsVariavel(QCteLoteCons, 'SITUACAO', IntToStr(SIT_CTE_LOTE_CRIADO));
      1: InsVariavel(QCteLoteCons, 'SITUACAO', IntToStr(SIT_CTE_LOTE_ENVIADO));
    end;
    QCteLoteCons.Open;
  end;
end;

procedure TFCteLoteCons.DBGLoteNfeDblClick(Sender: TObject);
begin
  inherited;
  ModalResult := MrOk;
end;

procedure TFCteLoteCons.LimpaParametros;
begin
  METexto.Text := '';
  FmConhecimento1.MeConhecimento.Text := '';
  FmConhecimento1.MeConhecimentoExit(Self);
  FMDataCriacao.MeDtInicial.Text := '';
  FMDataCriacao.MeDtFinal.Text := '';
  FMDataEnvio.MeDtInicial.Text := '';
  FMDataEnvio.MeDtFinal.Text := '';
  RGSituacao.ItemIndex := 2;
end;

procedure TFCteLoteCons.EventoOcorrido(Evento: TNFeClienteEvento);
var
  IdLote: Double;
begin
  if (Evento.Funcao = fuEnviaLote) and (Evento.Evento = evRetorno) and
      (Evento.Valor > 0) then
  begin
    IdLote := Evento.Params[0];
    DMCteLote.ConfirmaEnvioLoteCte(IdLote);
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

destructor TFCteLoteCons.Destroy;
begin
  TNFeCliente.RemoveListener(Self);
  inherited Destroy;
end;

procedure TFCteLoteCons.BtConsultarSefazClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with DMCteLote do
    if not QCteLoteConsID_LOTE.IsNull then
    begin
      AcaoEmLote(TAcoesLoteCTe.Create.Add(alConsultaCTe));
      i := DMCteLote.QCteLote.RecNo;
      Buscar;
      DMCteLote.QCteLote.RecNo := i;
    end;
end;

procedure TFCteLoteCons.FormActivate(Sender: TObject);
begin
  inherited;
  DSConsulta.DataSet := DMCteLote.QCteLoteCons;
  DSItem.DataSet := DMCteLote.CDSCteLoteItemCons;
  try
    DBGLoteNfeItem.SelectedIndex := DBGLoteNfeItem.SelectedIndex + 1;
  except
  end;
  case Foco of
    ctDacte:
    begin
      FBotaoFoco := BtDanfe;
      FBotaoFoco.SetFocus;
      TFoco.Enabled := True;
      BtDanfeClick(Sender);
    end;
    ctExportar:
    begin
      FBotaoFoco := BtExportar;
      FBotaoFoco.SetFocus;
      TFoco.Enabled := True;
      BtExportarClick(Sender);
    end;
    ctEmail:
    begin
      PEmail.Visible := True;
      FBotaoFoco := BtEmailEnviar;
      FBotaoFoco.SetFocus;
      TFoco.Enabled := True;
    end;
    ctConsulta:
    begin
      FBotaoFoco := BtConsulta;
      FBotaoFoco.SetFocus;
      TFoco.Enabled := True;
      BtConsultaClick(Sender);
    end;
    ctRetornoEnvio:
    begin
      VerretornodaNFe1Click(Sender);
    end;
  end;
end;

procedure TFCteLoteCons.DBGLoteNfeItemDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.FieldName = 'IND_SELECIONADO' then
  begin
    DBGLoteNfeItem.Canvas.FillRect(Rect);
    if DMCteLote.CDSCteLoteItemConsIND_SELECIONADO.Value = 'S' then
      ILChecks.Draw(DBGLoteNfeItem.Canvas, Rect.Left + 5, Rect.Top + 1, 0)
    else
      ILChecks.Draw(DBGLoteNfeItem.Canvas, Rect.Left + 5, Rect.Top + 1, 1);
  end;
end;

procedure TFCteLoteCons.DBGLoteNfeItemCellClick(Column: TColumn);
begin
  inherited;
  with DMCteLote do
    if (Column.FieldName = 'IND_SELECIONADO') then
    begin
      if (not CDSCteLoteItemCons.IsEmpty) then
        InverteSelecaoItem;
      try
        DBGLoteNfeItem.SelectedIndex := DBGLoteNfeItem.SelectedIndex + 1;
      except
      end;
    end;
end;

procedure TFCteLoteCons.BtDanfeClick(Sender: TObject);
begin
  inherited;
  with DMCteLote do
    if CDSCteLoteItemCons.RecordCount > 0 then
    begin
      if FNFeParam = nil then
        FNFeParam := TFNFeParam.Create(Application);
      FNFeParam.AtivaPagina(13);
      FNFeParam.ME13NumVias.Text := '1';
      FNFeParam.ME13Impressora.Text := CDSCteLoteItemConsDESC_IMPRESSORA_DACTE.Value;
      if FNFeParam.ShowModal = MrOk then
      begin
        CDSCteLoteItemCons.First;
        while not CDSCteLoteItemCons.Eof do
        begin
          if CDSCteLoteItemConsIND_SELECIONADO.Value = 'S' then
          begin
            CDSCteLoteItemCons.Edit;
            CDSCteLoteItemConsNUM_VIAS_DACTE.Value := StrToInt('0' +
                Trim(FNFeParam.ME13NumVias.Text));
            CDSCteLoteItemConsDESC_IMPRESSORA_DACTE.Value :=
                Trim(FNFeParam.ME13Impressora.Text);
            CDSCteLoteItemCons.Post;
          end;
          CDSCteLoteItemCons.Next;
        end;
        if CDSCteLoteItemConsDESC_IMPRESSORA_DACTE.Value = '' then
          MessageDlg('Impressora não informada.'+#13+#10+
              'Por favor, informe uma impressora.',
              mtInformation, [mbOK], 0)
        else
          AcaoEmLote(TAcoesLoteCTe.Create.Add(alDacte));
      end;
    end;
end;

procedure TFCteLoteCons.BtEmailClick(Sender: TObject);
begin
  inherited;
  PEmail.Visible := not PEmail.Visible;
end;

procedure TFCteLoteCons.BtEmailEnviarClick(Sender: TObject);
begin
  inherited;
  PEmail.Visible := False;
  with DMCteLote do
    if CDSCteLoteItemCons.RecordCount > 0 then
    begin
      CDSCteLoteItemCons.First;
      while not CDSCteLoteItemCons.Eof do
      begin
        CDSCteLoteItemCons.Edit;
        CDSCteLoteItemConsEMAIL_XML.Value := IfThen(CBEmailXML.Checked, 'S', 'N');
        CDSCteLoteItemConsEMAIL_PDF.Value := IfThen(CBEmailPDF.Checked, 'S', 'N');
        CDSCteLoteItemCons.Post;

        CDSCteLoteItemCons.Next;
      end;
      AcaoEmLote(TAcoesLoteCTe.Create.Add(alEmailAvulsoCTe));
    end;
end;

procedure TFCteLoteCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PEmail.Visible := False;
  TFoco.Enabled := False;
  if FBotaoFoco <> nil then
    EstacaBotaoFoco;
  Foco := ctNone;
end;

procedure TFCteLoteCons.PMCteLoteItemPopup(Sender: TObject);
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
    PMCteLoteItem.Items.Items[i].Enabled := not DMCteLote.CDSCteLoteItemCons.IsEmpty;
  if DMCteLote.CDSCteLoteItemCons.IsEmpty then
    ColocaChave('')
  else
    ColocaChave(DMCteLote.CDSCteLoteItemConsDESC_CHAVE_ACESSO.Value);
end;

procedure TFCteLoteCons.CopiarchavedeacessoCHAVE1Click(
  Sender: TObject);
begin
  inherited;
  Clipboard.SetTextBuf(PChar(DMCteLote.CDSCteLoteItemConsDESC_CHAVE_ACESSO.Value));
end;

procedure TFCteLoteCons.BtConsultaClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with DMCteLote do
  begin
    AcaoEmLote(TAcoesLoteCTe.Create.Add(alConsultaProtocoloCTe));

    Buscar;
    SetSelecaoItem;
  end;
end;

procedure TFCteLoteCons.VerretornodaNFe1Click(Sender: TObject);
var
  Ret: TNFeRPCRetorno;
begin
  inherited;
  Ret := TNFeRPCRetorno.Create;
  Ret.Status := StrToInt('0' + DMCteLote.CDSCteLoteItemConsDESC_RETORNO_PROCESSAMENTO.Value);
  Ret.Motivo := DMCteLote.CDSCteLoteItemConsDESC_MSG_VALIDACAO_LOTE.Value;
  Ret.Descricao := DMCteLote.CDSCteLoteItemConsDESC_MSG_VALIDACAO.Value;
  if FNFeRetorno = nil then
    FNFeRetorno := TFNFeRetorno.Create(Application);
  FNFeRetorno.Carrega(ACAO_ENVIO_NFE,Ret);
  FNFeRetorno.ShowModal;
end;

procedure TFCteLoteCons.CarregaConhecimento(Codigo: Integer);
begin
  LimpaParametros;
  FmConhecimento1.MeConhecimento.Text := IntToStr(Codigo);
  Buscar;
  with DMCteLote do
  begin
    CDSCteLoteItemCons.First;
    while not (CDSCteLoteItemCons.Eof or (CDSCteLoteItemConsCOD_CONHECIMENTO.Value =
        Codigo)) do
      CDSCteLoteItemCons.Next;
    if CDSCteLoteItemConsCOD_CONHECIMENTO.Value = Codigo then
      SetSelecaoItem;
  end;
end;

procedure TFCteLoteCons.DestacaBotaoFoco;
begin
  FBotaoFoco.Font.Style := FBotaoFoco.Font.Style + [fsBold];
  FBotaoFoco.Font.Size := 12;
  FBotaoFoco.Font.Color := clGreen;
end;

procedure TFCteLoteCons.EstacaBotaoFoco;
begin
  FBotaoFoco.Font.Style := FBotaoFoco.Font.Style - [fsBold];
  FBotaoFoco.Font.Size := 8;
  FBotaoFoco.Font.Color := clWindowText;
end;

procedure TFCteLoteCons.TFocoTimer(Sender: TObject);
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

procedure TFCteLoteCons.SalvarXMLdestaNFe1Click(Sender: TObject);
begin
  inherited;
  BtExportarClick(Sender);
end;

procedure TFCteLoteCons.BtExcluirClick(Sender: TObject);
var
  b: boolean;
  i: Integer;
begin
  inherited;
  with DMCteLote do
    if not QCteLoteConsID_LOTE.IsNull then
      if (MessageDlg('Tem certeza que deseja excluir esse lote do sistema?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        b := DMOracle.DBCemapa.InTransaction;
        QCteLote.Close;
        QCteLote.ClearVariables;
        QCteLote.SetVariable('PK', QCteLoteConsID_LOTE.Value);
        QCteLote.Open;

        QCteLote.Delete;
        if not b then //Se não está no meio de outra transação, pode efetuar commit;
          DMOracle.DBCemapa.Commit;

        i := QCteLoteCons.RecNo;
        Buscar;
        QCteLoteCons.RecNo := i;
      end;
end;

procedure TFCteLoteCons.VerretornodecancelamentodaNFe1Click(
  Sender: TObject);
var
  Ret: TNFeRPCRetorno;
begin
  inherited;
  Ret := TNFeRPCRetorno.Create;
  Ret.Status := StrToInt('0' + DMCteLote.CDSCteLoteItemConsDESC_RETORNO_CANCELAMENTO.Value);
  Ret.Motivo := DMCteLote.CDSCteLoteItemConsDESC_MSG_CANCELAMENTO.Value;
  Ret.Descricao := '';
  if FNFeRetorno = nil then
    FNFeRetorno := TFNFeRetorno.Create(Application);
  FNFeRetorno.Carrega(ACAO_CANCELA, Ret);
  FNFeRetorno.ShowModal;
end;

procedure TFCteLoteCons.SBInverteSelecaoClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with DMCteLote do
    if not CDSCteLoteItemCons.IsEmpty then
    begin
      i := CDSCteLoteItemCons.RecNo;
      CDSCteLoteItemCons.First;
      while not CDSCteLoteItemCons.Eof do
      begin
        InverteSelecaoItem;

        CDSCteLoteItemCons.Next;
      end;
      CDSCteLoteItemCons.RecNo := i;
    end;
end;

procedure TFCteLoteCons.BtExportarClick(Sender: TObject);
var
  wNome: String;
begin
  inherited;
    with DMCteLote do
    if CDSCteLoteItemCons.RecordCount > 0 then
    begin
        CDSCteLoteItemCons.First;
        while not CDSCteLoteItemCons.Eof do
        begin
          if CDSCteLoteItemConsIND_SELECIONADO.Value = 'S' then
          begin
            wNome := XML_FILE_NAME_CTE;
            wNome := StringReplace(wNome, '%FILIAL%', QCteLoteConsCOD_FILIAL.Text,[rfReplaceAll]);
            wNome := StringReplace(wNome, '%SERIE%', CDSCteLoteItemConsCOD_SERIE.Value, [rfReplaceAll]);
            wNome := StringReplace(wNome, '%NUMERO%', CDSCteLoteItemConsNUM_CONHECIMENTO.Text, [rfReplaceAll]);
            SaveDialog1.FileName := wNome;
          if(SaveDialog1.Execute) then
          begin
            if(SaveDialog1.FilterIndex = 2) then
              with DMCteLote do
                DMNfe.SalvaXMLCTe(wNome+'.xml', CDSCteLoteItemConsDESC_XML_CTE.Value, CDSCteLoteItemConsDESC_XML_RETORNO.Value)
            else
            begin
              CDSCteLoteItemCons.Edit;
              CDSCteLoteItemConsDESC_IMPRESSORA_DACTE.Value :=
                  Trim(SaveDialog1.FileName+'.pdf');
              CDSCteLoteItemCons.Post;
              if CDSCteLoteItemConsDESC_IMPRESSORA_DACTE.Value = '' then
                MessageDlg('Não foi informado o local para gravar o arquivo.'+#13+#10+
                    'Por favor, informe um local.',
                    mtInformation, [mbOK], 0)
              else
                AcaoEmLote(TAcoesLoteCTe.Create.Add(alSalvaDactePdf));
            end;
          end;
        end;
        CDSCteLoteItemCons.Next;
      end;
    end;
end;

procedure TFCteLoteCons.CbSelectAllClick(Sender: TObject);
begin
  inherited;
  with DMCteLote do
  begin
      CDSCteLoteItemCons.First;
      if (not CDSCteLoteItemCons.IsEmpty) then
        while not CDSCteLoteItemCons.Eof do
        begin
          if not (CDSCteLoteItemCons.State in [DsEdit, DsInsert]) then
            CDSCteLoteItemCons.Edit;
          if CbSelectAll.Checked then
            CDSCteLoteItemConsIND_SELECIONADO.Value := 'S'
          else
            CDSCteLoteItemConsIND_SELECIONADO.Value := 'N';
          if CDSCteLoteItemCons.State in [DsEdit, DsInsert] then
            CDSCteLoteItemCons.Post;
          try
            DBGLoteNfeItem.SelectedIndex := DBGLoteNfeItem.SelectedIndex + 1;
            CDSCteLoteItemCons.Next;
          except
          end;
        end;
  end;
end;

procedure TFCteLoteCons.FmConhecimento1BtConhecimentoClick(
  Sender: TObject);
begin
  inherited;
  FmConhecimento1.BtConhecimentoClick(Sender);
end;

initialization
begin
  RegisterClass(TFCteLoteCons);
//  if FNfEletronicaLoteCons = nil then
//    FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
//  TNFeCliente.AddListener(FNfEletronicaLoteCons);
end;

end.

