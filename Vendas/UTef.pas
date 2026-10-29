unit UTef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, TefUtils, Registry;

type
  TFTEF = class(TForm)
    lbMensagem: TLabel;
    btIniciaTef: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btIniciaTefClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    tef: TTefUtils;
    FValorTransacao: Double;
    FValorDinheiro: Double;
    FValorDesconto: Double;
    FTipoComprovante: String;
    FFilial: String;
    FModalidade: Integer;
    FComprovantes: TStringList;
    FFormaPagamento:String;
    FNumNota: String;
    FCodNotaCab: Integer;
    FCodValePresente: Integer;
    FPrimeiraInicializacao: Boolean;
    Registry: TRegistry;
    TerminalTEF: String;
    NSU: String;
    Resultado: Integer;
    wNMenu: Integer;
    FIndPaf: Boolean;
    FIndNFCe: Boolean;
    function CriaListaItens(str: String): TStrings;
    procedure RealizaPagamentoTEF();
    procedure RealizaPagamentoPAF();
    procedure RealizaPagamentoNFCe();
    procedure RealizaTransacaoGerencial();
    procedure Fechar;
  public
    { Public declarations }
    ValorTotal: Real;
    property Modalidade: Integer read FModalidade write FModalidade;
    property Comprovantes: TStringList read FComprovantes write FComprovantes;
    property TipoComprovante: String read FTipoComprovante write FTipoComprovante;
    property ValorTransacao: double read FValorTransacao write FValorTransacao;
    property ValorDinheiro: double read FValorDinheiro write FValorDinheiro;
    property ValorDesconto: double read FValorDesconto write FValorDesconto;
    property FormaPagamento: String read FFormaPagamento write FFormaPagamento;
    property NumNota: String read FNumNota write FNumNota;
    property CodNotaCab: Integer read FCodNotaCab write FCodNotaCab;
    property CodValePresente: Integer read FCodValePresente write FCodValePresente;
    property PrimeiraInicializacao: Boolean read FPrimeiraInicializacao write FPrimeiraInicializacao;
    property Filial: String read FFilial write FFilial;
    function Inicia(pValorTransacao, pNumNota: String): Integer;
    function Configura: Integer;
    procedure Finaliza(Operacao: Integer);
    procedure FinalizaTransacaoPendente;
    property IndPaf: Boolean read FIndPaf write FIndPaf;
    property IndNFCe: Boolean read FIndNFCe write FIndNFCe;
    function ImprimeTransacaoTEF(): Boolean;


  end;
var
  FTEF: TFTEF;

implementation

uses UNotaSaida_cl, UOracle_cl, UBiblioteca, URadioDialog,
  UTefInputBox, UImpressoraFiscal, UParamSistema_cl, UUsuario_cl, Math,
  StrUtils, UTefInputBoxCheque, UTef_cl, DateUtils, UNfe_cl,
  UDevolucaoTroca_cl;

{$R *.dfm}

function TFTEF.Inicia(pValorTransacao, pNumNota: String): Integer;
var
    // Variáveis usadas pelas funções TEF e/ou impressora fiscal.
    iRetorno, ProximoComando, TipoCampo: integer;
    TamanhoMinimo, TamanhoMaximo: smallint;
    Buffer: array [0..20000] of char;
    Msg   : array [0..22000] of char;
    Opcao, wCabecalho: String;
    wFinaliza: Integer;
    cFormaPagto, cModalidadePagto: String;
    wNumNota, wOperador, wData, wHora: String;
    iSenha: Boolean;
    wTipoComprovante, wParametrosAdic: string;
    wValorCancelamento: String;
    Aux, wTextoPinPad, redeAutorizadora, bandeiraCartao: string;
    wTransacaoAprovada: Boolean;
    modalResult, wQtdeLinhas: Integer;
