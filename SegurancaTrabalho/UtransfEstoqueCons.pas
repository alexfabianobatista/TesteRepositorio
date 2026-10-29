unit UtransfEstoqueCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFTransfEstoqueCons = class(TFTConsulta)
    MEDtInicio: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    MEDestino: TMaskEdit;
    RGSituacao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTransfEstoqueCons: TFTransfEstoqueCons;

implementation

uses UEstoqueSeguranca_cl, UProdutoSegurancaCons,
  UCaracteristicaProdutoCons, UFilialCons, UProdutoSeguranca_cl,
  UCaracteristicaProduto_cl, UFilial_cl;

{$R *.DFM}

procedure TFTransfEstoqueCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMEstoqueSeguranca do
  begin
    QTransfEstoqueCons.Close;

    if Trim(MEDestino.Text) = '' then
       QTransfEstoqueCons.SetVariable('COD_FILIAL_DEST',Null)
    else
       QTransfEstoqueCons.SetVariable('COD_FILIAL_DEST',Trim(MEDestino.Text));

    if Trim(MeTexto.Text) = '' then
       QTransfEstoqueCons.SetVariable('COD_FILIAL_ORIG',Null)
    else
       QTransfEstoqueCons.SetVariable('COD_FILIAL_ORIG',Trim(MeTexto.Text));

    if Trim(MeDtInicio.Text) = '' then
       QTransfEstoqueCons.SetVariable('DT_INICIAL',Null)
    else
       QTransfEstoqueCons.SetVariable('DT_INICIAL',Trim(MeDtInicio.Text));

    if RGSituacao.ItemIndex = 0 then
      QTransfEstoqueCons.SetVariable('SITUACAO','DIGITADA')
    else if RGSituacao.ItemIndex = 1 then
      QTransfEstoqueCons.SetVariable('SITUACAO','CONFIRMADA')
    else
      QTransfEstoqueCons.SetVariable('SITUACAO',NULL);

    QTransfEstoqueCons.Open;
  end;

end;

procedure TFTransfEstoqueCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    METexto.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFTransfEstoqueCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    MEDestino.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFTransfEstoqueCons.FormActivate(Sender: TObject);
begin
  inherited;
  METexto.SetFocus;
end;

end.
