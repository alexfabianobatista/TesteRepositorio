unit UOSCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, ComObj, ActiveX, DBDirceu, ActnList, DBPanel,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFOFI0009 = class(TFTCadSimples)
    PCOS: TPageControl;
    TSOS: TTabSheet;
    DBENumOS: TDBEdit;
    DBEDtEmissao: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label1: TLabel;
    LblDtEmissao: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    SBVeiculoCons: TSpeedButton;
    DBEdit6: TDBEdit;
    Label18: TLabel;
    DBEdit23: TDBEdit;
    DBEdit14: TDBEdit;
    OSnoperiodo1: TMenuItem;
    Opes1: TMenuItem;
    LblKm: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBMemo1: TDBMemo;
    FechamentoOS1: TMenuItem;
    SBMarcacaoCad: TSpeedButton;
    SBOSCapa: TSpeedButton;
    SBPreFechamento: TSpeedButton;
    Bevel1: TBevel;
    SBFinalizaMarcacao: TSpeedButton;
    RelProdutividadePendente1: TMenuItem;
    RelProdutividadeEncerrada1: TMenuItem;
    RelOrdemServioporVeculo1: TMenuItem;
    RelProdutividadeChapeao1: TMenuItem;
    RelProdutividadeServEltrico1: TMenuItem;
    GeraPrFechamentonoWord1: TMenuItem;
    TSOutros: TTabSheet;
    PSaida: TPanel;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    DBEdit22: TDBEdit;
    Label17: TLabel;
    DBPFilial: TDBPanel;
    DBPMecanico: TDBPanel;
    DBPHoraEntrada: TDBPanel;
    DBPHoraPrevistaSaida: TDBPanel;
    DBPSolicitacao: TDBPanel;
    DBPTipo: TDBPanel;
    DBPVendedor: TDBPanel;
    DBPCadastro: TDBPanel;
    PNaturezaLocal: TPanel;
    DBRGNaturezaOS: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    OSCAPA1: TMenuItem;
    OSPrFechamento1: TMenuItem;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBVeiculoConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure OSnoperiodo1Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure SBPreFechamentoClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure FechamentoOS1Click(Sender: TObject);
    procedure SBOSCapaClick(Sender: TObject);
    procedure SBPreFechamento1Click(Sender: TObject);
    procedure SBFinalizaMarcacaoClick(Sender: TObject);
    procedure SBMarcacaoCadClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RelProdutividadePendente1Click(Sender: TObject);
    procedure RelProdutividadeEncerrada1Click(Sender: TObject);
    procedure RelOrdemServioporVeculo1Click(Sender: TObject);
    procedure RelProdutividadeChapeao1Click(Sender: TObject);
    procedure RelProdutividadeServEltrico1Click(Sender: TObject);
    procedure GeraPrFechamentonoWord1Click(Sender: TObject);
    function GetOrCreateObject(const ClassName: string): IDispatch;
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure DBPFilialDefine(Sender: TObject; var QueryConsulta: TDataSet;
      var FormConsulta: TForm);
    procedure DBPMecanicoDefine(Sender: TObject; var QueryConsulta: TDataSet;
      var FormConsulta: TForm);
    function AgronewsNaoRenderizar(Sender: TObject): Boolean;
    procedure DBPTipoDefine(Sender: TObject; var QueryConsulta: TDataSet;                                    
      var FormConsulta: TForm);
    function AgronewsRenderizar(Sender: TObject): Boolean;
    procedure DBPVendedorDefine(Sender: TObject; var QueryConsulta: TDataSet;
      var FormConsulta: TForm);
    procedure DBPCadastroDefine(Sender: TObject;
      var QueryConsulta: TDataSet; var FormConsulta: TForm);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure OSCAPA1Click(Sender: TObject);
    procedure OSPrFechamento1Click(Sender: TObject);
    procedure DBPMecanicoValidate(Sender: TObject; Value: Variant;
      var isValid: Boolean; var Msg: String);
  private
    { Private declarations }
//    function SenhaLiberaCadastro() :boolean;
    function RMaskCGC_CPF(wCgc1: string; Zeros: Integer): string;
  public
    { Public declarations }
  end;

var
  FOFI0009: TFOFI0009;
  NewWord: Variant;

implementation

uses UFilialCons, UFilial_cl, UVendedorCons, UVendedor_cl,
  UMecanicoCons, UCadastroCons, UCadastro_cl, UOS_TipoCons, UVeiculoCons,
  UCondicao_pgtoCons, UOracle_cl, UOSCons, UROSCad, UOficinaParam,
  UROSPeriodo, UROSPreFechamento, UROSPreFechamentoServTerceiro,
  UOSVoltaFechamento, URServico_Terceiro, UROSPreFechamentoMO, UOSMarcacao,
  UTela_cl, UBiblioteca, UMarcacaoInicia, UMarcacaoFinaliza, UFechamentoOS,
  UParamSistema_cl, FRRelatorioProdutividadePendente,
  URProdutividadeEncerrada, URelatorio_cl, URelOSVeiculo,
  URProdutividadeChapeacao, URProdutividadeServEletrico, UOperacao_cl,
  UOperacaoCons, UOs_cl, UOficina_cl, UOSEmite_cl;

{$R *.DFM}

function TFOFI0009.RMaskCGC_CPF(wCgc1: string; Zeros: Integer): string;
var
  S: string;
  x: integer;
begin
  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      S := S + wCgc1[x];

  while Length(S) < Zeros do
    S := '0' + S;

  Result := S;
end;

function TFOFI0009.GetOrCreateObject(const ClassName: string): IDispatch;
var
  ClassID: TGUID;
  Unknown: IUnknown;
begin
  ClassID := ProgIDToClassID(ClassName);
  if Succeeded(GetActiveObject(ClassID, nil, Unknown)) then
    OleCheck(Unknown.QueryInterface(IDispatch, Result))
  else
    Result := CreateOleObject(ClassName);
end;

function ConverteHora(hora: Real): string;
var
  wHoraTexto: string;
  wCont: Integer;
begin
  wCont := 0;
  wHoraTexto := FloatToStr(hora);
  while (wCont <= length(wHoraTexto)) do
  begin
    if (wHoraTexto[wCont] = ',') then
      wHoraTexto[wCont] := ':';
    Inc(wCont);
  end;
  result := (wHoraTexto);
end;

function ConverteMinuto(hora: Real): Integer;
var
  wHoraTexto, wHora, wMinuto: string;
  wCont: Integer;
begin
  wCont := 1;
  wHora := '';
  wMinuto := '';
  wHoraTexto := FloatToStr(hora);

  while (wHoraTexto[wCont] <> ',') do
  begin
    wHora := wHora + wHoraTexto[wCont];
    Inc(wCont);
  end;

  Inc(wCont);
  while (wCont <= length(wHoraTexto)) do
  begin
    wMinuto := wMinuto + wHoraTexto[wCont];
    Inc(wCont);
  end;
  if length(wMinuto) <= 1 then
    wMinuto := wMinuto + '0';
  result := ((StrToInt(wHora)) * 60 + (StrToInt(wMinuto)));
end;

procedure TFOFI0009.DSPrimarioStateChange(Sender: TObject);
var
  b: bool;
begin
  inherited;
  b := (DSPrimario.State in [dsInsert, dsEdit]);
  SBVeiculoCons.Enabled := b;
  SBMarcacaocad.Enabled := not b;
  SBOSCapa.Enabled := not b;
  SBPreFechamento.Enabled := not b;

  if (DSPrimario.State in [dsEdit]) and
    (DMOs.QOsCadIND_SITUACAO.Value = 'F') then
  begin
    MessageDlg('Ordem de Serviço já foi fechada!', mtWarning, [mbOk], 0);
    DSPrimario.DataSet.Cancel;
  end;
end;

procedure TFOFI0009.SBVeiculoConsClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
  begin
    DMOs.QOsCadNUM_CHASSI.Value := DMOficina.QVeiculoConsNUM_CHASSI.Value;
    DBEdit6.OnExit(Self);
  end;
end;

procedure TFOFI0009.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
    with DMOs do
    begin
      QOSCad.Close;
      QOSCad.SetVariable('PK', QOSConsNUM_OS.Value);
      QOSCad.Open;
    end;
end;

