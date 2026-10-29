unit UReposicaoMovCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFReposicaoMovCons = class(TFTConsulta)
    MEFilial: TMaskEdit;
    SBFilialCons: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    SBPromotorCons: TSpeedButton;
    SBHistoricoCons: TSpeedButton;
    MePromotor: TMaskEdit;
    MEHistorico: TMaskEdit;
    procedure SBFilialConsClick(Sender: TObject);
    procedure SBPromotorConsClick(Sender: TObject);
    procedure SBHistoricoConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReposicaoMovCons: TFReposicaoMovCons;

implementation

uses UPromoto_cl, UFilialCons, UPromotorCons, UHistoricoPromotorCons,
  UFilial_cl, UHistoricoPromotor_cl;

{$R *.DFM}

procedure TFReposicaoMovCons.SBFilialConsClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MEFilial.Text := IntToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFReposicaoMovCons.SBPromotorConsClick(Sender: TObject);
begin
  inherited;
  If FPromotorCons = Nil then
    FPromotorCons := TFPromotorCons.Create(Application);
  If FPromotorCons.ShowModal = mrOk then
    MEPromotor.Text := IntToStr(DMPromotor.QPromotorConsCod_Promotor.Value);
end;

procedure TFReposicaoMovCons.SBHistoricoConsClick(Sender: TObject);
begin
  inherited;
  If FHistoricoPromotorCons = Nil then
    FHistoricoPromotorCons := TFHistoricoPromotorCons.Create(Application);
  If FHistoricoPromotorCons.ShowModal = mrOk then
    MEHistorico.Text := IntToStr(DMHistoricoPromotor.QHistoricoPromotorConsCod_Historico_Promotor.Value);
end;

procedure TFReposicaoMovCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPromotor do
  Begin
    QReposicaoMovCons.Close;
    if MEFilial.Text <> '' then
      QReposicaoMovCons.SetVariable('FILIAL',MeFilial.Text)
    else
      QReposicaoMovCons.SetVariable('FILIAL',null);

    if MEPromotor.Text <> '' then
    QReposicaoMovCons.SetVariable('PROMOTOR',FReposicaoMovCons.MePromotor.Text)
    else
    QReposicaoMovCons.SetVariable('PROMOTOR',null);

    if MEHistorico.Text <> '' then
    QReposicaoMovCons.SetVariable('HISTORICO',FReposicaoMovCons.MEHistorico.Text)
    else
    QReposicaoMovCons.SetVariable('HISTORICO',null);

    QReposicaoMovCons.Open;
  End;

end;

end.
