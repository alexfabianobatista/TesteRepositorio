unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, IniFiles,
  UCarregando, UConfiguracao, UMysql_cl, UOracle_cl, USmartThread, DB, TrayIcon,
  Menus;

type
  TFMenu = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    btConfigurar: TSpeedButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    dgOS: TDBGrid;
    mmTerminal: TMemo;
    Label2: TLabel;
    Label1: TLabel;
    tmLooping: TTimer;
    tmRetry: TTimer;
    dsOraOS: TDataSource;
    dsOraProdutos: TDataSource;
    dgProduto: TDBGrid;
    btMinimizar: TSpeedButton;
    minIcon: TTrayIcon;
    ppmMinimizado: TPopupMenu;
    Maximizar1: TMenuItem;
    SBAtualizarAgora: TSpeedButton;
    procedure btConfigurarClick(Sender: TObject);
    procedure msgTerminal(wTexto: String);
    procedure criaIniConfig();
    function verificaIniConfig(): Boolean;
    procedure inicializaIniConfig();
    function conectaBancos(): Boolean;
    procedure start();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmRetryTimer(Sender: TObject);
    procedure novaTentativaTerminal();
    procedure tmLoopingTimer(Sender: TObject);
    procedure sincronizaOS();
    procedure sincronizaProdutos();
    procedure btMinimizarClick(Sender: TObject);
    procedure Maximizar1Click(Sender: TObject);
    procedure minimizaAplicacao();
    procedure maximizaAplicacao();
    procedure FormActivate(Sender: TObject);
    procedure SBAtualizarAgoraClick(Sender: TObject);
    procedure gravaLog(wTexto: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;
  iniArquivo : TIniFile;
  myThread : CThread;
  gSincOs : Boolean;
  gSincProduto : Boolean;

implementation

{$R *.dfm}

procedure TFMenu.btConfigurarClick(Sender: TObject);
begin
  If FConfiguracao = Nil then
    FConfiguracao := TFConfiguracao.Create(Application);
  FConfiguracao.ShowModal;
end;

procedure TFMenu.tmRetryTimer(Sender: TObject);
begin
  tmRetry.Enabled := False;
  start();
end;

procedure TFMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmLooping.Enabled := False;
  tmRetry.Enabled := False;
  if myThread <> nil then
  begin
    myThread.Terminate;
  end;
end;

procedure TFMenu.novaTentativaTerminal();
begin
  msgTerminal('Nova tentativa em 15 segundos...');
  tmRetry.Enabled := True;
end;

procedure TFMenu.msgTerminal(wTexto: String);
begin
  wTexto := TimeToStr(Now) + ': ' + wTexto;
  mmTerminal.Lines.Add(wTexto);
end;

procedure TFMenu.gravaLog(wTexto: String);
var
  nomeTxt : String;
  arquivoTxt : TextFile;
begin
  wTexto := DateTimeToStr(Now) + ': ' + wTexto;
  nomeTxt := 'log.txt';
  try
    AssignFile(arquivoTxt, nomeTxt);
    if FileExists(nomeTxt) then
      Append(ArquivoTxt)
    else
      Rewrite(ArquivoTxt);
    WriteLn(arquivoTxt, wTexto);
    CloseFile(arquivoTxt);
  finally

  end;
end;

function TFMenu.verificaIniConfig() : Boolean;
var
  wNomeIni, wLocalIni, wDiretorio : String;
  wIniExiste : Boolean;
begin
  wNomeIni    :=    'config.ini';
  wLocalIni   :=    ExtractFilePath(ParamStr(0));
  wDiretorio  :=    wLocalIni + wNomeIni;
  wIniExiste  :=    FileExists(wDiretorio);

  msgTerminal('Verificando Configurações...');

  if(wIniExiste) then
    Result := True
  else
    Result := False;
end;

procedure TFMenu.criaIniConfig();
var
  wNomeIni, wLocalIni, wDiretorio : String;
begin
  wNomeIni    :=    'config.ini';
  wLocalIni   :=    ExtractFilePath(ParamStr(0));
  wDiretorio  :=    wLocalIni + wNomeIni;

  msgTerminal('Criando arquivo de configuração...');

  try
    iniArquivo := TIniFile.Create(wDiretorio);

    iniArquivo.WriteString('Oracle','Usuario','sistema');
    iniArquivo.WriteString('Oracle','Senha','karitec');
    iniArquivo.WriteString('Oracle','Database','ora');

    iniArquivo.WriteString('Mysql','Host','cemapadb.mysql.dbaas.com.br');
    iniArquivo.WriteString('Mysql','Usuario','cemapadb');
    iniArquivo.WriteString('Mysql','Senha','n1rc3m@p4');
    iniArquivo.WriteString('Mysql','Database','cemapadb');
    iniArquivo.WriteString('Mysql','Porta','3306');

    iniArquivo.WriteString('Outros','Time','60');
    iniArquivo.WriteString('Outros','SincProduto','True');
    iniArquivo.WriteString('Outros','SincOs','True');

  except on Error : Exception do
    try
      msgTerminal('Erro ao criar arquivo de configuração: ' + Error.Message);
      gravaLog('Erro ao criar arquivo de configuração: ' + Error.Message);
    finally

    end;
  end;

  msgTerminal('Arquivo de configuração criado.');
end;

procedure TFMenu.inicializaIniConfig();
var
  wOraUser, wOraSenha, wOraDB : String;
  wMsqlUser, wMsqlSenha, wMsqlDB, wMsqlHost, wMsqlPorta : String;
  wNomeIni, wLocalIni, wDiretorio : String;
  wTime : Integer;
begin
  wNomeIni    :=    'config.ini';
  wLocalIni   :=    ExtractFilePath(ParamStr(0));
  wDiretorio  :=    wLocalIni + wNomeIni;

  try
    iniArquivo := TIniFile.Create(wDiretorio);

    wOraUser := iniArquivo.ReadString('Oracle','Usuario', EmptyStr);
    wOraSenha := iniArquivo.ReadString('Oracle','Senha', EmptyStr);
    wOraDB := iniArquivo.ReadString('Oracle','Database', EmptyStr);

    wMsqlUser := iniArquivo.ReadString('Mysql','Usuario', EmptyStr);
    wMsqlSenha := iniArquivo.ReadString('Mysql','Senha', EmptyStr);
    wMsqlDB := iniArquivo.ReadString('Mysql','Database', EmptyStr);
    wMsqlHost := iniArquivo.ReadString('Mysql','Host', EmptyStr);
    wMsqlPorta := iniArquivo.ReadString('Mysql','Porta', EmptyStr);

    wTime := StrToInt(iniArquivo.ReadString('Outros','Time', EmptyStr));
    gSincOs := StrToBool(iniArquivo.ReadString('Outros','SincOs', EmptyStr));
    gSincProduto := StrToBool(iniArquivo.ReadString('Outros','SincProduto', EmptyStr));

    tmLooping.Interval := (wTime * 1000)*60;

  except on Error : Exception do
    msgTerminal('Erro ao inicializar Configurações: ' + Error.Message);
  end;

  try
    msgTerminal('Configurando acesso Mysql...');

    with DMMysql do
    begin
      conMysql.Connected := False;
      conMysql.Database := wMsqlDB;
      conMysql.User := wMsqlUser;
      conMysql.Password := wMsqlSenha;
      conMysql.HostName := wMsqlHost;
      conMysql.Port := StrToInt(wMsqlPorta);
      conMysql.Connected := True;
    end;

    msgTerminal('Configurando acesso Oracle...');

    with DMOracle do
    begin
      conOracle.Connected := False;
      conOracle.LogonDatabase := wOraDB;
      conOracle.LogonUsername := wOraUser;
      conOracle.LogonPassword := wOraSenha;
      conOracle.Connected := True;
    end;

    FreeAndNil(iniArquivo);

  except on Error : Exception do
    try
      msgTerminal('Erro ao inicializar conexões: ' + Error.Message);
      gravaLog('Erro ao inicializar conexões: ' + Error.Message);
    finally

    end;
  end;
end;

function TFMenu.conectaBancos() : Boolean;
begin
  try
    msgTerminal('Tentando conexão com Base de dados Oracle...');
    DMOracle.conOracle.Connected := True;

    msgTerminal('Tentando conexão com Base de dados Mysql...');
    DMMysql.conMysql.Connected := True;

    Result := True;
  except on Error : Exception do
    try
      msgTerminal('Erro ao conectar com base de dados: ' + Error.Message);
      gravaLog('Erro ao conectar com base de dados: ' + Error.Message);
      novaTentativaTerminal;
    finally
      Result := False;
    end;
  end;

end;

procedure TFMenu.start();
var
  wTime : Double;
begin
  if not verificaIniConfig then
  begin
    criaIniConfig;
    inicializaIniConfig
  end
  else
    inicializaIniConfig;

  if conectaBancos then
  begin
    wTime := tmLooping.Interval;
    tmLooping.Enabled := True;
    msgTerminal('Tudo pronto! Próxima sincronização em (' + FloatToStr((wTime/1000)/60) + ' minutos)');
    minimizaAplicacao;
  end;

end;

procedure TFMenu.tmLoopingTimer(Sender: TObject);
begin
  if not verificaIniConfig then
    criaIniConfig
  else
    inicializaIniConfig;

  if conectaBancos then
  begin
    if gSincProduto then
    begin
      msgTerminal('Buscando produtos...');
      sincronizaProdutos;
    end;
    if gSincOs then
    begin
      msgTerminal('Buscando ordens de serviço...');
      sincronizaOS;
    end;
  end;
end;

procedure TFMenu.maximizaAplicacao();
begin
  minIcon.Visible := False;
  FMenu.Visible := True;
end;

procedure TFMenu.minimizaAplicacao();
begin
  minIcon.Visible := True;
  FMenu.Visible := False;
end;

procedure TFMenu.btMinimizarClick(Sender: TObject);
begin
  minimizaAplicacao;
end;

procedure TFMenu.Maximizar1Click(Sender: TObject);
begin
  maximizaAplicacao;
end;

procedure TFMenu.sincronizaOS();
var
  wCountSinc : Integer;
begin
  wCountSinc := 0;

  with DMOracle do
  begin
    QOrdemServicoCab.Open;
    while not QOrdemServicoCab.Eof do
    begin
      try
        msgTerminal('Sincronizando Ordem de serviço ' + QOrdemServicoCabCOD_ORDEM_SERVICO_CAB.Text + '...');
        QOrdemServicoCab.Edit;

        DMMysql.QUpdateMysqlOS.SQL.Text := 'insert into tb_ordem_servico'
          + '(cod_ordem_servico,dt_entrada,desc_solicitacao,desc_equipamento,dt_saida,desc_tecnico,desc_cliente,num_cgc_cpf,dt_entrada_mant,dt_saida_mant,observacao)'
          + 'values'
          + '(' + QuotedStr(QOrdemServicoCabCOD_ORDEM_SERVICO_CAB.Text)
          + ',' + QuotedStr(QOrdemServicoCabDT_ENTRADA.Text)
          + ',' + QuotedStr(QOrdemServicoCabDESC_SOLICITACAO.Text)
          + ',' + QuotedStr(QOrdemServicoCabDESC_EQUIPAMENTO.Text)
          + ',' + QuotedStr(QOrdemServicoCabDT_SAIDA.Text)
          + ',' + QuotedStr(QOrdemServicoCabTECNICO.Text)
          + ',' + QuotedStr(QOrdemServicoCabCLIENTE.Text)
          + ',' + QuotedStr(QOrdemServicoCabCPF.Text)
          + ',' + QuotedStr(QOrdemServicoCabDT_ENTRADA_MANUTENCAO.Text)
          + ',' + QuotedStr(QOrdemServicoCabDT_SAIDA_MANUTENCAO.Text)
          + ',' + QuotedStr(QOrdemServicoCabDESC_OBS.Value) + ')';

        DMMysql.QUpdateMysqlOS.ExecSQL;
        QOrdemServicoCabIND_NIR_SYNC_SITE.Text := 'S';
        QOrdemServicoCab.Post;
        wCountSinc := wCountSinc + 1;

        DMMysql.CdsUpdatedMysqlOS.Insert;
        DMMysql.CdsUpdatedMysqlOS.FieldByName('COD_ORDEM_SERVICO_CAB').Text := QOrdemServicoCabCOD_ORDEM_SERVICO_CAB.Text;
        DMMysql.CdsUpdatedMysqlOS.FieldByName('DESC_EQUIPAMENTO').Text := QOrdemServicoCabDESC_EQUIPAMENTO.Text;
        DMMysql.CdsUpdatedMysqlOS.FieldByName('IND_NIR_SYNC_SITE').Text := QOrdemServicoCabIND_NIR_SYNC_SITE.Text;
        DMMysql.CdsUpdatedMysqlOS.FieldByName('DT_ENTRADA').Text := QOrdemServicoCabDT_ENTRADA.Text;
        DMMysql.CdsUpdatedMysqlOS.FieldByName('DESC_SOLICITACAO').Text := QOrdemServicoCabDESC_SOLICITACAO.Text;
        DMMysql.CdsUpdatedMysqlOS.FieldByName('DT_SAIDA').Text := QOrdemServicoCabDT_SAIDA.Text;
        DMMysql.CdsUpdatedMysqlOS.FieldByName('TECNICO').Text := QOrdemServicoCabTECNICO.Text;
        DMMysql.CdsUpdatedMysqlOS.FieldByName('CLIENTE').Text := QOrdemServicoCabCLIENTE.Text;
        DMMysql.CdsUpdatedMysqlOS.Post;
        
        gravaLog('Nova ordem de serviço adicionada: ' + QOrdemServicoCabCOD_ORDEM_SERVICO_CAB.Text + ', Cliente: ' + QOrdemServicoCabCLIENTE.Text);
      except on Error : Exception do
        try
          if StrPos(PChar(Error.Message), 'Duplicate entry') <> nil then
          begin
            DMMysql.QUpdateMysqlOS.SQL.Text := 'update tb_ordem_servico set '
              + 'dt_entrada=' + QuotedStr(QOrdemServicoCabDT_ENTRADA.Text) + ', '
              + 'desc_equipamento=' + QuotedStr(QOrdemServicoCabDESC_EQUIPAMENTO.Text) + ', '
              + 'desc_solicitacao=' + QuotedStr(QOrdemServicoCabDESC_SOLICITACAO.Text) + ', '
              + 'dt_saida=' +  QuotedStr(QOrdemServicoCabDT_SAIDA.Text) + ', '
              + 'desc_tecnico=' + QuotedStr(QOrdemServicoCabTECNICO.Text) + ', '
              + 'num_cgc_cpf=' + QuotedStr(QOrdemServicoCabCPF.Text) + ', '
              + 'desc_cliente=' + QuotedStr(QOrdemServicoCabCLIENTE.Text) + ', '
              + 'dt_entrada_mant=' + QuotedStr(QOrdemServicoCabDT_ENTRADA_MANUTENCAO.Text) + ', '
              + 'dt_saida_mant=' + QuotedStr(QOrdemServicoCabDT_SAIDA_MANUTENCAO.Text) + ', '
              + 'observacao=' + QuotedStr(QOrdemServicoCabDESC_OBS.Value) + ' where '
              + 'cod_ordem_servico=' + QuotedStr(QOrdemServicoCabCOD_ORDEM_SERVICO_CAB.Text);

              DMMysql.QUpdateMysqlOS.ExecSQL;
              QOrdemServicoCabIND_NIR_SYNC_SITE.Text := 'S';
              QOrdemServicoCab.Post;
              wCountSinc := wCountSinc + 1; 

              DMMysql.CdsUpdatedMysqlOS.Insert;
              DMMysql.CdsUpdatedMysqlOS.FieldByName('COD_ORDEM_SERVICO_CAB').Text := QOrdemServicoCabCOD_ORDEM_SERVICO_CAB.Text;
              DMMysql.CdsUpdatedMysqlOS.FieldByName('DESC_EQUIPAMENTO').Text := QOrdemServicoCabDESC_EQUIPAMENTO.Text;
              DMMysql.CdsUpdatedMysqlOS.FieldByName('IND_NIR_SYNC_SITE').Text := QOrdemServicoCabIND_NIR_SYNC_SITE.Text;
              DMMysql.CdsUpdatedMysqlOS.FieldByName('DT_ENTRADA').Text := QOrdemServicoCabDT_ENTRADA.Text;
              DMMysql.CdsUpdatedMysqlOS.FieldByName('DESC_SOLICITACAO').Text := QOrdemServicoCabDESC_SOLICITACAO.Text;
              DMMysql.CdsUpdatedMysqlOS.FieldByName('DT_SAIDA').Text := QOrdemServicoCabDT_SAIDA.Text;
              DMMysql.CdsUpdatedMysqlOS.FieldByName('TECNICO').Text := QOrdemServicoCabTECNICO.Text;
              DMMysql.CdsUpdatedMysqlOS.FieldByName('CLIENTE').Text := QOrdemServicoCabCLIENTE.Text;
              DMMysql.CdsUpdatedMysqlOS.Post;

              gravaLog('Ordem de serviço atualizada: ' + QOrdemServicoCabCOD_ORDEM_SERVICO_CAB.Text);
          end
          else
          begin
            msgTerminal('Erro ao sincronizar OS ' + QOrdemServicoCabCOD_ORDEM_SERVICO_CAB.Text + ': ' + Error.Message);
            gravaLog('Erro ao sincronizar OS ' + QOrdemServicoCabCOD_ORDEM_SERVICO_CAB.Text + ': ' + Error.Message);
          end;
        finally

        end;
      end;

      Application.ProcessMessages;
      QOrdemServicoCab.Next;
    end;
  end;

  msgTerminal(IntToStr(wCountSinc) + ' Ordens de serviço sincronizadas.');
end;

procedure TFMenu.sincronizaProdutos();
var
  wCountSinc : Integer;
begin
  wCountSinc := 0;

  with DMOracle do
  begin
    QProduto.Open;

    while not QProduto.Eof do
    begin
      try
        if QProdutoVAL_VAREJO.Value > 0 then
        begin
          msgTerminal('Sincronizando produto: ' + QProdutoDESC_PRODUTO.Text + '...');
          QProduto.Edit;
          DMMysql.QUpdateMysqlProduto.SQL.Text := 'update tb_produto set '
            + 'produto_preco=' + QuotedStr(QProdutoVAL_VAREJO.Text) + ', '
            + 'produto_quantia=' + QuotedStr(QProdutoQT_QUANTIDADE.Text) + ' where '
            + 'produto_cod_sistema=' + QuotedStr(QProdutoCOD_PRODUTO.Text);

          DMMysql.QUpdateMysqlProduto.ExecSQL;
          QProdutoIND_NIR_SYNC_SITE.Text := 'S';
          QProduto.Post;
          wCountSinc := wCountSinc + 1;

          DMMysql.CdsUpdatedMysqlProduto.Insert;
          DMMysql.CdsUpdatedMysqlProduto.FieldByName('COD_PRODUTO').Text := QProdutoCOD_PRODUTO.Text;
          DMMysql.CdsUpdatedMysqlProduto.FieldByName('DESC_PRODUTO').Text := QProdutoDESC_PRODUTO.Text;
          DMMysql.CdsUpdatedMysqlProduto.FieldByName('VAL_VAREJO').Text := QProdutoVAL_VAREJO.Text;
          DMMysql.CdsUpdatedMysqlProduto.FieldByName('QT_QUANTIDADE').Text := QProdutoQT_QUANTIDADE.Text;
          DMMysql.CdsUpdatedMysqlProduto.FieldByName('IND_NIR_SYNC_SITE').Text := QProdutoIND_NIR_SYNC_SITE.Text;
          DMMysql.CdsUpdatedMysqlProduto.FieldByName('DT_ALTERACAO_PRECO').Text := QProdutoDT_ALTERACAO_PRECO.Text;
          DMMysql.CdsUpdatedMysqlProduto.Post;
          
          gravaLog('Produto atualizado: ' + QProdutoDESC_PRODUTO.Text + ', estoque: ' + QProdutoQT_QUANTIDADE.Text + ', preço: ' + QProdutoVAL_VAREJO.Text);
        end;
      except on Error : Exception do
        try
          msgTerminal('Erro ao sincronizar produto ' + QProdutoCOD_PRODUTO.Text + ': ' + Error.Message);
          gravaLog('Erro ao sincronizar produto ' + QProdutoCOD_PRODUTO.Text + ': ' + Error.Message);
        finally

        end;
      end;
      
      Application.ProcessMessages;
      QProduto.Next;
    end;
  end;

  msgTerminal(IntToStr(wCountSinc) + ' produtos sincronizados.');
end;

procedure TFMenu.FormActivate(Sender: TObject);
begin
  myThread := USmartThread.CThread.Create(False);
  myThread.FreeOnTerminate := True;
end;

procedure TFMenu.SBAtualizarAgoraClick(Sender: TObject);
var
  wTime : Double;
begin
  tmLooping.Enabled := False;
  tmRetry.Enabled := False;

  tmLoopingTimer(Sender);

  tmLooping.Enabled := True;
  wTime := tmLooping.Interval;
  msgTerminal('Tudo pronto! Próxima sincronização em (' + FloatToStr((wTime/1000)/60) + ' minutos)');
end;

end.
