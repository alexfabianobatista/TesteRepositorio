unit UCampoPlantioCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, variants;

type
  TFCampoPlantioCad = class(TFTCadSimples)
    RelaoCampospMultiplicaoSementes1: TMenuItem;
    PageControl1: TPageControl;
    Cadastro: TTabSheet;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    BTClassePlantioCons: TBitBtn;
    BTCultivarCons: TBitBtn;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    BTCooperanteCons: TBitBtn;
    DBEdit15: TDBEdit;
    BTFilialCons: TBitBtn;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    BTnotaCons: TBitBtn;
    DBEdit11: TDBEdit;
    BTEmissorCertificadoCons: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label19: TLabel;
    Opes1: TMenuItem;
    Recalcularrea1: TMenuItem;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    DBEdit6: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    TabSheet2: TTabSheet;
    Label26: TLabel;
    DBMemo1: TDBMemo;
    Label27: TLabel;
    DBEdit26: TDBEdit;
    Label28: TLabel;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BTClassePlantioConsClick(Sender: TObject);
    procedure BTCooperanteConsClick(Sender: TObject);
    procedure BTCultivarConsClick(Sender: TObject);
    procedure BTnotaConsClick(Sender: TObject);
    procedure BTEmissorCertificadoConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure RelaoCampospMultiplicaoSementes1Click(Sender: TObject);
    procedure BTFilialConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit2Exit(Sender: TObject);
    procedure Recalcularrea1Click(Sender: TObject);
//    procedure GroupBox2Exit(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    wNum_Area_Calculada:real;
  end;

var
  FCampoPlantioCad: TFCampoPlantioCad;

implementation

uses UCampoPlantio_cl, UPlantioSafraCons, UPlantioSafra_cl, UCadastroCons,
  UCadastro_cl, UProduto_cl, UProdutoCons, UNotaSaidaCons, UNotaSaida_cl,
  UFilialCons, UFilial_cl, UOracle_cl, URRelacaoCampos, USementeParam,
  UCampoPlantioCons, UParamSistema_cl, UrRelacaoCampos_Anexo,
  URRelacaoCamposLocalizacao;

{$R *.DFM}

procedure TFCampoPlantioCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMCampoPlantio do
  begin
    QCampoPlantio.Open;
    QCampoPlantioItem.Close;
    QCampoPlantioItem.Open;
  end;
end;

procedure TFCampoPlantioCad.BTClassePlantioConsClick(Sender: TObject);
begin
  inherited;
  with DMCampoPlantio do
  begin
    if FPlantioSafraCons = nil then
      FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
    if FPlantioSafraCons.ShowModal = mrOk then
    begin
      QCampoPlantioCod_plantio_Safra.Value:=DMPlantioSafra.QPLantioSafraConsCod_Plantio_Safra.Value;
      QCampoPlantioCod_Filial.Text:=DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_PLANTIO_SAFRA','COD_PLANTIO_SAFRA='+IntToStr(QCampoPlantioCod_plantio_Safra.Value));
    end;
  end;
  DBEdit2.SetFocus;
end;

procedure TFCampoPlantioCad.BTCooperanteConsClick(Sender: TObject);
begin
  inherited;
  with DMCampoPlantio do
  begin
    if FCadastroCons = nil then
      FCadastroCons:= TFCadastroCons.Create(Application);
    if FCadastroCons.ShowModal = mrOk then
      QCampoPlantioCod_cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
  end;
end;

procedure TFCampoPlantioCad.BTCultivarConsClick(Sender: TObject);
begin
  inherited;
  with DMCampoPlantio do
  begin
    if FProdutoCons = nil then
      FProdutoCons:= TFProdutoCons.Create(Application);
    if FProdutoCons.ShowModal = mrOk then
      QCampoPlantioCod_Produto.Text:=(DMProduto.QProdutoConsCod_Produto.text);
  end;
end;

procedure TFCampoPlantioCad.BTnotaConsClick(Sender: TObject);
var
  wFilial : String;
begin
  inherited;
  with DMCampoPlantio do
  begin
    if FNotaSaidaCons = nil then
      FNotaSaidaCons:= TFNotaSaidaCons.Create(Application);
    if FNotaSaidaCons.ShowModal = mrOk then
    begin
    //------------------
      QCampoPlantioItemNum_Nota.Text:=(DMNotaSaida.QNotaSaidaConsNum_Nota.text);
      QCampoPlantioItemDt_Emissao_Nota.Text:=(DMNotaSaida.QNotaSaidaConsDt_Recebimento.text);
      wFilial := DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_FILIAL FROM TB_FILIAL','COD_FILIAL='+IntToStr(DMNotaSaida.QNotaSaidaConsCod_Filial.Value));
      QCampoPlantioItemDesc_Emissor_Nota.Text := wFilial;
      QCampoPlantioItemDesc_Emissor_Certificado.Text := wFilial;
      QCampoPlantioItemQT_QUANTIDADE.Text := (DMNotaSaida.QItemNfConsQT_QUANTIDADE.Text);
      QCampoPlantioItemNUM_LOTE_SEMENTE2.Text := (DMNotaSaida.QItemNfConsCOD_LOTE_TIPO.Text);
      //----------------
    end;
  end;
