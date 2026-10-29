unit UVeiculoFabricanteCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFVeiculoFabricanteCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelFabricantesdeVeculo1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelFabricantesdeVeculo1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeiculoFabricanteCad: TFVeiculoFabricanteCad;

implementation

uses UVeiculoFabricante_cl, UVeiculoFabricanteCons, URVeiculoFabricante;

{$R *.DFM}

procedure TFVeiculoFabricanteCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMVeiculoFabricante.QVeiculoFabricanteCad.Open;
end;

procedure TFVeiculoFabricanteCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMVeiculoFabricante.QVeiculoFabricanteCad.Close;
end;

procedure TFVeiculoFabricanteCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FVeiculoFabricanteCons = nil then
     FVeiculoFabricanteCons := TFVeiculoFabricanteCons.Create(Application);
  if FVeiculoFabricanteCons.ShowModal = mrOk then
  with DMVeiculoFabricante do
  begin
    QVeiculoFabricanteCad.Close;
    QVeiculoFabricanteCad.SetVariable('PK',QVeiculoFabricanteConsCOD_FABRICANTE.Value);
    QVeiculoFabricanteCad.Open;
  end;
end;

procedure TFVeiculoFabricanteCad.RelFabricantesdeVeculo1Click(
  Sender: TObject);
begin
  inherited;
  DMVeiculoFabricante.QRVeiculoFabricante.Close;
  DMVeiculoFabricante.QRVeiculoFabricante.Open;
  if FRVeiculoFabricante = nil then
    FRVeiculoFabricante := TFRVeiculoFabricante.Create(Application);
  FRVeiculoFabricante.QRPrimario.Preview;
end;

procedure TFVeiculoFabricanteCad.SBHelpClick(Sender: TObject);
begin
  inherited;
 Application.HelpContext(5);
end;

end.
