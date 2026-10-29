unit UCFOPParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFCFOPParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label12: TLabel;
    ME1CodFilial: TMaskEdit;
    SB1Filial: TSpeedButton;
    ME1Filial: TMaskEdit;
    Label13: TLabel;
    ME1Ano: TMaskEdit;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    SB2Filial: TSpeedButton;
    Label2: TLabel;
    ME2CodFilial: TMaskEdit;
    ME2Filial: TMaskEdit;
    ME2Ano: TMaskEdit;
    procedure ME1CodFilialExit(Sender: TObject);
    procedure SB1FilialClick(Sender: TObject);
    procedure ME2CodFilialExit(Sender: TObject);
    procedure SB2FilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCFOPParam: TFCFOPParam;

implementation

uses UOracle_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFCFOPParam.ME1CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME1CodFilial.Text) <> '')Then
    ME1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME1CodFilial.Text))
  Else
    ME1Filial.Text := 'Todas';
end;

procedure TFCFOPParam.SB1FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME1CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME1CodFilialExit(self);
end;

procedure TFCFOPParam.ME2CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME2CodFilial.Text) <> '')Then
    ME2Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME2CodFilial.Text))
  Else
    ME2Filial.Text := 'Todas';
end;

procedure TFCFOPParam.SB2FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME2CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME2CodFilialExit(self);
end;

end.
