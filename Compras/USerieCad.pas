unit USerieCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBPanel, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFSerieCad = class(TFTCadSimples)
    Sries1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBLCSerieModelo: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBECodUsuario: TDBEdit;
    EdNomeUsuario: TEdit;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure Sries1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBLCSerieModeloCloseUp(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSerieCad: TFSerieCad;

implementation

uses USerie_cl, USerieCons, UFilialCons, UFilial_cl, URSerie, UOracle_cl;

{$R *.DFM}

procedure TFSerieCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  If FSerieCons.ShowModal = mrOk then
  With DMSerie do
  Begin
    QSerie.Close;
    QSerie.SetVariable('COD_SERIE',QSerieConsCod_Serie.Value);
    QSerie.SetVariable('COD_FILIAL',QSerieConsCod_Filial.Value);
    QSerie.SetVariable('COD_SERIE_MODELO', QSerieConsCOD_SERIE_MODELO.Value);
    QSerie.Open;
  End;
  EdNomeUsuario.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = '+ DBECodUsuario.Text);
end;

procedure TFSerieCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMSerie do
  Begin
    QSerie.CommitOnPost := True;
    QSerie.Open;
  End;
  MELocaliza.Visible := False;
end;


procedure TFSerieCad.MELocalizaExit(Sender: TObject);
begin
  //inherited;
end;

procedure TFSerieCad.Sries1Click(Sender: TObject);
begin
  inherited;
  With DMSerie do
  Begin
    QRSerie.Open;
    If FRSerie = Nil then
      FRSerie := TFRSerie.Create(Application);
    FRSerie.QRPrimario.Preview;
    QRSerie.Close;
  End;
end;

procedure TFSerieCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(37);
end;

procedure TFSerieCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  With DMSerie do
  Begin
    QSerie.CommitOnPost := False;
    QSerie.Close;
  End;
  Action := CaFree;
  FSerieCad := Nil;
end;

procedure TFSerieCad.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFSerieCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  DBLCSerieModelo.Enabled := not (DSPrimario.State = DSBrowse);
end;

procedure TFSerieCad.DBLCSerieModeloCloseUp(Sender: TObject);
begin
  inherited;
  with DMSerie do
  begin
    DBLCSerieModelo.Hint := QSerieModeloDESC_COMPLETA.Value;
  end;
end;

procedure TFSerieCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBLCSerieModelo.KeyValue := '02';
  DMSerie.QSerieCOD_SERIE_MODELO.Value :=
    DBLCSerieModelo.KeyValue;
end;

procedure TFSerieCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  EdNomeUsuario.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = '+ DBECodUsuario.Text);
end;

end.
