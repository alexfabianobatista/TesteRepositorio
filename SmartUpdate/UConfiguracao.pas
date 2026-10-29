unit UConfiguracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles;

type
  TFConfiguracao = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    lbMysqlUser: TLabel;
    lbMysqlPassword: TLabel;
    lbMysqlHost: TLabel;
    lbMysqlDb: TLabel;
    edMysqlUser: TEdit;
    edMysqlPassword: TEdit;
    edMysqlHost: TEdit;
    edMysqlDb: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edOracleTns: TEdit;
    edOraclePassword: TEdit;
    edOracleUser: TEdit;
    lb: TLabel;
    Label4: TLabel;
    edMysqlPort: TEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    edTime: TEdit;
    cbSincProduto: TCheckBox;
    cbSincOS: TCheckBox;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    lbTriggerOS: TLabel;
    BtCorrigirTrigger: TBitBtn;
    Label7: TLabel;
    lbTriggerProduto: TLabel;
    Label9: TLabel;
    lbTriggerEstoque: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure verificaTriggers();
    procedure setaLabelTrigger(wLabel: TLabel; wCor: TColor; wTexto: String);
    procedure BtCorrigirTriggerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfiguracao: TFConfiguracao;
  iniArquivo : TIniFile;

implementation

uses UOracle_cl;
  
{$R *.dfm}

procedure TFConfiguracao.BitBtn1Click(Sender: TObject);
var
  wNomeIni, wLocalIni, wDiretorio : String;
begin
  wLocalIni :=       ExtractFilePath(ParamStr(0));
  wNomeIni :=        'config.ini';
  wDiretorio :=      wLocalIni + wNomeIni;

  try
    iniArquivo := TIniFile.Create(wDiretorio);

    iniArquivo.WriteString('Oracle','Usuario', Trim(edOracleUser.Text));
    iniArquivo.WriteString('Oracle','Senha', Trim(edOraclePassword.Text));
    iniArquivo.WriteString('Oracle','Database', Trim(edOracleTns.Text));

    iniArquivo.WriteString('Mysql','Host', Trim(edMysqlHost.Text));
    iniArquivo.WriteString('Mysql','Usuario', Trim(edMysqlUser.Text));
    iniArquivo.WriteString('Mysql','Senha', Trim(edMysqlPassword.Text));
    iniArquivo.WriteString('Mysql','Database', Trim(edMysqlDb.Text));
    iniArquivo.WriteString('Mysql','Porta', Trim(edMysqlPort.Text));

    iniArquivo.WriteString('Outros','Time', Trim(edTime.Text));
    iniArquivo.WriteString('Outros','SincProduto', BoolToStr(cbSincProduto.Checked));
    iniArquivo.WriteString('Outros','SincOs', BoolToStr(cbSincOS.Checked));

  except on Error : Exception do
    ShowMessage('Erro ao salvar configurações: ' + Error.Message);
  end;

  Close;
end;

procedure TFConfiguracao.FormShow(Sender: TObject);
var
  wNomeIni, wLocalIni, wDiretorio : String;
  wOraUser, wOraSenha, wOraDB, wTime : String;
  wSincOs, wSincProduto : Boolean;
  wMysqlUser, wMysqlSenha, wMysqlDB, wMysqlHost, wMysqlPorta : String;
