unit UMenuSPED;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTMenuPrincipal, Menus, Buttons, ExtCtrls, UCarregando, UContabil,
  UFiscal, UThreadLocal, ImgList, ComCtrls, UPisCofins, UFcont, TlHelp32,
  UContFisc;

type
  TFMenuSPED = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    GerarArquivo1: TMenuItem;
    SPEDContbil1: TMenuItem;
    ValidaodosDadosparaSPED1: TMenuItem;
    SPEDPISCofins1: TMenuItem;
    FCont1: TMenuItem;
    Relatrios1: TMenuItem;
    ConfernciaSpedPiseCofins1: TMenuItem;
    ConfernciaSpedFiscal1: TMenuItem;
    ECF1: TMenuItem;
    Reinf1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure GerarArquivo1Click(Sender: TObject);
    procedure SPEDContbil1Click(Sender: TObject);
    procedure ValidaodosDadosparaSPED1Click(Sender: TObject);
    procedure SPEDPISCofins1Click(Sender: TObject);
    procedure FCont1Click(Sender: TObject);
    procedure ConfernciaSpedPiseCofins1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfernciaSpedFiscal1Click(Sender: TObject);
    procedure ECF1Click(Sender: TObject);
    procedure Reinf1Click(Sender: TObject);
  private
    tela: TFCarregando;
    Contabil: TContabil;
    PisCofins: TPisCofins;
    Fiscal: TFiscal;
    FCont: TFCont;
    ContFisc: TContFisc;
    thread: TThreadLocal;
    procedure FiscalTerminate(Sender: TObject);
    procedure GeraFiscal(Sender: TObject);
    procedure GeraContabil(Sender: TObject);
    procedure GeraPisCofins(Sender: TObject);
    procedure GeraFCont(Sender: TObject);
    procedure GeraECF(Sender: TObject);
    function Finalizaprocesso(ExeFileName: string): integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuSPED: TFMenuSPED;

implementation

uses UTela_cl, UGeraSPED, UFmFilial, UGeraSPEDParam, USpedRel_cl,
  URPisCofinsOperacao, URPisCofinsNota, URPisCofinsCST, UBiblioteca,
  UBlocoP, URFiscalIPI, Delrun, UOracle_cl, UReinfGeral;

{$R *.dfm}

procedure TFMenuSPED.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'SPED';
end;

procedure TFMenuSPED.GerarArquivo1Click(Sender: TObject);
var path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if FGeraSPED = nil then
    FGeraSPED := TFGeraSPED.Create(Application);
  DMTela.VerificaTela(pModulo, FGeraSPED.Caption, FGeraSPED.Name);
  FGeraSPED.PGRelatorio.Pages[0].TabVisible := True;
  if FGeraSPED.ShowModal = mrOk then
  begin
    thread := TThreadLocal.Create;
    thread.thread.OnRun := GeraFiscal;
    thread.tela.mensagemCancelada := 'Geração do SPED Fiscal cancelada.';
    thread.tela.mensagemNormal := 'Geração do SPED Fiscal concluída com sucesso.' + #13 + #10 + 'O arquivo está no diretório ' + path + 'SPED\FISCAL';
    thread.tela.mostraMensagens := True;

    thread.Resume;
  end;
end;

procedure TFMenuSPED.SPEDContbil1Click(Sender: TObject);
var path: string;
  dia, mes, ano: word;
