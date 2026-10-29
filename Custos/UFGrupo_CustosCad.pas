unit UFGrupo_CustosCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls;

type
  TFGrupo_CustosCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Relatrios1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupo_CustosCad: TFGrupo_CustosCad;

implementation

uses UFGrupo_CustosCons, UGrupo_cl, URGrupoCustos;

{$R *.DFM}

procedure TFGrupo_CustosCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FGrupo_CustosCons = nil then
     FGRupo_CustosCons := TFGrupo_CustosCons.Create(Application);
  if FGrupo_CustosCons.ShowModal = mrOk then
  begin
    with DMGrupo do
    begin
      QGrupo_CustoCad.Close;
      QGrupo_CustoCad.SetVariable('PK',QGrupo_CustoConsCOD_GRUPO.Value);
      QGrupo_CustoCad.Open;
      QGrupo_CustoCons.Close;
    end;
  end;
  FGrupo_CustosCons.Release;
  FGrupo_CustosCons:=Nil;
end;

procedure TFGrupo_CustosCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMGrupo.QGrupo_CustoCad.Open;
  DSPrimario.AutoEdit:=True;

end;

procedure TFGrupo_CustosCad.Relatrios1Click(Sender: TObject);
begin
  inherited;
  With DMGrupo do
  Begin
    QRGrupo_CustoCad.Open;
    if FRGrupoCustos = Nil then
      FRGrupoCustos:=TFRGrupoCustos.Create(Application);
    FRGrupoCustos.QRPrimario.Preview;
    QRGrupo_CustoCad.Close;
    FRGrupoCustos.Release;
    FRGrupoCustos:=Nil;
  End;
end;

end.