end;

procedure TFCampoPlantioCad.BTEmissorCertificadoConsClick(Sender: TObject);
begin
  inherited;
  with DMCampoPlantio do
  begin
    if FFilialCons = nil then
      FFilialCons:= TFFilialCons.Create(Application);
    if FFilialCons.ShowModal = mrOk then
      QCampoPlantioItemDesc_Emissor_Certificado.Text:=(DMFilial.QFilialConsDesc_Filial.text);
  end;
end;

procedure TFCampoPlantioCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [Dsinsert, DsEdit] then
  Begin
    FCampoPlantioCad.BTEmissorCertificadoCons.enabled:=True;
    FCampoPlantioCad.BTnotaCons.enabled:=True;
    FCampoPlantioCad.BTClassePlantioCons.enabled:=True;
    FCampoPlantioCad.BTCooperanteCons.enabled:=True;
    FCampoPlantioCad.BTCultivarCons.enabled:=True;
    FCampoPlantioCad.BTFilialCons.enabled:=True;
  End
  Else
  Begin
    FCampoPlantioCad.BTEmissorCertificadoCons.enabled:=False;
    FCampoPlantioCad.BTnotaCons.enabled:=False;
    FCampoPlantioCad.BTClassePlantioCons.enabled:=False;
    FCampoPlantioCad.BTCooperanteCons.enabled:=False;
    FCampoPlantioCad.BTCultivarCons.enabled:=False;
    FCampoPlantioCad.BTFilialCons.enabled:=False;
  End;
end;

procedure TFCampoPlantioCad.RelaoCampospMultiplicaoSementes1Click(
  Sender: TObject);
begin
  inherited;
  If FSementeParam=Nil then
     FSementeParam:=TFSementeParam.Create(Application);
  FSementeParam.PGRelatorio.Pages[0].TabVisible:=True;
  if FSementeParam.ShowModal=MrOk then
  begin
    if (Trim(FSementeParam.MECodFilial.Text) <> '') and (Trim(FSementeParam.MEPlantioSafra.Text)<>'')then
    begin
      with DMCampoPlantio do
      begin
        QRRelacaoCampos.Close;
        QRRelacaoCamposAnexo.Close;
        QRLocalizacaoCampos.Close;
        QRRelacaoCampos.SetVariable('Cod_Filial',Trim(FSementeParam.MECodFilial.Text));
        QRRelacaoCampos.SetVariable('Cod_Plantio_Safra',Trim(FSementeParam.MEPlantioSafra.Text));
        if length(FSementeParam.ME1Cultivar.Text) > 0 then
          QRRelacaoCampos.SetVariable('Cod_produto',Trim(FSementeParam.ME1Cultivar.Text))
        else
          QRRelacaoCampos.SetVariable('Cod_produto',null);

        QRRelacaoCamposAnexo.SetVariable('Cod_Filial',Trim(FSementeParam.MECodFilial.Text));
        QRRelacaoCamposAnexo.SetVariable('Cod_Plantio_Safra',Trim(FSementeParam.MEPlantioSafra.Text));
        if length(FSementeParam.ME1Cultivar.Text) > 0 then
          QRRelacaoCamposAnexo.SetVariable('Cod_produto',Trim(FSementeParam.ME1Cultivar.Text))
        else
          QRRelacaoCamposAnexo.SetVariable('Cod_produto',null);

        QRLocalizacaoCampos.SetVariable('Cod_Filial',Trim(FSementeParam.MECodFilial.Text));
        QRLocalizacaoCampos.SetVariable('Cod_Plantio_Safra',Trim(FSementeParam.MEPlantioSafra.Text));
        if length(FSementeParam.ME1Cultivar.Text) > 0 then
          QRLocalizacaoCampos.SetVariable('Cod_produto',Trim(FSementeParam.ME1Cultivar.Text))
        else
          QRLocalizacaoCampos.SetVariable('Cod_produto',null);

        QRRelacaoCamposAnexo.Open;
        QRRelacaoCampos.Open;
        QRLocalizacaoCampos.Open;
      end;
      if FRRelacaoCampos=nil then
         FRRelacaoCampos:=TFRRelacaoCampos.Create(Application);
      if FRRelacaoCampos_Anexo=nil then
         FRRelacaoCampos_Anexo:=TFRRelacaoCampos_Anexo.Create(Application);
      if FRRelacaoCamposLocalizacao=nil then
         FRRelacaoCamposLocalizacao:=tFRRelacaoCamposLocalizacao.Create(Application);

