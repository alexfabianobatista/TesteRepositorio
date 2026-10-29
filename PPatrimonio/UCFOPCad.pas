unit UCFOPCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, DBDirceu, StdCtrls, ImgList, Db, Menus, ComCtrls,
  Mask, Buttons, ExtCtrls, OracleNavigator, Grids, DBGrids, variants,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ActnList;

type
  TFCFOPCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBDirceu1: TDBDirceu;
    SBtnFilialCons: TSpeedButton;
    CFOPControledeCrditodoAtivoPermanente1: TMenuItem;
    DSCFOPItem: TDataSource;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    OracleNavigator1: TOracleNavigator;
    procedure SBtnFilialConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure CFOPControledeCrditodoAtivoPermanente1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCFOPCad: TFCFOPCad;

implementation

uses UCFOP_cl, UFilialCons, UFilial_cl, UCFOPCons, URCFOP, UCFOPParam,
  UPatrimonioParam;

{$R *.DFM}

procedure TFCFOPCad.SBtnFilialConsClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    DMCFOP.QCFOPCOD_FILIAL.Value := DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFCFOPCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If (DSPrimario.State in [dsInsert,dsEdit]) Then
    SBtnFilialCons.Enabled := True
  Else
    SBtnFilialCons.Enabled := False;
end;

procedure TFCFOPCad.FormActivate(Sender: TObject);
begin
  inherited;
  
  DMCFOP.QCFOP.Close;
  DMCFOP.QCFOP.Open;

  DMCFOP.QCFOPItem.Close;
  DMCFOP.QCFOPItem.Open;
end;

procedure TFCFOPCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FCFOPCons = nil then
    FCFOPCons := TFCFOPCons.create(application);

  if FCFOPCons.ShowModal = mrok then
  begin
    DMCFOP.QCFOP.Close;
    DMCFOP.QCFOP.SetVariable( ':PK', DMCFOP.QCFOPConsCOD_CFOP.Value );
    DMCFOP.QCFOP.Open;
  end;
end;

procedure TFCFOPCad.CFOPControledeCrditodoAtivoPermanente1Click(
  Sender: TObject);
begin
  inherited;

  if FCFOPParam = nil then
    FCFOPParam := TFCFOPParam.create(application);

  FCFOPParam.PGRelatorio.Pages[0].TabVisible:=True;
  if FCFOPParam.ShowModal = mrok then
  begin
    if FRCFOP = nil then
      FRCFOP := TFRCFOP.create(application);

    DMCFOP.QRCFOP.close;

    if trim(FCFOPParam.ME1CodFilial.Text) = '' then
      DMCFOP.QRCFOP.SetVariable('COD_FILIAL',null)
    else
      DMCFOP.QRCFOP.SetVariable('COD_FILIAL',strtoint(trim(FCFOPParam.ME1CodFilial.Text)));

    if trim(FCFOPParam.ME1Ano.Text) = '' then
      DMCFOP.QRCFOP.SetVariable('NUM_ANO',null)
    else
      DMCFOP.QRCFOP.SetVariable('NUM_ANO',strtoint(trim(FCFOPParam.ME1Ano.Text)));

    DMCFOP.QRCFOP.open;
    FRCFOP.QRPrimario.Preview;
  end;
end;

procedure TFCFOPCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(6);
end;

end.