begin
  path := ExtractFilePath(Application.ExeName);
  if FGeraSPED = nil then
    FGeraSPED := TFGeraSPED.Create(Application);
  DMTela.VerificaTela(pModulo, FGeraSPED.Caption, FGeraSPED.Name);
  FGeraSPED.PGRelatorio.Pages[1].TabVisible := True;

  DecodeDate(DMOracle.DataServ, ano, mes, dia);
  FGeraSped.MeDataIniContabil.Text := '01/01/' + inttostr(ano - 1);
  FGeraSped.MeDataFinContabil.Text := '31/12/' + inttostr(ano - 1);
  
  if FGeraSPED.ShowModal = mrOk then
  begin
    if FGeraSPED.LbFiliais.Items.Count = 0 then
    begin
      MessageDlg('Informe pelo menos uma filial', mtError, [mbOK], 0);
      Abort;
    end;

    if FGeraSPED.wMatriz = 0 then
    begin
      MessageDlg('Informe, dentre as filiais, qual delas é a matriz.' + #13 + #10 + 'Faça isto clicando no número da filial que é a matriz e, após, clicando no botão Matriz.', mtError, [mbOK], 0);
      Abort;
    end;

    thread := TThreadLocal.Create;
    thread.thread.OnRun := GeraContabil;
    thread.tela.mensagemCancelada := 'Geração do SPED Contábil cancelada.';
    thread.tela.mensagemNormal := 'Geração do SPED Contábil concluída com sucesso.' + #13 + #10 + 'O arquivo está no diretório ' + path + 'SPED\CONTABIL';
    thread.tela.mostraMensagens := True;

    thread.Resume;
  end;
end;

procedure TFMenuSPED.GeraFiscal(Sender: TObject);
begin
  Fiscal := TFiscal.Create(
    StrToInt(Trim(FGeraSPED.FmFilialFiscal.MeFilial.Text)),
    StrToDate(FGeraSPED.MeDataIniFiscal.Text),
    StrToDate(FGeraSPED.MeDataFinFiscal.Text),
    FGeraSPED.RgFinalidade.ItemIndex
    );
  Fiscal.thread := thread;
  Fiscal.Gerar;
end;

procedure TFMenuSPED.GeraContabil(Sender: TObject);
begin
  Contabil := TContabil.Create(
    FGeraSped.wHashContabilLivroSubstituido,
    FGeraSped.RgFinalidade.ItemIndex,
    StrToDate(FGeraSPED.MeDataIniContabil.Text),
    StrToDate(FGeraSPED.MeDataFinContabil.Text),
    FGeraSPED.GeraStringsFiliais,
    FGeraSped.lbArquivosRTF.Items,
    FGeraSPED.wMatriz);
  Contabil.thread := thread;
  Contabil.Gerar;
end;

procedure TFMenuSPED.GeraPisCofins(Sender: TObject);
begin
  PisCofins := TPisCofins.Create(
    StrToDate(FGeraSPED.MeDataIniPisCofins.Text),
    StrToDate(FGeraSPED.MeDataFinPisCofins.Text),
    FGeraSPED.GeraStringsFiliais,
    FGeraSPED.cbxBlocoP.Checked,
    FGeraSPED.wMatriz);  
  PisCofins.thread := thread;
  PisCofins.Gerar;
end;

procedure TFMenuSPED.GeraFCont(Sender: TObject);
begin
  FCont := TFCont.Create(
    StrToDate(FGeraSPED.MeDataIniFCont.Text),
    StrToDate(FGeraSPED.MeDataFinFCont.Text),
    FGeraSPED.GeraStringsFiliais,
    FGeraSPED.wMatriz);
  FCont.thread := thread;
  FCont.Gerar;
end;


procedure TFMenuSPED.FiscalTerminate(Sender: TObject);
begin
  tela.Close;
end;

procedure TFMenuSPED.ValidaodosDadosparaSPED1Click(Sender: TObject);
begin
  inherited;
//  if FValida = nil then
//    FValida := TFValida.Create(Application);
//  DMTela.VerificaTela(pModulo, FValida.Caption, FValida.Name);
//  FValida.ShowModal;
end;

procedure TFMenuSPED.SPEDPISCofins1Click(Sender: TObject);
var path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if FGeraSPED = nil then
    FGeraSPED := TFGeraSPED.Create(Application);

  DMTela.VerificaTela(pModulo, FGeraSPED.Caption, FGeraSPED.Name);
  FGeraSPED.PGRelatorio.Pages[2].TabVisible := True;
  if FGeraSPED.ShowModal = mrOk then
  begin
    if FGeraSPED.LbFiliaisPisCofins.Items.Count = 0 then
    begin
      MessageDlg('Informe pelo menos uma filial', mtError, [mbOK], 0);
      Abort;
    end;

    if FGeraSPED.wMatriz = 0 then
    begin
      MessageDlg('Informe, dentre as filiais, qual delas é a matriz.' + #13 + #10 + 'Faça isto clicando no número da filial que é a matriz e, após, clicando no botão Matriz.', mtError, [mbOK], 0);
      Abort;
    end;

    if FGeraSPED.cbxBlocoP.Checked then
    begin
      if FBlocoP = Nil then
        FBlocoP := TFBlocoP.Create(Application);
      if FBlocoP.ShowModal = MrCancel then
        Abort;
    end;

    thread := TThreadLocal.Create;
    thread.thread.OnRun := GeraPisCofins;
    thread.tela.mensagemCancelada := 'Geração do SPED PIS/Cofins cancelada.';
    thread.tela.mensagemNormal := 'Geração do SPED PIS/Cofins concluída com sucesso.' + #13 + #10 + 'O arquivo está no diretório ' + path + 'SPED\PISCOFINS';
    thread.tela.mostraMensagens := True;
    thread.Resume;
  end;
end;

procedure TFMenuSPED.FCont1Click(Sender: TObject);
var path: string;
begin
  inherited;
  path := ExtractFilePath(Application.ExeName);
  if FGeraSPED = nil then
    FGeraSPED := TFGeraSPED.Create(Application);
  DMTela.VerificaTela(pModulo, FGeraSPED.Caption, FGeraSPED.Name);
  FGeraSPED.PGRelatorio.Pages[3].TabVisible := True;
  if FGeraSPED.ShowModal = mrOk then
  begin
    if FGeraSPED.LblFiliaisFCont.Items.Count = 0 then
    begin
      MessageDlg('Informe pelo menos uma filial', mtError, [mbOK], 0);
      Abort;
    end;

    if FGeraSPED.wMatriz = 0 then
    begin
      MessageDlg('Informe, dentre as filiais, qual delas é a matriz.' + #13 + #10 + 'Faça isto clicando no número da filial que é a matriz e, após, clicando no botão Matriz.', mtError, [mbOK], 0);
      Abort;
    end;

    thread := TThreadLocal.Create;
    thread.thread.OnRun := GeraFCont;
    thread.tela.mensagemCancelada := 'Geração do FCont cancelada.';
    thread.tela.mensagemNormal := 'Geração do FCont concluída com sucesso.' + #13 + #10 + 'O arquivo está no diretório ' + path + 'SPED\FCont';
    thread.tela.mostraMensagens := True;
    thread.Resume;
  end;
end;

procedure TFMenuSPED.ConfernciaSpedPiseCofins1Click(Sender: TObject);
var dataIni, dataFin: TDate;
begin
  inherited;
  if FGeraSPEDParam = nil then
    FGeraSPEDParam := TFGeraSPEDParam.Create(Application);
  FGeraSPEDParam.PGRelatorio.Pages[0].TabVisible := True;
  bib.PriUltDataVar(dataIni, dataFin,
    true, Now);
    FGeraSPEDParam.FmDatas1.MeDtInicial.Text  := DateToStr(dataIni);
    FGeraSPEDParam.FmDatas1.MeDtFinal.Text    := DateToStr(dataFin);
  if FGeraSPEDParam.ShowModal = mrOk then
  begin
    with DMSpedRel do
    begin
      QRPisCofinsOperacao.Close;
      QRPisCofinsOperacao.SetVariable('FILIAL', FGeraSPEDParam.FMFilial1.MEFilial.Text);
      QRPisCofinsOperacao.SetVariable('DT_INI', FGeraSPEDParam.FMDatas1.MEDtInicial.Text);
      QRPisCofinsOperacao.SetVariable('DT_FIN', FGeraSPEDParam.FMDatas1.MEDtFinal.Text);
      QRPisCofinsOperacao.Open;

      QRPisCofinsNota.Close;
      QRPisCofinsNota.SetVariable('FILIAL', FGeraSPEDParam.FMFilial1.MEFilial.Text);
      QRPisCofinsNota.SetVariable('DT_INI', FGeraSPEDParam.FMDatas1.MEDtInicial.Text);
      QRPisCofinsNota.SetVariable('DT_FIN', FGeraSPEDParam.FMDatas1.MEDtFinal.Text);
      QRPisCofinsNota.Open;

      QRPisCofinsCST.Close;
      QRPisCofinsCST.SetVariable('FILIAL', FGeraSPEDParam.FMFilial1.MEFilial.Text);
      QRPisCofinsCST.SetVariable('DT_INI', FGeraSPEDParam.FMDatas1.MEDtInicial.Text);
      QRPisCofinsCST.SetVariable('DT_FIN', FGeraSPEDParam.FMDatas1.MEDtFinal.Text);
      QRPisCofinsCST.Open;
    end;
    if FRPisCofinsOperacao = Nil then
      FRPisCofinsOperacao := TFRPisCofinsOperacao.Create(Application);
    FRPisCofinsOperacao.QRLTitulo.Caption := 'Relatório de Conferência Pis e Cofins';
    FRPisCofinsOperacao.QRLFilial.Caption := 'Filial ' + FGeraSPEDParam.FMFilial1.MEFilial.Text;
    FRPisCofinsOperacao.QRLPeriodo.Caption := 'De ' + FGeraSPEDParam.FMDatas1.MeDtInicial.Text +
      ' até ' + FGeraSPEDParam.FMDatas1.MeDtFinal.Text;
    if FRPisCofinsNota = Nil then
      FRPisCofinsNota := TFRPisCofinsNota.Create(Application);
    if FRPisCofinsCST = Nil then
      FRPisCofinsCST := TFRPisCofinsCST.Create(Application);
    if FGeraSPEDParam.RGPreview.ItemIndex = 0 then
      FRPisCofinsOperacao.QRCompositeReport1.Preview
    else
      FRPisCofinsOperacao.QRCompositeReport1.Print;
  end;
end;

function TFMenuSPED.Finalizaprocesso(ExeFileName: string): integer;
const
  PROCESS_TERMINATE=$0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  result := 0;

  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName))
      or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure TFMenuSPED.Sair1Click(Sender: TObject);
begin
  Finalizaprocesso('pjSPED.exe');
  inherited;
end;

procedure TFMenuSPED.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Sair1Click(Self);
end;

procedure TFMenuSPED.ConfernciaSpedFiscal1Click(Sender: TObject);
var dataIni, dataFin: TDate;
begin
  inherited;
  if FGeraSPEDParam = nil then
    FGeraSPEDParam := TFGeraSPEDParam.Create(Application);
  FGeraSPEDParam.PGRelatorio.Pages[1].TabVisible := True;
  bib.PriUltDataVar(dataIni, dataFin, true, Now);
    FGeraSPEDParam.FmDatas2.MeDtInicial.Text  := DateToStr(dataIni);
    FGeraSPEDParam.FmDatas2.MeDtFinal.Text    := DateToStr(dataFin);
  if FGeraSPEDParam.ShowModal = mrOk then
  begin
    with DMSpedRel do
    begin
      QRFiscalIPI.Close;
      QRFiscalIPI.SetVariable('FILIAL', FGeraSPEDParam.FMFilial2.MEFilial.Text);
      QRFiscalIPI.SetVariable('DATA_INI', FGeraSPEDParam.FMDatas2.MEDtInicial.Text);
      QRFiscalIPI.SetVariable('DATA_FIN', FGeraSPEDParam.FMDatas2.MEDtFinal.Text);
      QRFiscalIPI.Open;
    end;

    if FRFiscalIPI = Nil then
      FRFiscalIPI := TFRFiscalIPI.Create(Application);
    FRFiscalIPI.QRLTitulo.Caption := 'Relatório de Conferência Sped Fiscal';
    FRFiscalIPI.QRLFilial.Caption := 'Filial ' + FGeraSPEDParam.FMFilial2.MEFilial.Text;
    FRFiscalIPI.QRLPeriodo.Caption := 'De ' + FGeraSPEDParam.FMDatas2.MeDtInicial.Text +
      ' até ' + FGeraSPEDParam.FMDatas2.MeDtFinal.Text;

    if FGeraSPEDParam.RGPreview.ItemIndex = 0 then
      FRFiscalIPI.QRPrimario.Preview
    else
      FRFiscalIPI.QRPrimario.Print;
  end;
end;

procedure TFMenuSPED.ECF1Click(Sender: TObject);
var path: string;
  wDataAtual: tdate;
begin
  inherited;
  //if RunningUnderDelphi then
  //begin
    path := ExtractFilePath(Application.ExeName);
    if FGeraSPED = nil then
      FGeraSPED := TFGeraSPED.Create(Application);
    DMTela.VerificaTela(pModulo, FGeraSPED.Caption, FGeraSPED.Name);
    FGeraSPED.PGRelatorio.Pages[4].TabVisible := True;
    wDataAtual := DMOracle.dataserv;

    FGeraSPED.MeDataIniECF.Text
      := '01/01/'+ formatDateTime('yyyy',incMonth(wDataAtual,-12));
    FGeraSPED.MeDataFinECF.Text
      := '31/12/'+ formatDateTime('yyyy',incMonth(wDataAtual,-12));
    if FGeraSPED.ShowModal = mrOk then
    begin
      if FGeraSPED.LbLFiliaisECF.Items.Count = 0 then
      begin
        MessageDlg('Informe pelo menos uma filial', mtError, [mbOK], 0);
        Abort;
      end;

      if FGeraSPED.wMatriz = 0 then
      begin
        MessageDlg('Informe, dentre as filiais, qual delas é a matriz.' + #13 + #10 + 'Faça isto clicando no número da filial que é a matriz e, após, clicando no botão Matriz.', mtError, [mbOK], 0);
        Abort;
      end;

      thread := TThreadLocal.Create;
      thread.thread.OnRun := GeraECF;
      thread.tela.mensagemCancelada := 'Geração do SPED ECF cancelada.';
      thread.tela.mensagemNormal := 'Geração do SPED ECF concluída com sucesso.' + #13 + #10 + 'O arquivo está no diretório ' + path + 'SPED\ECF';
      thread.tela.mostraMensagens := True;

      thread.Resume;
    end;
  //end
  //else
  //  MessageDlg('Função em desenvolvimento', mtInformation, [mbOk], 0);
end;

procedure TFMenuSPED.GeraECF(Sender: TObject);
begin
  ContFisc := TContFisc.Create(
    StrToDate(FGeraSPED.MeDataIniECF.Text),
    StrToDate(FGeraSPED.MeDataFinECF.Text),
    FGeraSPED.GeraStringsFiliais,
    FGeraSPED.wMatriz);
  ContFisc.thread := thread;
  ContFisc.Gerar;
end;

procedure TFMenuSPED.Reinf1Click(Sender: TObject);
begin
  //inherited;
  if FReinf = nil then
    FReinf := TFReinfGeral.Create(Application);

  FReinf.ShowModal;
  FreeAndNil(FReinf);
end;

end.

