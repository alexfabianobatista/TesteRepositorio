unit UNfeCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  Spin, ExtCtrls, Clipbrd, DBCtrls, OraTeste, UFmFilial;

type
  TNfeConsThread = class(TThread)
  private
    FTela: TFTConsulta;
  protected
    procedure Execute; override;
  public
    constructor Create(Tela: TFTConsulta);
  end;

  TFNfeCons = class(TFTConsulta)
    SEDelay: TSpinEdit;
    BtNfeConsulta: TBitBtn;
    CBDtMin: TCheckBox;
    LLastRefresh: TLabel;
    RGTipoNota: TRadioGroup;
    SEDtMin: TSpinEdit;
    BtRemoveNfe: TBitBtn;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    BtCopiaMsg: TBitBtn;
    BtInutilizacaoCons: TBitBtn;
    BtReenvio: TBitBtn;
    BtXML: TBitBtn;
    CBAtualiza: TCheckBox;
    FmFilial: TFmFilial;
    BtStatusCons: TBitBtn;
    PMNfe: TPopupMenu;
    CopiarchavedeacessoCHAVE1: TMenuItem;
    VerretornodaNFe1: TMenuItem;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure SEDtMinChange(Sender: TObject);
    procedure RGTipoNotaClick(Sender: TObject);
    procedure BtNfeConsultaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BtRemoveNfeClick(Sender: TObject);
    procedure BtCopiaMsgClick(Sender: TObject);
    procedure BtInutilizacaoConsClick(Sender: TObject);
    procedure BtReenvioClick(Sender: TObject);
    procedure BtXMLClick(Sender: TObject);
    procedure CBDtMinClick(Sender: TObject);
    procedure FmFilialMeFilialChange(Sender: TObject);
    procedure CBAtualizaClick(Sender: TObject);
    procedure BtStatusConsClick(Sender: TObject);
    procedure PMNfePopup(Sender: TObject);
    procedure CopiarchavedeacessoCHAVE1Click(Sender: TObject);
    procedure VerretornodaNFe1Click(Sender: TObject);
  private
    FRefreshing: Boolean;
    FAutoAtualizar: Boolean;
    function getAutoAtualizar: Boolean;
    function getDataSet: TDataSet;
    procedure AddParams(DataSet: TOracleDataSet1);
    procedure CallThread;
    procedure Refresh;
    property AutoAtualizar: Boolean read getAutoAtualizar;
    property DataSet: TDataSet read getDataSet;
    function getValue(se: TSpinEdit): Integer;
    procedure AbreTelaLogin;
  public
    property Refreshing: Boolean read FRefreshing;
  end;

var
  FNfeCons: TFNfeCons;
  Logado: Boolean;

const
  MSG_OPCAO_COPIA_CHAVE: String = 'Copiar &chave de acesso (%CHAVE%)';

implementation

uses UNfe_cl, UBiblioteca, ULogin, UOracle_cl, UParamSistema_cl,
  UInutilizacaoCons, UStatusNfeCons, UUsuario_cl, UNFeRetorno, NFeRPCRetorno;

{$R *.dfm}

procedure TFNfeCons.AddParams(DataSet: TOracleDataSet1);
var
  dt: TDateTime;
  hr, min: Integer;
  MinSit, MaxSit: String;
begin
  //Seta variaveis do DataSet
  DataSet.ClearVariables;
  if CBDtMin.Checked then
  begin
    hr := StrToInt(FormatDateTime('hh',Now));
    min := StrToInt(FormatDateTime('nn',Now));
    min := min + (hr*60) - getValue(SEDtMin);
    hr := Trunc(min/60);
    min := min - (hr*60);
    dt := StrToDateTime(FormatDateTime('dd/MM/yyyy', Now) + ' ' +
        IntToStr(hr) + ':' + IntToStr(min));
    DataSet.SetVariable('DT_MIN', dt)
  end;
  MinSit := '';
  MaxSit := '';
  case RGTipoNota.ItemIndex of
    0:
    begin
      MinSit := '100';
      MaxSit := '100';
    end;
    1:
    begin
      MinSit := '201';
      MaxSit := '999';
    end;
    2:
    begin
      MinSit := '101';
      MaxSit := '101';
    end;
  end;
  if MinSit <> '' then
    DataSet.SetVariable('MIN_SITUACAO', MinSit);
  if MaxSit <> '' then
    DataSet.SetVariable('MAX_SITUACAO', MaxSit);
  if Trim(FmFilial.MeFilial.Text) <> '' then
    DataSet.SetVariable('FILIAL', FmFilial.MeFilial.Text);