begin
  wLocalIni :=       ExtractFilePath(ParamStr(0));
  wNomeIni :=        'config.ini';
  wDiretorio :=      wLocalIni + wNomeIni;

  try
    iniArquivo := TIniFile.Create(wDiretorio);

    wOraUser := iniArquivo.ReadString('Oracle','Usuario', EmptyStr);
    wOraSenha := iniArquivo.ReadString('Oracle','Senha', EmptyStr);
    wOraDB := iniArquivo.ReadString('Oracle','Database', EmptyStr);

    wMysqlUser := iniArquivo.ReadString('Mysql','Usuario', EmptyStr);
    wMysqlSenha := iniArquivo.ReadString('Mysql','Senha', EmptyStr);
    wMysqlDB := iniArquivo.ReadString('Mysql','Database', EmptyStr);
    wMysqlHost := iniArquivo.ReadString('Mysql','Host', EmptyStr);
    wMysqlPorta := iniArquivo.ReadString('Mysql','Porta', EmptyStr);

    wTime := iniArquivo.ReadString('Outros','Time', EmptyStr);
    wSincOs := StrToBool(iniArquivo.ReadString('Outros','SincOs', EmptyStr));
    wSincProduto := StrToBool(iniArquivo.ReadString('Outros','SincProduto', EmptyStr));

    edMysqlUser.Text :=       wMysqlUser;
    edMysqlPassword.Text :=   wMysqlSenha;
    edMysqlHost.Text :=       wMysqlHost;
    edMysqlDb.Text :=         wMysqlDB;
    edMysqlPort.Text :=       wMysqlPorta;

    edOracleTns.Text :=       wOraDB;
    edOraclePassword.Text :=  wOraSenha;
    edOracleUser.Text :=      wOraUser;

    edTime.Text := wTime;
    cbSincProduto.Checked := wSincProduto;
    cbSincOS.Checked := wSincOs;

  except on Error : Exception do
    ShowMessage('Erro ao ler configurações: ' + Error.Message);
  end;

  verificaTriggers;
end;

procedure TFConfiguracao.setaLabelTrigger(wLabel: TLabel; wCor: TColor; wTexto: String);
begin
  wLabel.Font.Color := wCor;
  wLabel.Caption := wTexto;
end;

procedure TFConfiguracao.verificaTriggers();
const
  wCorPadrao : TColor = $00444444; 
  wCorErro : TColor = clRed;
begin
  setaLabelTrigger(lbTriggerOS, wCorErro, 'Inexistente');
  setaLabelTrigger(lbTriggerProduto, wCorErro, 'Inexistente');
  setaLabelTrigger(lbTriggerEstoque, wCorErro, 'Inexistente');

  try
    with DMOracle do
    begin
      QTriggers.Close;
      QTriggers.Open;

      QTriggers.First;
      while not QTriggers.Eof do
      begin
        if QTriggersTRIGGER_NAME.Text = 'TRG_NIR_ORDEM_SERVICO_A' then
        begin
          if QTriggersSTATUS.Text = 'ENABLED' then
          begin
            setaLabelTrigger(lbTriggerOS, wCorPadrao, 'Ligado');
          end
          else
          begin
            setaLabelTrigger(lbTriggerOS, wCorErro, 'Desligado');
          end;
        end;
        QTriggers.Next;
      end;

      QTriggers.First;
      while not QTriggers.Eof do
      begin
        if QTriggersTRIGGER_NAME.Text = 'TRG_NIR_PRODUTO_A' then
        begin
          if QTriggersSTATUS.Text = 'ENABLED' then
          begin
            setaLabelTrigger(lbTriggerProduto, wCorPadrao, 'Ligado');
          end
          else
          begin
            setaLabelTrigger(lbTriggerProduto, wCorErro, 'Desligado');
          end;
        end;
        QTriggers.Next;
      end;

      QTriggers.First;
      while not QTriggers.Eof do
      begin
        if QTriggersTRIGGER_NAME.Text = 'TRG_NIR_PRODUTO_B' then
        begin
          if QTriggersSTATUS.Text = 'ENABLED' then
          begin
            setaLabelTrigger(lbTriggerEstoque, wCorPadrao, 'Ligado');
          end
          else
          begin
            setaLabelTrigger(lbTriggerEstoque, wCorErro, 'Desligado');
          end;
        end;
        QTriggers.Next;
      end;
    end;
  except on Error : Exception do
    ShowMessage('Erro ao carregar informações das triggers: ' + Error.Message);
  end;
end;

procedure TFConfiguracao.BtCorrigirTriggerClick(Sender: TObject);
begin
  try
    with DMOracle do
    begin
      QTriggerOS.Close;
      QTriggerProdutoA.Close;
      QTriggerProdutoB.Close;
      
      QTriggerOS.Open;
      QTriggerProdutoA.Open;
      QTriggerProdutoB.Open;
    end;
  except on Error : Exception do
    ShowMessage('Erro ao corrigir triggers: ' + Error.Message);
  end;
  
  verificaTriggers;
end;

end.
