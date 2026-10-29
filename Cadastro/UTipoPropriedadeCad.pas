unit UTipoPropriedadeCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBPanel, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFTipoPropriedadeCad = class(TFTCadSimples)
    TiposPropriedade1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure TiposPropriedade1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoPropriedadeCad: TFTipoPropriedadeCad;

implementation

uses UTipoPropriedade_cl, UTipoPropriedadeCons,
  URTipoPropriedade_TipoPropriedade;

{$R *.DFM}

procedure TFTipoPropriedadeCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMTipoPropriedade do
    QTipoPropriedade.Open;
end;

procedure TFTipoPropriedadeCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FTipoPropriedadeCons = Nil then
    FTipoPropriedadeCons := TFTipoPropriedadeCons.Create(Application);
  If FTipoPropriedadeCons.ShowModal = mrOk then
  With DMTipoPropriedade do
  Begin
    QTipoPropriedade.Close;
    QTipoPropriedade.SetVariable('PK',QTipoPropriedadeConsCod_Tipo_Propriedade.Value);
    QTipoPropriedade.Open;
  End;
end;

procedure TFTipoPropriedadeCad.TiposPropriedade1Click(Sender: TObject);
begin
  inherited;
  DMTipoPropriedade.QRTipoPropriedade.Open;
  If FRTipoPropriedade_TipoPropriedade = Nil then
    FRTipoPropriedade_TipoPropriedade := TFRTipoPropriedade_TipoPropriedade.Create(Application);
  FRTipoPropriedade_TipoPropriedade.QRPrimario.Preview;
end;

procedure TFTipoPropriedadeCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(30);
end;

procedure TFTipoPropriedadeCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMTipoPropriedade do
    QTipoPropriedade.Close;
  Action := CaFree;
  FTipoPropriedadeCad := Nil;
end;

end.
