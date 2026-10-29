unit UVeiculoModeloCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, ActnList;

type
  TFOFI0023 = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Modelodeveiculos1: TMenuItem;
    procedure SBConsultaClick(Sender: TObject);
    procedure Modelodeveiculos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0023: TFOFI0023;

implementation

uses UOficina_cl, UVeiculoModeloCons, URVeiculoModelo, UOficinaParam;

{$R *.DFM}

procedure TFOFI0023.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FVeiculoModeloCons = nil then
    FVeiculoModeloCons:= TFVeiculoModeloCons.Create(Application);
  if FVeiculoModeloCons.ShowModal = mrOk then
  with DMOficina do
  begin
    QVeiculoModeloCad.Close;
    QVeiculoModeloCad.SetVariable('PK',QVeiculoModeloConsCOD_MODELO.Value);
    QVeiculoModeloCad.Open;
  end;
end;

procedure TFOFI0023.Modelodeveiculos1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
     FOficinaParam:= TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[0].TabVisible := True;

  if FOficinaParam.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      QRVeiculoModelo.Close;
      if Trim(FOficinaParam.EdDESC_MODELO.Text) = '' then
         QRVeiculoModelo.SetVariable('DESC_MODELO',Null)
      else
         QRVeiculoModelo.SetVariable('DESC_MODELO','%'+FOficinaParam.EdDESC_MODELO.Text+'%');

      QRVeiculoModelo.Open;

      if FRVeiculoModelo = nil then
         FRVeiculoModelo:= TFRVeiculoModelo.Create(Application);
      if FOficinaParam.RGPreview.ItemIndex = 0 then
         FRVeiculoModelo.QRPrimario.Preview
      else
         FRVeiculoModelo.QRPrimario.Print;

      QRVeiculoModelo.Close;
    end;
  end;
end;

procedure TFOFI0023.FormCreate(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QVeiculoModeloCad.Close;
    QVeiculoModeloCad.Open;
  end;
end;

end.
