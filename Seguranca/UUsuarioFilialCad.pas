unit UUsuarioFilialCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, variants, DBDirceu, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFUsuarioFilialCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BtModulo: TSpeedButton;
    BtUsuario: TSpeedButton;
    BtFilial: TSpeedButton;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    Label5: TLabel;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtUsuarioClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BtModuloClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUsuarioFilialCad: TFUsuarioFilialCad;


implementation

uses UUsuario_cl, UUsuarioCons, UFilialCons, UFilial_cl, UModuloCons,
  UFuncao_cl, UControleInternoParam, UUsuarioFilialCons;

{$R *.DFM}

procedure TFUsuarioFilialCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [Dsinsert,Dsedit] then
  Begin
    BtModulo.Enabled:=True;
    BtUsuario.Enabled:= True;
    BtFilial.Enabled := True;
  End
  Else
  Begin
    BtModulo.Enabled := False;
    BtUsuario.Enabled := False;
    BtFilial.Enabled := False;
  End;
end;

procedure TFUsuarioFilialCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMUsuario.QUsuarioFilial.Open;
end;

procedure TFUsuarioFilialCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMFilial.QFilialCons.Close;
  DMFuncao.QModuloCons.Close;
  DMUsuario.QUsuarioFilialCons.Close;
  DMUsuario.QUsuarioFilial.Close;
  DMUsuario.QUsuarioFilial.SetVariable('PK', null);
  Action := CaFree;
  FUsuarioFilialCad := nil;
end;

procedure TFUsuarioFilialCad.BtUsuarioClick(Sender: TObject);
begin
  inherited;
  If FUsuarioCons = nil then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  If FUsuarioCons.ShowModal = mrOk then
    DMUsuario.QUsuarioFilialCOD_USUARIO.Value := DMUsuario.QUsuarioConsCOD_USUARIO.Value;
end;

procedure TFUsuarioFilialCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMUsuario.QUsuarioFilialCOD_FILIAL.Value := DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFUsuarioFilialCad.BtModuloClick(Sender: TObject);
begin
  inherited;
  If FModuloCons = nil then
    FModuloCons := TFModuloCons.Create(Application);
  If FModuloCons.ShowModal = mrOk then
    DMUsuario.QUsuarioFilialCOD_MODULO.Value := DMFuncao.QModuloConsCOD_MODULO.Value;
end;

procedure TFUsuarioFilialCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FUsuarioFilialCons = nil then
    FUsuarioFilialCons := TFUsuarioFilialCons.Create(Application);
  If FUsuarioFilialCons.showmodal = mrOk Then
  Begin
    If not(DMUsuario.QUsuarioFilialCons.IsEmpty) then
    Begin
      DMUsuario.QUsuarioFilial.Close;
      DMUsuario.QUsuarioFilial.SetVariable('PK', DMUsuario.QUsuarioFilialConsCOD_USUARIO_FILIAL.Text);
      DMUsuario.QUsuarioFilial.Open;
    End;
  End;
end;

end.
