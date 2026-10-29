Unit UInventarioMes_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFInventarioMes_Cons = class(TFTConsulta)
    MECodLote: TMaskEdit;
    Label8: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label6: TLabel;
    MECodFilial: TMaskEdit;
    SpeedButton6: TSpeedButton;
    Label2: TLabel;
    MeAno: TMaskEdit;
    MeMes: TMaskEdit;
    Label3: TLabel;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInventarioMes_Cons: TFInventarioMes_Cons;

implementation

uses UInventarioMes_cl, UProdutoCons, UTipoLoteCons, UFilialCons,
  UProduto_cl, UTipoLote_cl, UFilial_cl;

{$R *.dfm}

procedure TFInventarioMes_Cons.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal=mrOk then
     METexto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);

end;

procedure TFInventarioMes_Cons.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = Nil then
    FTipoLoteCons:=TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal=mrOk then
     MECodLote.Text:=FloatToStr(DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value);

end;

procedure TFInventarioMes_Cons.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk then
     MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);

end;

procedure TFInventarioMes_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMInventarioMes.QInventarioMes_Cons.Close;
  If Trim(METexto.Text) <> '' Then
     DMInventarioMes.QInventarioMes_Cons.SetVariable('Cod_Produto',Trim(METexto.Text))
  Else
     DMInventarioMes.QInventarioMes_Cons.SetVariable('Cod_Produto',Null);
  If Trim(MECodLote.Text) <> '' Then
     DMInventarioMes.QInventarioMes_Cons.SetVariable('Cod_Lote_Tipo',Trim(MECodLote.Text))
  Else
     DMInventarioMes.QInventarioMes_Cons.SetVariable('Cod_Lote_Tipo',Null);
  If Trim(MECodFilial.Text) <> '' Then
     DMInventarioMes.QInventarioMes_Cons.SetVariable('Cod_Filial',Trim(MECodFilial.Text))
  Else
     DMInventarioMes.QInventarioMes_Cons.SetVariable('Cod_Filial',Null);
  If Trim(MeAno.Text) = '' Then
     Raise Exception.Create('Informar Ano')
  Else
     DMInventarioMes.QInventarioMes_Cons.SetVariable('Num_Ano',Trim(MeAno.Text));
  If Trim(MeMes.Text) = '' Then
     Raise Exception.Create('Informar Mês')
  Else
     DMInventarioMes.QInventarioMes_Cons.SetVariable('Num_Mes',Trim(MeMes.Text));
  DMInventarioMes.QInventarioMes_Cons.Open;   
end;

end.
