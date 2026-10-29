unit UTipoEquipamentoCarac_Cad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, variants;

type
  TFTipoEquipamentoCarac_Cad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BtConsTipo: TBitBtn;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    RelatriodeCaractersticasdeTipodeEquipamento1: TMenuItem;
    procedure BtConsTipoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatriodeCaractersticasdeTipodeEquipamento1Click(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoEquipamentoCarac_Cad: TFTipoEquipamentoCarac_Cad;

implementation

uses UTipoEquipamento_cl, UTipoEquipamentoCons, UTipoEquipamentoCarac_Cons,
  Upatrimonio_cl, UPatrimonio_Param, URTipoEquipamentoCarac, URPatrimonio;

{$R *.DFM}

procedure TFTipoEquipamentoCarac_Cad.BtConsTipoClick(Sender: TObject);
begin
  inherited;
  If FTipoEquipamentoCons = Nil then
    FTipoEquipamentoCons := TFTipoEquipamentoCons.Create(Application);
  If FTipoEquipamentoCons.ShowModal = mrOk then
    DMTipoEquipamento.QTipoEquipamentoCaracCod_Tipo_Equipamento.Value := DMTipoEquipamento.QTipoEquipamentoConsCod_Tipo_Equipamento.Value;

end;

procedure TFTipoEquipamentoCarac_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMTipoEquipamento.QtipoEquipamentoCarac.Open;
  DMTipoEquipamento.QTipoEquipamentoCarac_Grid.Open;
end;

procedure TFTipoEquipamentoCarac_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMTipoEquipamento.QTipoEquipamentoCarac.Close;
  DMTipoEquipamento.QTipoEquipamentoCarac_Grid.Close;
end;

procedure TFTipoEquipamentoCarac_Cad.DSPrimarioStateChange(
  Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DSInsert,DSEdit] then
    begin
      BtConsTipo.Enabled:=True;
    end
  Else
    begin
      BtConstipo.Enabled:=False;
    End;
end;

procedure TFTipoEquipamentoCarac_Cad.DBEdit1Change(Sender: TObject);
begin
  inherited;
  With DMTipoEquipamento do
  Begin
    QTipoEquipamentoCarac_Grid.close;
    QTipoEquipamentoCarac_Grid.SetVariable('COD_TIPO_EQUIPAMENTO',QTipoEquipamentoCaracCod_Tipo_Equipamento.Value);
    QTipoEquipamentoCarac_Grid.Open;
  End;
end;

procedure TFTipoEquipamentoCarac_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FTipoEquipamentoCarac_Cons = Nil then
    FTipoEquipamentoCarac_Cons := TFTipoEquipamentoCarac_Cons.Create(Application);
  If FTipoEquipamentoCarac_Cons.ShowModal = mrOk then
  With DMTipoEquipamento do
  Begin
    QTipoEquipamentoCarac.Close;
    QTipoEquipamentoCarac.SetVariable('Cod_Tipo_Equipamento',QTipoEquipamentoCarac_ConsCod_Tipo_Equipamento.Value);
    QTipoEquipamentoCarac.SetVariable('Cod_Tipo_Equipamento_Carac',QTipoEquipamentoCarac_ConsCod_Tipo_Equipamento_Carac.Value);
    QTipoEquipamentoCarac.Open;
  End;

end;

procedure TFTipoEquipamentoCarac_Cad.RelatriodeCaractersticasdeTipodeEquipamento1Click(
  Sender: TObject);
begin
  inherited;
  If FPatrimonio_Param = Nil then
    FPatrimonio_Param := TFPatrimonio_Param.Create(Application);
  FPatrimonio_Param.PGRelatorio.Pages[5].TabVisible := True;
  if FPatrimonio_Param.ShowModal = mrOk then
  with DMTipoEquipamento do
  begin
    QRTipoEquipamentoCarac.Close;
    if Trim(FPatrimonio_Param.MECodTipoEqui.Text) = '' then
      QRTipoEquipamentoCarac.SetVariable('COD_TIPO_EQUIPAMENTO',Null)
    else
      QRTipoEquipamentoCarac.SetVariable('COD_TIPO_EQUIPAMENTO',FPatrimonio_Param.MECodTipoEqui.Text);
    QRTipoEquipamentoCarac.Open;

    if FRTipoEquipamentoCarac = Nil then
      FRTipoEquipamentoCarac := TFRTipoEquipamentoCarac.Create(Application);

    if FPatrimonio_Param.RGPreview.ItemIndex = 0 then
      FRTipoEquipamentoCarac.QRPrimario.Preview
    Else
      FRTipoEquipamentoCarac.QRPrimario.Print;
    QRTipoEquipamentoCarac.Close;
  End;

end;

end.