end;

(**
 * Procedure que atualiza os dados da Grid.
 * Não usar ShowMessages aqui dentro, geralmente dá erro
 * porque essa procedure é chamada por uma Thread.
 *)
procedure TFNfeCons.Refresh;
var
  i: Integer;
  ODataSet, NDataSet: TOracleDataSet1;
  OField, NField: TField;
begin
  if FRefreshing then Exit;
  FRefreshing := True;
  Try
    LLastRefresh.Caption := 'Última Atualização: Atualizando...';

    ODataSet := TOracleDataSet1(DSConsulta.DataSet);
    if not Assigned(ODataSet) then
      ODataSet := DMNfe.QNfeCons;
    NDataSet := TOracleDataSet1.Create(Application);
    NDataSet.Session := ODataSet.Session;
    NDataSet.SQL.Text := ODataSet.SQL.Text;
    NDataSet.Variables := ODataSet.Variables;
    NDataSet.OnCalcFields := ODataSet.OnCalcFields;
    AddParams(NDataSet);
    for i := 0 to ODataSet.Fields.Count - 1 do
    begin
      OField := ODataSet.Fields.Fields[i];
      if OField is TStringField then
        NField := TStringField.Create(Application)
      else if OField is TIntegerField then
        NField := TIntegerField.Create(Application)
      else if OField is TBooleanField then
        NField := TBooleanField.Create(Application)
      else if OField is TDateTimeField then
        NField := TDateTimeField.Create(Application)
      else if OField is TMemoField then
        NField := TMemoField.Create(Application)
      else if OField is TFloatField then
        NField := TFloatField.Create(Application)
      else
        NField := nil;
      if NField = nil then
        Continue; //Nenhum tipo de Field conhecido, entao pula pro proximo
      NField.FieldName := OField.FieldName;
      NField.DataSet := NDataSet;
      NField.Calculated := OField.Calculated;
      NField.Size := OField.Size;
    end;

    NDataSet.OpenNoWait;
    NDataSet.RecNo := NDataSet.RecordCount;
    if ODataSet.RecNo < NDataSet.RecordCount then
      NDataSet.RecNo := ODataSet.RecNo;
    DSConsulta.DataSet := NDataSet;

    ODataSet.Close;
    if ODataSet <> DMNfe.QNfeCons then
      ODataSet.Free;

    LLastRefresh.Caption := 'Última Atualização: ' + FormatDateTime('hh:nn:ss', Now);
    FRefreshing := False;
  except
    on e: Exception do
    begin
      FRefreshing := False;
      try
        LLastRefresh.Caption := 'Erro na última atualização.';
        LLastRefresh.Hint := e.Message;
      except
      end;
//    Raise;
    end;
  end;
end;

procedure TFNfeCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  Refresh;
end;

procedure TFNfeCons.AbreTelaLogin;
begin
  If FLogin = Nil then
    FLogin := TFLogin.Create(Application);
  If FLogin.ShowModal = mrOk then
    Logado := True
  else
    Application.Terminate;
end;

procedure TFNfeCons.FormCreate(Sender: TObject);
begin
  Logado := False;
  inherited;
  If Date <> DMOracle.DataServ then
  Begin
    ShowMessage('A Data desta Máquina está diferente do Servidor!');
    Close;
  End;
  Application.OnException := DMOracle.TrataErro;
  If FLogin = Nil then
  FLogin := TFLogin.Create(Application);
  if ((ParamStr(1) <> '') and (ParamStr(2) <> '') and (ParamStr(3) <> '') and (ParamStr(4) <> '')) then
  begin
    if ParamStr(1) = '/login' then
    begin
      FLogin.SBBase.Down := ParamStr(4) = 'ORA';
      if ParamStr(4) = 'ORA' then
        FLogin.SBBase.Caption := 'Produção'
      else
        FLogin.SBBase.Caption := 'Teste';
      DMOracle.DBCemapa.Connected := False;
      DMOracle.DBCemapa.LogonDataBase := ParamStr(4);
      DMOracle.DBCemapa.Connected := True;
      try
        DMUsuario.ValidaSenha(StrToInt(ParamStr(2)), UpperCase(ParamStr(3)));
      except
        AbreTelaLogin;
      end;
    end
    else
      AbreTelaLogin;
  end
  else
    AbreTelaLogin;
//  If FLogin.ShowModal = mrOk then
//    Logado := True
//  Else
//    Application.Terminate;
  FRefreshing := False;
  FAutoAtualizar := CBAtualiza.Checked;
  DMParamSistema.QParamSistema.Open;
  SEDelay.Value := 5;
  DBGrid1.DoubleBuffered := True;
  CallThread;
