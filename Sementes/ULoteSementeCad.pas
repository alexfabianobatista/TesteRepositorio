unit ULoteSementeCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls;

type
  TFLoteSementeCad = class(TFTCadSimples)
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
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    BTPlantioSafraCons: TBitBtn;
    BTCultivarCons: TBitBtn;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    IdentificaoAmostras1: TMenuItem;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    ImpAtestados1: TMenuItem;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    Label10: TLabel;
    DBEdit12: TDBEdit;
    Label11: TLabel;
    DBEdit13: TDBEdit;
    Label12: TLabel;
    DBEdit14: TDBEdit;
    Label13: TLabel;
    DBEdit15: TDBEdit;
    Label14: TLabel;
    DBEdit16: TDBEdit;
    Label15: TLabel;
    DBEdit17: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTCultivarConsClick(Sender: TObject);
    procedure BTPlantioSafraConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure IdentificaoAmostras1Click(Sender: TObject);
    procedure ImpAtestados1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLoteSementeCad: TFLoteSementeCad;

implementation

uses UProducaoSemente_cl, UCampoPlantio_cl, UProdutoCons, UPlantioSafraCons,
  UProduto_cl, UPlantioSafra_cl, ULoteSementeCons, USementeParam,
  URProducaoSemente, UParamSistema_cl, URIdentificacaoAmostras,
  URAtestadoSemente;

{$R *.DFM}

procedure TFLoteSementeCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMProducaoSemente do
  begin
    QLoteSemente.open;
  end;
end;

procedure TFLoteSementeCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMProducaoSemente do
  begin
    QLoteSemente.Close;
  end;
  action := caFree;
  FLoteSementeCad := nil;
end;

procedure TFLoteSementeCad.BTCultivarConsClick(Sender: TObject);
begin
  inherited;
  with DMProducaoSemente do
  begin
    if FProdutoCons = nil then
      FProdutoCons:= TFProdutoCons.Create(Application);
    if FProdutoCons.ShowModal = mrOk then
      QLoteSementeCod_Produto.Text:=(DMProduto.QProdutoConsCod_Produto.text);
  end;
end;

procedure TFLoteSementeCad.BTPlantioSafraConsClick(Sender: TObject);
begin
  inherited;
  with DMProducaoSemente do
  begin
    if FPlantioSafraCons = nil then
      FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
    if FPlantioSafraCons.ShowModal = mrOk then
    begin
      QLoteSementeCod_plantio_Safra.Value:=DMPlantioSafra.QPLantioSafraConsCod_Plantio_Safra.Value;
    end;
  end;
end;
procedure TFLoteSementeCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [Dsinsert, DsEdit] then
  Begin
    FLoteSementeCad.BTPlantioSafraCons.enabled:=True;
    FLoteSementeCad.BTCultivarCons.enabled:=True;
  End
  Else
  Begin
    FLoteSementeCad.BTPlantioSafraCons.enabled:=False;
    FLoteSementeCad.BTCultivarCons.enabled:=False;
  End;
end;

procedure TFLoteSementeCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FLoteSementeCons = nil then
     FLoteSementeCons:= TFLoteSementeCons.Create(Application);
   if FLoteSementeCons.ShowModal = mrOk then
   begin
     with  DMProducaoSemente do
     begin
       QLoteSemente.Close;
       QLoteSemente.setVariable('NUM_LOTE_SEMENTE',QLoteSementeConsNum_Lote_Semente.Value);
       QLoteSemente.setVariable('COD_PRODUTO',QLoteSementeConsCod_Produto.Value);
       QLoteSemente.setVariable('COD_PLANTIO_SAFRA',QLoteSementeConsCod_Plantio_Safra.Value);
       QLoteSemente.Open;
     end;
   end;
end;

procedure TFLoteSementeCad.IdentificaoAmostras1Click(Sender: TObject);
begin
  inherited;
  If FSementeParam=Nil then
     FSementeParam:=TFSementeParam.Create(Application);
  FSementeParam.PGRelatorio.Pages[6].TabVisible:=True;
  if FSementeParam.ShowModal=MrOk then
  begin
    if Trim(FSementeParam.ME7Safra.Text)<>''then
    begin
      with DMProducaoSemente do
      begin
        QRIdentificacaoAmostras.Close;
        QRIdentificacaoAmostras.SetVariable('SAFRA',Trim(FSementeParam.ME7Safra.Text));
        QRIdentificacaoAmostras.Open;
      end;
      if FRIdentificacaoAmostras=nil then
         FRIdentificacaoAmostras:=TFRIdentificacaoAmostras.Create(Application);
{      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' then
        FRProducaoSemente.QRLProdutor.Caption:='A.B.SEMENTES'
      else
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
        FRProducaoSemente.QRLProdutor.Caption:='MOINHO IGUAÇU';}
      if FSementeParam.RGPreview.ItemIndex=0 then
         FRIdentificacaoAmostras.QRPrimario.Preview
      else
         FRIdentificacaoAmostras.QRPrimario.Print;
      DMProducaoSemente.QRIdentificacaoAmostras.Close;
    end
    else
      showmessage('Deve ser informada a Safra');
  end;
end;

procedure TFLoteSementeCad.ImpAtestados1Click(Sender: TObject);
begin
  inherited;
  {If FSementeParam=Nil then
     FSementeParam:=TFSementeParam.Create(Application);
  FSementeParam.PGRelatorio.Pages[7].TabVisible:=True;
  if FSementeParam.ShowModal=MrOk then
  begin
    if Trim(FSementeParam.ME8Cultivar.Text)=''then
      raise exception.create('Informe a Cultivar');
    if Trim(FSementeParam.ME8Safra.Text)<>''then
    begin
      with DMProducaoSemente do
      begin
        QRAtestadoSemente.Close;
        QRAtestadoSemente.SetVariable('COD_PLANTIO_SAFRA',Trim(FSementeParam.ME8Safra.Text));
        QRAtestadoSemente.SetVariable('COD_PRODUTO',Trim(FSementeParam.ME8Cultivar.Text));
        QRAtestadoSemente.Open;
      end;
      if FRAtestadoSemente=nil then
         FRAtestadoSemente:=TFRAtestadoSemente.Create(Application);
      if FSementeParam.RGPreview.ItemIndex=0 then
         FRAtestadoSemente.QRPrimario.Preview
      else
         FRIdentificacaoAmostras.QRPrimario.Print;
      DMProducaoSemente.QRIdentificacaoAmostras.Close;
    end
    else
      showmessage('Informe a Safra');
  end;}
end;

end.
