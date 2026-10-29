unit UStatusNfeCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, DB;

type
  TFStatusNfeCons = class(TForm)
    cbUf: TComboBox;
    Label1: TLabel;
    cbAmbiente: TComboBox;
    Ambiente: TLabel;
    BtOk: TBitBtn;
    rgContingencia: TRadioGroup;
    dbgResultado: TDBGrid;
    LblResultado: TLabel;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    dsConsulta: TDataSource;
    RGNFe: TRadioGroup;
    procedure BtOkClick(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure RGNFeClick(Sender: TObject);
  private
    { Private declarations }
    procedure ativaStatusBar;
  public
    { Public declarations }
  end;

var
  FStatusNfeCons: TFStatusNfeCons;

implementation

{$R *.dfm}
uses
  UCodEstadoIBGE, UStatusXML, UNfe_cl, DateUtils, UOracle_cl, NFeCliente,
  UUsuario_cl, UNFeRetorno;
  
procedure TFStatusNfeCons.BtOkClick(Sender: TObject);
  var
    codIbge :String;
    amb, serv:String;
    xml :TStrings;
    contingencia :String;
    caminho :String;
begin
  amb := '';
  codIbge := '';

  with DMOracle do
    ExecutaSql('DELETE FROM TB_STATUS_WS_NFE');

  codIbge := CodEstadoIBGE.getCodIbge(trim(cbUf.Text));
  if trim(cbAmbiente.Text) = 'PRODUÇÃO' then
    amb := '1'
  else
    if trim(cbAmbiente.Text) = 'HOMOLOGAÇÃO' then
      amb := '2';
  if rgContingencia.ItemIndex = 0 then
    contingencia := '1'
  else
    if rgContingencia.ItemIndex = 1 then
      contingencia := '3';

  if RGNFe.ItemIndex = 1 then
  begin
    serv := DMOracle.FastSelect('DESC_REPOSITORIO_NFE',
        'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
//    if contingencia = '3' then
//      codIbge := '0';
    DMNfe.ExecutaAcoes(TExecucoesList.Create.Add(TExecucaoStatus.Create(serv,
        DMUsuario.CodFilialUsuario, StrToInt(codIbge), StrToInt(amb), StrToInt(contingencia),55)));
  end;
  {else
  begin
    xml := StatusXML.getXML(codIbge,amb,contingencia);
    //caminho := DMNfe.BuscaCaminho(tpStatus);
    caminho := caminho + 'xmlStatus.xml';
    xml.SaveToFile(caminho);

    ativaStatusBar;
  end; }

  with DMNfe do
  begin
    QNfeStatusServico.Close();
    QNfeStatusServico.SetVariable(':ESTADO',codIbge);
    QNfeStatusServico.Open();
  end;    
end;

procedure TFStatusNfeCons.ativaStatusBar;
var
  i :Integer;
  loads :Integer;
  maxVezesLoad :Integer;
begin
  maxVezesLoad := 2;
  
  for loads := 0 to maxVezesLoad do
  begin
    for I := ProgressBar1.Min to ProgressBar1.Max do
    begin
      { Atualiza a posição da ProgressBar }
      ProgressBar1.Position := I;
      { Repinta a StatusBar para forçar a atualização visual }
      StatusBar1.Repaint;
      { Aguarda 50 milisegundos }
      Sleep(50);
    end;
    { Aguarde 500 milisegundos }
    Sleep(500);
    { Reseta (zera) a ProgressBar }
    ProgressBar1.Position := ProgressBar1.Min;
    { Repinta a StatusBar para forçar a atualização visual }
    StatusBar1.Repaint;
  end;
end;

procedure TFStatusNfeCons.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel.Index = 0 then
  begin
    { Ajusta a tamanho da ProgressBar de acordo com
    o tamanho do painel }
    ProgressBar1.Width := Rect.Right - Rect.Left +1;
    ProgressBar1.Height := Rect.Bottom - Rect.Top +1;
    { Pinta a ProgressBar no DC (device-context) da StatusBar }
    ProgressBar1.PaintTo(StatusBar.Canvas.Handle, Rect.Left, Rect.Top);
  end;
end;

procedure TFStatusNfeCons.RGNFeClick(Sender: TObject);
begin
  LblResultado.Visible := RGNFe.ItemIndex <> 1;
  dbgResultado.Visible := LblResultado.Visible;
end;

end.
