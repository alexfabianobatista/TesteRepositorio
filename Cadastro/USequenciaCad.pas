unit USequenciaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFSequenciaCad = class(TFTCadSimples)
    GroupBox1: TGroupBox;
    MEFilial: TMaskEdit;
    BtConsFilial: TBitBtn;
    EdFilial: TEdit;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSequenciaCad: TFSequenciaCad;

implementation

uses USequencia_cl, UUsuario_cl, UFilialCons, UFilial_cl, UOracle_cl;

{$R *.DFM}

procedure TFSequenciaCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMSequencia do
    QSequencia.Open;
end;

procedure TFSequenciaCad.FormCreate(Sender: TObject);
begin
  inherited;
  MEFilial.Text :=FloatToStr(DMUsuario.CodFilialUsuario);
  MEFilialExit(Self);
end;

procedure TFSequenciaCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil Then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk Then
  With DMSequencia do
  Begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    MEFilialExit(Self);
  End;
end;

procedure TFSequenciaCad.MEFilialExit(Sender: TObject);
Var wFilial : Integer;
begin
  inherited;
  DMOracle.ValidaFilial(MEFilial.Text);
  If Trim(MEFilial.Text) = '' Then
   Begin
    EdFilial.Text := '';
    wFilial := 0;
   End
  Else
   Begin
    wFilial := StrToInt(Trim(MEFilial.Text));
    With DMFilial do
    Begin
      QFilial.Close;
      QFilial.SetVariable('PK',wFilial);
      QFilial.Open;
      EdFilial.Text := QFilialDesc_Filial.Text;
    End;
   End;
  If not (DMSequencia.QSequencia.State in [dsEdit,dsInsert]) Then
    DMSequencia.SetaFilial(wFilial,'');
end;

procedure TFSequenciaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  MEFilial.Enabled := DMSequencia.QSequencia.State = dsBrowse;
  BtConsFilial.Enabled := MEFilial.Enabled;
end;

procedure TFSequenciaCad.MELocalizaExit(Sender: TObject);
begin
  If MELocaliza.Text <> '' Then
  Begin
    MEFilial.Text := MELocaliza.Text;
    MEFilialExit(Self);
    MELocaliza.Text := '';
    // inherited;
  End;
end;

procedure TFSequenciaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(38);
end;

procedure TFSequenciaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMSequencia do
    QSequencia.Close;
  Action := CaFree;
  FSequenciaCad := Nil;
end;

procedure TFSequenciaCad.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit1.Text);
end;

end.
