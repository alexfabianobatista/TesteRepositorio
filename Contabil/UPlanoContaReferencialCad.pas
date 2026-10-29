unit UPlanoContaReferencialCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, DB, Menus, ComCtrls,
  Mask, Buttons, ExtCtrls, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFPlanoContaReferencialCad = class(TFTCadSimples)
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    PlanodeContasReferencial1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure PlanodeContasReferencial1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlanoContaReferencialCad: TFPlanoContaReferencialCad;

implementation

uses UPlanoContaReferencial_cl, UPlanoContaReferencialCons,
  URPlanoContaReferencial, UParamSistema_cl;

{$R *.dfm}

procedure TFPlanoContaReferencialCad.FormActivate(Sender: TObject);
begin
  inherited;
  DmPlanoContaReferencial.QPlanoContaReferencial.Close;
  DmPlanoContaReferencial.QPlanoContaReferencial.open;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' Then
     DmPlanoContaReferencial.QPlanoContaReferencialNum_Plano_Conta_Referencial.EditMask := '#.##.##.##.#####;0;';
end;

procedure TFPlanoContaReferencialCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaReferencialCons = nil then
    FPlanoContaReferencialCons := TFPlanoContaReferencialCons.Create(Application);
  if FPlanoContaReferencialCons.ShowModal = MrOk then
    with DmPlanoContaReferencial do
    begin
      QPlanoContaReferencial.Close;
      QPlanoContaReferencial.SetVariable('PK', QPlanoContaReferencialConsCOD_PLANO_CONTA_REFERENCIAL.Value);
      QPlanoContaReferencial.Open;
    end;
end;

procedure TFPlanoContaReferencialCad.PlanodeContasReferencial1Click(
  Sender: TObject);
begin
  inherited;
  if FRPlanoContaReferencial = nil then
    FRPlanoContaReferencial := TFRPlanoContaReferencial.Create(Application);
  DmPlanoContaReferencial.QRPlanoContaReferencial.Close;
  DmPlanoContaReferencial.QRPlanoContaReferencial.Open;
  FRPlanoContaReferencial.QRPrimario.Preview;
  DmPlanoContaReferencial.QRPlanoContaReferencial.Close;
end;

end.
