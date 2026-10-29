unit UEstoqueCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, variants, Menus;

type
  TFEstoqueCons = class(TFTConsulta)
    MEProduto: TMaskEdit;
    METipoLote: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    SBConsFilial: TSpeedButton;
    MECodProduto: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    MENumFabricante: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBConsFilialClick(Sender: TObject);
    procedure MENumFabricanteChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstoqueCons: TFEstoqueCons;

implementation

uses UEstoque_cl, UFilialCons, UFilial_cl, UUsuario_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFEstoqueCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(METexto.Text),'ESTOQUE');
  with DMEstoque do
  begin
    QEstoqueCons.Close;
    if Trim(MECodProduto.Text) <> '' then
       QEstoqueCons.SetVariable('COD_PRODUTO',MECodProduto.Text)
    else
       QEstoqueCons.SetVariable('COD_PRODUTO',Null);
    if Trim(METexto.Text) <> '' then
       QEstoqueCons.SetVariable('FILIAL',METexto.Text)
    else
       QEstoqueCons.SetVariable('FILIAL',Null);
    if Trim(MEProduto.Text) <> '' then
       QEstoqueCons.SetVariable('PRODUTO','%'+UPPERCASE(MEProduto.Text)+'%')
    else
       QEstoqueCons.SetVariable('PRODUTO',Null);
    if Trim(MENumFabricante.Text) <> '' then
       QEstoqueCons.SetVariable('NUM_FABRICANTE',Trim(MENumFabricante.Text) + '%')
    else
       QEstoqueCons.SetVariable('NUM_FABRICANTE',Null);
    if Trim(MeTipoLote.Text) <> '' then
       QEstoqueCons.SetVariable('TIPO_LOTE','%'+UPPERCASE(METipoLote.Text)+'%')
    else
       QEstoqueCons.SetVariable('TIPO_LOTE',Null);
    QEstoqueCons.Open;
  end;
end;

procedure TFEstoqueCons.SBConsFilialClick(Sender: TObject);
begin
  inherited;
  IF FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  IF FFilialCons.Showmodal=mrOk then
    Begin
      METexto.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
    End;
end;

procedure TFEstoqueCons.MENumFabricanteChange(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
    BtProcurarClick(Sender);
end;

end.
