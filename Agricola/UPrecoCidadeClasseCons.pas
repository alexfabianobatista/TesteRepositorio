unit UPrecoCidadeClasseCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFPrecoCidadeClasseCons = class(TFTConsulta)
    SbClasseCons: TSpeedButton;
    SbCidadeCons: TSpeedButton;
    MeClasse: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    MeData: TMaskEdit;
    procedure SbCidadeConsClick(Sender: TObject);
    procedure SbClasseConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoCidadeClasseCons: TFPrecoCidadeClasseCons;

implementation

uses UPrecoCidadeClasse_cl, UCidadeCons, UClasseCons, UCidade_cl,
  UClasse_cl;

{$R *.dfm}

procedure TFPrecoCidadeClasseCons.SbCidadeConsClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = Nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.ShowModal = MrOk then
    MeTexto.Text := DMCidade.QCidadeConsCOD_CIDADE.Text;
end;

procedure TFPrecoCidadeClasseCons.SbClasseConsClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = Nil Then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
    MeClasse.Text := DMClasse.QClasseConsCOD_CLASSE.Text;
end;

procedure TFPrecoCidadeClasseCons.BtProcurarClick(Sender: TObject);
begin
  inherited;

  with DMPrecoCidadeClasse do
  begin
    QPrecoCidadeClasseCons.Close;

    if Trim(METexto.Text) <> '' then
      QPrecoCidadeClasseCons.SetVariable('COD_CIDADE', StrToInt(Trim(METexto.Text)))
    else
      QPrecoCidadeClasseCons.SetVariable('COD_CIDADE', Null);

    if Trim(MeClasse.Text) <> '' then
      QPrecoCidadeClasseCons.SetVariable('COD_CLASSE', StrToInt(Trim(MeClasse.Text)))
    else
      QPrecoCidadeClasseCons.SetVariable('COD_CLASSE', Null);

    if Trim(MeData.Text) <> '' then
      QPrecoCidadeClasseCons.SetVariable('DATA', Trim(MeData.Text))
    else
      Raise Exception.Create('É necessário informar Data de Referência');

    QPrecoCidadeClasseCons.Open;
  end;
end;

end.
