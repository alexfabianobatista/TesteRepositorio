unit UFatorICMSCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFFatorICMSCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    RelaodosFatores1: TMenuItem;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    DBDirceu1: TDBDirceu;
    SBtnFilialCons: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodosFatores1Click(Sender: TObject);
    procedure SBtnFilialConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFatorICMSCad: TFFatorICMSCad;

implementation

uses UFatorICMS_cl, UFatorICMSCons, URRelacaoFatorICMS, UFilialCons,
  UFilial_cl, UCFOPParam;

{$R *.DFM}

procedure TFFatorICMSCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMFatorICMS.QFatorICMS.Close;
  DMFatorICMS.QFatorICMS.Open;
end;

procedure TFFatorICMSCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FFatorICMSCons = nil Then
    FFatorICMSCons := TFFatorICMSCons.Create(Application);
  If FFatorICMSCons.ShowModal = mrOk Then
  Begin
    DMFatorICMS.QFatorICMS.Close;
    DMFatorICMS.QFatorICMS.SetVariable( ':PK', DMFatorICMS.QFatorICMSConsCOD_FATOR_ICMS.Value );
    DMFatorICMS.QFatorICMS.Open;
  End;
end;

procedure TFFatorICMSCad.RelaodosFatores1Click(Sender: TObject);
begin
  inherited;

  if FCFOPParam = nil then
    FCFOPParam := TFCFOPParam.create(application);

  FCFOPParam.PGRelatorio.Pages[1].TabVisible:=True;
  if FCFOPParam.ShowModal = mrok then
  begin
    If(FRRelacaoFatorICMS = nil)Then
      FRRelacaoFatorICMS := TFRRelacaoFatorICMS.create(Application);
    DMFatorICMS.QRFatorICMS.Close;

    if trim(FCFOPParam.ME2CodFilial.Text) = '' then
      DMFatorICMS.QRFatorICMS.SetVariable('COD_FILIAL', Null)
    else
      DMFatorICMS.QRFatorICMS.SetVariable('COD_FILIAL', trim(FCFOPParam.ME2CodFilial.Text));

    if trim(FCFOPParam.ME2Ano.Text) = '' then
      DMFatorICMS.QRFatorICMS.SetVariable('NUM_ANO', Null)
    else
      DMFatorICMS.QRFatorICMS.SetVariable('NUM_ANO', trim(FCFOPParam.ME2Ano.Text));
            
    DMFatorICMS.QRFatorICMS.open;
    FRRelacaoFatorICMS.QRPrimario.Preview;
    DMFatorICMS.QRFatorICMS.Close;
  end;
end;

procedure TFFatorICMSCad.SBtnFilialConsClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    DMFatorICMS.QFatorICMSCOD_FILIAL.Value := DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFFatorICMSCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If (DSPrimario.State in [dsInsert,dsEdit]) Then
    SBtnFilialCons.Enabled := True
  Else
    SBtnFilialCons.Enabled := False;
end;

procedure TFFatorICMSCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(3);
end;

procedure TFFatorICMSCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMFatorICMS.QFatorICMS;
end;

end.