{      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' then
        FRRelacaoCampos.QRLMarca.Caption:='A.B.SEMENTES';
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
        FRRelacaoCampos.QRLMarca.Caption:='SEMENTES AMIZADE';
}     if (length(FSementeParam.MEDT_Emissao.Text) > 2) then
        FRRelacaoCampos.QRLDT_Emissao.Caption:=FSementeParam.MEDT_Emissao.Text
      else
        FRRelacaoCampos.QRLDT_Emissao.Caption:=DateToStr(Date);
      if FSementeParam.RGPreview.ItemIndex=0 then
         FRRelacaoCampos.QRPrimario.Preview
      else
         FRRelacaoCampos.QRPrimario.Print;

      if FSementeParam.RGPreview.ItemIndex=0 then
         FRRelacaoCampos_Anexo.QRPrimario.Preview
      else
         FRRelacaoCampos_Anexo.QRPrimario.Print;

      if FSementeParam.RGPreview.ItemIndex=0 then
         FRRelacaoCamposLocalizacao.QRPrimario.Preview
      else
         FRRelacaoCamposLocalizacao.QRPrimario.Print;
      DMCampoPlantio.QRRelacaoCampos.Close;
      DMCampoPlantio.QRRelacaoCamposAnexo.Close;
      DMCampoPlantio.QRLocalizacaoCampos.Close;
    end
    else
      showmessage('Os campos Filial e Safra devem ser Preenchidos');
  end;
end;

procedure TFCampoPlantioCad.BTFilialConsClick(Sender: TObject);
begin
  inherited;
  with DMCampoPlantio do
  begin
    if  FFilialCons = nil then
      FFilialCons:= TFFilialCons.Create(Application);
    if FFilialCons.ShowModal = mrOk then
      QCampoPlantioCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
  end;
end;

procedure TFCampoPlantioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FCampoPlantioCons = nil then
     FCampoPlantioCons:= TFCampoPlantioCons.Create(Application);
   if FCampoPlantioCons.ShowModal = mrOk then
   begin
     with  DMCampoPlantio do
     begin
       QCampoPlantio.Close;
       QCampoPlantio.setVariable('PK',QCampoPlantioConsCod_Campo_Plantio_CAB.Value);
       QCampoPlantio.Open;
       QCampoPlantioItem.Close;
       QCampoPlantioItem.Open;
     end;
   end;
end;

procedure TFCampoPlantioCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMCampoPlantio do
  begin
    QCampoPlantio.Close;
    QCampoPlantioItem.Close;
    QCampoPlantioCons.Close;
  end;
  action:=caFree;
  FCampoPlantioCad:=nil;
end;

procedure TFCampoPlantioCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  with DMCampoPlantio do
  begin
    if QCampoPlantio.State in [DSInsert] then
    begin
      QCampoPlantioCod_Filial.Text:=DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_PLANTIO_SAFRA','COD_PLANTIO_SAFRA='+IntToStr(QCampoPlantioCod_plantio_Safra.Value));
      QNum_Campo.Close;
      QNum_Campo.SetVariable('COD_PLANTIO_SAFRA',IntToStr(QCampoPlantioCOD_PLANTIO_SAFRA.Value));
      QNum_Campo.Open;
      QCampoPlantioNUM_CAMPO_PLANTIO.Text:=FloatToStr(QNum_CampoNUM_CAMPO.Value+1);
    end;
  end;
end;

procedure TFCampoPlantioCad.Recalcularrea1Click(Sender: TObject);
var
  wArea_Cultivar,wArea_Calculada,wQuantidade :real;
  wTexto:String;
begin
  inherited;
  with DMCampoPlantio do
  begin
    if QCampoPlantioCod_Campo_plantio_cab.Text <> '' then
    begin
      wQuantidade:=0;
      wArea_Cultivar:=0;
      QCampoPlantioItem.First;
      while not(QCampoPlantioItem.Eof) do
      begin
        if QCampoPlantioItemQT_Quantidade.Value > 0 then
        begin
          wQuantidade:=wQuantidade+(QCampoPlantioItemQT_Quantidade.Value/1000);
        end;
        QCampoPlantioItem.Next;
      end;
      if wQuantidade > 0 then
      begin
        wTexto:=DMOracle.BuscaNome('SELECT TB_AREA_CULTIVAR.VAL_AREA_CULTIVAR '+
                                                      'FROM TB_AREA_CULTIVAR ','TB_AREA_CULTIVAR.COD_PLANTIO_SAFRA = '+IntToStr(QCampoPlantioCod_Plantio_Safra.Value)+
                                                      'AND TB_AREA_CULTIVAR.COD_PRODUTO = '+floatToStr(QCampoPlantioCod_Produto.Value));
        if wTexto <> '' then
          wArea_Cultivar:=StrToFloat(wTexto);
        wQuantidade:=wQuantidade*wArea_Cultivar;
      end;
      wArea_Calculada:=wQuantidade;
      QCampoPlantio.edit;
      QCampoPlantioNum_Area_Calculada.Value:=(wArea_Calculada);
      QCampoPlantio.post;
      end
    else
        raise exception.create('É necessário escolher um Campo!!');
  end;
end;
end.
