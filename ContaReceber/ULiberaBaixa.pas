unit ULiberaBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, Variants;

type
  TFLiberaBaixa = class(TForm)
    Panel1: TPanel;
    SBProcura: TSpeedButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    MEDataInicial: TMaskEdit;
    MEDataFinal: TMaskEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    CBAceite: TCheckBox;
    RGEnviadoBanco1: TRadioGroup;
    SpeedButton2: TSpeedButton;
    procedure SBProcuraClick(Sender: TObject);
    procedure CBAceiteClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLiberaBaixa: TFLiberaBaixa;

implementation

uses UContasReceber_cl, UOracle_cl;

{$R *.DFM}

procedure TFLiberaBaixa.SBProcuraClick(Sender: TObject);
begin
  With DMContasReceber do
    begin
      QLiberaBaixa.Close;
      If CBAceite.Checked then
        QLiberaBaixa.SetVariable('IND_ACEITE','NAO')
      Else
        QLiberaBaixa.SetVariable('IND_ACEITE',Null);
      if Trim(MEDataInicial.Text)<>'' then
        QLiberaBaixa.SetVariable('DATA_INICIAL',MEDataInicial.Text)
      Else
        QLiberaBaixa.SetVariable('DATA_INICIAL',Null);
      if Trim(MEDataFinal.Text)<>'' then
        QLiberaBaixa.SetVariable('DATA_FINAL',MEDataFinal.Text)
      Else
        QLiberaBaixa.SetVariable('DATA_FINAL',Null);
      case RGEnviadoBanco1.ItemIndex of
        0: QLiberaBaixa.SetVariable('IND_ENVIADO_BANCO',Null);
        1: QLiberaBaixa.SetVariable('IND_ENVIADO_BANCO','NAO');
        2: QLiberaBaixa.SetVariable('IND_ENVIADO_BANCO','SIM');
      end;

      QLiberaBaixa.Open;
    end;
end;

procedure TFLiberaBaixa.CBAceiteClick(Sender: TObject);
begin
  SBProcura.Click;
end;

procedure TFLiberaBaixa.SpeedButton1Click(Sender: TObject);
var
  exec : TExecutador;
begin
  with DMContasReceber do
  begin
    exec := TExecutador.Create;
    exec.Adiciona('UPDATE TB_CONTA_RECEBER_CAB SET IND_ACEITE='
    + QuotedStr('SIM') +
    ' WHERE COD_CONTA_RECEBER_CAB = '
      + QLiberaBaixaCOD_CONTA_RECEBER_CAB.Text);
    exec.Executar(True, True);
    QLiberaBaixa.Close;
    QLiberaBaixa.Open;
   end;
end;

procedure TFLiberaBaixa.SpeedButton2Click(Sender: TObject);
var
  exec : TExecutador;
begin
  with DMContasReceber do
  begin
    exec := TExecutador.Create;
    exec.Adiciona('UPDATE TB_CONTA_RECEBER_CAB SET IND_ACEITE='
    + QuotedStr('NAO') +
    ' WHERE COD_CONTA_RECEBER_CAB = '
      + QLiberaBaixaCOD_CONTA_RECEBER_CAB.Text);
    exec.Executar(True, True);
    QLiberaBaixa.Close;
    QLiberaBaixa.Open;
   end;
end;

end.