end;

procedure TFNfeCons.BtOkClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFNfeCons.SEDtMinChange(Sender: TObject);
begin
  inherited;
  if CBDtMin.Checked then
    Refresh;
end;

function TFNfeCons.getValue(se: TSpinEdit): Integer;
begin
  if se.Text = '' then
  begin
    Result := se.MinValue;
    Exit;
  end;
  if se.Value > se.MaxValue then
    se.Value := se.MaxValue;
  Result := se.Value;
end;

procedure TFNfeCons.RGTipoNotaClick(Sender: TObject);
begin
  inherited;
  Refresh;
end;

procedure TFNfeCons.BtNfeConsultaClick(Sender: TObject);
begin
  inherited;
  FAutoAtualizar := False;
  with DMNfe do
    //ConsultaNfe(DataSet.FieldByName('DESC_CHAVE_ACESSO').Value);
  FAutoAtualizar := True;
end;

procedure TFNfeCons.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FAutoAtualizar := False;
  Visible := False;
  while FRefreshing do //Apenas aguardando o fim da execução da Thread
    Application.ProcessMessages;
end;

procedure TFNfeCons.DBGrid1DblClick(Sender: TObject);
begin
//  inherited;
end;

procedure TFNfeCons.DBGrid1TitleClick(Column: TColumn);
begin
//  inherited;
end;

