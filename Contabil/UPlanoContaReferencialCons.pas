unit UPlanoContaReferencialCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFPlanoContaReferencialCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlanoContaReferencialCons: TFPlanoContaReferencialCons;

implementation

uses UPlanoContaReferencial_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFPlanoContaReferencialCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DmPlanoContaReferencial do
    begin
      QPlanoContaReferencialCons.Close;
      QPlanoContaReferencialCons.SetVariable('NUM_PLANO_CONTA_REFERENCIAL', METexto.Text);
      QPlanoContaReferencialCons.Open;
    end;
end;

procedure TFPlanoContaReferencialCons.FormActivate(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' Then
     DmPlanoContaReferencial
      .QPlanoContaReferencialConsNum_Plano_Conta_Referencial
      .EditMask := '#.##.##.##.#####;0;';
end;

end.