begin
    //AssignFile(log, 'log.txt');
    //Rewrite(log);
    wOperador := dmoracle.FastSelect('NOME', 'TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));

    wData := FormatDateTime('yyyyMMdd', Now);
    wHora := FormatDateTime('HHmmss', Now);
    //inicia
    wParametrosAdic := '{TipoTratamento=4}';
    iRetorno := IniciaFuncaoSiTefInterativo(FModalidade,
                                            PAnsiChar(PAnsiString(pValorTransacao)),
                                            PAnsiChar(PAnsiString(pNumNota)),
                                            PAnsiChar(PAnsiString(wData)),
                                            PAnsiChar(PAnsiString(wHora)),
                                            PAnsiChar(PAnsiString(wOperador)),
                                            PAnsiChar(PAnsiString(wParametrosAdic)));

    if iRetorno <> 10000 then
    begin
      FTEF.FormStyle := fsNormal;
      tef.AnalisaRetornoTEF(iRetorno);
      FTEF.FormStyle := fsStayOnTop;
      Application.ProcessMessages;
      Result := iRetorno;
      Abort;
    end;

     //Inicializa algumas variáveis utilizadas no TEF  
    wNMenu:= 0;
    ProximoComando:= 0;
		TipoCampo:= 0;
		TamanhoMinimo:= 0;
		TamanhoMaximo:= 0;
		Resultado:= 0;
    wTransacaoAprovada := false;
		repeat
		  Application.ProcessMessages;

      // passa o conteúdo do buffer e os parâmetros retornados pelo TEF para a variável Aux, e depois escreve no arquivo de logs
      Aux := 'Enviado --> ProximoComando = ' + IntToStr(ProximoComando)  + ' Tipo = ' +
				IntToStr(TipoCampo) + ' Tmin = ' + Inttostr(TamanhoMinimo) + ' Tmax = ' + Inttostr(TamanhoMaximo);
		  Aux := Aux + ' Buffer = ';
		  fillchar (Msg,sizeof(Msg),0);
		  move (aux[1],Msg[0],length(aux));
		  move (Buffer[0], Msg[(length(aux))],sizeof(Buffer));


		  iRetorno:= ContinuaFuncaoSiTefInterativo (ProximoComando, TipoCampo, TamanhoMinimo,
										TamanhoMaximo, Buffer, sizeof (Buffer),
										Resultado);
      //Writeln(Log, 'Antes');
      //Mostrar o que retornou nos comandos
      Aux := 'Retornado -> ProximoComando = ' + IntToStr(ProximoComando)  + ' Tipo = ' +
				IntToStr(TipoCampo) + ' Tmin = ' + Inttostr(TamanhoMinimo) + ' Tmax = ' + Inttostr(TamanhoMaximo);
		  Aux := Aux + ' Buffer = ';
		  fillchar (Msg,sizeof(Msg),0);
		  move (aux[1],Msg[0],length(aux));
		  move (Buffer[0], Msg[(length(aux))],sizeof(Buffer));
      //Writeln(Log, 'Depois');
      //Writeln(Log, Msg);

		  if iRetorno = 10000 then
		  begin
        case (ProximoComando) of
          0:
          begin
            case (TipoCampo) of
              0: Buffer := '';
              101: cFormaPagto := Buffer;
              102:
              begin
                if Trim(FormaPagamento) = '' then
                  FormaPagamento := Buffer;
                if Trim(cModalidadePagto) = '' then
                  cModalidadePagto := buffer;
              end;
              57, 58: FTipoComprovante := 'REIMPRESSAO';
              100:
              begin
                if Buffer[0] = '9' then
                  FTipoComprovante := 'COMPROVANTE'
                else
                  FTipoComprovante := 'PAGAMENTO';
              end;
              110: FTipoComprovante := 'CANCELAMENTO';
              120:
              begin
                FTEF.FormStyle := fsNormal;
                MessageDlg(Buffer, mtInformation, [mbOK], 0);
                FTEF.FormStyle := fsStayOnTop;
                Application.ProcessMessages;
              end;
              121, 122:
              begin
                FComprovantes.Add(Buffer);
              end;
              131:
              begin
                redeAutorizadora := Buffer;

              end;
              132:
              begin
                bandeiraCartao := Buffer;

              end;
              134:
              begin
                if FTipoComprovante = 'PAGAMENTO' then
                begin
                  with DMTEF do
                  begin
                    QTefPgto.Insert;
                    QTefPgtoCOD_TEF_CAB.Value := QTefCabCOD_TEF_CAB.Value;
                    QTefPgtoNSU.Value := IfThen((redeAutorizadora = '00125') or (redeAutorizadora = '00006'), rightstr(Buffer,6), Buffer);
                    QTefPgtoDESC_REDE_AUTORIZADORA.Value := redeAutorizadora;
                    QTefPgtoDESC_BANDEIRA_CARTAO.Value := bandeiraCartao;
                    QTefPgto.Post;    
                  end;
                end;
                NSU := IfThen((redeAutorizadora = '00125') or (redeAutorizadora = '00006'), rightstr(Buffer,6), Buffer);
              end;
              70, 71, 72, 161: wTransacaoAprovada := true;
              130:
              begin
                FValorTransacao := FValorTransacao + strtofloat(Buffer);
              end;
              4029:
              begin
                FValorDesconto := FValorDesconto + StrToFloat(Buffer)/100;
              end;
            end;
          end;
          1:
          begin
            lbMensagem.Caption := bib.SubstituiStr(Buffer, '@', #10);
          end;
          3:
          begin
            lbMensagem.Caption := bib.SubstituiStr(Buffer, '@', #10);
            Application.ProcessMessages;
            if wTransacaoAprovada then
              Sleep(1000);
            Application.ProcessMessages;
          end;
          4:  wCabecalho := Buffer;
          11: lbMensagem.Caption := ' ';
          13:
          begin
            lbMensagem.Caption := ' ';
          end;
          20:
          begin
            FTEF.FormStyle := fsNormal;
            if Application.MessageBox ({'Confirma?'}buffer , 'Confirmação', MB_OKCANCEL) = IdCancel then
            begin
              Opcao := '1';
              StrPCopy(Buffer, Opcao);
              Resultado:= 0;
            end
            else
            begin
              Opcao := '0';
              StrPCopy(Buffer, Opcao);
              Resultado:= 0;
            end;
            FTEF.FormStyle := fsStayOnTop;
            Application.ProcessMessages;
          end;
          21:
          begin
            FTEF.FormStyle := fsNormal;
            FRadioDialog.configura('Selecione uma opção', wCabecalho, CriaListaItens(buffer), wNMenu > 0);
            modalResult := FRadioDialog.ShowModal;
            FTEF.FormStyle := fsStayOnTop;
            Application.ProcessMessages;
            if (modalResult = mrOK) then
            begin
              Opcao := IntToStr(FRadioDialog.rgOpcoes.ItemIndex + 1);
              StrPCopy(Buffer, Opcao);
              Resultado:= 0;
              Inc(wNMenu);
            end
            else if (modalResult = mrCancel) then
              Resultado:= -1
            else if (modalResult = mrAbort) then
            begin
              Resultado:= 1;
              Dec(wNMenu);
            end;
          end;

          22:
          begin
            if Buffer <> 'Homologacao CliSiTef' then
            begin
              FTEF.FormStyle := fsNormal;
              MessageDlg( Buffer, mtWarning, [mbOK], 0);
              FTEF.FormStyle := fsStayOnTop;
              Application.ProcessMessages;
            end;
          end;
          30:
          begin
            FTEF.FormStyle := fsNormal;
            FTefInputBox.configura('Informe o valor solicitado', buffer, true, wNMenu > 0, TamanhoMinimo, TamanhoMaximo,
              'DADOS', TipoCampo);
            modalResult := FTefInputBox.ShowModal;
            FTEF.FormStyle := fsStayOnTop;
            Application.ProcessMessages;
            if (modalResult = mrOK) then
            begin
              Opcao := FTefInputBox.edValor.Text;
              StrPCopy(Buffer, Opcao);
              Resultado:= 0;
              Inc(wNMenu);
            end
            else if (modalResult = mrCancel) then
              Resultado:= -1
            else if (modalResult = mrAbort) then
            begin
              Resultado:= 1;
              Dec(wNMenu);
            end;
          end;
          31:
          begin
            FTEF.FormStyle := fsNormal;
            modalResult := FTefInputBoxCheque.ShowModal;
            FTEF.FormStyle := fsStayOnTop;
            Application.ProcessMessages;
            if (modalResult = mrOK) then
            begin
              Opcao := FTefInputBoxCheque.InfoCheque;
              StrPCopy(Buffer, Opcao);
              Resultado:= 0;
              Inc(wNMenu);
            end
            else if (modalResult = mrCancel) then
              Resultado:= -1
            else if (modalResult = mrAbort) then
            begin
              Resultado:= 1;
              Dec(wNMenu);
            end;
          end;
          32, 33, 35, 38:
          begin
            Resultado:= 0;
          end;
          34:
          begin
            FTEF.FormStyle := fsNormal;
            FTefInputBox.configura('Informe o valor solicitado', buffer, true, wNMenu > 0, TamanhoMinimo, TamanhoMaximo,
              'VALOR', TipoCampo);
            modalResult := FTefInputBox.ShowModal;
            FTEF.FormStyle := fsStayOnTop;
            Application.ProcessMessages;
            if (modalResult = mrOK) then
            begin
              Opcao := bib.LimpaString(FTefInputBox.edValor.Text, ',');
              StrPCopy(Buffer, Opcao);
              Resultado:= 0;
              Inc(wNMenu);
            end
            else if (modalResult = mrCancel) then
              Resultado:= -1
            else if (modalResult = mrAbort) then
            begin
              Resultado:= 1;
              Dec(wNMenu);
            end;
            if TipoCampo = 146 then
              wValorCancelamento := Opcao;
          end;
        end;
      end;
		until iRetorno <> 10000;
    Result := iRetorno;
    //Writeln(Log, 'Acabou');
end;

function TFTEF.CriaListaItens(str: String): TStrings;
var
  lista: TStrings;
  aux: string;
  i: integer;
begin
  lista := TStringList.Create;
  aux := '';
  for i := 1 to length(str) do
  begin
    if(str[i] <> ';') then
    begin
      aux := aux + str[i];
    end
    else
    begin
      lista.Add(aux);
      aux := '';
    end;
  end;
  result := lista;
end;

procedure TFTEF.FormCreate(Sender: TObject);
var
  wMsg: String;
begin
  try
    Registry := TRegistry.Create;//executa o tregistry
    Registry.RootKey:=HKEY_CURRENT_USER; //abre a chave mestra
    Registry.OpenKey('SOFTWARE\CemapaSistema',true);
    if Registry.ValueExists('FilialTEF') then
      Filial := Registry.ReadString('FilialTEF');

    if (DMOracle.FastSelect('DESC_ID_LOJA_TEF','TB_FILIAL',
      'COD_FILIAL = ' + Filial) <> '') then
    begin
      Registry := TRegistry.Create;//executa o tregistry
      Registry.RootKey:=HKEY_CURRENT_USER; //abre a chave mestra
      Registry.OpenKey('SOFTWARE\CemapaSistema',true);
      if Registry.ValueExists('TerminalTEF') then
        TerminalTEF := Registry.ReadString('TerminalTEF')
      else
        TerminalTEF := '';
      iRetorno := Configura;
      if iRetorno <> 0 then
      begin
        //self.FormStyle := fsNormal;
        tef.AnalisaRetornoTEF(iRetorno);
        //FTEF.FormStyle := fsStayOnTop;
        Application.ProcessMessages;
        Abort;
      end;
      wMsg :='     CEMAPA       INFORMATICA';
      iretorno := EscreveMensagemPermanentePinPad(PAnsiChar(PAnsiString(wMsg)));
      FIndPaf := False;
      FIndNFCe := False;
      FinalizaTransacaoPendente;
    end;
  except on E: Exception do

    raise Exception.Create(E.Message);
  end;
end;

procedure TFTEF.FinalizaTransacaoPendente;
var
  wNumeroNota, wData, wHora, wAuxNSU, wAuxValor, wCodSerieModelo: String;
  idLoja, idTerminal, EnderecoTEF: String;
  retorno, i, iretorno, Operacao : integer;
  NSUs:TStringList;
  wSomaValor, wValorTotal: real;
  ultimaTransEfetuada :boolean;
begin
  NSUs := TStringList.Create;
  wNumeroNota := '';
  wCodSerieModelo := '';
  with DMTEF do
  begin
    QTefCabPendente.Close;
    QTefCabPendente.SetVariable( 'DESC_TERMINAL',TerminalTEF);
    QTefCabPendente.SetVariable('IND_STATUS','PENDENTE');
    QTefCabPendente.Open;

    QTefPgtoPendente.Close;
    QTefPgtoPendente.Open;
    
    if QTefCabPendenteCOD_NOTA_CAB.Value > 0 then
      wCodSerieModelo := DMOracle.FastSelect('COD_SERIE_MODELO','TB_NOTA_CAB','COD_NOTA_CAB = '+
              QTefCabPendenteCOD_NOTA_CAB.Text);
              
    if QTefCabPendente.RecordCount > 0 then
    begin
      while not QTefCabPendente.Eof do
      begin
        if FImpressoraFiscal = nil then
          FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
        Cursor := crHourGlass;

        if (wCodSerieModelo <> '65') and (QTefCabPendenteCOD_NOTA_CAB.Value > 0) then
        begin
          iRetorno := Bematech_FI_VerificaImpressoraLigada;
          if iRetorno = 0 then
            Bematech_FI_TerminaFechamentoCupom('');
          tef.Analisa_iRetorno(iRetorno);
        end;
        Cursor := crDefault;

        wNumeroNota := FloatToStr(QTefCabPendenteNUM_NOTA.Value);
        wValorTotal := QTefCabPendenteVAL_NOTA.Value;
        try
          wSomaValor := 0;
          while not QTefPgtoPendente.Eof do
          begin
            ultimaTransEfetuada := true;
            if QTefPgtoPendenteNSU.Value = '' then
              ultimaTransEfetuada := false
            else
              NSUs.Add(QTefPgtoPendenteNSU.Value);
            if QTefPgtoPendenteVAL_PGTO.Value = 0  then
              ultimaTransEfetuada := false
            else
              wSomaValor := wSomaValor + QTefPgtoPendenteVAL_PGTO.Value;
            QTefPgtoPendente.Next;
          end;
        except
          MessageDlg('Erro ao acessar dados!', mtError, [mbOK], 0);
          ultimaTransEfetuada := false;
        end;
        wData := FormatDateTime('yyyyMMdd', QTefCabPendenteDT_EMISSAO.Value);
        wHora := FormatDateTime('HHmmss', QTefCabPendenteDT_EMISSAO.Value);
        //iRetorno := ObtemQuantidadeTransacoesPendentes(PAnsiChar(PAnsiString(wDataCupom)),PAnsiChar(PAnsiString(wNumeroNota)));

        if ultimaTransEfetuada and (wSomaValor >= wValorTotal) then
        begin
          DMNfe.SetaNfe(Bib.LimpaNumero(DMOracle.BuscaNome('SELECT DESC_CHAVE_ACESSO FROM TB_NOTA_CAB',
                'COD_NOTA_CAB = 0'+QTefCabPendenteCOD_NOTA_CAB.Text)),true);
          if (wCodSerieModelo = '65') and (not StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO) then
          begin
            Operacao := FINALIZA_CANCELANDO;
            FinalizaTransacaoSiTefInterativo(FINALIZA_CANCELANDO,PAnsiChar(PAnsiString(wNumeroNota)),
                                            PAnsiChar(PAnsiString(wData)),
                                            PAnsiChar(PAnsiString(wHora)));
            MessageDlg('Última transação TEF não foi efetuada. A NFC-e não foi autorizada.', mtInformation, [mbOK], 0);
          end
          else
          begin
            Operacao := FINALIZA_CONFIRMANDO;
            FinalizaTransacaoSiTefInterativo(FINALIZA_CONFIRMANDO,PAnsiChar(PAnsiString(wNumeroNota)),
                                              PAnsiChar(PAnsiString(wData)),
                                              PAnsiChar(PAnsiString(wHora)));
            wAuxNSU := '';
            for i:=0 to NSUs.count-1 do
            begin
              if NSUs[i] <> 'Dinheiro' then
                wAuxNSU := wAuxNSU + 'NSU: ' + NSUs[i] + #10;
            end;
            MessageDlg('Transação TEF efetuada. Favor reimprimir os cupons. NSUs'+ #10 + wAuxNSU, mtInformation, [mbOK], 0);
          end;
        end
        else
        begin
          Operacao := FINALIZA_CANCELANDO;
          FinalizaTransacaoSiTefInterativo(FINALIZA_CANCELANDO,PAnsiChar(PAnsiString(wNumeroNota)),
                                            PAnsiChar(PAnsiString(wData)),
                                            PAnsiChar(PAnsiString(wHora)));
          MessageDlg('Última transação TEF não foi efetuada. Favor reter o Cupom.', mtInformation, [mbOK], 0);

        end;

        QTefCabPendente.Edit;
        if Operacao = FINALIZA_CONFIRMANDO then
          QTefCabPendenteIND_STATUS.Value := 'EFETUADA'
        else
          QTefCabPendenteIND_STATUS.Value := 'CANC.PDV';
        QTefCabPendente.Post;

        QTefCabPendente.Next;
      end;
    end
    else
    begin
      QTefCabPendente.Close;
      QTefCabPendente.SetVariable('DESC_TERMINAL',TerminalTEF);
      QTefCabPendente.SetVariable('IND_STATUS','NAOVALID');
      QTefCabPendente.Open;

      if QTefCabPendenteCOD_NOTA_CAB.Value > 0 then
        wCodSerieModelo := DMOracle.FastSelect('COD_SERIE_MODELO','TB_NOTA_CAB','COD_NOTA_CAB = '+
              QTefCabPendenteCOD_NOTA_CAB.Text);

      while not QTefCabPendente.Eof do
      begin
        if FImpressoraFiscal = nil then
          FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
        Cursor := crHourGlass;
        if (wCodSerieModelo <> '65') and (QTefCabPendenteCOD_NOTA_CAB.Value > 0) then
        begin
          iRetorno := Bematech_FI_VerificaImpressoraLigada;
          if iRetorno = 0 then
            Bematech_FI_TerminaFechamentoCupom('');
          tef.Analisa_iRetorno(iRetorno);
        end;
        Cursor := crDefault;
        wNumeroNota := FloatToStr(QTefCabPendenteNUM_NOTA.Value);
        wData := FormatDateTime('yyyyMMdd', QTefCabPendenteDT_EMISSAO.Value);
        wHora := FormatDateTime('HHmmss', QTefCabPendenteDT_EMISSAO.Value);
        FinalizaTransacaoSiTefInterativo(FINALIZA_CANCELANDO,PAnsiChar(PAnsiString(wNumeroNota)),
                                              PAnsiChar(PAnsiString(wData)),
                                              PAnsiChar(PAnsiString(wHora)));
        MessageDlg('Última transação TEF não foi efetuada. Favor reter o Cupom.', mtInformation, [mbOK], 0);
        QTefCabPendente.Edit;
        QTefCabPendenteIND_STATUS.Value := 'CANC.PDV';
        QTefCabPendente.Post;

        QTefCabPendente.Next;
      end;
    end;
  end;
end;

function TFTEF.Configura: Integer;
var
  idLoja, idTerminal, EnderecoTEF, wParametrosAdicionais: String;
begin
  tef := TTefUtils.Create;

  idLoja := DMOracle.FastSelect('DESC_ID_LOJA_TEF','TB_FILIAL','COD_FILIAL = ' +
    Filial);
  idTerminal := TerminalTEF;
  EnderecoTEF := DMOracle.FastSelect('DESC_IP_TEF','TB_FILIAL','COD_FILIAL = ' +
    Filial);

  wParametrosAdicionais := '[VersaoAutomacaoCielo=CEMAPAIN10]';
  Result := ConfiguraIntSiTefInterativoEx(PAnsiChar(PAnsiString(EnderecoTEF)),
                                            PAnsiChar(PAnsiString(idLoja)),
                                            PAnsiChar(PAnsiString(idTerminal)),0,
                                            PAnsiChar(PAnsiString(wParametrosAdicionais)));
end;

procedure TFTEF.Finaliza(Operacao: Integer);
var
  wNumNota, wData, wHora: String;
begin
  if FModalidade = 110 then
    wNumNota := '0'
  else
  begin
    if DMTEF.QTefCabCOD_VALE_PRESENTE.Value > 0 then
      wNumNota := DMDevolucaoTroca.QValeProdutoCOD_VALE_PRODUTO.Text
    else
      wNumNota := DMNotaSaida.QNotaSaidaNUM_NOTA.AsString;
  end;
  wData := FormatDateTime('yyyyMMdd', DMTEF.QTefCabDT_EMISSAO.Value);
  wHora := FormatDateTime('HHmmss', DMTEF.QTefCabDT_EMISSAO.Value);

  FinalizaTransacaoSiTefInterativo(Operacao,PAnsiChar(PAnsiString(wNumNota)),
                                      PAnsiChar(PAnsiString(wData)),
                                      PAnsiChar(PAnsiString(wHora)));
  with DMTEF do
  begin
    if not QTefCab.Eof then
    begin
      QTefCab.Edit;
      if Operacao = FINALIZA_CONFIRMANDO then
        QTefCabIND_STATUS.Value := 'EFETUADA'
      else
        QTefCabIND_STATUS.Value := 'CANC.PDV';
      QTefCab.Post;
    end;
  end;
end;

procedure TFTEF.RealizaPagamentoTEF();
var
  wAuxValor: Real;
  wValor, wAuxValorFormatado: String;
begin
  if FRadioDialog = nil then
      FRadioDialog := TFRadioDialog.Create(Application);
  if FTefInputBox = nil then
    FTefInputBox := TFTefInputBox.Create(Application);
  if FTefInputBoxCheque = nil then
    FTefInputBoxCheque := TFTefInputBoxCheque.Create(Application);
  with DMTEF do
  begin
    QTefCab.Close;
    QTefCab.ClearVariables;
    if FCodValePresente > 0 then
      QTefCab.SetVariable('PK',FCodValePresente);
    if FCodNotaCab > 0 then
      QTefCab.SetVariable('PK',FCodNotaCab);
    QTefCab.Open;
    QTefPgto.Close;
    QTefPgto.Open;
  end;

  Registry := TRegistry.Create;//executa o tregistry
  Registry.RootKey:=HKEY_CURRENT_USER; //abre a chave mestra
  Registry.OpenKey('SOFTWARE\CemapaSistema',true);

  //gravando o numero do cupom que está vinculado ao TEF, para, se necessario, continuar a transação em caso de falha.
  with DMTEF do
  begin
    if not QTefCab.RecordCount = 0 then
      QTefCab.Insert
    else
      QTefCab.Edit;
    if FCodValePresente > 0 then
      QTefCabCOD_VALE_PRESENTE.Value := FCodValePresente;
    if FCodNotaCab > 0 then
      QTefCabCOD_NOTA_CAB.Value := FCodNotaCab;
    QTefCabNUM_NOTA.Value := StrToInt(FNumNota);
    QTefCabVAL_NOTA.Value := FValorTransacao;
    QTefCabIND_STATUS.Value := 'NAOVALID';
    QTefCabDESC_TERMINAL.Value := TerminalTEF;
    QTefCab.Post;

    while not QTefPgto.eof do
      QTefPgto.Delete;

    Application.ProcessMessages;
    ValorTotal := FValorTransacao;
    while (ValorTotal > 0.001) or (iRetorno <> 0) do
    begin
      FTEF.FormStyle := fsNormal;
      FTefInputBox.configura('Valor da Transação', 'Digite o valor', false, false, 0, 14, 'VALOR', 0);
      FTefInputBox.edValor.Text := FormatFloat('##########0.00',ValorTotal);
      FTefInputBox.edValor.SelectAll;
      FTefInputBox.BorderIcons := [];
      FTefInputBox.rgFormaPagamento.Visible := true;
      FTefInputBox.rgFormaPagamento.ItemIndex := 0;
      ModalResult := FTefInputBox.ShowModal;
      if ModalResult = mrOK then
      begin
        FTefInputBox.rgFormaPagamento.Visible := false;
        if FTefInputBox.rgFormaPagamento.ItemIndex = 0 then
        begin
          FTEF.FormStyle := fsStayOnTop;
          Application.ProcessMessages;
          wValor := bib.LimpaString(FTefInputBox.edValor.Text, ',');
          wValor := bib.LimpaString(wValor, '.');

          iRetorno := Inicia(wValor, FNumNota);
          if iRetorno <> 0 then
          begin
            FTEF.FormStyle := fsNormal;
            tef.AnalisaRetornoTEF(iRetorno);
            FTEF.FormStyle := fsStayOnTop;
            Application.ProcessMessages;
          end
          else
          begin
            QTefPgto.Edit;
            QTefPgtoVAL_PGTO.Value := (StrToFloat(wValor) / 100);
            QTefPgto.Post;
            wAuxValor := (StrToFloat(wValor) / 100);
            ValorTotal := ValorTotal - wAuxValor;
          end;
        end
        else
        begin
          QTefPgto.Insert;
          QTefPgtoNSU.Value := 'Dinheiro';
          QTefPgtoVAL_PGTO.Value := StrToFloat(FTefInputBox.edValor.Text);
          QTefPgto.Post;
          FValorTransacao := FValorTransacao - ValorTotal;
          fvalordinheiro := StrToFloat(FTefInputBox.edValor.Text) +
            DMNotaSaida.QNotaSaidaVAL_AVISTA.Value;
          ValorTotal := ValorTotal - StrToFloat(FTefInputBox.edValor.Text);
          iretorno := 0;

          //Insere pagamento em dinheiro no caixa
          with DMDevolucaoTroca do
          begin
            try
              if FCodValePresente > 0 then
              begin
                IncluiCaixa(fvalordinheiro + ValorTotal,
                'VALE-PRESENTE', Filial, QValeProdutoCOD_CADASTRO.Text,
                QTefCabCOD_VALE_PRESENTE.Text, QValeProdutoDT_EMISSAO.Value);
              end;
            Except
              MessageDlg(
                'Não foi possível fazer lançamento em dinheiro no caixa'
                + #13#10 + 'Faça o lançamento manualmente',
                mtError, [mbOk],0);
            end;
          end;
        end;
      end
      else
      begin
        if (MessageDlg('Deseja realmente cancelar? Desta forma toda a transação TEF será cancelada!', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          FImpressoraFiscal.BtCancelaCupomClick(Self);
          Break;
        end;
      end;
    end;
    //CloseFile(log);
  end;
end;

procedure TFTEF.RealizaPagamentoNFCe;
var
  wAuxValor, wValPagamento: Real;
  wValor, wAuxValorFormatado: String;
  wRecNo, mrAux: Integer;
begin
  if FRadioDialog = nil then
      FRadioDialog := TFRadioDialog.Create(Application);
  if FTefInputBox = nil then
    FTefInputBox := TFTefInputBox.Create(Application);
  with DMTEF do
  begin
    QTefCab.Close;
    QTefCab.SetVariable('PK',FCodNotaCab);
    QTefCab.Open;
    QTefPgto.Close;
    QTefPgto.Open;
  end;

  Registry := TRegistry.Create;//executa o tregistry
  Registry.RootKey:=HKEY_CURRENT_USER; //abre a chave mestra
  Registry.OpenKey('SOFTWARE\CemapaSistema',true);

  //gravando o numero do cupom que está vinculado ao TEF, para, se necessario, continuar a transação em caso de falha.
  with DMTEF, DMOracle do
  begin
    if QTefCab.RecordCount = 0 then
      QTefCab.Insert
    else
    begin
      if QTefCabIND_STATUS.Value = 'PENDENTE' then
      begin
        FormStyle := fsNormal;
        Application.ProcessMessages;
        FTEF.Finaliza(FINALIZA_CANCELANDO);
        MessageDlg('Última transação TEF não foi efetuada.', mtInformation, [mbOK], 0);
        FormStyle := fsStayOnTop;
        Application.ProcessMessages;
      end;
      QTefCab.Edit;
    end;
    QTefCabCOD_NOTA_CAB.Value := FCodNotaCab;
    QTefCabNUM_NOTA.Value := StrToInt(FNumNota);
    QTefCabVAL_NOTA.Value := FValorTransacao;
    QTefCabIND_STATUS.Value := 'NAOVALID';
    QTefCabDESC_TERMINAL.Value := TerminalTEF;  
    QTefCab.Post;

    QTefPgto.First;
    while not QTefPgto.eof do
      QTefPgto.Delete;     
    QPagamento.Close;
    QPagamento.Open;

    QPagamento.First;
    Application.ProcessMessages;
    ValorTotal := FValorTransacao;
    FComprovantes.Clear;
    while (ValorTotal > 0.001) or (iRetorno <> 0) do
    begin
      FTEF.FormStyle := fsNormal;
      if DMParamSistema.CodEmpresa = 'ARISTIDES' then
        FTefInputBox.configura('Valor da Transação', 'Digite o valor a ser pago neste cartão', false, false, 0, 14, 'VALOR', 0)
      else
      begin
        FTefInputBox.configura('Valor Total da Transação TEF - R$ '+FormatFloat('##############0.00',FValorTransacao) +
          ' / Nº de Cartões = '+IntToStr(QPagamento.RecordCount) , 'Valor do '+ IntToStr(QPagamento.RecNo) +
          'º pagamento em '+ QPagamentoDESC_PAGAMENTO.Value, false, false, 0, 14, 'VALOR', 0);
        FTefInputBox.edValor.ReadOnly := true;
      end;
      FTefInputBox.edValor.Text := FormatFloat('##########0.00',QPagamentoVAL_VALOR.Value);
      FTefInputBox.edValor.SelectAll;
      FTefInputBox.BorderIcons := [];
      FTefInputBox.rgFormaPagamento.Visible := False;
      FTefInputBox.rgFormaPagamento.ItemIndex := 0;
      ModalResult := FTefInputBox.ShowModal;
      if ModalResult = mrOK then
      begin
        FTEF.FormStyle := fsStayOnTop;
        Application.ProcessMessages;
        wValor := bib.LimpaNumero(FTefInputBox.edValor.Text);
        FTefInputBox.edValor.ReadOnly := False;
        FModalidade := Bib.ift(DMTEF.QPagamentoDESC_PAGAMENTO.Value = 'Cartão de Crédito',3,2);
        iRetorno := Inicia(wValor, FNumNota);
        if iRetorno <> 0 then
        begin
          FTEF.FormStyle := fsNormal;
          tef.AnalisaRetornoTEF(iRetorno);
          FTEF.FormStyle := fsStayOnTop;
          Application.ProcessMessages;
        end
        else
        begin
          QTefPgto.Edit;
          QTefPgtoVAL_PGTO.Value := (StrToFloat(wValor) / 100);
          QTefPgto.Post;
          wAuxValor := (StrToFloat(wValor) / 100);
          ValorTotal := ValorTotal - wAuxValor;
          if not QPagamento.Eof then
          begin           
            if RoundTo(wAuxValor,-2) = RoundTo(QPagamentoVAL_VALOR.Value,-2) then
            begin
              QPagamento.Edit;
              QPagamentoCOD_TEF_PGTO.Value := QTefPgtoCOD_TEF_PGTO.Value;
              QPagamento.Post;
              //owmessage(DMTEF.QTefPgtoDESC_REDE_AUTORIZADORA.Value);
            end
            else
            begin
              QPagamento.Edit;
              wValPagamento := QPagamentoVAL_PAGAMENTO.Value;
              QPagamentoVAL_PAGAMENTO.Value := wAuxValor;
              QPagamentoVAL_VALOR.Value := wAuxValor;
              QPagamentoCOD_TEF_PGTO.Value := QTefPgtoCOD_TEF_PGTO.Value;
              QPagamento.Post;
              wRecNo := QPagamento.RecNo;
              QPagamento.Append;
              FormStyle := fsNormal;
              mrAux := bib.MessageDlgCustomizado('Escolha o tipo de cartão do próximo pagamento.',mtConfirmation,
                  [mbYes,mbOK],['Crédito','Débito']);
              FormStyle := fsStayOnTop;
              if mrAux = mrOK then
                QPagamentoDESC_PAGAMENTO.Value := 'Cartão de Débito'
              else
                QPagamentoDESC_PAGAMENTO.Value := 'Cartão de Crédito';

              QPagamentoVAL_PAGAMENTO.Value := wValPagamento - wAuxValor;
              QPagamentoVAL_VALOR.Value := QPagamentoVAL_PAGAMENTO.Value;
              QPagamento.Post;
              QPagamento.RecNo := wRecNo;
            end;
          end;
          QPagamento.Next;
        end;
      end
      else
      begin
        if (MessageDlg('Deseja realmente cancelar? Desta forma toda a transação TEF será cancelada!', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
          Break; 
      end;

    end;
  end;
end;

procedure TFTEF.RealizaPagamentoPAF();
var
  wAuxValor: Real;
  wValor, wAuxValorFormatado: String;
begin
  if FRadioDialog = nil then
      FRadioDialog := TFRadioDialog.Create(Application);
  if FTefInputBox = nil then
    FTefInputBox := TFTefInputBox.Create(Application);
  if FTefInputBoxCheque = nil then
    FTefInputBoxCheque := TFTefInputBoxCheque.Create(Application);
  with DMTEF do
  begin
    QTefCab.Close;
    QTefCab.SetVariable('PK',FCodNotaCab);
    QTefCab.Open;
    QTefPgto.Close;
    QTefPgto.Open;
  end;

  Registry := TRegistry.Create;//executa o tregistry
  Registry.RootKey:=HKEY_CURRENT_USER; //abre a chave mestra
  Registry.OpenKey('SOFTWARE\CemapaSistema',true);

  //gravando o numero do cupom que está vinculado ao TEF, para, se necessario, continuar a transação em caso de falha.
  with DMTEF do
  begin
    if not QTefCab.RecordCount = 0 then
      QTefCab.Insert
    else
      QTefCab.Edit;
    QTefCabCOD_NOTA_CAB.Value := FCodNotaCab;
    QTefCabNUM_NOTA.Value := StrToInt(FNumNota);
    QTefCabVAL_NOTA.Value := FValorTransacao;
    QTefCabIND_STATUS.Value := 'NAOVALID';
    QTefCabDESC_TERMINAL.Value := TerminalTEF;
    QTefCab.Post;

    while not QTefPgto.eof do
      QTefPgto.Delete;

    Application.ProcessMessages;
    ValorTotal := FValorTransacao;

    FTEF.FormStyle := fsNormal;
    FTefInputBox.configura('Valor da Transação', 'Digite o valor', false, false, 0, 14, 'VALOR', 0);
    FTefInputBox.edValor.Text := FormatFloat('##########0.00',ValorTotal);
    FTefInputBox.edValor.SelectAll;
    FTefInputBox.BorderIcons := [];
    FTefInputBox.rgFormaPagamento.Visible := false;
    FTefInputBox.rgFormaPagamento.ItemIndex := 0;
    ModalResult := FTefInputBox.OkAutomatico;

    if FTefInputBox.rgFormaPagamento.ItemIndex = 0 then
    begin
      FTEF.FormStyle := fsStayOnTop;
      Application.ProcessMessages;
      wValor := bib.LimpaNumero(FTefInputBox.edValor.Text);

      iRetorno := Inicia(wValor, FNumNota);
      if iRetorno <> 0 then
      begin
        FTEF.FormStyle := fsNormal;
        tef.AnalisaRetornoTEF(iRetorno);
        //FTEF.FormStyle := fsStayOnTop;
        Application.ProcessMessages;
        FTEF.ModalResult := mrCancel;
      end
      else
      begin
        QTefPgto.Edit;
        QTefPgtoVAL_PGTO.Value := (StrToFloat(wValor) / 100);
        QTefPgto.Post;
        wAuxValor := (StrToFloat(wValor) / 100);
        ValorTotal := ValorTotal - wAuxValor;
      end;
    end
    else
    begin
      QTefPgto.Insert;
      QTefPgtoNSU.Value := 'Dinheiro';
      QTefPgtoVAL_PGTO.Value := StrToFloat(FTefInputBox.edValor.Text);
      QTefPgto.Post;
      FValorTransacao := FValorTransacao - ValorTotal;
      fvalordinheiro := StrToFloat(FTefInputBox.edValor.Text) +
        DMNotaSaida.QNotaSaidaVAL_AVISTA.Value;
      ValorTotal := ValorTotal - StrToFloat(FTefInputBox.edValor.Text);
      iretorno := 0;

      //Insere pagamento em dinheiro no caixa
      with DMNotaSaida do
      begin
        try
          AtuCaixa((fvalordinheiro - DMNotaSaida.QNotaSaidaVAL_AVISTA.Value +
            (ValorTotal)),
          'A VISTA',QNotaSaidaCOD_OPERACAO.Text,
            QNotaSaidaCOD_FILIAL.Text,QNotaSaidaCOD_DEPARTAMENTO.Text,
            QNotaSaidaNUM_NOTA.Text, QNotaSaidaCOD_CADASTRO.Text,
            QNotaSaidaCOD_NOTA_CAB.Text,'',Trunc(QNotaSaidaDT_RECEBIMENTO.Value));
        Except
          MessageDlg(
            'Não foi possível fazer lançamento em dinheiro no caixa'
            + #13#10 + 'Faça o lançamento manualmente',
            mtError, [mbOk],0);
        end;
      end;
    end;
  end;
end;

procedure TFTEF.RealizaTransacaoGerencial;
var
  wFinaliza: boolean;
begin
  if FRadioDialog = nil then
      FRadioDialog := TFRadioDialog.Create(Application);
  if FTefInputBox = nil then
    FTefInputBox := TFTefInputBox.Create(Application);
  FTefInputBox.rgFormaPagamento.Visible := false;
  FTEF.FormStyle := fsStayOnTop;
  Application.ProcessMessages;
  iRetorno := Inicia(FloatToStr(FValorTransacao), '0');
  Application.ProcessMessages;
  if iRetorno <> 0 then
  begin
    FTEF.FormStyle := fsNormal;
    tef.AnalisaRetornoTEF(iRetorno);
    FTEF.FormStyle := fsStayOnTop;
    Application.ProcessMessages;
    ModalResult := mrCancel;
    Abort;
  end;
  wFinaliza := true;
  FTEF.FormStyle := fsNormal;
  if(Comprovantes.Count > 0) then
  begin
    if DMUsuario.ImpressoraPadraoNFCe <> '' then
    begin
      FIndNFCe := True;
      wFinaliza := ImprimeTransacaoTEF;
    end
    else
      wfinaliza := tef.ImprimeRelatorioGerencial(Comprovantes);
  end;
  if(wfinaliza) then
  begin
    Finaliza(FINALIZA_CONFIRMANDO);
    ModalResult := mrOk;
  end
  else
  begin
    if FTipoComprovante = 'CANCELAMENTO' then
    begin
      Finaliza(FINALIZA_CONFIRMANDO);
      MessageDlg('Transação TEF foi efetuada. Favor reimprimir o Cupom. NSU ' + NSU, mtConfirmation, [mbOK], 0);
      ModalResult := mrOk;
    end
    else
    begin
      Finaliza(FINALIZA_CANCELANDO);
      ModalResult := mrCancel;
    end;
  end;
  FTEF.FormStyle := fsStayOnTop;
  Application.ProcessMessages;
end;

function TFTEF.ImprimeTransacaoTEF: Boolean;
var wResultadoImpressao: Integer;
begin
  result := true;
  if FIndNFCe then
    tef.ImprimeTransacaoTEF(DMUsuario.ImpressoraPadraoNFCe, Comprovantes)
  else
    Result := tef.ImprimeTransacaoTEF(FFormaPagamento, FTipoComprovante, Comprovantes);
end;

procedure TFTEF.btIniciaTefClick(Sender: TObject);
begin
  inherited;
  btIniciaTef.Visible := false;
  lbMensagem.Caption := '';
  if (FModalidade = 0) or (FModalidade in [2,3]) then
  begin
    if IndPaf then
      RealizaPagamentoPAF
    else if IndNFCe then
      RealizaPagamentoNFCe
    else
      RealizaPagamentoTEF
  end
  else
    RealizaTransacaoGerencial;
end;

procedure TFTEF.Fechar;
begin
  Resultado:= 1;
  Dec(wNMenu);
end;

procedure TFTEF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
      Resultado:= 1;
      Dec(wNMenu);
  end;
end;

procedure TFTEF.FormActivate(Sender: TObject);
begin
  //tag := 777;
  //btIniciaTefClick(btIniciaTef);
end;

end.
