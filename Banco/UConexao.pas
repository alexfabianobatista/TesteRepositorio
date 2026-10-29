unit UConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, UAguardoBloqueado, UBiblioteca, Menus,
  Buttons, Oracle;

type
  TFConexao = class(TForm, ITelaAguardo)
    LConexao: TLabel;
    ImgConexao: TImage;
    LTitulo: TLabel;
    PMConexao: TPopupMenu;
    Finalizarsistemaporfavorevitefazeristosepuderaguardar1: TMenuItem;
    LMensagem: TLabel;
    BtDetalhe: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Finalizarsistemaporfavorevitefazeristosepuderaguardar1Click(
      Sender: TObject);
    procedure BtDetalheClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FAguardo: TAguardoBloqueado;
    function GetTexto: String;
    procedure AguardoExecucao(Sender: TObject; Tentativa: Integer; Parametros: TVariantMap;
      var Acao: TExecucaoAction; var Msg: String);
    procedure SetTexto(const Value: String);
    function GetTitulo: String;
    procedure SetTitulo(const Value: String);
  public
    procedure Acabou;
    procedure Limpa;
    procedure Feito(Percentual: Extended);
    procedure MostraPercentual;
    procedure Notifica(Str: String);
    procedure Reconectar;
    property Texto: String read GetTexto write SetTexto;
    property Titulo: String read GetTitulo write SetTitulo;
  end;

var
  FConexao: TFConexao;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TFConexao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Se não estiver conectado, não fechar.
  if not (Application.Terminated or DMOracle.DBCemapa.Connected) then
    Abort;
end;

function TFConexao.GetTexto: String;
begin
  Result := LConexao.Caption;
end;

procedure TFConexao.SetTexto(const Value: String);
begin
  LConexao.Caption := Value;
end;

procedure TFConexao.FormCreate(Sender: TObject);
begin
  FAguardo := TAguardoBloqueado.Create;
  FAguardo.Intervalo := 500;
  FAguardo.TimeOut := 999;
  FAguardo.OnExecucao := AguardoExecucao;
  FAguardo.TelaAguardo := Self;
end;

procedure TFConexao.AguardoExecucao(Sender: TObject; Tentativa: Integer;
  Parametros: TVariantMap; var Acao: TExecucaoAction; var Msg: String);
begin
  //Tentar reconectar
  Acao := eaContinue;
  if DMOracle.DBCemapa.CheckConnection(True) in [ccOK, ccReconnected] then
    Acao := eaOk;
end;

procedure TFConexao.Reconectar;
begin
  if FAguardo.Rodar <> erOk then
  begin
    MessageDlg('Não foi possível reconectar no banco de dados.'+#13+#10+
      'O sistema será fechado.', mtError, [mbOK], 0);
    Halt;
  end;
end;

function TFConexao.GetTitulo: String;
begin
  Result := LTitulo.Caption;
end;

procedure TFConexao.SetTitulo(const Value: String);
begin
  LTitulo.Caption := Value;
end;

procedure TFConexao.Finalizarsistemaporfavorevitefazeristosepuderaguardar1Click(
  Sender: TObject);
begin
  Halt;
end;

procedure TFConexao.BtDetalheClick(Sender: TObject);
begin
  LMensagem.Visible := not LMensagem.Visible;
  if LMensagem.Visible then
  begin
    Self.Height := LMensagem.Top + LMensagem.Height + 25;
    BtDetalhe.Caption := '&Ocultar Detalhes';
  end
  else
  begin
    Self.Height := LMensagem.Top + 20;
    BtDetalhe.Caption := '&Mostrar Detalhes';
  end;
end;

procedure TFConexao.FormShow(Sender: TObject);
begin
  LMensagem.Visible := False;
  Self.Height := LMensagem.Top + 20;
  BtDetalhe.Caption := '&Mostrar Detalhes';
end;

procedure TFConexao.Notifica(Str: String);
begin
  
end;

procedure TFConexao.Feito(Percentual: Extended);
begin

end;

procedure TFConexao.MostraPercentual;
begin

end;

procedure TFConexao.Acabou;
begin

end;

procedure TFConexao.Limpa;
begin

end;

end.