procedure TFOFI0009.OSnoperiodo1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
    FOficinaParam := TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[2].TabVisible := True;

  if FOficinaParam.ShowModal = mrOk then
  begin
    if (Trim(FOficinaParam.MEEmissaoI.Text) = '') or
      (Trim(FOficinaParam.MEEmissaoF.Text) = '') then
      raise exception.Create('Periodo deve ser informado!');

    with DMOficina do
    begin
      QROSPeriodo.Close;
      if Trim(FOficinaParam.EdNumOS.Text) = '' then
        QROSPeriodo.SetVariable('NUM_OS', Null)
      else
        QROSPeriodo.SetVariable('NUM_OS', FOficinaParam.EdNumOS.Text);

      if Trim(FOficinaParam.METipoOS1.Text) = '' then
        QROSPeriodo.SetVariable('IND_TIPO_OS', Null)
      else
        QROSPeriodo.SetVariable('IND_TIPO_OS', FOficinaParam.METipoOS1.Text);

      if Trim(FOficinaParam.MECadastroCod1.Text) = '' then
        QROSPeriodo.SetVariable('COD_CADASTRO', Null)
      else
        QROSPeriodo.SetVariable('COD_CADASTRO', FOficinaParam.MECadastroCod1.Text);

      if Trim(FOficinaParam.MEMecanicoCod1.Text) = '' then
        QROSPeriodo.SetVariable('COD_MECANICO', Null)
      else
        QROSPeriodo.SetVariable('COD_MECANICO', FOficinaParam.MEMecanicoCod1.Text);

      if Trim(FOficinaParam.MEVendedorCod1.Text) = '' then
        QROSPeriodo.SetVariable('COD_VENDEDOR', Null)
      else
        QROSPeriodo.SetVariable('COD_VENDEDOR', FOficinaParam.MEVendedorCod1.Text);

      QROSPeriodo.SetVariable('DT_EMISSAO_I', FOficinaParam.MEEmissaoI.Text);
      QROSPeriodo.SetVariable('DT_EMISSAO_F', FOficinaParam.MEEmissaoF.Text);

      if FOficinaParam.RadioGroup1.ItemIndex = 0 then
        QROSPeriodo.SetVariable('IND_SITUACAO', 'A')
      else if FOficinaParam.RadioGroup1.ItemIndex = 1 then
        QROSPeriodo.SetVariable('IND_SITUACAO', 'F')
      else
        QROSPeriodo.SetVariable('IND_SITUACAO', Null);

      QROSPeriodo.Open;

      if FROSPeriodo = nil then
        FROSPeriodo := TFROSPeriodo.Create(Application);
      if FOficinaParam.RGPreview.ItemIndex = 0 then
        FROSPeriodo.QRPrimario.Preview
      else
        FROSPeriodo.QRPrimario.Print;

    end;
  end;
end;

procedure TFOFI0009.DBEdit6Exit(Sender: TObject);
var
  mNumChassi, mTotalPendente, mTotalLimiteCR: string;
