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
    procedure SBProcuraClick(Sender: TObject);
    procedure CBAceiteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLiberaBaixa: TFLiberaBaixa;

implementation

uses UContasReceber_cl;

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
      QLiberaBaixa.Open;
    end;
end;

procedure TFLiberaBaixa.CBAceiteClick(Sender: TObject);
begin
  SBProcura.Click;
end;

end.
