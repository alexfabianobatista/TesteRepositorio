unit UPrevisaoLaudoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, Buttons, DBCtrls, ImgList, Db, Menus, ComCtrls,
  Mask, ExtCtrls, Grids, DBGrids;

type
  TFPrevisaoLaudoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    BTSafraCons: TBitBtn;
    BTProdutoCons: TBitBtn;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBGrid1: TDBGrid;
    RelatrioPrevisoLaudoFlorao1: TMenuItem;
    RelatrioPrevisoLaudoPrColheita1: TMenuItem;
    procedure BTSafraConsClick(Sender: TObject);
    procedure BTProdutoConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatrioPrevisoLaudoFlorao1Click(Sender: TObject);
    procedure RelatrioPrevisoLaudoPrColheita1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrevisaoLaudoCad: TFPrevisaoLaudoCad;

implementation

uses UPrevisaoLaudo_cl, UPlantioSafraCons, UPlantioSafra_cl, UProdutoCons,
  UProduto_cl, UPrevisaoLaudoCons, USementeParam, URPrevisaoLaudo,
  URPrevisaoPreColheita;

{$R *.DFM}

procedure TFPrevisaoLaudoCad.BTSafraConsClick(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
     FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
   if FPlantioSafraCons.ShowModal = mrOk then
   begin
     with DMPrevisaoLaudo do
     begin
       QPrevisaoLaudoCod_Plantio_Safra.Value:=(DMPlantioSafra.QPlantioSafraConsCod_Plantio_Safra.Value);
     end;
   end;
end;

procedure TFPrevisaoLaudoCad.BTProdutoConsClick(Sender: TObject);
begin
  inherited;
  with DMPrevisaoLaudo do
  begin
    if FProdutoCons = nil then
      FProdutoCons:= TFProdutoCons.Create(Application);
    if FProdutoCons.ShowModal = mrOk then
      QPrevisaolaudoCod_Produto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
  end;
end;

procedure TFPrevisaoLaudoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMPrevisaoLaudo do
  begin
    QPrevisaoLaudo.open;
  end;
end;

procedure TFPrevisaoLaudoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [Dsinsert, DsEdit] then
  Begin
    BTSafraCons.Enabled:=true;
    BTProdutoCons.Enabled:=true;
  end
  else
  begin
    BTSafraCons.Enabled:=false;
    BTProdutoCons.Enabled:=false;
  end;
end;

procedure TFPrevisaoLaudoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FPrevisaoLaudoCons = nil then
    FPrevisaoLaudoCons:=TFPrevisaoLaudoCons.create(Application);
  if FPrevisaoLaudoCons.Showmodal = mrOk then
  begin
    with DMPrevisaoLaudo do
    begin
      QPrevisaoLaudo.Close;
      QPrevisaoLaudo.SetVariable('PK',QPrevisaoLaudoConsCod_Previsao_Laudo.Value);
      QPrevisaoLaudo.Open;
    end;
  end;
end;

procedure TFPrevisaoLaudoCad.RelatrioPrevisoLaudoFlorao1Click(
  Sender: TObject);
begin
  inherited;
  with DMPrevisaoLaudo do
  begin
    if FSementeParam = nil then
      FSementeParam:= TFSementeParam.Create(Application);
    FSementeParam.PGRelatorio.Pages[3].TabVisible:=True;
    if FSementeParam.ShowModal=MrOk then
    begin
      if Trim(FSementeParam.ED4Safra.Text) <> '' then
      begin
        QRPrevisaoLaudo.Close;
        QRPrevisaoLaudo.SetVariable('Cod_Plantio_Safra',Trim(FSementeParam.ED4Safra.Text));
        if (FSementeParam.RGOrdem.ItemIndex = 1) then
          QRPrevisaoLaudo.SQL[QRPrevisaoLaudo.SQL.Count-1]:='NUM_CAMPO_PLANTIO'
        else
          QRPrevisaoLaudo.SQL[QRPrevisaoLaudo.SQL.Count-1]:='DT_FLORACAO';
        QRPrevisaoLaudo.Open;

        if FRPrevisaoLaudo = nil then
          FRPrevisaoLaudo := TFRPrevisaoLaudo.Create(Application);
        FRPrevisaoLaudo.QRPrimario.PreviewModal;
        DMPrevisaoLaudo.QRPrevisaoLaudo.Close;
      end
      else
        raise exception.create('É necessario escolher uma Safra');
    end;
  end;
end;

procedure TFPrevisaoLaudoCad.RelatrioPrevisoLaudoPrColheita1Click(
  Sender: TObject);
begin
  inherited;
  with DMPrevisaoLaudo do
  begin
    if FSementeParam = nil then
      FSementeParam:= TFSementeParam.Create(Application);
    FSementeParam.PGRelatorio.Pages[3].TabVisible:=True;
    if FSementeParam.ShowModal=MrOk then
    begin
      if Trim(FSementeParam.ED4Safra.Text) <> '' then
      begin
        QRPrevisaoPreColheita.Close;
        QRPrevisaoPreColheita.SetVariable('Cod_Plantio_Safra',Trim(FSementeParam.ED4Safra.Text));
        if (FSementeParam.RGOrdem.ItemIndex = 1) then
          QRPrevisaoPreColheita.SQL[QRPrevisaoPreColheita.SQL.Count-1]:='NUM_CAMPO_PLANTIO'
        else
          QRPrevisaoPreColheita.SQL[QRPrevisaoPreColheita.SQL.Count-1]:='DT_PRE_COLHEITA';
        QRPrevisaoPreColheita.Open;
        if FRPrevisaoLaudoPreColheita = nil then
          FRPrevisaoLaudoPreColheita := TFRPrevisaoLaudoPreColheita.Create(Application);
        FRPrevisaoLaudoPreColheita.QRPrimario.PreviewModal;
        DMPrevisaoLaudo.QRPrevisaoPreColheita.Close;
      end
      else
        raise exception.create('É necessario escolher uma Safra');
    end;
  end;
end;

end.