procedure TFNfeCons.BtRemoveNfeClick(Sender: TObject);
begin
  inherited;
  FAutoAtualizar := False;
  if (MessageDlg('Tem certeza?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    DMOracle.ExecutaSql('DELETE FROM TB_NF_ELETRONICA_CONS WHERE ' +
        'DESC_CHAVE_ACESSO = ' + QuotedStr(DataSet.FieldByName('DESC_CHAVE_ACESSO').Value));
    Refresh;
  end;
  FAutoAtualizar := True;
end;

procedure TFNfeCons.BtCopiaMsgClick(Sender: TObject);
begin
  inherited;
  Clipboard.SetTextBuf(PChar(DataSet.FieldByName('desc_validacao').Text));
end;

procedure TFNfeCons.BtInutilizacaoConsClick(Sender: TObject);
begin
  inherited;
  BtInutilizacaoCons.Enabled := False;
  try
    while FRefreshing do
      Application.ProcessMessages;
    FAutoAtualizar := False;
    if FInutilizacaoCons = nil then
      FInutilizacaoCons := TFInutilizacaoCons.Create(Application);
    FInutilizacaoCons.Consultar;
    FInutilizacaoCons.ShowModal;
    FAutoAtualizar := True;
    BtInutilizacaoCons.Enabled := True;
  except
    BtInutilizacaoCons.Enabled := True;
  end;
end;

procedure TFNfeCons.BtReenvioClick(Sender: TObject);
begin
  inherited;
  if (not DataSet.FieldByName('DESC_CHAVE_ACESSO').IsNull) and
      (StrToInt('0' + DataSet.FieldByName('SIT_NFE').Value) = 1001) then
    DMOracle.ExecutaSql('UDPATE TB_NF_ELETRONICA SET NUM_CONT = 0 ' +
        'WHERE DESC_CHAVE_ACESSO = ' + QuotedStr(DataSet.FieldByName('DESC_CHAVE_ACESSO').Value));
end;

procedure TFNfeCons.BtXMLClick(Sender: TObject);
var
//  XML: TStrings;
  wNome: String;
  wDataSet: TDataSet;
begin
  inherited;
  wDataSet := DataSet;
  if (not wDataSet.FieldByName('DESC_CHAVE_ACESSO').IsNull) then
  begin
    FAutoAtualizar := False;
    wNome := XML_FILE_NAME;
    wNome := StringReplace(wNome, '%FILIAL%', wDataSet.FieldByName('COD_FILIAL').Text, [rfReplaceAll]);
    wNome := StringReplace(wNome, '%SERIE%', Trim(wDataSet.FieldByName('DESC_SERIE').Value), [rfReplaceAll]);
    wNome := StringReplace(wNome, '%NUMERO%', wDataSet.FieldByName('NUM_NF_ELETRONICA').Text, [rfReplaceAll]);
//    SDXML.FileName := wNome;
//    if (SDXML.Execute) then
//    begin
//      XML := TStringList.Create;
//      XML.Add(DMOracle.FastSelect('DESC_XML_NFE', 'TB_NF_ELETRONICA',
//          'DESC_CHAVE_ACESSO = ' + QuotedStr(wDataSet.FieldByName('DESC_CHAVE_ACESSO').Value)));
//      XML.SaveToFile(SDXML.FileName);
//    end;
    //DMNfe.SalvaXML(wDataSet.FieldByName('DESC_CHAVE_ACESSO').Value,
        //wDataSet.FieldByName('COD_FILIAL').Text,
        //Trim(wDataSet.FieldByName('DESC_SERIE').Value),
        //wDataSet.FieldByName('NUM_NF_ELETRONICA').Text
        //wNome);
    FAutoAtualizar := True;
  end;
end;

procedure TFNfeCons.CallThread;
var
  FThread: TNfeConsThread;
begin
  FThread := TNfeConsThread.Create(Self);
  FThread.FreeOnTerminate := True;
  FThread.Resume;
end;

function TFNfeCons.getAutoAtualizar: Boolean;
begin
  Result := (FAutoAtualizar) and (getValue(SEDelay) > 0) and (CBAtualiza.Checked);
end;

function TFNfeCons.getDataSet: TDataSet;
begin
  Result := DBGrid1.DataSource.DataSet;
end;

{ TNfeConsThread }

constructor TNfeConsThread.Create(Tela: TFTConsulta);
begin
  inherited Create(True);
  FTela := Tela;
end;

procedure TNfeConsThread.Execute;
  procedure dormir(Auto: Boolean; Time: Cardinal);
  begin
    if Auto then
      Sleep(Time)
    else
      Sleep(2000);
  end;
var
  FNfe: TFNfeCons;
begin
  inherited;
  Priority := tpLower;
  if Assigned(FTela) and (FTela is TFNfeCons) then
  begin
    FNfe := (FTela as TFNfeCons);
    while (FNfe.Visible) do
    begin
      try
        if (FNfe.AutoAtualizar) then
          FNfe.Refresh;
        dormir(FNfe.AutoAtualizar, FNfe.getValue(FNfe.SEDelay)*1000);
      except
        dormir(FNfe.AutoAtualizar, FNfe.getValue(FNfe.SEDelay)*1000);
      end;
    end;
  end;
  Terminate;
end;

procedure TFNfeCons.CBDtMinClick(Sender: TObject);
begin
  inherited;
  Refresh;
end;

procedure TFNfeCons.FmFilialMeFilialChange(Sender: TObject);
begin
  inherited;
  Refresh;
end;

procedure TFNfeCons.CBAtualizaClick(Sender: TObject);
begin
  inherited;
  FAutoAtualizar := CBAtualiza.Checked;
end;

procedure TFNfeCons.BtStatusConsClick(Sender: TObject);
begin
  inherited;
  if FStatusNfeCons = Nil then
    FStatusNfeCons := TFStatusNfeCons.Create(Application);
  FStatusNfeCons.ShowModal();
end;

procedure TFNfeCons.PMNfePopup(Sender: TObject);
  procedure ColocaChave(Chave: String);
  begin
    CopiarchavedeacessoCHAVE1.Caption := StringReplace(MSG_OPCAO_COPIA_CHAVE,
        '%CHAVE%', Chave, [rfReplaceAll]);
  end;
var
  i: Integer;
begin
  inherited;
  for i := 0 to PMNfe.Items.Count - 1 do
    PMNfe.Items.Items[i].Enabled := not DataSet.IsEmpty;
  if DataSet.IsEmpty then
    ColocaChave('')
  else
    ColocaChave(DataSet.FieldByName('DESC_CHAVE_ACESSO').Value);
end;

procedure TFNfeCons.CopiarchavedeacessoCHAVE1Click(Sender: TObject);
begin
  inherited;
  Clipboard.SetTextBuf(PChar(DataSet.FieldByName('DESC_CHAVE_ACESSO').Text));
end;

procedure TFNfeCons.VerretornodaNFe1Click(Sender: TObject);
var
  Ret: TNFeRPCRetorno;
begin
  inherited;
  Ret := TNFeRPCRetorno.Create;
  Ret.Status := StrToInt('0' + DataSet.FieldByName('SIT_NFE').Value);
  Ret.Motivo := DataSet.FieldByName('DESC_MSG_VALIDACAO_LOTE').Value;
  Ret.Descricao := DataSet.FieldByName('DESC_MSG_VALIDACAO').Value;
  if FNFeRetorno = nil then
    FNFeRetorno := TFNFeRetorno.Create(Application);
  FNFeRetorno.Carrega(ACAO_ENVIO_NFE, Ret);
  FNFeRetorno.ShowModal;
end;

end.

