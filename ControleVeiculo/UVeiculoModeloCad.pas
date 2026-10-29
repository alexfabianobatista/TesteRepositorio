unit UVeiculoModeloCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFVeiculoModeloCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelVeculos1: TMenuItem;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    SBFabricante: TSpeedButton;
    DBEdit4: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelVeculos1Click(Sender: TObject);
    procedure SBFabricanteClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeiculoModeloCad: TFVeiculoModeloCad;

implementation

uses UVeiculoModelo_cl, UVeiculoModeloCons, URVeiculoModelo,
  UVeiculoFabricanteCons, UVeiculoFabricante_cl;

{$R *.DFM}

procedure TFVeiculoModeloCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMVeiculoModelo.QVeiculoModeloCad.open;
end;

procedure TFVeiculoModeloCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMVeiculoModelo.QVeiculoModeloCad.Close;
end;

procedure TFVeiculoModeloCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FVeiculoModeloCons = nil then
     FVeiculoModeloCons := TFVeiculoModeloCons.Create(Application);
  if FVeiculoModeloCons.ShowModal = mrOk then
  with DMVeiculoModelo do
  begin
    QVeiculoModeloCad.Close;
    QVeiculoModeloCad.SetVariable('PK',QVeiculoModeloConsCOD_MODELO.Value);
    QVeiculoModeloCad.Open;
  end;
end;

procedure TFVeiculoModeloCad.RelVeculos1Click(Sender: TObject);
begin
  inherited;
  DMVeiculoModelo.QRVeiculoModelo.Close;
  DMVeiculoModelo.QRVeiculoModelo.Open;
  if FRVeiculoModelo = nil then
    FRVeiculoModelo := TFRVeiculoModelo.Create(Application);
  FRVeiculoModelo.QRPrimario.Preview;
end;

procedure TFVeiculoModeloCad.SBFabricanteClick(Sender: TObject);
begin
  inherited;
  if FVeiculoFabricanteCons = nil then
    FVeiculoFabricanteCons := TFVeiculoFabricanteCons.Create(Application);
  if FVeiculoFabricanteCons.ShowModal = mrOk then
    DMVeiculoModelo.QVeiculoModeloCadCOD_FABRICANTE.Value := DMVeiculoFabricante.QVeiculoFabricanteConsCOD_FABRICANTE.Value;
end;

procedure TFVeiculoModeloCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBFabricante.Enabled := SBConfirmar.Enabled;
end;

procedure TFVeiculoModeloCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(6);
end;

end.