begin
  inherited;
  with DMOficina do
  begin
    if (DSPrimario.State in [DsEdit, DsInsert]) and (Trim(DBEdit6.Text) <> '') then // Se informou numero do chassi
    begin
      if Length(DBEdit6.Text) = 6 then
        mNumChassi := '%' + DBEdit6.Text
      else
        mNumChassi := DBEdit6.Text;

      DBEdit6.Text := '';
      DBEdit6.Text := DMOracle.BuscaNome('SELECT NUM_CHASSI FROM TB_VEICULO', 'NUM_CHASSI LIKE ' + chr(39) + mNumChassi + chr(39));

      if Trim(DBEdit6.Text) = '' then
        raise exception.Create('Número do CHASSI informado não foi encontrado!')
      else
        DMOs.QOsCadCOD_CADASTRO.Value := StrToInt('0' + DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_VEICULO', 'NUM_CHASSI LIKE ' + chr(39) + mNumChassi + chr(39)));

      if DMOs.QOsCadCOD_CADASTRO.Value > 0 then // Cliente encontrado no cadastro.
      begin
//        DMOs.QOsCadCOD_CADASTRO.Value := StrToInt(DBEdit5.Text);
        if DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMOs.QOsCadCOD_CADASTRO.Text) <> '' then
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
        begin
          MessageDlg('Atenção!'+#13+#10+'Esse cadastro foi cancelado!', mtWarning, [mbOK], 0);
        end
        else
        begin
          MessageDlg('CADASTRO - Cliente BLOQUEADO verifique com a gerencia!', mtInformation, [mbOk], 0);
          DMOs.QOsCad.cancel;
        end;

        // Verificar situação do cliente
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS' then
        begin
          mTotalPendente := DMOracle.BuscaNome('SELECT SUM(VAL_TITULO+VAL_JUROS) FROM TB_CONTA_RECEBER_CAB', '(COD_CADASTRO = ' + FloatToStr(DMOficina.QVeiculoConsCOD_CADASTRO.Value) + ') AND (IND_SITUACAO <> ' + CHR(39) + 'BAIXA TOTAL' + CHR(39) + ')');
          mTotalLimiteCR := DMOracle.BuscaNome('SELECT VAL_LIMITE FROM TB_CADASTRO', ' COD_CADASTRO = ' + IntToStr(DMOs.QOsCadCOD_CADASTRO.Value));
          if (Trim(mTotalPendente) <> '') and (Trim(mTotalLimiteCR) <> '') then
          begin
            if StrToFloat(mTotalPendente) > StrToFloat(mTotalLimiteCR) then
            begin
              MessageDlg('Limite de credito excedido, verifique com a Gerencia!', mtInformation, [mbOk], 0);
              if SenhaLiberaCadastro = true then
                exit
              else
                DBEdit6.SetFocus;
            end;
            if Trim(DBEdit23.Text) <> '' then
            begin
              if StrToFloat(mTotalLimiteCR) > StrToFloat(DBEdit23.Text) then
              begin
                MessageDlg('Limite da requisição maior que limite credito do cadastro!', mtInformation, [mbOk], 0);
                DBEdit23.SetFocus;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFOFI0009.SBPreFechamentoClick(Sender: TObject);
var
  wTotalMinuto, wTotalHora : Double;
  wHora, wMinuto, wValor : Double;
  wTotalHoraTrabalhada : String;
begin
  inherited;
  if FOficinaParam = nil then
    FOficinaParam := TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[3].TabVisible := True;
  FOficinaParam.EdNumOS2.Text := FOFI0009.DBENumOS.Text;
  if FOficinaParam.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      QROSPreFechamento.Close;
      QRServico_Terceiro.Close;
      QROSPreFechamentoMO.Close;

      // Parametros devem ser null para impressão aqui deste relatório.
      QRServico_Terceiro.SetVariable('DT_SERVICO_I', '01/01/1980');
      QRServico_Terceiro.SetVariable('DT_SERVICO_F', '31/12/2060');
      QRServico_Terceiro.SetVariable('COD_CADASTRO', Null);
      QRServico_Terceiro.SetVariable('COD_VENDEDOR', Null);
      QRServico_Terceiro.SetVariable('COD_SERVICO', Null);

      if Trim(FOficinaParam.EdNumOS2.Text) = '' then
        raise exception.Create('Número da O.S. deve ser informada!');

      QROSPreFechamento.SetVariable('NUM_OS', FOficinaParam.EdNumOS2.Text);
      QRServico_Terceiro.SetVariable('NUM_OS', FOficinaParam.EdNumOS2.Text);
      QROSPreFechamentoMO.SetVariable('NUM_OS', FOficinaParam.EdNumOS2.Text);

      QROSPreFechamento.Open;
      QRServico_Terceiro.Open;
      QROSPreFechamentoMO.Open;

      if FROSPreFechamento = nil then
        FROSPreFechamento := TFROSPreFechamento.Create(Application);

      if FRServico_Terceiro = nil then
        FRServico_Terceiro := TFRServico_Terceiro.Create(Application);

      if FROSPreFechamentoMO = nil then
        FROSPreFechamentoMO := TFROSPreFechamentoMO.Create(Application);
//------------------------- CALCULA HORAS --------------------------------------- Junior - 27/08/2013
      wValor  := 0;
      wMinuto := 0;
      wHora   := 0;
      while not (QROSPreFechamentoMO.eof) do
      begin
        wTotalMinuto := wTotalMinuto + ConverteMinuto(QROSPreFechamentoMOHR_FINAL.Value) - ConverteMinuto(QROSPreFechamentoMOHR_INICIO.Value);
        QROSPreFechamentoMO.Next;
      end;
      wTotalHora := (wTotalMinuto / 60);
      wValor := wValor + (wTotalHora * QROSPreFechamentoMOVAL_HORA_MECANICO.Value);
      wMinuto := Frac(wTotalMinuto / 60);
      wHora := wHora + (Int(wTotalHora / 60));

      while (wMinuto >= 0.6) do
      begin
        wHora := wHora + 1;
        wMinuto := wMinuto - 0.6;
      end;

      wTotalHoraTrabalhada := ConverteHora((wHora + wMinuto));

      FROSPreFechamentoMO.QRLQtdeHoraCad.Caption := IntToStr(QROSPreFechamentoMO.RecordCount);
      FROSPreFechamentoMO.QRLHoraTrabalhada.caption := FormatFloat('#,##0.00',wTotalHora);
      FROSPreFechamentoMO.QRLVlrHoraTrabalhada.Caption := FormatFloat('#,##0.00',wvalor);
 //     DMOficina.QROSPreFechamentoMOhoras_trabalhadas.Value := wTotalHoraTrabalhada;
//      DMOficina.QROSPreFechamentoMOvalor_horas_trabalhadas.Value:= FloatToStr(wValor);
//-----------------------------------------------------------------------------------------

      if FOficinaParam.RGPreview.ItemIndex = 0 then
        FROSPreFechamento.QRCompositeReport1.Preview
      else
        FROSPreFechamento.QRCompositeReport1.Print;

      QROSPreFechamento.Close;
      QRServico_Terceiro.Close;
      QROSPreFechamentoMO.Close;
    end;
  end;
end;

procedure TFOFI0009.SBConfirmarClick(Sender: TObject);
var
  mSituacao, wDtVencto, wLibera, wSql: string;
  wAgronews: Boolean;
begin
  mSituacao := DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO', ' COD_CADASTRO = ' + IntToStr(DMOs.QOsCadCOD_CADASTRO.Value));
  if mSituacao <> '' then
    raise exception.Create('Cliente - Cadastro cancelado. Verifique!');
  wAgronews := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS');
  if wAgronews then
  begin
    if DMOs.QOsCadIND_TIPO_OS.IsNull then
      Raise Exception.Create('Por favor, informe o tipo da OS.');
    if DMOs.QOsCadCOD_MECANICO.Value > 0 then
    begin
      wSql := 'SELECT NUM_OS FROM TB_OS WHERE DT_FECHAMENTO IS NULL ' +
          ' AND COD_MECANICO = ' + DMOs.QOsCadCOD_MECANICO.Text;
      wSql := DMOracle.BuscaNome(wSql, '');
      if (wSql <> '') then
      begin
        MessageDlg('Este mecânico está alocado em outro serviço.', mtError, [mbOK], 0);
        DBPMecanico.SetFocus;
        Abort;
      end;
    end;
  end
  else
  begin
    wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB', 'COD_CADASTRO = ' +
      FloatToStr(DMOs.QOsCadCod_Cadastro.Value) +
      ' AND IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));
    wLibera := DMOracle.BuscaNome('SELECT IND_LIBERA_VENDA FROM TB_CADASTRO', 'TB_CADASTRO.COD_CADASTRO = ' +
      FloatToStr(DMOs.QOsCadCod_Cadastro.Value));
    if wDtvencto <> '' then
      if StrToDate(wDtVencto) < (Date - 5) then
        if wLibera = 'NAO' then
          raise Exception.Create('Cliente Com Titulos Em Aberto - Verificar Liberação de Cadastro');
    PCOS.ActivePage := TSOS;
    DBEDtEmissao.SetFocus;
  end;
  inherited;
end;

procedure TFOFI0009.FechamentoOS1Click(Sender: TObject);
begin
  inherited;
  if FOFI0018 = nil then
    FOFI0018 := TFOFI0018.Create(Application);
  FOFI0018.ShowModal;
end;

procedure TFOFI0009.SBOSCapaClick(Sender: TObject);
  function GetTokStr(Str, Token: String; CurrPos: Integer = 0): String;
  var
    wStr: String;
    i, p: Integer;
  begin
    Result := '';
    wStr := Str;
    for i := 0 to CurrPos do
    begin
      p := Pos(Token, wStr);
      if p < 1 then
        p := Length(wStr)
      else
        Dec(p);
      if i = CurrPos then
      begin
        Result := Copy(wStr, 1, p);
        Break;
      end;
      wStr := Copy(wStr, p + Length(Token) + 1, Length(wStr));
      if wStr = '' then
        Break;
    end;
  end;
var
  wCont: Byte;
  wLpt_Nota, wMens: string;
  wCopiado, wLinha: Integer;
begin
  inherited;
  if Trim(DBENumOS.Text) = '' then
  begin
    MessageDlg('Primeiro selecione a Ordem de Serviço que deseja imprimir!', mtWarning, [mbOk], 0);
    Exit;
  end;

  if DMOs.QOsCadCOD_FILIAL.Value > 0 then
    wLpt_Nota := DMOracle.FastSelect('DESC_LPT_OS', 'TB_FILIAL',
          'COD_FILIAL = ' + DMOs.QOsCadCOD_FILIAL.Text)
  else
  begin
    MessageDlg('Não foi informada filial para O.S. informada!', mtWarning, [mbOk], 0);
    Exit;
  end;
  if Trim(wLpt_Nota) = '' then
  begin
    MessageDlg('Não foi encontrado cadastrado porta da impressora na tabela de filial!', mtWarning, [mbOk], 0);
    Exit;
  end;

  if Imp = nil then
    Imp := TImp.Create;
  if Trim(wLpt_Nota) = 'LPT1' then
    Imp.AbreImpressora
  else if Trim(wLpt_Nota) = 'LPT2' then
    Imp.AbreImpressora_Lpt2
  else
    Imp.AbreImpressora_Com2;

  Imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 66);

  // Inicia procedimento de impressão OS-Capa em modo texto.

  with DMOFicina do
  begin
    QROSCapa.Close;
    QROSCapa.SetVariable('NUM_OS', DBENumOS.Text);
    QROSCapa.Open;
    wCont := 2;
    Imp.WriteXY(0.2, wCont, DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + FloatToStr(QROSCapaCOD_FILIAL.Value)));
    Imp.WriteXY(17.3, wCont, DateTimeToStr(Now));
    wCont := wCont + 2;
    Imp.WriteXY(0.2, wCont, 'Nr. O.S.:          ' + QROSCapaNUM_OS.Text);
    wCont := wCont + 2;
    Imp.WriteXY(0.2, wCont, 'CLIENTE..........: ' + QROSCapaCOD_CADASTRO.Text + '-' + QROSCapaNOME.Value);
    Imp.WriteXY(13.5, wCont, 'PLACA............: ' + QROSCapaNUM_PLACA.Value);
    wCont := wCont + 1;
    Imp.WriteXY(0.2, wCont, 'TELEFONE.........: ' + QROSCapaDESC_TELEFONE.Value + ' / ' + QROSCapaDESC_CELULAR.Value);
    Imp.WriteXY(13.5, wCont, 'CHASSI...........: ' + QROSCapaNUM_CHASSI.Value);
    wCont := wCont + 2;
    Imp.WriteXY(0.2, wCont, 'TIPO O.S.........: ' + QROSCapaIND_TIPO_OS.Text + '-' + QROSCapaDESC_OS_TIPO.Value);
    Imp.WriteXY(13.5, wCont, 'KM...............: ' + QROSCapaNUM_KM.Text);
    wCont := wCont + 1;
    Imp.WriteXY(0.2, wCont, 'DT.EMISSAO.......: ' + QROSCapaDT_EMISSAO.Text);
    wCont := wCont + 1;
    Imp.WriteXY(0.2, wCont, 'DT.ENTRADA.......: ' + QROSCapaDT_ENTRADA.Text);
    Imp.WriteXY(13.5, wCont, 'MODELO...........: ' + QROSCapaDESC_MODELO.Text);
    wCont := wCont + 1;
    Imp.WriteXY(0.2, wCont, 'PREVISAO SAIDA...: ' + QROSCapaDT_PREVISAOSAIDA.Text);
    Imp.WriteXY(13.5, wCont, 'MOTOR............: ' + QROSCapaNUM_MOTOR.Text);
    wCont := wCont + 1;
    Imp.WriteXY(0.2, wCont, 'NR. HORAS P/TRAB.: ');
    Imp.WriteXY(13.5, wCont, 'ANO FABRICACAO...: ' + QROSCapaNUM_ANO_FAB.Text);
    wCont := wCont + 1;
    Imp.WriteXY(0.2, wCont, 'PECAS REQ........: ');
    Imp.WriteXY(13.5, wCont, 'ANO MODELO.......: ' + QROSCapaNUM_ANO.Text); //Arrumei Ano de Fabricação e Modelo pela 3x para a Raquel. Vanessa 03/06/2016

    wCont := wCont + 2;
    Imp.WriteXY(7.5, wCont, 'S E R V I C O S   E X E C U T A D O S');
    wCont := wCont + 2;
    wCopiado := 0;
    wLinha := 1;
    while wCopiado < Length(QROSCapaDESC_SERVICO.Value) do
    begin
      wMens := GetTokStr(QROSCapaDESC_SERVICO.Value, #$D + #$A, wLinha - 1);
      Imp.WriteXY(0.2, wCont, wMens);
      Inc(wCont);
      Inc(wLinha);
      Inc(wCopiado, Length(wMens) + 2);
    end;
//    wCont := 64-wCont;
//    wCont := wCont +3;

  //Para fixar a assinatura proximo ao fim da folha. Raquel, 07/08/2009
    wCont := 51;
    Imp.WriteXY(7.5, wCont, '_____________________________');
    wCont := wCont + 1;
    Imp.WriteXY(7.5, wCont, '  CLIENTE E/OU RESPONSAVEL');
    wCont := wCont + 2;
    Imp.WriteXY(4.2, wCont, 'Aplica-se a garantia de serviço executado a garantia legal do artigo 26 do CDC.');
    wCont := wCont + 1;
    Imp.WriteXY(0.2, wCont, 'Nao nos responsabilizamos por qualquer objeto deixado no interior do veiculo,');
    wCont := wCont + 1;
    Imp.WriteXY(0.2, wCont, 'a nao ser que esteja relacionado e entregue ao recepcionista.');
    wCont := wCont + 1;
    Imp.WriteXY(0.2, wCont, 'Autorizo a execucao dos servicos acima descritos, inclusive a aplicacao de pecas que forem necessarias.');
    Imp.SaltaPagina;
    Imp.FechaImpressora;
  end;
end;

procedure TFOFI0009.SBPreFechamento1Click(Sender: TObject);
var
  wContwLinhaPFechamento: Byte;
  wLpt_Nota: string;
  wTotalPeca, wTotalIsento, wTotalServicoTerceiro, wTotalFornecedor: Real;
  wCOD_FORNECEDOR: Integer;
  wTotalMinuto: Real;
  wTotalHora: Real;
  wValor: Real;
  wMinuto: Real;
  wHora: Real;
  wTotalHoraTrabalhada: string;
begin
  inherited;
  if FOficinaParam = nil then
    FOficinaParam := TFOficinaParam.Create(Application);

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
  begin
    if DMOs.QOSCadNUM_OS.Value > 0 then
    begin
      FOficinaParam.PGRelatorio.Pages[23].TabVisible := True;
      if FOficinaParam.ShowModal = MrOk then
        for wCOD_FORNECEDOR := 1 to StrToInt(FOficinaParam.ME23NumCopias.Text) do //apenas reaproveitando variavel wCOD_FORNECEDOR
          DMOSEmite.EmiteOS(DMOs.QOSCadNUM_OS.Value, (FOficinaParam.RG23Tipo.ItemIndex = 0));
    end;
    Exit;
  end;

  FOficinaParam.PGRelatorio.Pages[3].TabVisible := True;
  FOficinaParam.EdNumOS2.Text := FOFI0009.DBENumOS.Text;
  if FOficinaParam.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      // Verifica se ha marcação em aberto.
      QOSMarcacaoCons.Close;
      QOSMarcacaoCons.SetVariable('NUM_OS', FOficinaParam.EdNumOS2.Text);
      QOSMarcacaoCons.SetVariable('COD_MECANICO', Null);
      QOSMarcacaoCons.SetVariable('IND_SITUACAO', 'I');
      QOSMarcacaoCons.Open;
      if QOSMarcacaoCons.RecordCount > 0 then
        raise exception.Create('Mecanico não foi desmarcado para está O.S.!');
      QOSMarcacaoCons.Close;

      QROSPreFechamento.Close;
      QRServico_Terceiro.Close;
      QROSPreFechamentoMO.Close;

      // Parametros devem ser null para impressão aqui deste relatório.
      QRServico_Terceiro.SetVariable('DT_SERVICO_I', '01/01/1980');
      QRServico_Terceiro.SetVariable('DT_SERVICO_F', '31/12/2060');
      QRServico_Terceiro.SetVariable('COD_CADASTRO', Null);
      QRServico_Terceiro.SetVariable('COD_VENDEDOR', Null);
      QRServico_Terceiro.SetVariable('COD_SERVICO', Null);

      if Trim(FOficinaParam.EdNumOS2.Text) = '' then
        raise exception.Create('Número da O.S. deve ser informada!');

      QROSPreFechamento.SetVariable('NUM_OS', FOficinaParam.EdNumOS2.Text);
      QROSPreFechamento.Open;

      QRServico_Terceiro.SetVariable('NUM_OS', FOficinaParam.EdNumOS2.Text);
      QRServico_Terceiro.Open;

      QROSPreFechamentoMO.SetVariable('NUM_OS', FOficinaParam.EdNumOS2.Text);
      QROSPreFechamentoMO.Open;

      // inicia servico de impressao.
      if QROSPreFechamentoCOD_FILIAL.Value <> 0 then
        wLpt_Nota := DMOracle.BuscaNome('SELECT DESC_LPT_OS FROM TB_FILIAL', 'COD_FILIAL = ' + FloatToStr(QROSPreFechamentoCOD_FILIAL.Value));

      if Trim(wLpt_Nota) = '' then
        wLpt_Nota := 'LPT1';

      if Imp = nil then
        Imp := TImp.Create;
      if Trim(wLpt_Nota) = 'LPT1' then
        Imp.AbreImpressora
      else if Trim(wLpt_Nota) = 'LPT2' then
        Imp.AbreImpressora_Lpt2
      else
        Imp.AbreImpressora_Com2;

      Imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 66);

      wContwLinhaPFechamento := 2;

      if QROSPreFechamento.RecordCount > 0 then
      begin
        Imp.WriteXY(0.2, wContwLinhaPFechamento, DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + FloatToStr(QROSPreFechamentoCOD_FILIAL.Value)));
        Imp.WriteXY(17.3, wContwLinhaPFechamento, DateTimeToStr(Now));
        wContwLinhaPFechamento := wContwLinhaPFechamento + 2;
        Imp.WriteXY(0.2, wContwLinhaPFechamento, 'PRE-FECHAMENTO - Nr. O.S.: ' + QROSPreFechamentoNUM_OS.Text);
        Imp.WriteXY(7.5, wContwLinhaPFechamento, 'TIPO: ' + QROSPreFechamentoIND_TIPO_OS.Text + '-' + QROSPreFechamentoDESC_OS_TIPO.Value);
        wContwLinhaPFechamento := wContwLinhaPFechamento + 2;
        Imp.WriteXY(0.2, wContwLinhaPFechamento, 'CLIENTE: ' + QROSPreFechamentoCOD_CADASTRO.Text + ' - ' + QROSPreFechamentoNOME.Value);
        wContwLinhaPFechamento := wContwLinhaPFechamento + 2;
        Imp.WriteXY(0.2, wContwLinhaPFechamento, '-------------------------------------------------------------------------------------------------------------------------------------');
        wContwLinhaPFechamento := wContwLinhaPFechamento + 1;
        Imp.WriteXY(0.2, wContwLinhaPFechamento, 'ITEM');
        Imp.WriteXY(1.9, wContwLinhaPFechamento, 'DESCRICAO');
        Imp.WriteXY(9.5, wContwLinhaPFechamento, 'QUANT');
        Imp.WriteXY(10.3, wContwLinhaPFechamento, 'DESC.');
        Imp.WriteXY(11.5, wContwLinhaPFechamento, 'VALOR');
        Imp.WriteXY(12.6, wContwLinhaPFechamento, 'SUB-TOTAL');
        Imp.WriteXY(14.1, wContwLinhaPFechamento, 'T.ISENTO');
        Imp.WriteXY(15.3, wContwLinhaPFechamento, 'DATA');
        Imp.WriteXY(17.2, wContwLinhaPFechamento, 'MEC.');
        Imp.WriteXY(18.1, wContwLinhaPFechamento, 'VEND.');
        Imp.WriteXY(19.1, wContwLinhaPFechamento, 'ORC.');
        wContwLinhaPFechamento := wContwLinhaPFechamento + 1;
        Imp.WriteXY(0.2, wContwLinhaPFechamento, '-------------------------------------------------------------------------------------------------------------------------------------');
        inc(wContwLinhaPFechamento);

        wTotalPeca := 0;
        wTotalIsento := 0;
        while not QROSPreFechamento.Eof do
        begin
          Imp.WriteXY(0.2, wContwLinhaPFechamento, QROSPreFechamentoNUM_FABRICANTE.Text);
          Imp.WriteXY(1.9, wContwLinhaPFechamento, QROSPreFechamentoDESC_PRODUTO.Value);
          Imp.WriteXY(9.4, wContwLinhaPFechamento, Bib.NumToTexto(QROSPreFechamentoQT_QUANTIDADE.Value, 0, 5));
          Imp.WriteXY(10.6, wContwLinhaPFechamento, QROSPreFechamentoInd_Desconto.Value);
          Imp.WriteXY(10.8, wContwLinhaPFechamento, Bib.NumToTexto(QROSPreFechamentoVAL_UNITARIO.Value, 2, 9));
          Imp.WriteXY(12.5, wContwLinhaPFechamento, Bib.NumToTexto(QROSPreFechamentoTOTAL_ITENS.Value, 2, 9));
          if (QROSPreFechamentoPERC_TRIBUTADO.Value = 0) and (QROSPreFechamentoPERC_ALIQUOTA.Value = 0) then
            Imp.WriteXY(13.9, wContwLinhaPFechamento, Bib.NumToTexto(QROSPreFechamentototal_isento.Value, 2, 9));

          Imp.WriteXY(15.5, wContwLinhaPFechamento, QROSPreFechamentoDT_EMISSAO_REQUISICAO.Text);
          Imp.WriteXY(17.3, wContwLinhaPFechamento, QROSPreFechamentoCOD_MECANICO.Text);
          Imp.WriteXY(18.4, wContwLinhaPFechamento, QROSPreFechamentoCOD_VENDEDOR.Text);
          Imp.WriteXY(19.3, wContwLinhaPFechamento, QROSPreFechamentoIND_ORCAMENTO.Text);

          if (QROSPreFechamentoPERC_TRIBUTADO.Value = 0) and (QROSPreFechamentoPERC_ALIQUOTA.Value = 0) then
            wTotalIsento := wTotalIsento + QROSPreFechamentoVAL_UNITARIO.Value * QROSPreFechamentoQT_QUANTIDADE.Value
          else
            wTotalPeca := wTotalPeca + QROSPreFechamentoVAL_UNITARIO.Value * QROSPreFechamentoQT_QUANTIDADE.Value;

          QROSPreFechamento.Next;
          if wContwLinhaPFechamento >= 60 then
          begin
            Imp.SaltaPagina;
            wContwLinhaPFechamento := 1;
          end;
          inc(wContwLinhaPFechamento);
        end;
        inc(wContwLinhaPFechamento);
        Imp.WriteXY(7.5, wContwLinhaPFechamento, 'TOTAL DAS PECAS......................: ' + Bib.NumToTexto(wTotalPeca, 2, 9));
        inc(wContwLinhaPFechamento);
        Imp.WriteXY(7.5, wContwLinhaPFechamento, 'TOTAL ITENS ISENTOS/NAO TRIBUTADOS...: ' + Bib.NumToTexto(wTotalIsento, 2, 9));
        inc(wContwLinhaPFechamento);
        Imp.WriteXY(7.5, wContwLinhaPFechamento, 'TOTAL GERAL..........................: ' + Bib.NumToTexto(wTotalPeca + wTotalIsento, 2, 9));
        wContwLinhaPFechamento := wContwLinhaPFechamento + 5;
      end
      else
        MessageDlg('Não itens nesta O.S.!', mtInformation, [mbOk], 0);

      // Impressão servico terceiros
      if QRServico_Terceiro.RecordCount > 0 then
      begin
        Imp.WriteXY(0.2, wContwLinhaPFechamento, 'SERVICO(S) DE TERCEIRO(S)');
        wContwLinhaPFechamento := wContwLinhaPFechamento + 2;

        wTotalServicoTerceiro := 0; // Inicia valor da variavel.
        Imp.WriteXY(0.2, wContwLinhaPFechamento, '-------------------------------------------------------------------------------------------------------------------------------------');
        inc(wContwLinhaPFechamento);
        Imp.WriteXY(0.2, wContwLinhaPFechamento, 'DT.SERVICO');
        Imp.WriteXY(2.2, wContwLinhaPFechamento, 'NOTA FISCAL');
        Imp.WriteXY(3.5, wContwLinhaPFechamento, 'DESCRICAO SERVICO');
        Imp.WriteXY(12.2, wContwLinhaPFechamento, 'VENDEDOR');
        Imp.WriteXY(18.2, wContwLinhaPFechamento, 'VALOR');
        inc(wContwLinhaPFechamento);
        Imp.WriteXY(0.2, wContwLinhaPFechamento, '-------------------------------------------------------------------------------------------------------------------------------------');
        inc(wContwLinhaPFechamento);

        QRServico_Terceiro.First;
        while not QRServico_Terceiro.Eof do
        begin
          wCOD_FORNECEDOR := QRServico_TerceiroCOD_CADASTRO.Value;
          Imp.WriteXY(0.2, wContwLinhaPFechamento, 'FORNECEDOR: ' + QRServico_TerceiroCOD_CADASTRO.Text + ' - ' +
            QRServico_TerceiroNOME_CADASTRO.Value);

          wContwLinhaPFechamento := wContwLinhaPFechamento + 2;
          wTotalFornecedor := 0;
          while not (QRServico_Terceiro.Eof) and
            (wCOD_FORNECEDOR = QRServico_TerceiroCOD_CADASTRO.Value) do
          begin
            Imp.WriteXY(0.2, wContwLinhaPFechamento, QRServico_TerceiroDT_SERVICO.Text);
            Imp.WriteXY(2.2, wContwLinhaPFechamento, QRServico_TerceiroNUM_NOTA.Text);
            Imp.WriteXY(3.5, wContwLinhaPFechamento, QRServico_TerceiroDESC_PRODUTO.Value);
            Imp.WriteXY(12.2, wContwLinhaPFechamento, QRServico_TerceiroCOD_VENDEDOR.Text + ' - ' + QRServico_TerceiroNOME_VENDEDOR.Value);
            Imp.WriteXY(17.7, wContwLinhaPFechamento, Bib.NumToTexto(QRServico_TerceiroVAL_SERVICO.Value, 2, 9));

            // Imprimir Servico de Cada Item - Djeison A. S. - 26/07/2013
            inc(wContwLinhaPFechamento);
            Imp.WriteXY(1.0, wContwLinhaPFechamento, 'SERVICO: ' +
              StringReplace(QRServico_TerceiroDESC_Servico.Text, #$D#$A, '', [rfReplaceAll]));

            // Acumula totais.
            wTotalServicoTerceiro := wTotalServicoTerceiro + QRServico_TerceiroVAL_SERVICO.Value;
            wTotalFornecedor := wTotalFornecedor + QRServico_TerceiroVAL_SERVICO.Value;
            QRServico_Terceiro.Next;
            inc(wContwLinhaPFechamento);
          end;
          inc(wContwLinhaPFechamento);
          Imp.WriteXY(13.2, wContwLinhaPFechamento, 'TOTAL DO FORNECEDOR..........: ' + Bib.NumToTexto(wTotalFornecedor, 2, 9));
          wContwLinhaPFechamento := wContwLinhaPFechamento + 2;
        end;
        Imp.WriteXY(13.2, wContwLinhaPFechamento, 'TOTAL GERAL SERVICO TERCEIROS: ' + Bib.NumToTexto(wTotalServicoTerceiro, 2, 9));
      end
      else
        MessageDlg('Não foi encontrado itens de terceiro!', mtInformation, [mbOk], 0);

      if QROSPreFechamentoMO.RecordCount > 0 then
      begin
        Imp.SaltaPagina;
        wContwLinhaPFechamento := 2;
        Imp.WriteXY(0.2, wContwLinhaPFechamento, 'M A O   DE   O B R A');
        wContwLinhaPFechamento := wContwLinhaPFechamento + 2;
        Imp.WriteXY(0.2, wContwLinhaPFechamento, '-------------------------------------------------------------------------------------------------------------------------------------');
        wContwLinhaPFechamento := wContwLinhaPFechamento + 1;
        Imp.WriteXY(0.2, wContwLinhaPFechamento, 'MECANICO');
        Imp.WriteXY(12.6, wContwLinhaPFechamento, 'DATA');
        Imp.WriteXY(15.5, wContwLinhaPFechamento, 'HR. INICIO');
        Imp.WriteXY(17.2, wContwLinhaPFechamento, 'HR. FINAL');
        inc(wContwLinhaPFechamento);
        Imp.WriteXY(0.2, wContwLinhaPFechamento, '-------------------------------------------------------------------------------------------------------------------------------------');
        inc(wContwLinhaPFechamento);
        while not QROSPreFechamentoMO.Eof do
        begin
          Imp.WriteXY(0.2, wContwLinhaPFechamento, QROSPreFechamentoMOCOD_MECANICO.Text + '-' + QROSPreFechamentoMONOME.Value);
          Imp.WriteXY(12.2, wContwLinhaPFechamento, QROSPreFechamentoMODT_LANCAMENTO.Text);

          Imp.WriteXY(16.0, wContwLinhaPFechamento, Bib.NumToTexto(QROSPreFechamentoMOHR_INICIO.Value, 2, 5));
          Imp.WriteXY(17.7, wContwLinhaPFechamento, Bib.NumToTexto(QROSPreFechamentoMOHR_FINAL.Value, 2, 5));
          // Soma horas trabalhadas.
//          wtotalhoratrabalhada:= wtotalhoratrabalhada+(QROSPreFechamentoMOHR_FINAL.Value-QROSPreFechamentoMOHR_INICIO.Value);
          inc(wContwLinhaPFechamento);
          QROSPreFechamentoMO.Next;
        end;

        // Calcula horas
        wTotalMinuto := 0;
        QROSPreFechamentoMO.first;
        while not (QROSPreFechamentoMO.eof) do
        begin
          wTotalMinuto := wTotalMinuto + ConverteMinuto(QROSPreFechamentoMOHR_FINAL.Value) - ConverteMinuto(QROSPreFechamentoMOHR_INICIO.Value);
          QROSPreFechamentoMO.Next;
        end;
        wTotalHora := (wTotalMinuto / 60);
        wValor := wTotalHora * QROSPreFechamentoMOVAL_HORA_MECANICO.Value;
        wMinuto := Frac(wTotalMinuto / 60);
        wHora := Int(wMinuto / 60);

        while (wMinuto >= 0.6) do
        begin
          wHora := wHora + 1;
          wMinuto := wMinuto - 0.6;
        end;
        wTotalHoraTrabalhada := ConverteHora((wHora + wMinuto));

        inc(wContwLinhaPFechamento);
        QROSPreFechamentoMOhoras_trabalhadas.Value := wTotalHoraTrabalhada;
        QROSPreFechamentoMOvalor_horas_trabalhadas.Value := FloatToStr(wValor);

        Imp.WriteXY(10.2, wContwLinhaPFechamento, 'NUMERO DE HORAS CADASTRADAS.:     ' + IntToStr(QROSPreFechamentoMO.RecordCount));
        inc(wContwLinhaPFechamento);
        Imp.WriteXY(10.2, wContwLinhaPFechamento, 'NUMERO DE HORAS TRABALHADAS.:     ' + FormatFloat('00.00', wTotalHora));
        inc(wContwLinhaPFechamento);
        Imp.WriteXY(10.2, wContwLinhaPFechamento, 'VALOR DE HORAS TRABALHADAS..: ' + Bib.NumToTexto(wValor, 2, 6));

        // inicializa valor das variaveis para impressão.
      end;
      Imp.FechaImpressora;
    end;
  end;
end;

procedure TFOFI0009.SBFinalizaMarcacaoClick(Sender: TObject);
begin
  inherited;
  if FMarcacaoFinalizar = nil then
    FMarcacaoFinalizar := TFMarcacaoFinalizar.Create(Application);
  FMarcacaoFinalizar.ShowModal;
end;

procedure TFOFI0009.SBMarcacaoCadClick(Sender: TObject);
begin
  inherited;
  if FOFI0010 = nil then
    FOFI0010 := TFOFI0010.Create(Application);
  FOFI0010.ShowModal;
end;

procedure TFOFI0009.FormActivate(Sender: TObject);
begin
  inherited;
  with DMOs do
  begin
    QOSCad.Close;
    QOSCad.Open;
  end;
end;

procedure TFOFI0009.RelProdutividadePendente1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
    FOficinaParam := TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[11].TabVisible := True;

  if FOficinaParam.ShowModal = mrOk then
  begin
    if (Trim(FOficinaParam.ME12Dt_Emissao_I.Text) = '') or
      (Trim(FOficinaParam.ME12Dt_Emissao_F.Text) = '') then
      raise exception.Create('Periodo deve ser informado!');

    with DMOficina do
    begin
      QRProdutividadePendente.Close;
      if Trim(FOficinaParam.ME12CodMecanico.Text) = '' then
        QRProdutividadePendente.SetVariable('COD_MECANICO', Null)
      else
        QRProdutividadePendente.SetVariable('COD_MECANICO', Trim(FOficinaParam.ME12CodMecanico.Text));
      QRProdutividadePendente.SetVariable('DATA_I', Trim(FOficinaParam.ME12Dt_Emissao_I.Text));
      QRProdutividadePendente.SetVariable('DATA_F', Trim(FOficinaParam.ME12Dt_Emissao_F.Text));
      QRProdutividadePendente.Open;

      if FRProdutividadePendente = nil then
        FRProdutividadePendente := TFRProdutividadePendente.Create(Application);
      FRProdutividadePendente.QRLPeriodo.Caption := Trim(FOficinaParam.ME12Dt_Emissao_I.Text) + ' até ' + Trim(FOficinaParam.ME12Dt_Emissao_F.Text);

      if FOficinaParam.RGPreview.ItemIndex = 0 then
        FRProdutividadePendente.QRPrimario.Preview
      else
        FRProdutividadePendente.QRPrimario.Print;

      QRProdutividadePendente.Close;
    end;
  end;
end;

procedure TFOFI0009.RelProdutividadeEncerrada1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
    FOficinaParam := TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[12].TabVisible := True;

  if FOficinaParam.ShowModal = mrOk then
  begin
    if (Trim(FOficinaParam.ME13Dt_Emissao_I.Text) = '') or
      (Trim(FOficinaParam.ME13Dt_Emissao_F.Text) = '') then
      raise exception.Create('Periodo deve ser informado!');

    with DMOficina do
    begin
      QRProdutividadeEncerrada.Close;
      if Trim(FOficinaParam.ME13CodMecanico.Text) = '' then
        QRProdutividadeEncerrada.SetVariable('COD_MECANICO', Null)
      else
        QRProdutividadeEncerrada.SetVariable('COD_MECANICO', Trim(FOficinaParam.ME13CodMecanico.Text));
      QRProdutividadeEncerrada.SetVariable('DATA_I', Trim(FOficinaParam.ME13Dt_Emissao_I.Text));
      QRProdutividadeEncerrada.SetVariable('DATA_F', Trim(FOficinaParam.ME13Dt_Emissao_F.Text));
      QRProdutividadeEncerrada.Open;

      if FRProdutividadeEncerrada = nil then
        FRProdutividadeEncerrada := TFRProdutividadeEncerrada.Create(Application);
      FRProdutividadeEncerrada.QRLPeriodo.Caption := Trim(FOficinaParam.ME13Dt_Emissao_I.Text) + ' até ' + Trim(FOficinaParam.ME13Dt_Emissao_F.Text);

      if FOficinaParam.RGPreview.ItemIndex = 0 then
        FRProdutividadeEncerrada.QRPrimario.Preview
      else
        FRProdutividadeEncerrada.QRPrimario.Print;

      QRProdutividadeEncerrada.Close;
    end;
  end;
end;

procedure TFOFI0009.RelOrdemServioporVeculo1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
    FOficinaParam := TFOficinaParam.Create(Application);
  FOficinaParam.PGRelatorio.Pages[13].TabVisible := True;
  if FOficinaParam.ShowModal = mrOk then
  begin
    if (Trim(FOficinaParam.ME14DtInicio.Text) = '') or
      (Trim(FOficinaParam.ME14DtFim.Text) = '') then
      raise exception.Create('Periodo deve ser informado!');
    with DMOficina_Relatorio do
    begin
      QROSVeiculo.Close;
      if Trim(FOficinaParam.ME14Chassi.Text) = '' then
        QROSVeiculo.SetVariable('NUM_CHASSI', Null)
      else
        QROSVeiculo.SetVariable('NUM_CHASSI', Trim(FOficinaParam.ME14Chassi.Text));

      QROSVeiculo.SetVariable('DT_INICIO', StrToDate(FOficinaParam.ME14DtInicio.Text));
      QROSVeiculo.SetVariable('DT_FIM', StrToDate(FOficinaParam.ME14DtFim.Text));

      QROSVeiculo.Open;

      if FRelOSVeiculo = nil then
        FRelOSVeiculo := TFRelOSVeiculo.Create(Application);
      FRelOSVeiculo.QRLPeriodo.Caption := 'Período de ' + FOficinaParam.ME14DtInicio.Text + ' à ' + FOficinaParam.ME14DtFim.Text;

      if FOficinaParam.RGPreview.ItemIndex = 0 then
        FRelOSVeiculo.QRPrimario.Preview
      else
        FRelOSVeiculo.QRPrimario.Print;

      QROSVeiculo.Close; ;
    end;
  end;
end;

procedure TFOFI0009.RelProdutividadeChapeao1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
    FOficinaParam := TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[16].TabVisible := True;

  if FOficinaParam.ShowModal = mrOk then
  begin
    if (Trim(FOficinaParam.ME16Dt_Emissao_I.Text) = '') or
      (Trim(FOficinaParam.ME16Dt_Emissao_F.Text) = '') then
      raise exception.Create('Periodo deve ser informado!');

    with DMOficina do
    begin
      QRProdutividadeChapeacao.Close;
      if Trim(FOficinaParam.ME16CodMecanico.Text) = '' then
        QRProdutividadeChapeacao.SetVariable('COD_MECANICO', Null)
      else
        QRProdutividadeChapeacao.SetVariable('COD_MECANICO', Trim(FOficinaParam.ME16CodMecanico.Text));
      QRProdutividadeChapeacao.SetVariable('DATA_I', Trim(FOficinaParam.ME16Dt_Emissao_I.Text));
      QRProdutividadeChapeacao.SetVariable('DATA_F', Trim(FOficinaParam.ME16Dt_Emissao_F.Text));
      QRProdutividadeChapeacao.Open;

      if FRProdutividadeChapeacao = nil then
        FRProdutividadeChapeacao := TFRProdutividadeChapeacao.Create(Application);
      FRProdutividadeChapeacao.QRLPeriodo.Caption := Trim(FOficinaParam.ME16Dt_Emissao_I.Text) + ' até ' + Trim(FOficinaParam.ME16Dt_Emissao_F.Text);

      if FOficinaParam.RGPreview.ItemIndex = 0 then
        FRProdutividadeChapeacao.QRPrimario.Preview
      else
        FRProdutividadeChapeacao.QRPrimario.Print;
      QRProdutividadeChapeacao.Close;
    end;
  end;
end;

procedure TFOFI0009.RelProdutividadeServEltrico1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
    FOficinaParam := TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[17].TabVisible := True;

  if FOficinaParam.ShowModal = mrOk then
  begin
    if (Trim(FOficinaParam.ME17Dt_Emissao_I.Text) = '') or
      (Trim(FOficinaParam.ME17Dt_Emissao_F.Text) = '') then
      raise exception.Create('Periodo deve ser informado!');

    with DMOficina_Relatorio do
    begin
      QRProdutividadeServEletrico.Close;
      if Trim(FOficinaParam.ME17CodMecanico.Text) = '' then
        QRProdutividadeServEletrico.SetVariable('COD_MECANICO', Null)
      else
        QRProdutividadeServEletrico.SetVariable('COD_MECANICO', Trim(FOficinaParam.ME17CodMecanico.Text));
      QRProdutividadeServEletrico.SetVariable('DATA_I', Trim(FOficinaParam.ME17Dt_Emissao_I.Text));
      QRProdutividadeServEletrico.SetVariable('DATA_F', Trim(FOficinaParam.ME17Dt_Emissao_F.Text));
      QRProdutividadeServEletrico.Open;

      if FRProdutividadeServEletrico = nil then
        FRProdutividadeServEletrico := TFRProdutividadeServEletrico.Create(Application);
      FRProdutividadeServEletrico.QRLPeriodo.Caption := Trim(FOficinaParam.ME17Dt_Emissao_I.Text) + ' até ' + Trim(FOficinaParam.ME17Dt_Emissao_F.Text);

      if FOficinaParam.RGPreview.ItemIndex = 0 then
        FRProdutividadeServEletrico.QRPrimario.Preview
      else
        FRProdutividadeServEletrico.QRPrimario.Print;
      QRProdutividadeServEletrico.Close;
    end;
  end;
end;

procedure TFOFI0009.GeraPrFechamentonoWord1Click(Sender: TObject);
var
  wTotalPeca, wTotalIsento, wTotalServicoTerceiro, wTotalFornecedor: Real;
  wCOD_FORNECEDOR, wCont: Integer;
  wTotalMinuto: Real;
  wTotalHora: Real;
  wValor: Real;
  wMinuto: Real;
  wHora: Real;
  wTotalHoraTrabalhada: string;
  Document, Range: Variant;
  wAux: string;
  wProduto: string;
begin
  inherited;
  wCont := 0;
  if FOficinaParam = nil then
    FOficinaParam := TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[3].TabVisible := True;
  FOficinaParam.EdNumOS2.Text := FOFI0009.DBENumOS.Text;

  if FOficinaParam.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      // Verifica se ha marcação em aberto.
      QOSMarcacaoCons.Close;
      QOSMarcacaoCons.SetVariable('NUM_OS', FOficinaParam.EdNumOS2.Text);
      QOSMarcacaoCons.SetVariable('COD_MECANICO', Null);
      QOSMarcacaoCons.SetVariable('IND_SITUACAO', 'I');
      QOSMarcacaoCons.Open;
      if QOSMarcacaoCons.RecordCount > 0 then
        raise exception.Create('Mecanico não foi desmarcado para está O.S.!');
      QOSMarcacaoCons.Close;

      QROSPreFechamento.Close;
      QRServico_Terceiro.Close;
      QROSPreFechamentoMO.Close;

      // Parametros devem ser null para impressão aqui deste relatório.
      QRServico_Terceiro.SetVariable('DT_SERVICO_I', '01/01/1980');
      QRServico_Terceiro.SetVariable('DT_SERVICO_F', '31/12/2060');
      QRServico_Terceiro.SetVariable('COD_CADASTRO', Null);
      QRServico_Terceiro.SetVariable('COD_VENDEDOR', Null);
      QRServico_Terceiro.SetVariable('COD_SERVICO', Null);

      if Trim(FOficinaParam.EdNumOS2.Text) = '' then
        raise exception.Create('Número da O.S. deve ser informada!');

      QROSPreFechamento.SetVariable('NUM_OS', FOficinaParam.EdNumOS2.Text);
      QROSPreFechamento.Open;

      QRServico_Terceiro.SetVariable('NUM_OS', FOficinaParam.EdNumOS2.Text);
      QRServico_Terceiro.Open;

      QROSPreFechamentoMO.SetVariable('NUM_OS', FOficinaParam.EdNumOS2.Text);
      QROSPreFechamentoMO.Open;

      if QROSPreFechamento.RecordCount > 0 then
      begin
        NewWord := GetOrCreateObject('Word.Application');
        NewWord.Visible := True;
        NewWord.Documents.Add;
        // Obtem documento e paragrafo
        Document := NewWord.Documents.Item(1);
        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(1).Range;
        wAux := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + FloatToStr(QROSPreFechamentoCOD_FILIAL.Value));
        Range.Text := wAux + '                               ' + DateTimeToStr(Now);
        Range.Font.Size := 9;
        Document.Paragraphs.Item(1).Alignment := '0';

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(2).Range;
        Range.Text := 'PRE-FECHAMENTO - Nr. O.S.: ' + QROSPreFechamentoNUM_OS.Text;
        Range.Font.Size := 9;

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(3).Range;
        Range.Text := 'CLIENTE: ' + QROSPreFechamentoCOD_CADASTRO.Text + ' - ' + QROSPreFechamentoNOME.Value;

        Document.Paragraphs.Add;
        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(5).Range;
        Range.Text := '------------------------------------------------------------------------------------------------------';

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(6).Range;
        Range.Text := 'ITEM-DESCRICAO                       QUANT  DESC. VALOR SUB-TOTAL T.ISENTO DATA MEC. VEND. ORC.';

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(7).Range;
        Range.Text := '------------------------------------------------------------------------------------------';

        wTotalPeca := 0;
        wTotalIsento := 0;
        wCont := 8;
        while not QROSPreFechamento.Eof do
        begin
          wProduto := Copy(QROSPreFechamentoDESC_PRODUTO.Value + '                                 ', 1, 33);
          Document.Paragraphs.Add;
          Range := Document.Paragraphs.Item(wCont).Range;
          Range.Text := RMaskCGC_CPF(QROSPreFechamentoNUM_FABRICANTE.Text, 13) + '   ' +
            wProduto + ' ' +
            Bib.NumToTexto(QROSPreFechamentoQT_QUANTIDADE.Value, 0, 5) + ' ' +
            QROSPreFechamentoInd_Desconto.Value + ' ' +
            Bib.NumToTexto(QROSPreFechamentoVAL_UNITARIO.Value, 2, 9) + ' ' +
            Bib.NumToTexto(QROSPreFechamentoTOTAL_ITENS.Value, 2, 9) + ' ' +
          //if (QROSPreFechamentoPERC_TRIBUTADO.Value = 0) and (QROSPreFechamentoPERC_ALIQUOTA.Value = 0) then
          Bib.NumToTexto(QROSPreFechamentototal_isento.Value, 2, 9) + ' ' +

          QROSPreFechamentoDT_EMISSAO_REQUISICAO.Text + ' ' +
            QROSPreFechamentoCOD_MECANICO.Text + ' ' +
            QROSPreFechamentoCOD_VENDEDOR.Text + ' ' +
            QROSPreFechamentoIND_ORCAMENTO.Text;

          if (QROSPreFechamentoPERC_TRIBUTADO.Value = 0) and (QROSPreFechamentoPERC_ALIQUOTA.Value = 0) then
            wTotalIsento := wTotalIsento + QROSPreFechamentoVAL_UNITARIO.Value * QROSPreFechamentoQT_QUANTIDADE.Value
          else
            wTotalPeca := wTotalPeca + QROSPreFechamentoVAL_UNITARIO.Value * QROSPreFechamentoQT_QUANTIDADE.Value;
          inc(wCont);
          QROSPreFechamento.Next;

        end;

        Document.Paragraphs.Add;
        inc(wCont);
        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := 'TOTAL DAS PECAS......................: ' + Bib.NumToTexto(wTotalPeca, 2, 9);
        inc(wCont);

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := 'TOTAL ITENS ISENTOS/NAO TRIBUTADOS...: ' + Bib.NumToTexto(wTotalIsento, 2, 9);
        inc(wCont);

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := 'TOTAL GERAL..........................: ' + Bib.NumToTexto(wTotalPeca + wTotalIsento, 2, 9);
        inc(wCont);

      end
      else
        MessageDlg('Não itens nesta O.S.!', mtInformation, [mbOk], 0);

      // Impressão servico terceiros
      if QRServico_Terceiro.RecordCount > 0 then
      begin
        Document.Paragraphs.Add;
        inc(wCont);
        Document.Paragraphs.Add;
        inc(wCont);
        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := 'SERVICO(S) DE TERCEIRO(S)';
        inc(wCont);

        wTotalServicoTerceiro := 0; // Inicia valor da variavel.
        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := '-------------------------------------------------------------------------------------';
        inc(wCont);

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := 'DT.SERVICO   NOTA FISCAL   DESCRICAO SERVICO   VENDEDOR   VALOR       ';
        inc(wCont);

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := '-------------------------------------------------------------------------------------';
        inc(wCont);

        QRServico_Terceiro.First;
        while not QRServico_Terceiro.Eof do
        begin
          wCOD_FORNECEDOR := QRServico_TerceiroCOD_CADASTRO.Value;

          Document.Paragraphs.Add;
          Range := Document.Paragraphs.Item(wCont).Range;
          Range.Text := 'FORNECEDOR: ' + QRServico_TerceiroCOD_CADASTRO.Text + ' - ' + QRServico_TerceiroNOME_CADASTRO.Value;
          inc(wCont);

          Document.Paragraphs.Add;
          Range := Document.Paragraphs.Item(wCont).Range;
          Range.Text := 'SERVICO: ' + QRServico_TerceiroDESC_Servico.Value;
          inc(wCont);

          wTotalFornecedor := 0;
          while not (QRServico_Terceiro.Eof) and
            (wCOD_FORNECEDOR = QRServico_TerceiroCOD_CADASTRO.Value) do
          begin
            Document.Paragraphs.Add;
            Range := Document.Paragraphs.Item(wCont).Range;
            Range.Text := QRServico_TerceiroDT_SERVICO.Text + '    ' + QRServico_TerceiroNUM_NOTA.Text + '   ' + QRServico_TerceiroDESC_PRODUTO.Value +
              '   ' + QRServico_TerceiroCOD_VENDEDOR.Text + ' - ' + QRServico_TerceiroNOME_VENDEDOR.Value + '   ' +
              '   ' + Bib.NumToTexto(QRServico_TerceiroVAL_SERVICO.Value, 2, 9);
            inc(wCont);

            // Acumula totais.
            wTotalServicoTerceiro := wTotalServicoTerceiro + QRServico_TerceiroVAL_SERVICO.Value;
            wTotalFornecedor := wTotalFornecedor + QRServico_TerceiroVAL_SERVICO.Value;
            QRServico_Terceiro.Next;
          end;

          Document.Paragraphs.Add;
          inc(wCont);
          Document.Paragraphs.Add;
          Range := Document.Paragraphs.Item(wCont).Range;
          Range.Text := 'TOTAL DO FORNECEDOR..........: ' + Bib.NumToTexto(wTotalFornecedor, 2, 9);
          inc(wCont);
        end;

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := 'TOTAL GERAL SERVICO TERCEIROS: ' + Bib.NumToTexto(wTotalServicoTerceiro, 2, 9);
        inc(wCont);
      end
      else
        MessageDlg('Não foi encontrado itens de terceiro!', mtInformation, [mbOk], 0);

      if QROSPreFechamentoMO.RecordCount > 0 then
      begin
        //Imp.SaltaPagina;
        Document.Paragraphs.Add;
        inc(wCont);
        Document.Paragraphs.Add;
        inc(wCont);
        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := 'M A O   DE   O B R A';
        inc(wCont);

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := '--------------------------------------------------------------------------------------';
        inc(wCont);

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := 'MECANICO       DATA         HR. INICIO         HR. FINAL';
        inc(wCont);

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := '--------------------------------------------------------------------------------------';
        inc(wCont);

        while not QROSPreFechamentoMO.Eof do
        begin
          Document.Paragraphs.Add;
          Range := Document.Paragraphs.Item(wCont).Range;
          Range.Text := QROSPreFechamentoMOCOD_MECANICO.Text + '-' + QROSPreFechamentoMONOME.Value + '   ' +
            QROSPreFechamentoMODT_LANCAMENTO.Text + '   ' + Bib.NumToTexto(QROSPreFechamentoMOHR_INICIO.Value, 2, 5) +
            '   ' + Bib.NumToTexto(QROSPreFechamentoMOHR_FINAL.Value, 2, 5);
          inc(wCont);
          // Soma horas trabalhadas.
//          wtotalhoratrabalhada:= wtotalhoratrabalhada+(QROSPreFechamentoMOHR_FINAL.Value-QROSPreFechamentoMOHR_INICIO.Value);

          QROSPreFechamentoMO.Next;
        end;

        // Calcula horas
        wTotalMinuto := 0;
        QROSPreFechamentoMO.first;
        while not (QROSPreFechamentoMO.eof) do
        begin
          wTotalMinuto := wTotalMinuto + ConverteMinuto(QROSPreFechamentoMOHR_FINAL.Value) - ConverteMinuto(QROSPreFechamentoMOHR_INICIO.Value);
          QROSPreFechamentoMO.next;
        end;
        wTotalHora := (wTotalMinuto / 60);
        wValor := wTotalHora * QROSPreFechamentoMOVal_Hora_mecanico.Value;
        wMinuto := Frac(wTotalMinuto / 60);
        wHora := Int(wMinuto / 60);

        while (wMinuto >= 0.6) do
        begin
          wHora := wHora + 1;
          wMinuto := wMinuto - 0.6;
        end;
        wTotalHoraTrabalhada := ConverteHora((wHora + wMinuto));

        QROSPreFechamentoMOhoras_trabalhadas.Value := wTotalHoraTrabalhada;
        QROSPreFechamentoMOvalor_horas_trabalhadas.Value := FloatToStr(wValor);

        Document.Paragraphs.Add;
        inc(wCont);
        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := 'NUMERO DE HORAS CADASTRADAS.:     ' + IntToStr(QROSPreFechamentoMO.RecordCount);
        inc(wCont);

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := 'NUMERO DE HORAS TRABALHADAS.:     ' + FormatFloat('00.00', wTotalHora);
        inc(wCont);

        Document.Paragraphs.Add;
        Range := Document.Paragraphs.Item(wCont).Range;
        Range.Text := 'VALOR DE HORAS TRABALHADAS..: ' + Bib.NumToTexto(wValor, 2, 6);
        inc(wCont);
        // inicializa valor das variaveis para impressão.
      end;
      //Imp.FechaImpressora;
    end;
  end;

end;

procedure TFOFI0009.DSPrimarioDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  PSaida.Visible := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS')
      or (DMOs.QOsCadIND_SITUACAO.Value = 'F');
end;

procedure TFOFI0009.DBPFilialDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  FormConsulta := FFilialCons;
  QueryConsulta := DMFilial.QFilialCons;
end;

procedure TFOFI0009.DBPMecanicoDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FMecanicoCons = nil then
    FMecanicoCons := TFMecanicoCons.Create(Application);
  FormConsulta := FMecanicoCons;
  QueryConsulta := DMOficina.QMecanicoCons;
end;

function TFOFI0009.AgronewsNaoRenderizar(Sender: TObject): Boolean;
begin
  inherited;
  Result := DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS';
end;

procedure TFOFI0009.DBPTipoDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FOFI0008 = nil then
    FOFI0008 := TFOFI0008.Create(Application);
  FormConsulta := FOFI0008;
  QueryConsulta := DMOficina.QOS_TipoCons;
end;

function TFOFI0009.AgronewsRenderizar(Sender: TObject): Boolean;
begin
  inherited;
  Result := DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS';
end;

procedure TFOFI0009.DBPVendedorDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  FormConsulta := FVendedorCons;
  QueryConsulta := DMVendedor.QVendedorCons;
end;

procedure TFOFI0009.DBPCadastroDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  FormConsulta := FCadastroCons;
  QueryConsulta := DMCadastro.QCadastroCons;
end;

procedure TFOFI0009.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 123 then
    SBVeiculoCons.Click;
end;

procedure TFOFI0009.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
  begin
    LblKm.Caption := 'Horas Equipamento'; //Para AgroNews o marcador das máquinas consertadas não é Km, é Horas
    LblDtEmissao.Caption := 'Dt. Abertura';
    DBPVendedor.LCaption := 'Atendente';
    PNaturezaLocal.Parent := TSOS;
    Bib.inverteControles(PNaturezaLocal, DBPFilial);
    PNaturezaLocal.TabOrder := DBPFilial.TabOrder;
    DMOs.QOsCadDT_LIMITEHORAS.EditMask := '###:##;1;_';
  end;
//  TSOutros.TabVisible := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS'); //Aba com campos para AgroNews. Não aparece para outras empresas.
  TSOutros.TabVisible := False;
end;

procedure TFOFI0009.OSCAPA1Click(Sender: TObject);
begin
  inherited;

  if Trim(DBENumOS.Text) = '' then
    Raise Exception.Create('Selecione uma O.S!');

  DMOficina.QROSCapa.Close;
  DMOficina.QROSCapa.SetVariable('NUM_OS',Trim(DBENumOS.Text));
  DMOficina.QROSCapa.Open;
  if FROSCapa = nil then
    FROSCapa := TFROSCapa.Create(Application);
  FROSCapa.QRPrimario.Preview;

end;

procedure TFOFI0009.OSPrFechamento1Click(Sender: TObject);
begin
  inherited;
  SBPreFechamentoClick(Sender);
end;

procedure TFOFI0009.DBPMecanicoValidate(Sender: TObject; Value: Variant;
  var isValid: Boolean; var Msg: String);
var wSituacao: String;
begin
  inherited;
  isValid := true;
  if Value <> Null then
  begin
    wSituacao := DMOracle.FastSelect('IND_SITUACAO','TB_MECANICO','COD_MECANICO = '+String(Value));
    if wSituacao <> 'A' then
    begin
      isValid := False;
      Msg := 'Selecione um mecânico com cadastro ativo.';
    end;
  end;
end;

end.

